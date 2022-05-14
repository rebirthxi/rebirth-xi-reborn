﻿#ifndef _TRACY_H
#define _TRACY_H

#ifdef TRACY_ENABLE
#include "Tracy.hpp"
#include "cbasetypes.h"
#include "spdlog/fmt/fmt.h"
#include "spdlog/fmt/bundled/core.h"
#include "spdlog/fmt/bundled/format.h"

#define TracyFrameMark         FrameMark
#define TracyZoneScoped        ZoneScoped
#define TracyZoneScopedN(n)    ZoneScopedN(n)
#define TracyNamed(name)       ZoneNamed(name, true)
#define TracyZoneText(n, l)    ZoneText(n, l)
#define TracyZoneScopedC(c)    ZoneScopedC(c)
#define TracyZoneString(str)   ZoneText(str.c_str(), str.size())
#define TracyZoneCString(cstr) ZoneText(cstr, std::strlen(cstr))
#define TracyZoneIString(istr) TracyZoneCString(reinterpret_cast<const char*>(istr))
#define TracyLuaRegister(lua)  tracy::LuaRegister(lua)
#define TracyMessageStr(str)   TracyMessage(str.c_str(), str.size())

inline std::string Hex8ToString(uint8 hex)
{
    return fmt::format("0x{:02X}", hex);
}

inline std::string Hex16ToString(uint16 hex)
{
    return fmt::format("0x{:04X}", hex);
}

#define TracyZoneHex8(num)                                                                                                                                     \
    auto str = Hex8ToString(num);                                                                                                                              \
    TracyZoneText(str.c_str(), str.size());
#define TracyZoneHex16(num)                                                                                                                                    \
    auto str = Hex16ToString(num);                                                                                                                             \
    TracyZoneText(str.c_str(), str.size());

#define TracyReportLuaMemory(L)                                                                                                                                \
    TracyPlotConfig("Lua Memory Usage", tracy::PlotFormatType::Memory);                                                                                        \
    TracyPlot("Lua Memory Usage", static_cast<double>(lua_gc(L, LUA_GCCOUNT, 0)) * 1024.0);

#define TracyReportGraphNumber(name, num)                 \
    TracyPlotConfig(name, tracy::PlotFormatType::Number); \
    TracyPlot(name, num);

#define TracyReportGraphBytes(name, num)                  \
    TracyPlotConfig(name, tracy::PlotFormatType::Memory); \
    TracyPlot(name, num);

#define TracyReportGraphPercent(name, num)                    \
    TracyPlotConfig(name, tracy::PlotFormatType::Percentage); \
    TracyPlot(name, num);

#else // Empty stubs for regular builds
#define TracyFrameMark
#define TracyZoneScoped
#define TracyZoneScopedN(n)
#define TracyNamed(var, name)
#define TracyZoneText(n, l)
#define TracyZoneScopedC(c)
#define TracyZoneString(str)
#define TracyZoneCString(cstr)
#define TracyZoneIString(istr)
#define TracyZoneHex8(num)
#define TracyZoneHex16(num)
#define TracyReportLuaMemory(L)
#define TracyReportGraphNumber(name, num)
#define TracyReportGraphBytes(name, num)
#define TracyReportGraphPercent(name, num)
#define TracyLuaRegister(lua)
#define TracyMessageStr(str)
#endif

#endif // _TRACY_H
