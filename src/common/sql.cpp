﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "logging.h"
#include "timer.h"
#include "tracy.h"
#include "xirand.h"

#include "sql.h"

#include <any>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <thread>

#include <concurrentqueue.h>

moodycamel::ConcurrentQueue<std::function<void(SqlConnection*)>> asyncQueue;

std::atomic<bool>            asyncRunning;
std::unique_ptr<std::thread> asyncThread;

void AsyncThreadBody(const char* user, const char* passwd, const char* host, uint16 port, const char* db)
{
    TracySetThreadName("Async DB Thread");
    SqlConnection con(user, passwd, host, port, db);
    while (asyncRunning)
    {
        con.HandleAsync();
        std::this_thread::sleep_for(200ms); // TODO: This is bad and ugly. Replace with something better.
    }
}

void SqlConnection::Async(std::function<void(SqlConnection*)>&& func)
{
    TracyZoneScoped;
    asyncQueue.enqueue(std::move(func));
}

void SqlConnection::Async(std::string const& query)
{
    TracyZoneScoped;
    TracyZoneString(query);

    // clang-format off
    Async([query = std::move(query)](SqlConnection* sql)
    {
        // Executed on worker thread
        if (sql->QueryStr(query.c_str()) == SQL_ERROR)
        {
            ShowFatalError("Asyc Query Error");
        }
    });
    // clang-format on
}

void SqlConnection::HandleAsync()
{
    std::function<void(SqlConnection*)> func;
    while (asyncQueue.try_dequeue(func))
    {
        TracyZoneScoped;
        func(this);
    }
}

void SqlConnection::SetLatencyWarning(bool _LatencyWarning)
{
    m_LatencyWarning = _LatencyWarning;
}

SqlConnection::SqlConnection(const char* user, const char* passwd, const char* host, uint16 port, const char* db)
: m_LatencyWarning(false)
{
    TracyZoneScoped;
    self = new Sql_t{};
    mysql_init(&self->handle);
    if (self == nullptr)
    {
        ShowFatalError("mysql_init failed!");
    }

    self->lengths = nullptr;
    self->result  = nullptr;

    bool reconnect = true;
    mysql_options(&self->handle, MYSQL_OPT_RECONNECT, &reconnect);

    self->buf.clear();
    if (!mysql_real_connect(&self->handle, host, user, passwd, db, (uint32)port, nullptr /*unix_socket*/, 0 /*clientflag*/))
    {
        ShowFatalError("%s", mysql_error(&self->handle));
    }

    m_User   = user;
    m_Passwd = passwd;
    m_Host   = host;
    m_Port   = port;
    m_Db     = db;

    InitPreparedStatements();

    SetupKeepalive();

    // if (!asyncThread)
    // {
    //     asyncRunning = true;
    //     asyncThread = std::make_unique<std::thread>(
    //         AsyncThreadBody, m_User, m_Passwd, m_Host, m_Port, m_Db);
    // }
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

SqlConnection::~SqlConnection()
{
    TracyZoneScoped;
    asyncRunning = false;
    if (self)
    {
        mysql_close(&self->handle);
        FreeResult();
        delete self;
    }
}

/************************************************************************
 *                                                                        *
 *  Retrieves the timeout of the connection.                              *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::GetTimeout(uint32* out_timeout)
{
    TracyZoneScoped;
    if (out_timeout && SQL_SUCCESS == Query("SHOW VARIABLES LIKE 'wait_timeout'"))
    {
        char*  data;
        size_t len;
        if (SQL_SUCCESS == NextRow() && SQL_SUCCESS == GetData(1, &data, &len))
        {
            *out_timeout = (uint32)strtoul(data, nullptr, 10);
            FreeResult();
            return SQL_SUCCESS;
        }
        FreeResult();
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetTimeout: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return SQL_ERROR;
}

/************************************************************************
 *                                                                        *
 *  Retrieves the name of the columns of a table into out_buf, with       *
 *  the separator after each name.                                        *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::GetColumnNames(const char* table, char* out_buf, size_t buf_len, char sep)
{
    TracyZoneScoped;
    char*  data;
    size_t len;
    size_t off = 0;

    if (self == nullptr || SQL_ERROR == Query("EXPLAIN `%s`", table))
    {
        return SQL_ERROR;
    }

    out_buf[off] = '\0';
    while (SQL_SUCCESS == NextRow() && SQL_SUCCESS == GetData(0, &data, &len))
    {
        len = strnlen(data, len);
        if (off + len + 2 > buf_len)
        {
            ShowDebug("GetColumns: output buffer is too small");
            *out_buf = '\0';
            return SQL_ERROR;
        }
        memcpy(out_buf + off, data, len);
        off += len;
        out_buf[off++] = sep;
    }
    out_buf[off] = '\0';
    FreeResult();
    return SQL_SUCCESS;
}

/************************************************************************
 *                                                                        *
 *  Changes the encoding of the connection.                               *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::SetEncoding(const char* encoding)
{
    TracyZoneScoped;
    if (mysql_set_character_set(&self->handle, encoding) == 0)
    {
        return SQL_SUCCESS;
    }
    return SQL_ERROR;
}

void SqlConnection::SetupKeepalive()
{
    TracyZoneScoped;
    auto now        = std::chrono::system_clock::now().time_since_epoch();
    auto nowSeconds = std::chrono::duration_cast<std::chrono::seconds>(now).count();
    m_LastPing      = nowSeconds;

    // set a default value first
    uint32 timeout = 7200; // 2 hours

    // request the timeout value from the mysql server
    GetTimeout(&timeout);

    if (timeout < 60)
    {
        timeout = 60;
    }

    // 30-second reserve
    uint8 reserve  = 30;
    m_PingInterval = timeout + reserve;
}

/************************************************************************
 *                                                                        *
 *  Pings the connection.                                                 *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::TryPing()
{
    TracyZoneScoped;
    auto now        = std::chrono::system_clock::now().time_since_epoch();
    auto nowSeconds = std::chrono::duration_cast<std::chrono::seconds>(now).count();

    if (m_LastPing + m_PingInterval <= nowSeconds)
    {
        ShowInfo("Pinging SQL server to keep connection alive");

        m_LastPing = nowSeconds;

        auto startId = mysql_thread_id(&self->handle);
        try
        {
            if (mysql_ping(&self->handle) == 0)
            {
                auto endId = mysql_thread_id(&self->handle);
                if (startId != endId)
                {
                    ShowWarning("DB thread ID has changed. You have been reconnected.");
                    // TODO: Maybe we need to refresh the prepared statements now?
                }
                return SQL_SUCCESS;
            }
        }
        catch (const std::exception& e)
        {
            ShowFatalError(fmt::format("mysql_ping failed: {}", e.what()));
        }
        catch (...)
        {
            ShowFatalError("mysql_ping failed with unhandled exception");
        }
    }

    return SQL_ERROR;
}

/************************************************************************
 *                                                                        *
 *  Escapes a string.                                                     *
 *                                                                        *
 ************************************************************************/

size_t SqlConnection::EscapeStringLen(char* out_to, const char* from, size_t from_len)
{
    TracyZoneScoped;
    if (self)
    {
        return mysql_real_escape_string(&self->handle, out_to, from, (uint32)from_len);
    }
    return mysql_escape_string(out_to, from, (uint32)from_len);
}

/************************************************************************
 *                                                                        *
 *  Escapes a string.                                                     *
 *                                                                        *
 ************************************************************************/

size_t SqlConnection::EscapeString(char* out_to, const char* from)
{
    TracyZoneScoped;
    return EscapeStringLen(out_to, from, strlen(from));
}

/************************************************************************
 *                                                                        *
 *  Executes a query.                                                     *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::QueryStr(const char* query)
{
    TracyZoneScoped;
    TracyZoneCString(query);

    if (self == nullptr)
    {
        return SQL_ERROR;
    }

    FreeResult();
    self->buf.clear();

    auto startTime = hires_clock::now();

    {
        TracyZoneNamed(mysql_real_query_);
        self->buf += query;
        if (mysql_real_query(&self->handle, self->buf.c_str(), (unsigned int)self->buf.length()))
        {
            ShowSQL("Query: %s", self->buf);
            ShowSQL("mysql_real_query: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
            return SQL_ERROR;
        }
    }

    {
        TracyZoneNamed(mysql_store_result_);
        self->result = mysql_store_result(&self->handle);
        if (mysql_errno(&self->handle) != 0)
        {
            ShowSQL("Query: %s", self->buf);
            ShowSQL("mysql_store_result: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
            return SQL_ERROR;
        }
    }

    auto endTime = hires_clock::now();
    auto dTime = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime);
    if (m_LatencyWarning)
    {
        if (dTime > 250ms)
        {
            ShowError(fmt::format("Query took {}ms: {}", dTime.count(), self->buf));
        }
        else if (dTime > 100ms)
        {
            ShowWarning(fmt::format("Query took {}ms: {}", dTime.count(), self->buf));
        }
    }

    return SQL_SUCCESS;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

uint64 SqlConnection::AffectedRows()
{
    TracyZoneScoped;
    if (self)
    {
        return (uint64)mysql_affected_rows(&self->handle);
    }
    return 0;
}

/************************************************************************
 *                                                                        *
 *  Returns the number of the AUTO_INCREMENT column of the last           *
 *  INSERT/UPDATE query.                                                  *
 *                                                                        *
 ************************************************************************/

uint64 SqlConnection::LastInsertId()
{
    TracyZoneScoped;
    if (self)
    {
        return (uint64)mysql_insert_id(&self->handle);
    }
    return 0;
}

/************************************************************************
 *                                                                        *
 *  Returns the number of columns in each row of the result.              *
 *                                                                        *
 ************************************************************************/

uint32 SqlConnection::NumColumns()
{
    TracyZoneScoped;
    if (self && self->result)
    {
        return mysql_num_fields(self->result);
    }
    return 0;
}

/************************************************************************
 *                                                                        *
 *  Returns the number of rows in the result.                             *
 *                                                                        *
 ************************************************************************/

uint64 SqlConnection::NumRows()
{
    TracyZoneScoped;
    if (self && self->result)
    {
        return mysql_num_rows(self->result);
    }
    return 0;
}

/************************************************************************
 *                                                                        *
 *  Fetches the next row.                                                 *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::NextRow()
{
    TracyZoneScoped;
    if (self && self->result)
    {
        self->row = mysql_fetch_row(self->result);
        if (self->row)
        {
            self->lengths = mysql_fetch_lengths(self->result);
            return SQL_SUCCESS;
        }
        self->lengths = nullptr;
        if (mysql_errno(&self->handle) == 0)
        {
            return SQL_NO_DATA;
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("NextRow: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return SQL_ERROR;
}

/************************************************************************
 *                                                                        *
 *  Gets the data of a column.                                            *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::GetData(size_t col, char** out_buf, size_t* out_len)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            if (out_buf)
            {
                *out_buf = self->row[col];
            }
            if (out_len)
            {
                *out_len = self->lengths[col];
            }
        }
        else // out of range - ignore
        {
            if (out_buf)
            {
                *out_buf = nullptr;
            }
            if (out_len)
            {
                *out_len = 0;
            }
        }
        return SQL_SUCCESS;
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return SQL_ERROR;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

int8* SqlConnection::GetData(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return (int8*)self->row[col];
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return nullptr;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

int32 SqlConnection::GetIntData(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return (self->row[col] ? atoi(self->row[col]) : 0);
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetIntData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return 0;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

uint32 SqlConnection::GetUIntData(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return (self->row[col] ? (uint32)strtoul(self->row[col], nullptr, 10) : 0);
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetUIntData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return 0;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

uint64 SqlConnection::GetUInt64Data(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return (self->row[col] ? (uint64)strtoull(self->row[col], NULL, 10) : 0);
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetUInt64Data: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return 0;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

float SqlConnection::GetFloatData(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return (self->row[col] ? (float)atof(self->row[col]) : 0.f);
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetFloatData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return 0;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

std::string SqlConnection::GetStringData(size_t col)
{
    TracyZoneScoped;
    if (self && self->row)
    {
        if (col < NumColumns())
        {
            return std::string(self->row[col] ? (const char*)self->row[col] : "");
        }
    }
    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetStringData: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return "";
}

/************************************************************************
 *                                                                        *
 *  Frees the result of the query.                                        *
 *                                                                        *
 ************************************************************************/

void SqlConnection::FreeResult()
{
    TracyZoneScoped;
    if (self && self->result)
    {
        mysql_free_result(self->result);
        self->result  = nullptr;
        self->row     = nullptr;
        self->lengths = nullptr;
    }
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

bool SqlConnection::SetAutoCommit(bool value)
{
    TracyZoneScoped;
    uint8 val = (value) ? 1 : 0;

    // if( self && mysql_autocommit(&self->handle, val) == 0)
    if (self && Query("SET @@autocommit = %u", val) != SQL_ERROR)
    {
        return true;
    }

    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("SetAutoCommit: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return false;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

bool SqlConnection::GetAutoCommit()
{
    TracyZoneScoped;
    if (self)
    {
        int32 ret = Query("SELECT @@autocommit;");

        if (ret != SQL_ERROR && NumRows() > 0 && NextRow() == SQL_SUCCESS)
        {
            return (GetUIntData(0) == 1);
        }
    }

    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("GetAutoCommit: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return false;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

bool SqlConnection::TransactionStart()
{
    TracyZoneScoped;
    if (self && Query("START TRANSACTION;") != SQL_ERROR)
    {
        return true;
    }

    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("TransactionStart: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return false;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

bool SqlConnection::TransactionCommit()
{
    TracyZoneScoped;
    if (self && mysql_commit(&self->handle) == 0)
    {
        return true;
    }

    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("TransactionCommit: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return false;
}

/************************************************************************
 *                                                                        *
 *                                                                        *
 *                                                                        *
 ************************************************************************/

bool SqlConnection::TransactionRollback()
{
    TracyZoneScoped;
    if (self && Query("ROLLBACK;") != SQL_ERROR)
    {
        return true;
    }

    ShowFatalError("Query: %s", self->buf);
    ShowFatalError("TransactionRollback: SQL_ERROR: %s (%u)", mysql_error(&self->handle), mysql_errno(&self->handle));
    return false;
}

void SqlConnection::InitPreparedStatements()
{
    TracyZoneScoped;
    auto add = [&](std::string const& name, std::string const& query)
    {
        auto st                    = std::make_shared<SqlPreparedStatement>(&self->handle, query);
        m_PreparedStatements[name] = st;
    };

    add("GET_CHAR_VAR", "SELECT value FROM char_vars WHERE charid = (?) AND varname = (?) LIMIT 1;");
}

std::shared_ptr<SqlPreparedStatement> SqlConnection::GetPreparedStatement(std::string const& name)
{
    TracyZoneScoped;
    return m_PreparedStatements[name];
}
