﻿// Copyright (c) Athena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

#ifndef _COMMON_SQL_H
#define _COMMON_SQL_H

#include "cbasetypes.h"
#include "sql_prepared_stmt.h"

#include <mysql.h>
#include <unordered_map>

#ifdef WIN32
#include <winsock2.h>
#endif

#include "logging.h"

// Return codes
#define SQL_ERROR   -1
#define SQL_SUCCESS 0
#define SQL_NO_DATA 100

struct Sql_t
{
    std::string buf;

    // NOTE: Access to any of the MySQL resources is NOT thread-safe.
    // You will encounter very difficult to debug crashes and failed
    // operations if you're not careful!
    MYSQL          handle;
    MYSQL_RES*     result;
    MYSQL_ROW      row;
    unsigned long* lengths;
};

/// Data type identifier.
/// String, enum and blob data types need the buffer length specified.
enum SqlDataType
{
    SQLDT_NULL,
    // fixed size
    SQLDT_INT8,
    SQLDT_INT16,
    SQLDT_INT32,
    SQLDT_INT64,
    SQLDT_UINT8,
    SQLDT_UINT16,
    SQLDT_UINT32,
    SQLDT_UINT64,
    // platform dependent size
    SQLDT_CHAR,
    SQLDT_SHORT,
    SQLDT_INT,
    SQLDT_LONG,
    SQLDT_LONGLONG,
    SQLDT_UCHAR,
    SQLDT_USHORT,
    SQLDT_UINT,
    SQLDT_ULONG,
    SQLDT_ULONGLONG,
    // floating point
    SQLDT_FLOAT,
    SQLDT_DOUBLE,
    // other
    SQLDT_STRING,
    SQLDT_ENUM,
    // Note: An ENUM is a string with restricted values. When an invalid value
    //       is inserted, it is saved as an empty string (numerical value 0).
    SQLDT_BLOB,
    SQLDT_LASTID
};

class SqlPreparedStatement;

class SqlConnection
{
public:
    /// Establishes a connection.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    SqlConnection(const char* user, const char* passwd, const char* host, uint16 port, const char* db);
    ~SqlConnection();

    /// Retrieves the timeout of the connection.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 GetTimeout(uint32* out_timeout);

    /// Retrieves the name of the columns of a table into out_buf, with the separator after each name.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 GetColumnNames(const char* table, char* out_buf, size_t buf_len, char sep);

    /// Changes the encoding of the connection.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 SetEncoding(const char* encoding);

    void SetupKeepalive();

    /// Pings the connection.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 TryPing();

    /// Escapes a string.
    /// The output buffer must be at least strlen(from)*2+1 in size.
    ///
    /// @return The size of the escaped string
    size_t EscapeString(char* out_to, const char* from);
    size_t EscapeStringLen(char* out_to, const char* from, size_t from_len);

    /// Executes a query.
    /// Any previous result is freed.
    /// The query is used directly.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 QueryStr(const char* query);

    /// Executes a query.
    /// Any previous result is freed.
    /// The query is constructed as if it was sprintf.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    template <typename... Args>
    int32 Query(const char* query, Args... args)
    {
        std::string query_v = fmt::sprintf(query, args...);
        return QueryStr(query_v.c_str());
    }

    uint64 AffectedRows();

    /// Returns the number of the AUTO_INCREMENT column of the last INSERT/UPDATE query.
    ///
    /// @return Value of the auto-increment column
    uint64 LastInsertId();

    /// Returns the number of columns in each row of the result.
    ///
    /// @return Number of columns
    uint32 NumColumns();

    /// Returns the number of rows in the result.
    ///
    /// @return Number of rows
    uint64 NumRows();

    /// Fetches the next row.
    /// The data of the previous row is no longer valid.
    ///
    /// @return SQL_SUCCESS, SQL_ERROR or SQL_NO_DATA
    int32 NextRow();

    /// Establishes keepalive (periodic ping) on the connection
    ///
    /// @return the keepalive timer id, or INVALID_TIMER
    int32 Keepalive(std::string const& keepalive_name);

    /// Gets the data of a column.
    /// The data remains valid until the next row is fetched or the result is freed.
    ///
    /// @return SQL_SUCCESS or SQL_ERROR
    int32 GetData(size_t col, char** out_buf, size_t* out_len);

    int8*  GetData(size_t col);
    int32  GetIntData(size_t col);
    uint32 GetUIntData(size_t col);
    uint64 GetUInt64Data(size_t col);
    float  GetFloatData(size_t col);

    std::string GetStringData(size_t col);

    /// Frees the result of the query.
    void FreeResult();

    bool GetAutoCommit();
    bool SetAutoCommit(bool value);

    bool TransactionStart();
    bool TransactionCommit();
    bool TransactionRollback();

    std::shared_ptr<SqlPreparedStatement> GetPreparedStatement(std::string const& name);

    // NOTE: You need to be very careful of the lifetime you pass into these std::functions.
    //     : You should capture by value and be very careful of capturing pointers.
    //     : `const char*` is a pointer! If you need to pass that in, construct a std::string
    //     : and capture that by value!
    void Async(std::function<void(SqlConnection*)>&& func);
    void Async(std::string const& query);

    void HandleAsync();

    void SetLatencyWarning(bool _LatencyWarning);

private:
    Sql_t*      self;
    const char* m_User;
    const char* m_Passwd;
    const char* m_Host;
    uint16      m_Port;
    const char* m_Db;

    uint32 m_PingInterval;
    uint32 m_LastPing;
    bool   m_LatencyWarning;

    void InitPreparedStatements();

    std::unordered_map<std::string, std::shared_ptr<SqlPreparedStatement>> m_PreparedStatements;
};
#endif // _COMMON_SQL_H
