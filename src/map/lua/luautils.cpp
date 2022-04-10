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

#include "../../common/filewatcher.h"
#include "../../common/logging.h"
#include "../../common/utils.h"
#include "../../common/version.h"

#include <array>
#include <filesystem>
#include <numeric>
#include <optional>
#include <string>
#include <unordered_map>

#include "lua_action.h"
#include "lua_battlefield.h"
#include "lua_instance.h"
#include "lua_item.h"
#include "lua_mobskill.h"
#include "lua_region.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "lua_zone.h"
#include "luautils.h"

#include "../ability.h"
#include "../ai/ai_container.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/death_state.h"
#include "../ai/states/inactive_state.h"
#include "../ai/states/item_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/mobskill_state.h"
#include "../ai/states/raise_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/respawn_state.h"
#include "../ai/states/weaponskill_state.h"
#include "../alliance.h"
#include "../battlefield.h"
#include "../campaign_system.h"
#include "../conquest_system.h"
#include "../daily_system.h"
#include "../entities/automatonentity.h"
#include "../entities/baseentity.h"
#include "../entities/charentity.h"
#include "../entities/mobentity.h"
#include "../instance.h"
#include "../items/item_puppet.h"
#include "../map.h"
#include "../mobskill.h"
#include "../packets/action.h"
#include "../packets/char_emotion.h"
#include "../packets/char_update.h"
#include "../packets/entity_update.h"
#include "../packets/entity_visual.h"
#include "../packets/menu_raisetractor.h"
#include "../party.h"
#include "../roe.h"
#include "../spell.h"
#include "../status_effect_container.h"
#include "../timetriggers.h"
#include "../transport.h"
#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../utils/instanceutils.h"
#include "../utils/itemutils.h"
#include "../utils/moduleutils.h"
#include "../utils/zoneutils.h"
#include "../vana_time.h"
#include "../weapon_skill.h"

// QR Custom Include
#include "../trade_container.h"
#include "../item_container.h"
#include "../packets/synth_animation.h"
#include "../utils/synthutils.h"

namespace luautils
{
    sol::state lua;

    bool                                  contentRestrictionEnabled;
    std::unordered_map<std::string, bool> contentEnabledMap;

    std::unique_ptr<Filewatcher>  filewatcher;

    std::unordered_map<uint32, sol::table> customMenuContext;

    /************************************************************************
     *                                                                       *
     *  Initialization of Lua user classes and global functions             *
     *                                                                       *
     ************************************************************************/

    int32 init()
    {
        TracyZoneScoped;
        ShowStatus("luautils::init:lua initializing");

        lua = sol::state();
        lua.open_libraries();

        // Globally require bit library
        lua.do_string("if not bit then bit = require('bit') end");

        // Bind print(...) globally
        lua.set_function("print", &luautils::print);

        // Bind math.randon(...) globally
        // clang-format off
        lua["math"]["random"] =
            sol::overload([]() { return xirand::GetRandomNumber(1.0f); },
                          [](int n) { return xirand::GetRandomNumber<int>(1, n); },
                          [](float n) { return xirand::GetRandomNumber<float>(0.0f, n); },
                          [](int n, int m) { return xirand::GetRandomNumber<int>(n, m + 1); },
                          [](float n, float m) { return xirand::GetRandomNumber<float>(n, m); });
        // clang-format on

        lua.set_function("GarbageCollectStep", &luautils::garbageCollectStep);
        lua.set_function("GarbageCollectFull", &luautils::garbageCollectFull);
        lua.set_function("GetZone", &luautils::GetZone);
        lua.set_function("GetNPCByID", &luautils::GetNPCByID);
        lua.set_function("GetMobByID", &luautils::GetMobByID);
        lua.set_function("WeekUpdateConquest", &luautils::WeekUpdateConquest);
        lua.set_function("GetRegionOwner", &luautils::GetRegionOwner);
        lua.set_function("GetRegionInfluence", &luautils::GetRegionInfluence);
        lua.set_function("GetNationRank", &luautils::GetNationRank);
        lua.set_function("GetConquestBalance", &luautils::GetConquestBalance);
        lua.set_function("IsConquestAlliance", &luautils::IsConquestAlliance);
        lua.set_function("SpawnMob", &luautils::SpawnMob);
        lua.set_function("DespawnMob", &luautils::DespawnMob);
        lua.set_function("GetPlayerByName", &luautils::GetPlayerByName);
        lua.set_function("GetPlayerByID", &luautils::GetPlayerByID);
        lua.set_function("GetMagianTrial", &luautils::GetMagianTrial);
        lua.set_function("GetMagianTrialsWithParent", &luautils::GetMagianTrialsWithParent);
        lua.set_function("JstMidnight", &luautils::JstMidnight);
        lua.set_function("JstWeekday", &luautils::JstWeekday);
        lua.set_function("VanadielTime", &luautils::VanadielTime);
        lua.set_function("VanadielTOTD", &luautils::VanadielTOTD);
        lua.set_function("VanadielHour", &luautils::VanadielHour);
        lua.set_function("VanadielMinute", &luautils::VanadielMinute);
        lua.set_function("VanadielDayOfTheWeek", &luautils::VanadielDayOfTheWeek);
        lua.set_function("VanadielDayOfTheMonth", &luautils::VanadielDayOfTheMonth);
        lua.set_function("VanadielDayOfTheYear", &luautils::VanadielDayOfTheYear);
        lua.set_function("VanadielYear", &luautils::VanadielYear);
        lua.set_function("VanadielMonth", &luautils::VanadielMonth);
        lua.set_function("VanadielUniqueDay", &luautils::VanadielUniqueDay);
        lua.set_function("VanadielDayElement", &luautils::VanadielDayElement);
        lua.set_function("VanadielMoonPhase", &luautils::VanadielMoonPhase);
        lua.set_function("VanadielMoonDirection", &luautils::VanadielMoonDirection);
        lua.set_function("VanadielRSERace", &luautils::VanadielRSERace);
        lua.set_function("VanadielRSELocation", &luautils::VanadielRSELocation);
        lua.set_function("SetVanadielTimeOffset", &luautils::SetVanadielTimeOffset);
        lua.set_function("IsMoonNew", &luautils::IsMoonNew);
        lua.set_function("IsMoonFull", &luautils::IsMoonFull);
        lua.set_function("RunElevator", &luautils::StartElevator);
        lua.set_function("GetServerVariable", &luautils::GetServerVariable);
        lua.set_function("SetServerVariable", &luautils::SetServerVariable);
        lua.set_function("ClearVarFromAll", &luautils::ClearVarFromAll);
        lua.set_function("SendEntityVisualPacket", &luautils::SendEntityVisualPacket);
        lua.set_function("UpdateServerMessage", &luautils::UpdateServerMessage);
        lua.set_function("GetServerVersion", &luautils::GetServerVersion);
        lua.set_function("GetMobRespawnTime", &luautils::GetMobRespawnTime);
        lua.set_function("DisallowRespawn", &luautils::DisallowRespawn);
        lua.set_function("UpdateNMSpawnPoint", &luautils::UpdateNMSpawnPoint);
        lua.set_function("SetDropRate", &luautils::SetDropRate);
        lua.set_function("NearLocation", &luautils::NearLocation);
        lua.set_function("Terminate", &luautils::Terminate);
        lua.set_function("GetHealingTickDelay", &luautils::GetHealingTickDelay);
        lua.set_function("GetReadOnlyItem", &luautils::GetReadOnlyItem);
        lua.set_function("GetAbility", &luautils::GetAbility);
        lua.set_function("GetSpell", &luautils::GetSpell);
        lua.set_function("SelectDailyItem", &luautils::SelectDailyItem);
        lua.set_function("GetQuestAndMissionFilenamesList", &luautils::GetQuestAndMissionFilenamesList);
        lua.set_function("GetCachedInstanceScript", &luautils::GetCachedInstanceScript);

        // This binding specifically exists to forcefully crash the server.
        lua.set_function("ForceCrash", [](){ crash(); });

        // Register Sol Bindings
        CLuaAbility::Register();
        CLuaAction::Register();
        CLuaBaseEntity::Register();
        CLuaBattlefield::Register();
        CLuaInstance::Register();
        CLuaMobSkill::Register();
        CLuaRegion::Register();
        CLuaSpell::Register();
        CLuaStatusEffect::Register();
        CLuaTradeContainer::Register();
        CLuaZone::Register();
        CLuaItem::Register();

        // Load globals
        // Truly global files first
        lua.script_file("./scripts/settings/main.lua");
        lua.script_file("./scripts/globals/common.lua");
        roeutils::init(); // TODO: Get rid of the need to do this

        // Then the rest...
        for (auto entry : std::filesystem::directory_iterator("./scripts/globals"))
        {
            if (entry.path().extension() == ".lua")
            {
                // TODO: Add to verbose logging
                auto relative_path_string = entry.path().relative_path().generic_string();
                //auto lua_path = std::filesystem::relative(entry.path(), "./").replace_extension("").generic_string();
                //ShowInfo("Loading global script %s", lua_path);
                auto result = lua.safe_script_file(relative_path_string);
                if (!result.valid())
                {
                    sol::error err = result;
                    ShowError(err.what());
                }
            }
        }

        // Pet Scripts
        CacheLuaObjectFromFile("./scripts/globals/pets/automaton.lua");
        CacheLuaObjectFromFile("./scripts/globals/pets/luopan.lua");
        CacheLuaObjectFromFile("./scripts/globals/pets/wyvern.lua");

        // Handle settings
        contentRestrictionEnabled = GetSettingsVariable("RESTRICT_CONTENT") != 0;

        moduleutils::LoadLuaModules();

        filewatcher = std::make_unique<Filewatcher>("scripts");

        TracyReportLuaMemory(lua.lua_state());

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Освобождение lua                                                     *
     *                                                                       *
     ************************************************************************/

    int32 garbageCollectStep()
    {
        TracyZoneScoped;
        TracyReportLuaMemory(lua.lua_state());

        lua.step_gc(10); // LUA_GCSTEP 10 (performs an incremental step of garbage collection. Step size 10kb.)

        // NOTE: This is just requesting that an incremental step starts. There won't be a before/after change from
        //       this request!

        ShowScript("Garbage Collected (Step)");
        ShowScript("Current State Top: %d, Total Memory Used: %dkb", lua_gettop(lua.lua_state()), lua.memory_used() / 1024);

        TracyReportLuaMemory(lua.lua_state());

        return 0;
    }

    int32 garbageCollectFull()
    {
        TracyZoneScoped;
        TracyReportLuaMemory(lua.lua_state());

        auto before_mem_kb = lua.memory_used() / 1024;

        lua.collect_garbage(); // LUA_GCCOLLECT (performs a full garbage-collection cycle.)

        auto after_mem_kb = lua.memory_used() / 1024;

        ShowScript("Garbage Collected (Full)");
        ShowScript("Current State Top: %d, Total Memory Used: %dkb -> %dkb", lua_gettop(lua.lua_state()), before_mem_kb, after_mem_kb);

        TracyReportLuaMemory(lua.lua_state());

        return 0;
    }

    void ReloadFilewatchList()
    {
        std::set<std::string> filenames; // For de-duping

        std::filesystem::path path;
        while (filewatcher->modifiedQueue.try_dequeue(path))
        {
            if (path.extension() == ".lua")
            {
                std::string filename = path.relative_path().generic_string();
                filenames.insert(filename);
            }
        }

        for (auto const& filename : filenames)
        {
            CacheLuaObjectFromFile(filename, true);
        }
    }

    std::vector<std::string> GetQuestAndMissionFilenamesList()
    {
        TracyZoneScoped;
        std::vector<std::string> outVec;

        // Scrape for files of the form: "scripts/(quests|missions)/(area|expansion)/(filename).lua"
        auto scrapeSubdir = [&](std::string subFolder) -> void
        {
            for (auto const& entry : std::filesystem::recursive_directory_iterator(subFolder))
            {
                auto path = entry.path().relative_path();

                // TODO(compiler updates):
                // entry.depth() is not yet available in all of our compilers
                auto depth = std::distance(path.begin(), path.end());

                bool isHelpersFile = path.filename() == "helpers.lua";

                if (!entry.is_directory() &&
                    path.extension() == ".lua" &&
                    depth == 4 &&
                    !isHelpersFile)
                {
                    outVec.emplace_back(path.replace_extension("").make_preferred().string());
                }
            }
        };

        scrapeSubdir("scripts/missions");
        scrapeSubdir("scripts/quests");

        return outVec;
    }

    /************************************************************************
     *                                                                       *
     * Overriding the official lua print function                            *
     *                                                                       *
     ************************************************************************/
    std::string luaToString(sol::object const& obj, std::size_t depth = 0)
    {
        switch (obj.get_type())
        {
            case sol::type::none:
                [[fallthrough]];
            case sol::type::lua_nil:
            {
                return "nil";
            }
            case sol::type::string:
            {
                if (depth > 0)
                {
                    return "\"" + obj.as<std::string>() + "\"";
                }
                else
                {
                    return obj.as<std::string>();
                }
            }
            case sol::type::number:
            {
                return fmt::format("{0:g}", obj.as<double>());
            }
            case sol::type::thread:
            {
                return "thread";
            }
            case sol::type::boolean:
            {
                return obj.as<bool>() ? "true" : "false";
            }
            case sol::type::function:
            {
                return "function";
            }
            case sol::type::userdata:
            {
                return lua["tostring"](obj);
            }
            case sol::type::lightuserdata:
            {
                return "lightuserdata";
            }
            case sol::type::table:
            {
                auto table  = obj.as<sol::table>();

                // Stringify everything first
                std::vector<std::string> stringVec;
                for (auto& pair : table)
                {
                    stringVec.emplace_back(luaToString(pair.second, depth + 1));
                }

                // Accumulate into a pretty string
                std::string outStr = "table{ ";
                outStr += std::accumulate(std::begin(stringVec), std::end(stringVec), std::string(),
                [](std::string& ss, std::string& s)
                {
                    return ss.empty() ? s : ss + ", " + s;
                });
                return outStr + " }";
            }
        }
        return "UNKNOWN";
    }

    void print(sol::variadic_args va)
    {
        TracyZoneScoped;

        std::string outString;
        for (int i = 0; i < va.size(); ++i)
        {
            auto entry = luaToString(va[i]);
            // TODO: Use fmt::join if we ever update fmt
            outString += fmt::format("{} ", entry);
        }

        ShowScript(fmt::format("{}", outString));
    }

    sol::function getEntityCachedFunction(CBaseEntity* PEntity, std::string funcName)
    {
        TracyZoneScoped;
        TracyZoneString(funcName);
        TracyZoneIString(PEntity->GetName());

        if (PEntity->objtype == TYPE_NPC)
        {
            std::string zone_name = (const char*)PEntity->loc.zone->GetName();
            std::string npc_name  = (const char*)PEntity->GetName();

            if (auto cached_func = lua["xi"]["zones"][zone_name]["npcs"][npc_name][funcName]; cached_func.valid())
            {
                return cached_func;
            }
        }
        else if (PEntity->objtype == TYPE_MOB)
        {
            std::string zone_name = (const char*)PEntity->loc.zone->GetName();
            std::string mob_name  = (const char*)PEntity->GetName();

            if (auto cached_func = lua["xi"]["zones"][zone_name]["mobs"][mob_name][funcName]; cached_func.valid())
            {
                return cached_func;
            }
        }
        else if (PEntity->objtype == TYPE_PET)
        {
            std::string mob_name = static_cast<CPetEntity*>(PEntity)->GetScriptName();

            if (auto cached_func = lua["xi"]["globals"]["pets"][mob_name][funcName]; cached_func.valid())
            {
                return cached_func;
            }
        }
        else if (PEntity->objtype == TYPE_TRUST)
        {
            std::string mob_name = (const char*)PEntity->GetName();

            if (auto cached_func = lua["xi"]["globals"]["spells"]["trust"][mob_name][funcName]; cached_func.valid())
            {
                return cached_func;
            }
        }

        // Didn't find it
        return sol::lua_nil;
    }

    sol::function getSpellCachedFunction(CSpell* PSpell, std::string funcName)
    {
        TracyZoneScoped;
        TracyZoneString(funcName);
        TracyZoneIString(PSpell->getName());

        auto name = (const char*)PSpell->getName();

        std::string switchKey = "";
        switch (PSpell->getSpellGroup())
        {
            case SPELLGROUP_WHITE:
            {
                switchKey = "white";
            }
            break;
            case SPELLGROUP_BLACK:
            {
                switchKey = "black";
            }
            break;
            case SPELLGROUP_SONG:
            {
                switchKey = "songs";
            }
            break;
            case SPELLGROUP_NINJUTSU:
            {
                switchKey = "ninjutsu";
            }
            break;
            case SPELLGROUP_SUMMONING:
            {
                switchKey = "summoning";
            }
            break;
            case SPELLGROUP_BLUE:
            {
                switchKey = "blue";
            }
            break;
            case SPELLGROUP_GEOMANCY:
            {
                switchKey = "geomancy";
            }
            break;
            case SPELLGROUP_TRUST:
            {
                switchKey = "trust";
            }
            break;
            default:
            {
                ShowError("luautils::getSpellCachedFunction: Spell %s not inside a folder or doesnt have a SpellGroup", name);
            }
            break;
        }

        if (auto cached_func = lua["xi"]["globals"]["spells"][switchKey][name][funcName]; cached_func.valid())
        {
            return cached_func;
        }

        // Didn't find it
        return sol::lua_nil;
    }

    // Assumes filename in the form "./scripts/folder0/folder1/folder2/mob_name.lua
    // Object returned form that script will be cached to:
    // xi.folder0.folder1.folder2.mob_name
    void CacheLuaObjectFromFile(std::string filename, bool printOutput /*= false*/)
    {
        TracyZoneScoped;
        TracyZoneString(filename);

        // Handle filename -> path conversion
        std::filesystem::path    path(filename);
        std::vector<std::string> parts;
        for (auto part : path)
        {
            part.replace_extension("");
            parts.emplace_back(part.string());
        }

        auto it = std::find(parts.begin(), parts.end(), "scripts");
        if (it == parts.end())
        {
            ShowError("luautils::CacheLuaObjectFromFile: Invalid filename: %s", filename);
            return;
        }

        // Now that the list is verified, overwrite it with the same list; without "scripts"
        parts = std::vector<std::string>(it + 1, parts.end());

        // Handle Globals then return
        // Globals need to be nil'd before they're reloaded
        if (parts.size() == 2 && parts[0] == "globals")
        {
            std::string requireName = fmt::format("scripts/globals/{}", parts[1]);

            auto result = lua.safe_script(fmt::format(R"(package.loaded["{}"] = nil; require("{}");)", requireName, requireName));
            if (!result.valid())
            {
                sol::error err = result;
                ShowError("luautils::CacheLuaObjectFromFile: Load global error: %s: %s", filename, err.what());
                return;
            }

            ShowInfo("[FileWatcher] GLOBAL %s -> \"%s\"", filename, requireName);
            return;
        }

        // Handle Quests and Missions then return
        if (parts.size() == 3 &&
            (parts[0] == "quests" || parts[0] == "missions"))
        {
            if (parts[2] == "helpers")
            {
                std::string requireName = fmt::format("scripts/{}/{}/{}", parts[0], parts[1], parts[2]);

                auto result = lua.safe_script(fmt::format(R"(
                    require("scripts/globals/utils")
                    package.loaded["{0}"] = nil
                    utils.prequire("{0}")
                )", requireName));

                ShowInfo("[FileWatcher] INTERACTION HELPERS %s", parts[1]);
            }
            else // Regular interaction files
            {
                std::string requireName = fmt::format("scripts/{}/{}/{}", parts[0], parts[1], parts[2]);

                auto result = lua.safe_script(fmt::format(R"(
                    require("scripts/globals/utils")
                    require("scripts/globals/interaction/interaction_global")

                    if package.loaded["{0}"] then
                        local old = package.loaded["{0}"]
                        package.loaded["{0}"] = nil
                        if InteractionGlobal and old then
                            InteractionGlobal.lookup:removeContainer(old)
                        end
                    end

                    local res = utils.prequire("{0}")
                    if InteractionGlobal and res then
                        InteractionGlobal.lookup:addContainer(res)
                    end
                )", requireName));

                if (!result.valid())
                {
                    sol::error err = result;
                    ShowError("luautils::CacheLuaObjectFromFile: Load interaction error: %s: %s", filename, err.what());
                    return;
                }

                ShowInfo("[FileWatcher] INTERACTION %s -> %s", requireName, parts[2]);
            }

            return;
        }

        if (!std::filesystem::exists(filename))
        {
            // ShowDebug("luautils::CacheLuaObjectFromFile: File does not exist: %s", filename);
            return;
        }

        // Try and load script
        auto file_result = lua.safe_script_file(filename);
        if (!file_result.valid())
        {
            sol::error err = file_result;
            ShowError("luautils::CacheLuaObjectFromFile: Load error: %s: %s", filename, err.what());
            return;
        }

        if (!file_result.return_count())
        {
            ShowError("luautils::CacheLuaObjectFromFile: No returned object to cache: %s", filename);
            return;
        }

        // file_result should be good, cache it!

        auto        table   = lua["xi"].get_or_create<sol::table>();
        std::string out_str = "xi";
        for (auto& part : parts)
        {
            if (part == parts.back())
            {
                table[sol::override_value][part] = file_result;
            }
            else
            {
                table = table[part].get_or_create<sol::table>(lua.create_table());
            }
            out_str += "." + part;
        }

        if (printOutput)
        {
            ShowInfo("[FileWatcher] %s -> %s", filename, out_str);
        }

        moduleutils::TryApplyModules();
    }

    sol::table GetCacheEntryFromFilename(std::string filename)
    {
        TracyZoneScoped;
        TracyZoneString(filename);

        if (filename.empty())
        {
            return lua.create_table();
        }

        // Handle filename -> path conversion
        std::filesystem::path    path(filename);
        std::vector<std::string> parts;
        for (auto part : path)
        {
            part.replace_extension("");
            parts.emplace_back(part.string());
        }

        auto it = std::find(parts.begin(), parts.end(), "scripts");
        if (it == parts.end())
        {
            ShowError("luautils::GetCacheEntryFromFilename: Invalid filename: %s", filename);
            return lua.create_table();
        }

        // Now that the list is verified, overwrite it with the same list; without "scripts"
        parts = std::vector<std::string>(it + 1, parts.end());

        // TODO: This is bad, this could create bad tables that persist...
        auto table = lua["xi"].get_or_create<sol::table>();
        for (auto& part : parts)
        {
            table = table[part].get_or_create<sol::table>();
        }

        return table;
    }

    void OnEntityLoad(CBaseEntity* PEntity)
    {
        TracyZoneScoped;

        std::string filename;
        if (PEntity->objtype == TYPE_NPC)
        {
            // TODO: These int8 string need to die.
            std::string zone_name = (const char*)PEntity->loc.zone->GetName();
            std::string npc_name  = (const char*)PEntity->GetName();
            filename              = fmt::format("./scripts/zones/{}/npcs/{}.lua", zone_name, npc_name);
        }
        else if (PEntity->objtype == TYPE_MOB)
        {
            // TODO: These int8 string need to die.
            std::string zone_name = (const char*)PEntity->loc.zone->GetName();
            std::string mob_name  = (const char*)PEntity->GetName();
            filename              = fmt::format("./scripts/zones/{}/mobs/{}.lua", zone_name, mob_name);
        }
        else if (PEntity->objtype == TYPE_PET)
        {
            std::string mob_name = static_cast<CPetEntity*>(PEntity)->GetScriptName();
            filename             = fmt::format("./scripts/globals/pets/{}.lua", static_cast<CPetEntity*>(PEntity)->GetScriptName());
        }
        else if (PEntity->objtype == TYPE_TRUST)
        {
            std::string mob_name = (const char*)PEntity->GetName();
            filename             = fmt::format("./scripts/globals/spells/trust/{}.lua", PEntity->GetName());
        }

        CacheLuaObjectFromFile(filename);
    }

    // temporary solution for geysers in Dangruf_Wadi
    void SendEntityVisualPacket(uint32 npcid, const char* command)
    {
        TracyZoneScoped;
        if (CBaseEntity* PNpc = zoneutils::GetEntity(npcid, TYPE_NPC))
        {
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityVisualPacket(PNpc, command));
        }
    }

    std::optional<CLuaBaseEntity> GetNPCByID(uint32 npcid, sol::object const& instanceObj)
    {
        TracyZoneScoped;

        CInstance* PInstance = nullptr;
        if (instanceObj.is<CLuaInstance>())
        {
            PInstance = instanceObj.as<CLuaInstance>().GetInstance();
        }

        CBaseEntity* PNpc{ nullptr };
        if (PInstance)
        {
            PNpc = PInstance->GetEntity(npcid & 0xFFF, TYPE_NPC);
        }
        else
        {
            PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);
        }

        if (!PNpc)
        {
            ShowWarning("luautils::GetNPCByID NPC doesn't exist (%d)", npcid);
            return std::nullopt;
        }

        return std::optional<CLuaBaseEntity>(PNpc);
    }

    void InitInteractionGlobal()
    {
        CacheLuaObjectFromFile("./scripts/globals/interaction/interaction_global.lua");

        auto initZones = lua["xi"]["globals"]["interaction"]["interaction_global"]["initZones"];
        std::vector<uint16> zoneIds;
        zoneutils::ForEachZone([&zoneIds](CZone* PZone) {
            zoneIds.push_back(PZone->GetID());
        });

        auto result = initZones(zoneIds);

        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::InitInteractionGlobal: %s", err.what());
        }
    }

    /************************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    std::optional<CLuaZone> GetZone(uint16 zoneId)
    {
        TracyZoneScoped;

        CZone* zone = zoneutils::GetZone(zoneId);
        if (zone)
        {
            return std::optional<CLuaZone>(zone);
        }

        return std::nullopt;
    }

    std::optional<CLuaBaseEntity> GetMobByID(uint32 mobid, sol::object const& instanceObj)
    {
        TracyZoneScoped;

        CInstance* PInstance = nullptr;
        if (instanceObj.is<CLuaInstance>())
        {
            PInstance = instanceObj.as<CLuaInstance>().GetInstance();
        }

        CBaseEntity* PMob{ nullptr };

        if (PInstance)
        {
            PMob = PInstance->GetEntity(mobid & 0xFFF, TYPE_MOB | TYPE_PET);
        }
        else
        {
            PMob = zoneutils::GetEntity(mobid, TYPE_MOB | TYPE_PET);
        }

        if (!PMob)
        {
            ShowWarning("luautils::GetMobByID Mob doesn't exist (%d)", mobid);
            return std::nullopt;
        }

        return std::optional<CLuaBaseEntity>(PMob);
    }

    /************************************************************************
     *                                                                       *
     * WeekUpdateConquest                                                    *
     *                                                                       *
     ************************************************************************/

    void WeekUpdateConquest(sol::variadic_args va)
    {
        TracyZoneScoped;

        ConquestUpdate type = Conquest_Tally_Start;
        if (va.size())
        {
            type = static_cast<ConquestUpdate>(va.get<uint8>(0));
        }
        conquest::UpdateConquestGM(type);
    }

    /************************************************************************
     *                                                                       *
     *  Find out the country that owns the current region                    *
     *                                                                       *
     ************************************************************************/

    uint8 GetRegionOwner(uint8 type)
    {
        TracyZoneScoped;
        return conquest::GetRegionOwner(static_cast<REGION_TYPE>(type));
    }

    uint8 GetRegionInfluence(uint8 type)
    {
        TracyZoneScoped;
        return conquest::GetInfluenceGraphics(static_cast<REGION_TYPE>(type));
    }

    /************************************************************************
     *                                                                       *
     * Get Rank of Nations in Conquest                                       *
     *                                                                       *
     ************************************************************************/

    uint8 GetNationRank(uint8 nation)
    {
        TracyZoneScoped;

        uint8 balance = conquest::GetBalance();
        switch (nation)
        {
            case NATION_SANDORIA:
                balance &= 0x3U;
                return balance;
            case NATION_BASTOK:
                balance &= 0xCU;
                balance >>= 2;
                return balance;
            case NATION_WINDURST:
                balance >>= 4;
                return balance;
            default:
                return 0;
        }
    }

    uint8 GetConquestBalance()
    {
        TracyZoneScoped;
        return conquest::GetBalance();
    }

    bool IsConquestAlliance()
    {
        TracyZoneScoped;
        return conquest::IsAlliance();
    }

    /************************************************************************
     *                                                                       *
     * SetRegionalConquestOverseers() used for updating conquest guards      *
     *                                                                       *
     ************************************************************************/

    int32 SetRegionalConquestOverseers(uint8 regionID)
    {
        TracyZoneScoped;

        auto setRegionalConquestOverseers = lua["xi"]["conquest"]["setRegionalConquestOverseers"];
        if (!setRegionalConquestOverseers.valid())
        {
            sol::error err = setRegionalConquestOverseers;
            ShowError("luautils::setRegionalConquestOverseers: %s", err.what());
            return -1;
        }

        auto result = setRegionalConquestOverseers(regionID);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::setRegionalConquestOverseers: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *    Return Vanadiel Time                                               *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielTime()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getVanaTime();
    }

    /************************************************************************
     *                                                                       *
     *  Получаем текущее время суток Vana'diel                               *
     *                                                                       *
     ************************************************************************/

    uint8 VanadielTOTD()
    {
        TracyZoneScoped;
        return static_cast<uint8>(CVanaTime::getInstance()->GetCurrentTOTD());
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Year                                                *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielYear()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getYear();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Month                                               *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielMonth()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getMonth();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Unique Day                                          *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielUniqueDay()
    {
        TracyZoneScoped;

        int32 day;
        int32 month;
        int32 year;

        day   = CVanaTime::getInstance()->getDayOfTheMonth();
        month = CVanaTime::getInstance()->getMonth();
        year  = CVanaTime::getInstance()->getYear();

        return (year * 360) + (month * 30 - 30) + day;
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Day of Year                                         *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielDayOfTheYear()
    {
        TracyZoneScoped;

        int32 day;
        int32 month;

        day   = CVanaTime::getInstance()->getDayOfTheMonth();
        month = CVanaTime::getInstance()->getMonth();

        return (month * 30 - 30) + day;
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Day of the Month                                    *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielDayOfTheMonth()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getDayOfTheMonth();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel day of the week                                     *
     *   Note: THIS IS NOT THE SAME AS THAT DAY'S ELEMENT                    *
     *   Days of week: Fire Earth Water Wind Ice Lightning Light Dark        *
     *   Elements: Fire Ice Wind Earth Thunder Water Light Dark              *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielDayOfTheWeek()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getWeekday();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Hour                                                *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielHour()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getHour();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Minute                                              *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielMinute()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getMinute();
    }

    /************************************************************************
     *                                                                       *
     *   Return Vanadiel Day's element                                       *
     *   Note: THIS IS NOT THE SAME AS THE DAY OF THE WEEK                   *
     *   Days of week: Fire Earth Water Wind Ice Lightning Light Dark        *
     *   Elements: Fire Ice Wind Earth Thunder Water Light Dark              *
     *                                                                       *
     ************************************************************************/

    uint8 VanadielDayElement()
    {
        TracyZoneScoped;
        return static_cast<uint8>(battleutils::GetDayElement());
    }

    /************************************************************************
     *                                                                       *
     * JstMidnight - Returns UTC timestamp of upcoming JST midnight
     *                                                                       *
     ************************************************************************/

    uint32 JstMidnight()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getJstMidnight();
    }

    /************************************************************************
     *                                                                       *
     * JstWeekday - Returns days since Sunday JST
     *                                                                       *
     ************************************************************************/

    uint32 JstWeekday()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getJstWeekDay();
    }

    /************************************************************************
     *                                                                       *
     *   Return Moon Phase                                                   *
     *                                                                       *
     ************************************************************************/

    uint32 VanadielMoonPhase()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getMoonPhase();
    }

    bool SetVanadielTimeOffset(int32 offset)
    {
        TracyZoneScoped;
        int32 custom = CVanaTime::getInstance()->getCustomEpoch();
        CVanaTime::getInstance()->setCustomEpoch((custom ? custom : VTIME_BASEDATE) - offset);
        return true;
    }

    /************************************************************************
     *                                                                       *
     *   Return Moon Phasing Direction                                       *
     *                                                                       *
     ************************************************************************/

    uint8 VanadielMoonDirection()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getMoonDirection();
    }

    /************************************************************************
     *                                                                       *
     *   Return RSE Race                                                     *
     *                                                                       *
     ************************************************************************/

    uint8 VanadielRSERace()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getRSERace();
    }

    /************************************************************************
     *                                                                       *
     *   Return RSE Location                                                 *
     *                                                                       *
     ************************************************************************/

    uint8 VanadielRSELocation()
    {
        TracyZoneScoped;
        return CVanaTime::getInstance()->getRSELocation();
    }

    /************************************************************************
     *                                                                       *
     *   is new moon?                                                        *
     *                                                                       *
     ************************************************************************/

    bool IsMoonNew()
    {
        TracyZoneScoped;
        // New moon occurs when:
        // Waning (decreasing) from 10% to 0%,
        // Waxing (increasing) from 0% to 5%.

        uint8 phase = CVanaTime::getInstance()->getMoonPhase();

        switch (CVanaTime::getInstance()->getMoonDirection())
        {
            case 0: // None
                if (phase == 0)
                {
                    return true;
                }
                break;
            case 1: // Waning (decending)
                if (phase <= 10)
                {
                    return true;
                }
                break;
            case 2: // Waxing (increasing)
                if (phase <= 5)
                {
                    return true;
                }
                break;
        }

        return false;
    }

    /************************************************************************
     *                                                                       *
     *   is full moon?                                                       *
     *                                                                       *
     ************************************************************************/

    bool IsMoonFull()
    {
        TracyZoneScoped;
        // Full moon occurs when:
        // Waxing (increasing) from 90% to 100%,
        // Waning (decending) from 100% to 95%.

        uint8 phase = CVanaTime::getInstance()->getMoonPhase();

        switch (CVanaTime::getInstance()->getMoonDirection())
        {
            case 0: // None
                if (phase == 100)
                {
                    return true;
                }
            case 1: // Waning (decending)
                if (phase >= 95 && phase <= 100)
                {
                    return true;
                }
            case 2: // Waxing (increasing)
                if (phase >= 90 && phase <= 100)
                {
                    return true;
                }
        }

        return false;
    }

    /************************************************************************
     *                                                                       *
     *  Spawn a mob using mob ID. Returns that mob.                          *
     *                                                                       *
     ************************************************************************/
    std::optional<CLuaBaseEntity> SpawnMob(uint32 mobid, sol::object const& arg2, sol::object const& arg3)
    {
        TracyZoneScoped;

        CMobEntity* PMob = nullptr;

        if (arg2.is<CLuaInstance>())
        {
            auto PInstance = arg2.as<CLuaInstance>().GetInstance();
            auto PEntity   = PInstance->GetEntity(mobid & 0xFFF, TYPE_MOB);
            PMob           = dynamic_cast<CMobEntity*>(PEntity);
        }
        else if (((mobid >> 12) & 0x0FFF) < MAX_ZONEID)
        {
            PMob = dynamic_cast<CMobEntity*>(zoneutils::GetEntity(mobid, TYPE_MOB));
        }

        if (PMob != nullptr)
        {
            if (arg2.is<uint32>())
            {
                PMob->SetDespawnTime(std::chrono::seconds(arg2.as<uint32>()));
            }

            if (arg3.is<uint32>())
            {
                PMob->m_RespawnTime  = arg3.as<uint32>() * 1000;
                PMob->m_AllowRespawn = true;
            }
            else
            {
                if (!PMob->PAI->IsSpawned())
                {
                    PMob->Spawn();
                }
                else
                {
                    ShowDebug("SpawnMob: %u <%s> is already spawned", PMob->id, PMob->GetName());
                }
            }
        }
        else
        {
            ShowDebug("SpawnMob: mob <%u> not found", mobid);
            return std::nullopt;
        }

        return std::optional<CLuaBaseEntity>(PMob);
    }

    /************************************************************************
     *                                                                       *
     *  DeSpawn mob using mob ID.                                            *
     *                                                                       *
     ************************************************************************/

    void DespawnMob(uint32 mobid, sol::object const& arg2)
    {
        TracyZoneScoped;

        CMobEntity* PMob = nullptr;

        if (arg2.is<CLuaInstance>())
        {
            auto PInstance = arg2.as<CLuaInstance>().GetInstance();
            PMob           = (CMobEntity*)PInstance->GetEntity(mobid & 0xFFF, TYPE_MOB);
        }
        else
        {
            PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        }

        if (PMob != nullptr)
        {
            if (arg2.is<uint32>())
            {
                PMob->SetDespawnTime(std::chrono::seconds(arg2.as<uint32>()));
            }
            else
            {
                PMob->PAI->Despawn();
            }
        }
    }

    /************************************************************************
     *                                                                       *
     *  Gets a player object via the player's name. Used for GM commands.    *
     *                                                                       *
     ************************************************************************/

    std::optional<CLuaBaseEntity> GetPlayerByName(std::string name)
    {
        TracyZoneScoped;

        CCharEntity* PTargetChar = zoneutils::GetCharByName((int8*)name.c_str());

        if (PTargetChar != nullptr)
        {
            return std::optional<CLuaBaseEntity>(PTargetChar);
        }

        return std::nullopt;
    }

    /************************************************************************
     *                                                                       *
     *  Gets a player object via the player's ID.                            *
     *                                                                       *
     ************************************************************************/

    std::optional<CLuaBaseEntity> GetPlayerByID(uint32 pid)
    {
        TracyZoneScoped;

        CCharEntity* PTargetChar = zoneutils::GetChar(pid);

        if (PTargetChar != nullptr)
        {
            return std::optional<CLuaBaseEntity>(PTargetChar);
        }

        return std::nullopt;
    }

    /*******************************************************************************
    *                                                                              *
    *  Returns data of Magian trials                                               *
    *  Will return a single table with keys matching the SQL table column          *
    *  names if given one trial #, or will return a table of likewise trial        *
    *  columns if given a table of trial #s.                                       *
    *  examples: GetMagianTrial(2)          returns {column = value, ...}          *
    *            GetMagianTrial({2, 16})    returns { 2 = { column = value, ...},  *
    *                                                16 = { column = value, ...}}  *
    *******************************************************************************/

    sol::table GetMagianTrial(sol::variadic_args va)
    {
        TracyZoneScoped;

        sol::table table = lua.create_table();

        if (va.size())
        {
            // Get all magian table columns to build lua keys
            const char*              ColumnQuery = "SHOW COLUMNS FROM `magian`;";
            std::vector<std::string> magianColumns;
            if (sql->Query(ColumnQuery) == SQL_SUCCESS && sql->NumRows() != 0)
            {
                while (sql->NextRow() == SQL_SUCCESS)
                {
                    magianColumns.push_back((const char*)sql->GetData(0));
                }
            }
            else
            {
                ShowError("Error: No columns in `magian` table?");
                return sol::lua_nil;
            }

            const char* Query = "SELECT * FROM `magian` WHERE trialId = %u;";

            if (va[0].is<lua_Number>())
            {
                int32 trial = va[0].as<int32>();
                int32 field{ 0 };
                if (sql->Query(Query, trial) != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
                {
                    for (auto column : magianColumns)
                    {
                        table[column] = (int32)sql->GetIntData(field++);
                    }
                }
            }
            else if (va[0].is<sol::table>())
            {
                auto trials = va[0].as<std::vector<int32>>();

                // one inner table each trial { trial# = { column = value, ... } }
                for (auto trial : trials)
                {
                    int32 ret = sql->Query(Query, trial);
                    if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
                    {
                        auto  inner_table = table.create_named(trial);
                        int32 field{ 0 };
                        for (auto column : magianColumns)
                        {
                            inner_table[column] = (int32)sql->GetIntData(field++);
                        }
                    }
                }
            }
            else
            {
                return sol::lua_nil;
            }

            return table;
        }

        return sol::lua_nil;
    }

    /*******************************************************************************
    *                                                                              *
    *  Returns a list of trial numbers who have the given parent trial             *
    *                                                                              *
    *******************************************************************************/

    sol::table GetMagianTrialsWithParent(int32 parentTrial)
    {
        TracyZoneScoped;

        const char* Query = "SELECT `trialId` from `magian` WHERE `previousTrial` = %u;";
        int32       ret   = sql->Query(Query, parentTrial);
        if (ret != SQL_ERROR && sql->NumRows() > 0)
        {
            auto  table = lua.create_table();
            int32 field{ 0 };
            while (sql->NextRow() == 0)
            {
                int32 childTrial = sql->GetIntData(0);
                table[++field]   = childTrial;
            }

            return table;
        }

        return sol::lua_nil;
    }

    /************************************************************************
     *                                                                       *
     *  Load the value of the TextID variable of the specified zone          *
     *                                                                       *
     ************************************************************************/

    int32 GetTextIDVariable(uint16 ZoneID, const char* variable)
    {
        TracyZoneScoped;
        return lua["zones"][ZoneID]["text"][variable].get_or(0);
    }

    /************************************************************************
     *                                                                       *
     *  Get a Variable From Settings.lua                                     *
     *                                                                       *
     ************************************************************************/

    uint8 GetSettingsVariable(const char* variable)
    {
        TracyZoneScoped;
        return lua["xi"]["settings"][variable].valid() ? lua["xi"]["settings"][variable].get<uint8>() : 0;
    }

    /************************************************************************
     *                                                                       *
     *  Check if an something is restricted in Settings.lua                  *
     *  ENABLE_ is subject to RESTRICT_BY_EXPANSION                          *
     *  ALLOW_ is NOT subject to RESTRICT_BY_EXPANSION                       *
     *                                                                       *
     ************************************************************************/

    bool IsContentEnabled(const char* contentTag)
    {
        TracyZoneScoped;

        if (contentTag != nullptr)
        {
            std::string contentVariable("ENABLE_");
            contentVariable.append(contentTag);

            bool contentEnabled;

            if (auto contentEnabledIter = contentEnabledMap.find(contentVariable); contentEnabledIter != contentEnabledMap.end())
            {
                contentEnabled = contentEnabledIter->second;
            }
            else
            {
                // Cache contentTag lookups in a map so that we don't re-hit the Lua file every time
                contentEnabled = (GetSettingsVariable(contentVariable.c_str()) != 0);

                contentEnabledMap[contentVariable] = contentEnabled;
            }

            if (!contentEnabled && contentRestrictionEnabled)
            {
                return false;
            }
        }

        return true;
    }

    /************************************************************************
     *                                                                       *
     ************************************************************************/

    int32 OnZoneInitialise(uint16 ZoneID)
    {
        TracyZoneScoped;

        CZone* PZone = zoneutils::GetZone(ZoneID);
        auto   name  = (const char*)PZone->GetName();

        auto filename = fmt::format("./scripts/zones/{}/Zone.lua", name);

        CacheLuaObjectFromFile(filename);

        auto onInitialize = lua["xi"]["zones"][name]["Zone"]["onInitialize"];
        if (!onInitialize.valid())
        {
            return -1;
        }

        auto result = onInitialize(CLuaZone(PZone));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInitialize: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Выполняем скрипт при входе персонажа в зону                          *
     *                                                                       *
     ************************************************************************/

    int32 OnGameIn(CCharEntity* PChar, bool zoning)
    {
        TracyZoneScoped;

        auto onGameIn = lua["xi"]["player"]["onGameIn"];
        if (!onGameIn.valid())
        {
            ShowError("luautils::onGameIn");
            return -1;
        }

        auto result = onGameIn(CLuaBaseEntity(PChar), PChar->GetPlayTime(false) == 0, zoning);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onGameIn: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Выполняем скрипт при входе персонажа в зону                          *
     *                                                                       *
     ************************************************************************/

    void OnZoneIn(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto name = PChar->m_moghouseID ? "Residential_Area" : (const char*)zoneutils::GetZone(PChar->loc.destination)->GetName();

        auto onZoneInFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onZoneIn"];
        auto onZoneIn = lua["xi"]["zones"][name]["Zone"]["onZoneIn"];

        auto result = onZoneInFramework(CLuaBaseEntity(PChar), PChar->loc.prevzone, onZoneIn);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onZoneIn: %s", err.what());
            return;
        }

        if (result.get_type() == sol::type::table)
        {
            auto resultTable = result.get<sol::table>();

            PChar->currentEvent->eventId   = resultTable.get_or(1, -1);
            PChar->currentEvent->textTable = resultTable.get_or(2, -1);
        }
        else if (result.get_type() == sol::type::number)
        {
            PChar->currentEvent->eventId = result.get<int32>();
        }
    }

    void AfterZoneIn(CBaseEntity* PChar)
    {
        TracyZoneScoped;

        auto name = (const char*)PChar->loc.zone->GetName();

        auto afterZoneInFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["afterZoneIn"];
        auto afterZoneIn = lua["xi"]["zones"][name]["Zone"]["afterZoneIn"];

        auto result = afterZoneInFramework(CLuaBaseEntity(PChar), afterZoneIn);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::afterZoneIn: %s", err.what());
        }
    }

    void OnZoneOut(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto name = (const char*)PChar->loc.zone->GetName();

        auto onZoneOutFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onZoneOut"];
        auto onZoneOut          = lua["xi"]["zones"][name]["Zone"]["onZoneOut"];

        auto result = onZoneOutFramework(CLuaBaseEntity(PChar), onZoneOut);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onZoneOut: %s", err.what());
            return;
        }
    }

    /************************************************************************
     *                                                                       *
     *  Персонаж входит в активный регион                                    *
     *                                                                       *
     ************************************************************************/

    int32 OnRegionEnter(CCharEntity* PChar, CRegion* PRegion)
    {
        TracyZoneScoped;

        std::string filename;
        if (PChar->PInstance)
        {
            filename =
                std::string("./scripts/zones/") + (const char*)PChar->loc.zone->GetName() + "/instances/" + (const char*)PChar->PInstance->GetName() + ".lua";
        }
        else
        {
            filename = std::string("./scripts/zones/") + (const char*)PChar->loc.zone->GetName() + "/Zone.lua";
        }

        // player may be entering because of an earlier event (event that changes position)
        // these should probably not call another event from onRegionEnter (use onEventFinish instead)
        if (!PChar->isInEvent())
        {
            PChar->eventPreparation->scriptFile = filename;
        }

        auto name = (const char*)PChar->loc.zone->GetName();

        sol::function onRegionEnter;
        if (PChar->PInstance)
        {
            auto instance_name = (const char*)PChar->PInstance->GetName();
            onRegionEnter      = lua["xi"]["zones"][name]["instance"][instance_name]["onRegionEnter"];
        }
        else
        {
            onRegionEnter = lua["xi"]["zones"][name]["Zone"]["onRegionEnter"];
        }

        auto onRegionEnterFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onRegionEnter"];
        auto result                 = onRegionEnterFramework(CLuaBaseEntity(PChar), CLuaRegion(PRegion), onRegionEnter);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onRegionEnter: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Персонаж покидает активный регион                                    *
     *                                                                       *
     ************************************************************************/

    int32 OnRegionLeave(CCharEntity* PChar, CRegion* PRegion)
    {
        TracyZoneScoped;

        std::string filename;
        if (PChar->PInstance)
        {
            filename =
                std::string("scripts/zones/") + (const char*)PChar->loc.zone->GetName() + "/instances/" + (const char*)PChar->PInstance->GetName() + ".lua";
        }
        else
        {
            filename = std::string("scripts/zones/") + (const char*)PChar->loc.zone->GetName() + "/Zone.lua";
        }

        // player may be leaving because of an earlier event (event that changes position)
        if (!PChar->isInEvent())
        {
            PChar->eventPreparation->scriptFile = filename;
        }

        auto name   = (const char*)PChar->loc.zone->GetName();
        auto zoneId = (const uint16*)PChar->loc.zone->GetID();

        sol::function onRegionLeave;
        if (PChar->PInstance && zoneId == (const uint16*)PChar->PInstance->GetZone()->GetID())
        {
            auto instance_name = (const char*)PChar->PInstance->GetName();
            onRegionLeave      = lua["xi"]["zones"][name]["instance"][instance_name]["onRegionLeave"];
        }
        else
        {
            onRegionLeave = lua["xi"]["zones"][name]["Zone"]["onRegionLeave"];
        }

        auto onRegionLeaveFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onRegionLeave"];
        auto result                 = onRegionLeaveFramework(CLuaBaseEntity(PChar), CLuaRegion(PRegion), onRegionLeave);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onRegionLeave: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     * The character refers to some npc. Trying to respond to its action.    *
     *                                                                       *
     ************************************************************************/

    int32 OnTrigger(CCharEntity* PChar, CBaseEntity* PNpc)
    {
        TracyZoneScoped;

        auto zone     = (const char*)PChar->loc.zone->GetName();
        auto name     = (const char*)PNpc->GetName();
        auto filename = fmt::format("./scripts/zones/{}/npcs/{}.lua", zone, name);

        PChar->eventPreparation->targetEntity = PNpc;
        PChar->eventPreparation->scriptFile   = filename;

        auto onTriggerFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onTrigger"];
        auto onTrigger = GetCacheEntryFromFilename(filename)["onTrigger"];

        auto result = onTriggerFramework(CLuaBaseEntity(PChar), CLuaBaseEntity(PNpc), onTrigger);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onTrigger: %s", err.what());
            return -1;
        }

        return result.get_type() == sol::type::number ? result.get<int32>() : 0;
    }

    /************************************************************************
     *  Запущенное событие нуждается в дополнительных параметрах             *
     *  A triggered event needs additional parameters  (battlefield extras)  *
     ************************************************************************/

    int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result, uint16 extras)
    {
        TracyZoneScoped;

        EventPrep* previousPrep = PChar->eventPreparation;
        PChar->eventPreparation = PChar->currentEvent;

        auto onEventUpdate = LoadEventScript(PChar, "onEventUpdate");
        if (!onEventUpdate.valid())
        {
            ShowError("luautils::onEventUpdate: undefined procedure onEventUpdate");
            return -1;
        }

        std::optional<CLuaBaseEntity> optTarget = std::nullopt;
        if (PChar->currentEvent->targetEntity)
        {
            optTarget = CLuaBaseEntity(PChar->currentEvent->targetEntity);
        }

        auto func_result = onEventUpdate(CLuaBaseEntity(PChar), eventID, result, extras, optTarget);

        PChar->eventPreparation = previousPrep;

        if (!func_result.valid())
        {
            sol::error err = func_result;
            ShowError("luautils::onEventUpdate: %s", err.what());
            return -1;
        }

        return func_result.get_type() == sol::type::number ? func_result.get<int32>() : 1;
    }

    /************************************************************************
     *  Запущенное событие нуждается в дополнительных параметрах             *
     *  A triggered event needs additional parameters                        *
     ************************************************************************/

    int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result)
    {
        TracyZoneScoped;

        EventPrep* previousPrep = PChar->eventPreparation;
        PChar->eventPreparation = PChar->currentEvent;

        auto onEventUpdateFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onEventUpdate"];
        auto onEventUpdate = LoadEventScript(PChar, "onEventUpdate");

        std::optional<CLuaBaseEntity> optTarget = std::nullopt;
        if (PChar->currentEvent->targetEntity)
        {
            optTarget = CLuaBaseEntity(PChar->currentEvent->targetEntity);
        }

        auto func_result = onEventUpdateFramework(CLuaBaseEntity(PChar), eventID, result, optTarget, onEventUpdate);

        PChar->eventPreparation = previousPrep;

        if (!func_result.valid())
        {
            sol::error err = func_result;
            ShowError("luautils::onEventUpdate: %s", err.what());
            return -1;
        }

        return func_result.get_type() == sol::type::number ? func_result.get<int32>() : 1;
    }

    int32 OnEventUpdate(CCharEntity* PChar, std::string const& updateString)
    {
        TracyZoneScoped;

        EventPrep* previousPrep = PChar->eventPreparation;
        PChar->eventPreparation = PChar->currentEvent;

        auto onEventUpdateFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onEventUpdate"];
        auto onEventUpdate = LoadEventScript(PChar, "onEventUpdate");

        std::optional<CLuaBaseEntity> optTarget = std::nullopt;
        if (PChar->currentEvent->targetEntity)
        {
            optTarget = CLuaBaseEntity(PChar->currentEvent->targetEntity);
        }

        auto result = onEventUpdateFramework(CLuaBaseEntity(PChar), PChar->currentEvent->eventId, updateString, optTarget, onEventUpdate);

        PChar->eventPreparation = previousPrep;

        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onEventUpdate: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Событие завершилось, результат события хранится в result             *
     *                                                                       *
     ************************************************************************/

    int32 OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result)
    {
        TracyZoneScoped;

        EventPrep* previousPrep = PChar->eventPreparation;
        PChar->eventPreparation = PChar->currentEvent;

        auto onEventFinishFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onEventFinish"];
        auto onEventFinish = LoadEventScript(PChar, "onEventFinish");

        std::optional<CLuaBaseEntity> optTarget = std::nullopt;
        if (PChar->currentEvent->targetEntity)
        {
            if (PChar->currentEvent->targetEntity->objtype == TYPE_NPC)
            {
                PChar->currentEvent->targetEntity->SetLocalVar("pauseNPCPathing", 0);
            }

            optTarget = CLuaBaseEntity(PChar->currentEvent->targetEntity);
        }

        auto func_result = onEventFinishFramework(CLuaBaseEntity(PChar), eventID, result, optTarget, onEventFinish);

        // Restore eventPreparation before potentially bailing out of function due to errors
        PChar->eventPreparation = previousPrep;

        if (!func_result.valid())
        {
            sol::error err = func_result;
            ShowError("luautils::onEventFinish %s", err.what());
            return -1;
        }

        if (PChar->currentEvent->scriptFile.find("/bcnms/") > 0 && PChar->health.hp <= 0)
        { // for some reason the event doesnt enforce death afterwards
            PChar->animation = ANIMATION_DEATH;
            PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_HOMEPOINT));
            PChar->updatemask |= UPDATE_HP;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Персонаж пытается передать предмет npc                               *
     *                                                                       *
     ************************************************************************/

    int32 OnTrade(CCharEntity* PChar, CBaseEntity* PNpc)
    {
        TracyZoneScoped;

        auto zone     = (const char*)PChar->loc.zone->GetName();
        auto name     = (const char*)PNpc->GetName();
        auto filename = fmt::format("./scripts/zones/{}/npcs/{}.lua", zone, name);

        PChar->eventPreparation->targetEntity = PNpc;
        PChar->eventPreparation->scriptFile   = filename;

        auto onTradeFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onTrade"];
        auto onTrade          = GetCacheEntryFromFilename(filename)["onTrade"];

        auto result = onTradeFramework(CLuaBaseEntity(PChar), CLuaBaseEntity(PNpc), CLuaTradeContainer(PChar->TradeContainer), onTrade);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onTrade: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnNpcSpawn(CBaseEntity* PNpc)
    {
        TracyZoneScoped;

        if (PNpc == nullptr)
        {
            ShowError("luautils::onNpcSpawn: Npc not found!");
            return 0;
        }

        auto onSpawn = getEntityCachedFunction(PNpc, "onSpawn");
        if (!onSpawn.valid())
        {
            return -1;
        }

        auto result = onSpawn(CLuaBaseEntity(PNpc));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onNpcSpawn: %s", err.what());
            return -1;
        }

        return 0;
    }

    // Used by mobs
    int32 OnAdditionalEffect(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action, int32 damage)
    {
        TracyZoneScoped;

        sol::function onAdditionalEffect;
        if (PAttacker->objtype == TYPE_MOB)
        {
            auto zone          = (const char*)PAttacker->loc.zone->GetName();
            auto name          = (const char*)PAttacker->GetName();
            onAdditionalEffect = lua[sol::create_if_nil]["xi"]["zones"][zone]["mobs"][name]["onAdditionalEffect"];
        }

        if (!onAdditionalEffect.valid())
        {
            return -1;
        }

        auto result = onAdditionalEffect(CLuaBaseEntity(PAttacker), CLuaBaseEntity(PDefender), damage);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onAdditionalEffect: %s", err.what());
            return -1;
        }

        Action->additionalEffect = (SUBEFFECT)(result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0);
        Action->addEffectMessage = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        Action->addEffectParam   = result.get_type(2) == sol::type::number ? result.get<int32>(2) : 0;

        return 0;
    }

    // Used by mobs
    int32 OnSpikesDamage(CBattleEntity* PDefender, CBattleEntity* PAttacker, actionTarget_t* Action, int32 damage)
    {
        TracyZoneScoped;

        auto zone = (const char*)PDefender->loc.zone->GetName();
        auto name = (const char*)PDefender->GetName();

        auto onSpikesDamage = lua["xi"]["zones"][zone]["mobs"][name]["onSpikesDamage"];
        if (!onSpikesDamage.valid())
        {
            return -1;
        }

        auto result = onSpikesDamage(CLuaBaseEntity(PDefender), CLuaBaseEntity(PAttacker), damage);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onSpikesDamage: %s", err.what());
            return -1;
        }

        Action->additionalEffect = (SUBEFFECT)(result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0);
        Action->addEffectMessage = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        Action->addEffectParam   = result.get_type(2) == sol::type::number ? result.get<int32>(2) : 0;

        return 0;
    }

    // Used by items
    int32 additionalEffectAttack(CBattleEntity* PAttacker, CBattleEntity* PDefender, CItemWeapon* PItem, actionTarget_t* Action, int32 baseAttackDamage)
    {
        TracyZoneScoped;

        sol::function additionalEffectAttack;
        if (PAttacker->objtype == TYPE_PC)
        {
            additionalEffectAttack = lua[sol::create_if_nil]["xi"]["additionalEffect"]["attack"];
        }

        if (!additionalEffectAttack.valid())
        {
            return -1;
        }

        auto result = additionalEffectAttack(CLuaBaseEntity(PAttacker), CLuaBaseEntity(PDefender), baseAttackDamage, CLuaItem(PItem));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::additionalEffectAttack: %s", err.what());
            return -1;
        }

        Action->additionalEffect = (SUBEFFECT)(result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0);
        Action->addEffectMessage = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        Action->addEffectParam   = result.get_type(2) == sol::type::number ? result.get<int32>(2) : 0;

        return 0;
    }

    // future use: migrating items to scripts\globals\additional_effects.lua
    int32 additionalEffectSpikes(CBattleEntity* PDefender, CBattleEntity* PAttacker, CItemEquipment* PItem, actionTarget_t* Action, int32 baseAttackDamage)
    {
        TracyZoneScoped;

        auto additionalEffectSpikes = lua["xi"]["additionalEffect"]["spikes"];
        if (!additionalEffectSpikes.valid())
        {
            return -1;
        }

        auto result = additionalEffectSpikes(CLuaBaseEntity(PDefender), CLuaBaseEntity(PAttacker), baseAttackDamage, CLuaItem(PItem));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::additionalEffectSpikes: %s", err.what());
            return -1;
        }

        Action->additionalEffect = (SUBEFFECT)(result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0);
        Action->addEffectMessage = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        Action->addEffectParam   = result.get_type(2) == sol::type::number ? result.get<int32>(2) : 0;

        return 0;
    }

    int32 OnEffectGain(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
    {
        TracyZoneScoped;

        std::string filename = fmt::format("./scripts/{}.lua", PStatusEffect->GetName());

        sol::function onEffectGain = GetCacheEntryFromFilename(filename)["onEffectGain"].get<sol::function>();
        if (!onEffectGain.valid())
        {
            return -1;
        }

        auto result = onEffectGain(CLuaBaseEntity(PEntity), CLuaStatusEffect(PStatusEffect));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onEffectGain: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnEffectTick(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
    {
        TracyZoneScoped;

        std::string filename = fmt::format("./scripts/{}.lua", PStatusEffect->GetName());

        sol::function onEffectTick = GetCacheEntryFromFilename(filename)["onEffectTick"].get<sol::function>();
        if (!onEffectTick.valid())
        {
            return -1;
        }

        auto result = onEffectTick(CLuaBaseEntity(PEntity), CLuaStatusEffect(PStatusEffect));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onEffectTick: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnEffectLose(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
    {
        TracyZoneScoped;

        std::string filename = fmt::format("./scripts/{}.lua", PStatusEffect->GetName());

        sol::function onEffectLose = GetCacheEntryFromFilename(filename)["onEffectLose"].get<sol::function>();
        if (!onEffectLose.valid())
        {
            return -1;
        }

        auto result = onEffectLose(CLuaBaseEntity(PEntity), CLuaStatusEffect(PStatusEffect));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onEffectLose: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnAttachmentEquip(CBattleEntity* PEntity, CItemPuppet* attachment)
    {
        TracyZoneScoped;

        auto name = (const char*)attachment->getName();

        auto onEquip = lua["xi"]["globals"]["abilities"]["pets"]["attachments"][name]["onEquip"];
        if (!onEquip.valid())
        {
            return -1;
        }

        auto result = onEquip(CLuaBaseEntity(PEntity), CLuaItem(attachment));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onEquip: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnAttachmentUnequip(CBattleEntity* PEntity, CItemPuppet* attachment)
    {
        TracyZoneScoped;

        auto name = (const char*)attachment->getName();

        auto onUnequip = lua["xi"]["globals"]["abilities"]["pets"]["attachments"][name]["onUnequip"];
        if (!onUnequip.valid())
        {
            return -1;
        }

        auto result = onUnequip(CLuaBaseEntity(PEntity), CLuaItem(attachment));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onUnequip: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnManeuverGain(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers)
    {
        TracyZoneScoped;

        auto name = (const char*)attachment->getName();

        auto onManeuverGain = lua["xi"]["globals"]["abilities"]["pets"]["attachments"][name]["onManeuverGain"];
        if (!onManeuverGain.valid())
        {
            return -1;
        }

        auto result = onManeuverGain(CLuaBaseEntity(PEntity), CLuaItem(attachment), maneuvers);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onManeuverGain: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnManeuverLose(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers)
    {
        TracyZoneScoped;

        auto name = (const char*)attachment->getName();

        auto onManeuverLose = lua["xi"]["globals"]["abilities"]["pets"]["attachments"][name]["onManeuverLose"];
        if (!onManeuverLose.valid())
        {
            return -1;
        }

        auto result = onManeuverLose(CLuaBaseEntity(PEntity), CLuaItem(attachment), maneuvers);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onManeuverLose: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnUpdateAttachment(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers)
    {
        TracyZoneScoped;

        auto name = (const char*)attachment->getName();

        auto onUpdate = lua["xi"]["globals"]["abilities"]["pets"]["attachments"][name]["onUpdate"];
        if (!onUpdate.valid())
        {
            return -1;
        }

        auto result = onUpdate(CLuaBaseEntity(PEntity), CLuaItem(attachment), maneuvers);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onUpdate: %s", err.what());
            return -1;
        }

        return 0;
    }

    // We check the possibility of using the item.
    // If all is well, then return value - 0, in case of failure - error message number
    std::tuple<int32, int32, int32> OnItemCheck(CBaseEntity* PTarget, CItem* PItem, ITEMCHECK param, CBaseEntity* PCaster)
    {
        TracyZoneScoped;

        auto filename = fmt::format("./scripts/globals/items/{}.lua", PItem->getName());

        sol::function onItemCheck = GetCacheEntryFromFilename(filename)["onItemCheck"].get<sol::function>();
        if (!onItemCheck.valid())
        {
            return { 56, 0, 0 };
        }

        std::optional<CLuaBaseEntity> caster = std::nullopt;
        if (PCaster)
        {
            caster = CLuaBaseEntity(PCaster);
        }

        auto result = onItemCheck(CLuaBaseEntity(PTarget), caster, static_cast<uint32>(param));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onItemCheck: %s", err.what());
            return { 56, 0, 0 };
        }

        uint32 messageId = result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
        uint32 param1    = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        uint32 param2    = result.get_type(2) == sol::type::number ? result.get<int32>(2) : 0;

        return { messageId, param1, param2 };
    }

    // We use the subject. The return value is the message number or 0.
    // It is also necessary to somehow pass the message parameter (for example,
    // number of recovered MP)
    int32 OnItemUse(CBaseEntity* PUser, CBaseEntity* PTarget, CItem* PItem)
    {
        TracyZoneScoped;

        auto filename = fmt::format("./scripts/globals/items/{}.lua", PItem->getName());

        sol::function onItemUse = GetCacheEntryFromFilename(filename)["onItemUse"].get<sol::function>();
        if (!onItemUse.valid())
        {
            return -1;
        }

        auto result = onItemUse(CLuaBaseEntity(PTarget), CLuaBaseEntity(PUser), CLuaItem(PItem));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onItemUse: %s", err.what());
            return -1;
        }

        return 0;
    }

    // Check for gear sets  (e.g Set: enhances haste effect)
    int32 CheckForGearSet(CBaseEntity* PTarget)
    {
        TracyZoneScoped;

        auto checkForGearSet = lua["xi"]["gear_sets"]["checkForGearSet"];
        if (!checkForGearSet.valid())
        {
            return 56;
        }

        auto result = checkForGearSet(CLuaBaseEntity(PTarget));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::CheckForGearSet: %s", err.what());
            return -1;
        }

        return 0;
    }

    uint32 OnSpellCast(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell)
    {
        TracyZoneScoped;

        if (PSpell == nullptr)
        {
            ShowError("luautils::OnSpellCast: Spell not found!");
            return -1;
        }

        auto onSpellCast = getSpellCachedFunction(PSpell, "onSpellCast");
        if (!onSpellCast.valid())
        {
            return -1;
        }

        auto result = onSpellCast(CLuaBaseEntity(PCaster), CLuaBaseEntity(PTarget), CLuaSpell(PSpell));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onSpellCast: %s", err.what());
            return -1;
        }

        uint32 retVal = result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
        return retVal;
    }

    int32 OnSpellPrecast(CBattleEntity* PCaster, CSpell* PSpell)
    {
        TracyZoneScoped;

        if (PCaster->objtype != TYPE_MOB)
        {
            return -1;
        }

        sol::function onSpellPrecast = getEntityCachedFunction(PCaster, "onSpellPrecast");
        if (!onSpellPrecast.valid())
        {
            return 0;
        }

        auto result = onSpellPrecast(CLuaBaseEntity(PCaster), CLuaSpell(PSpell));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onSpellPrecast: %s", err.what());
            return 0;
        }

        return 0;
    }

    std::optional<SpellID> OnMobMagicPrepare(CBattleEntity* PCaster, CBattleEntity* PTarget, std::optional<SpellID> startingSpellId)
    {
        TracyZoneScoped;

        if (PCaster == nullptr)
        {
            return {};
        }

        sol::function onMobMagicPrepare = getEntityCachedFunction(PCaster, "onMobMagicPrepare");
        if (!onMobMagicPrepare.valid())
        {
            return {};
        }

        std::optional<CLuaSpell> luaSpell;
        if (startingSpellId.has_value())
        {
            luaSpell = spell::GetSpell(startingSpellId.value());
        }

        auto result = onMobMagicPrepare(CLuaBaseEntity(PCaster), CLuaBaseEntity(PTarget), luaSpell);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::OnMobMagicPrepare: %s", err.what());
            return {};
        }

        uint32 retVal = result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
        if (retVal > 0)
        {
            return static_cast<SpellID>(retVal);
        }

        return {};
    }

    // Called when mob is targeted by a spell.
    // Note: does not differentiate between offensive and defensive spells
    int32 OnMagicHit(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell)
    {
        TracyZoneScoped;

        if (PSpell == nullptr)
        {
            return -1;
        }

        PTarget->PAI->EventHandler.triggerListener("MAGIC_TAKE", CLuaBaseEntity(PTarget), CLuaBaseEntity(PCaster), CLuaSpell(PSpell));

        sol::function onMagicHit = getEntityCachedFunction(PTarget, "onMagicHit");
        if (!onMagicHit.valid())
        {
            return 0;
        }

        auto result = onMagicHit(CLuaBaseEntity(PCaster), CLuaBaseEntity(PTarget), CLuaSpell(PSpell));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMagicHit: %s", err.what());
            return -1;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    // Called when mob is struck by a Weaponskill
    int32 OnWeaponskillHit(CBattleEntity* PMob, CBaseEntity* PAttacker, uint16 PWeaponskill)
    {
        TracyZoneScoped;

        sol::function onWeaponskillHit = getEntityCachedFunction(PMob, "onWeaponskillHit");
        if (!onWeaponskillHit.valid())
        {
            return 0;
        }

        auto result = onWeaponskillHit(CLuaBaseEntity(PMob), CLuaBaseEntity(PAttacker), PWeaponskill);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onWeaponskillHit: %s", err.what());
            return 0;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    int32 OnMobInitialize(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        sol::function onMobInitialize = getEntityCachedFunction(PMob, "onMobInitialize");
        if (!onMobInitialize.valid())
        {
            return -1;
        }

        auto result = onMobInitialize(CLuaBaseEntity(PMob));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobInitialize: %s", err.what());
            return -1;
        }

        return 0;
    }

    // Called during server startup, file reads are OK!
    int32 ApplyMixins(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr || PMob->objtype != TYPE_MOB)
        {
            return -1;
        }

        // Clear out globals
        lua.set("mixins", sol::lua_nil);
        lua.set("mixinOptions", sol::lua_nil);

        auto zone_name = (const char*)PMob->loc.zone->GetName();
        auto name      = (const char*)PMob->GetName();

        auto filename = fmt::format("./scripts/zones/{}/mobs/{}.lua", zone_name, name);

        auto script_result = lua.script_file(filename);
        if (!script_result.valid())
        {
            return -1;
        }

        // get the global function "applyMixins"
        sol::function applyMixins = lua["applyMixins"];
        if (!applyMixins.valid())
        {
            return -1;
        }

        // get the parameter "mixins"
        auto mixins = lua["mixins"];
        if (!mixins.valid())
        {
            return -1;
        }

        // get the parameter "mixinOptions" (optional)
        auto mixinOptions = lua["mixinOptions"];

        auto result = applyMixins(CLuaBaseEntity(PMob), mixins, mixinOptions);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::applyMixins: %s", err.what());
        }

        return 0;
    }

    // Called during server startup, file reads are OK!
    int32 ApplyZoneMixins(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr || PMob->objtype != TYPE_MOB)
        {
            return -1;
        }

        // Clear out any previous global definitions
        lua.set("mixins", sol::lua_nil);
        lua.set("mixinOptions", sol::lua_nil);

        auto filename = fmt::format("./scripts/mixins/zones/{}.lua", PMob->loc.zone->GetName());

        auto script_result = lua.script_file(filename);
        if (!script_result.valid())
        {
            return -1;
        }

        // get the global function "applyMixins"
        sol::function applyMixins = lua["applyMixins"];
        if (!applyMixins.valid())
        {
            return -1;
        }

        // get the parameter "mixins"
        auto mixins = lua["mixins"];
        if (!mixins.valid())
        {
            return -1;
        }

        // get the parameter "mixinOptions" (optional)
        auto mixinOptions = lua["mixinOptions"];

        auto result = applyMixins(CLuaBaseEntity(PMob), mixins, mixinOptions);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::applyMixins %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnPath(CBaseEntity* PEntity)
    {
        TracyZoneScoped;

        if (PEntity == nullptr || PEntity->objtype == TYPE_PC)
        {
            return -1;
        }

        sol::function onPath = getEntityCachedFunction(PEntity, "onPath");
        if (!onPath.valid())
        {
            return -1;
        }

        auto result = onPath(CLuaBaseEntity(PEntity));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPath: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnBattlefieldHandlerInitialise(CZone* PZone)
    {
        TracyZoneScoped;

        if (PZone == nullptr)
        {
            return -1;
        }

        int32 MaxAreas = 3;

        // TODO: This is loaded globally, fix this
        auto onBattlefieldHandlerInitialise = lua["onBattlefieldHandlerInitialise"];
        if (!onBattlefieldHandlerInitialise.valid())
        {
            return MaxAreas;
        }

        CLuaZone LuaZone(PZone);

        auto result = onBattlefieldHandlerInitialise(CLuaZone(PZone));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldHandlerInitialise: %s", err.what());
            return MaxAreas;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : MaxAreas;
    }

    int32 OnBattlefieldInitialise(CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        if (PBattlefield == nullptr)
        {
            return -1;
        }

        auto zone = (const char*)PBattlefield->GetZone()->GetName();
        auto name = PBattlefield->GetName();

        // TODO: This will happen more often than needed, but not so often that it's a performance concern
        auto filename = fmt::format("./scripts/zones/{}/bcnms/{}.lua", zone, name);
        CacheLuaObjectFromFile(filename);

        auto onBattlefieldInitialise = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldInitialise"];
        if (!onBattlefieldInitialise.valid())
        {
            return -1;
        }

        auto result = onBattlefieldInitialise(CLuaBattlefield(PBattlefield));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldInitialise: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnBattlefieldTick(CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        if (PBattlefield == nullptr)
        {
            return -1;
        }

        auto zone = (const char*)PBattlefield->GetZone()->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldTick = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldTick"];
        if (!onBattlefieldTick.valid())
        {
            ShowError("luautils::onBattlefieldTick: Unable to find onBattlefieldTick function for %s", name);
            return -1;
        }

        auto seconds = std::chrono::duration_cast<std::chrono::seconds>(PBattlefield->GetTimeInside()).count();
        auto result  = onBattlefieldTick(CLuaBattlefield(PBattlefield), seconds);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldTick: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnBattlefieldStatusChange(CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        if (PBattlefield == nullptr)
        {
            return -1;
        }

        auto zone = (const char*)PBattlefield->GetZone()->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldStatusChange = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldStatusChange"];
        if (!onBattlefieldStatusChange.valid())
        {
            return -1;
        }

        auto result = onBattlefieldStatusChange(CLuaBattlefield(PBattlefield), PBattlefield->GetStatus());
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldStatusChange: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Сalled when a monster engages a target for the first time            *
     *                                                                       *
     ************************************************************************/

    int32 OnMobEngaged(CBaseEntity* PMob, CBaseEntity* PTarget)
    {
        TracyZoneScoped;

        if (PTarget == nullptr || PMob == nullptr)
        {
            return -1;
        }

        std::string filename;
        if (PMob->objtype == TYPE_PET)
        {
            filename = fmt::format("./scripts/globals/pets/{}.lua", static_cast<CPetEntity*>(PMob)->GetScriptName());
        }
        else
        {
            filename = fmt::format("./scripts/zones/{}/mobs/{}.lua", PMob->loc.zone->GetName(), PMob->GetName());
        }

        if (PTarget->objtype == TYPE_PC)
        {
            ((CCharEntity*)PTarget)->eventPreparation->targetEntity = PMob;
            ((CCharEntity*)PTarget)->eventPreparation->scriptFile   = filename;
        }

        sol::function onMobEngaged = getEntityCachedFunction(PMob, "onMobEngaged");
        if (!onMobEngaged.valid())
        {
            return -1;
        }

        auto result = onMobEngaged(CLuaBaseEntity(PMob), CLuaBaseEntity(PTarget));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobEngaged: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Calls a lua script when a mob has disengaged from a target           *
     *                                                                       *
     ************************************************************************/

    int32 OnMobDisengage(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr)
        {
            return -1;
        }

        sol::function onMobDisengage = getEntityCachedFunction(PMob, "onMobDisengage");
        if (!onMobDisengage.valid())
        {
            return -1;
        }

        uint8 weather = PMob->loc.zone->GetWeather();

        auto result = onMobDisengage(CLuaBaseEntity(PMob), weather);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobDisengage: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnMobDrawIn(CBaseEntity* PMob, CBaseEntity* PTarget)
    {
        TracyZoneScoped;

        if (PTarget == nullptr || PMob == nullptr)
        {
            return -1;
        }

        auto filename = fmt::format("./scripts/zones/{}/mobs/{}.lua", PMob->loc.zone->GetName(), PMob->GetName());

        if (PTarget->objtype == TYPE_PC)
        {
            ((CCharEntity*)PTarget)->eventPreparation->targetEntity = PMob;
            ((CCharEntity*)PTarget)->eventPreparation->scriptFile = filename;
        }

        sol::function onMobDrawIn = getEntityCachedFunction(PMob, "onMobDrawIn");
        if (!onMobDrawIn.valid())
        {
            return -1;
        }

        auto result = onMobDrawIn(CLuaBaseEntity(PMob), CLuaBaseEntity(PTarget));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobDrawIn: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  Сalled every 3 sec when a player fight monster                       *
     *                                                                       *
     ************************************************************************/

    int32 OnMobFight(CBaseEntity* PMob, CBaseEntity* PTarget)
    {
        TracyZoneScoped;

        if (PTarget == nullptr || PMob == nullptr)
        {
            return -1;
        }

        sol::function onMobFight = getEntityCachedFunction(PMob, "onMobFight");
        if (!onMobFight.valid())
        {
            return -1;
        }

        auto result = onMobFight(CLuaBaseEntity(PMob), CLuaBaseEntity(PTarget));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobFight: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnCriticalHit(CBattleEntity* PMob, CBattleEntity* PAttacker)
    {
        TracyZoneScoped;

        if (PMob == nullptr)
        {
            return -1;
        }

        sol::function onCriticalHit = getEntityCachedFunction(PMob, "onCriticalHit");
        if (!onCriticalHit.valid())
        {
            return -1;
        }

        std::optional<CLuaBaseEntity> optionalKiller = std::nullopt;
        if (PAttacker)
        {
            optionalKiller = CLuaBaseEntity(PAttacker);
        }

        auto result = onCriticalHit(CLuaBaseEntity(PMob), optionalKiller);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onCriticalHit %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  The script is executed after the death of any monster in the game    *
     *                                                                       *
     ************************************************************************/

    int32 OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller)
    {
        TracyZoneScoped;

        if (PMob == nullptr)
        {
            return -1;
        }

        // TODO: These int8 string need to die.
        std::string zone_name = (const char*)PMob->loc.zone->GetName();
        std::string mob_name  = (const char*)PMob->GetName();

        CCharEntity* PChar = dynamic_cast<CCharEntity*>(PKiller);
        if (PChar && PMob->objtype == TYPE_MOB)
        {
            auto onMobDeathEx = lua["xi"]["mob"]["onMobDeathEx"];
            if (!onMobDeathEx.valid())
            {
                return -1;
            }

            PChar->ForAlliance([PMob, PChar, &onMobDeathEx](CBattleEntity* PMember) {
                if (PMember->getZone() == PChar->getZone())
                {
                    CLuaBaseEntity LuaMobEntity(PMob);
                    CLuaBaseEntity LuaAllyEntity(PMember);
                    bool           isKiller          = PMember == PChar;
                    bool           isWeaponSkillKill = PMob->GetLocalVar("weaponskillHit") > 0;

                    auto result = onMobDeathEx(LuaMobEntity, LuaAllyEntity, isKiller, isWeaponSkillKill);
                    if (!result.valid())
                    {
                        sol::error err = result;
                        ShowError("luautils::onMobDeathEx: %s", err.what());
                    }
                }
            });

            auto filename = fmt::format("./scripts/zones/{}/mobs/{}.lua", PMob->loc.zone->GetName(), PMob->GetName());

            auto onMobDeathFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onMobDeath"];
            sol::function onMobDeath = getEntityCachedFunction(PMob, "onMobDeath");

            PChar->ForAlliance([PMob, PChar, &onMobDeathFramework, &onMobDeath, &filename](CBattleEntity* PPartyMember) {
                CCharEntity* PMember = (CCharEntity*)PPartyMember;
                if (PMember && PMember->getZone() == PChar->getZone())
                {
                    CLuaBaseEntity                LuaMobEntity(PMob);
                    std::optional<CLuaBaseEntity> optLuaAllyEntity = std::nullopt;
                    if (PMember)
                    {
                        optLuaAllyEntity = CLuaBaseEntity(PMember);
                    }
                    bool isKiller = PMember == PChar;
                    bool noKiller = false;

                    PChar->eventPreparation->targetEntity = PMob;
                    PChar->eventPreparation->scriptFile   = filename;

                    // onMobDeath(mob, player, isKiller, noKiller)
                    auto result = onMobDeathFramework(LuaMobEntity, optLuaAllyEntity, isKiller, noKiller, onMobDeath);
                    if (!result.valid())
                    {
                        sol::error err = result;
                        ShowError("luautils::onMobDeath: %s", err.what());
                    }
                }
            });
        }
        else
        {
            auto onMobDeathFramework = lua["xi"]["globals"]["interaction"]["interaction_global"]["onMobDeath"];
            sol::function onMobDeath = getEntityCachedFunction(PMob, "onMobDeath");

            // onMobDeath(mob, player, isKiller, noKiller)
            auto result = onMobDeathFramework(CLuaBaseEntity(PMob), sol::lua_nil, sol::lua_nil, true, onMobDeath);
            if (!result.valid())
            {
                sol::error err = result;
                ShowError("luautils::onMobDeath: %s", err.what());
                return -1;
            }
        }

        return 0;
    }

    int32 OnMobSpawn(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr)
        {
            return -1;
        }

        sol::function onMobSpawn = getEntityCachedFunction(PMob, "onMobSpawn");
        if (!onMobSpawn.valid())
        {
            return -1;
        }

        auto result = onMobSpawn(CLuaBaseEntity(PMob));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobSpawn: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnMobRoamAction(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr || PMob->objtype != TYPE_MOB)
        {
            return -1;
        }

        sol::function onMobRoamAction = getEntityCachedFunction(PMob, "onMobRoamAction");
        if (!onMobRoamAction.valid())
        {
            return -1;
        }

        auto result = onMobRoamAction(CLuaBaseEntity(PMob));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobRoonMobRoamActionam: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnMobRoam(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        sol::function onMobRoam = getEntityCachedFunction(PMob, "onMobRoam");
        if (!onMobRoam.valid())
        {
            return -1;
        }

        auto result = onMobRoam(CLuaBaseEntity(PMob));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobRoam: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnMobDespawn(CBaseEntity* PMob)
    {
        TracyZoneScoped;

        if (PMob == nullptr)
        {
            return -1;
        }

        auto onMobDespawn = getEntityCachedFunction(PMob, "onMobDespawn");
        if (!onMobDespawn.valid())
        {
            return -1;
        }

        auto result = onMobDespawn(CLuaBaseEntity(PMob));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobDespawn: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *   OnGameDayAutomatisation()                                           *
     *   used for creating action of npc every game day                      *
     *                                                                       *
     ************************************************************************/

    int32 OnGameDay(CZone* PZone)
    {
        TracyZoneScoped;

        auto name = (const char*)PZone->GetName();

        auto onGameDay = lua["xi"]["zones"][name]["Zone"]["onGameDay"];
        if (!onGameDay.valid())
        {
            return -1;
        }

        auto result = onGameDay();
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onGameDay: %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *   OnGameHourAutomatisation()                                          *
     *   used for creating action of npc every game hour                     *
     *                                                                       *
     ************************************************************************/

    int32 OnGameHour(CZone* PZone)
    {
        TracyZoneScoped;

        auto name = (const char*)PZone->GetName();

        auto onGameHour = lua["xi"]["zones"][name]["Zone"]["onGameHour"];
        if (!onGameHour.valid())
        {
            return -1;
        }

        auto result = onGameHour(CLuaZone(PZone));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onGameHour: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnZoneWeatherChange(uint16 ZoneID, uint8 weather)
    {
        TracyZoneScoped;

        auto name = (const char*)zoneutils::GetZone(ZoneID)->GetName();

        auto onZoneWeatherChange = lua["xi"]["zones"][name]["Zone"]["onZoneWeatherChange"];
        if (!onZoneWeatherChange.valid())
        {
            return -1;
        }

        auto result = onZoneWeatherChange(weather);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onZoneWeatherChange: %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnTOTDChange(uint16 ZoneID, uint8 TOTD)
    {
        TracyZoneScoped;

        auto name = (const char*)zoneutils::GetZone(ZoneID)->GetName();

        auto onTOTDChange = lua["xi"]["zones"][name]["Zone"]["onTOTDChange"];
        if (!onTOTDChange.valid())
        {
            return -1;
        }

        auto result = onTOTDChange(TOTD);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onTOTDChange: %s", err.what());
            return -1;
        }

        return 0;
    }

    std::tuple<int32, uint8, uint8> OnUseWeaponSkill(CBattleEntity* PChar, CBaseEntity* PMob, CWeaponSkill* wskill, uint16 tp, bool primary, action_t& action,
                                                     CBattleEntity* taChar)
    {
        TracyZoneScoped;

        auto name = (const char*)wskill->getName();

        auto onUseWeaponSkill = lua["xi"]["globals"]["weaponskills"][name]["onUseWeaponSkill"];
        if (!onUseWeaponSkill.valid())
        {
            return std::tuple<int32, uint8, uint8>();
        }

        std::optional<CLuaBaseEntity> optTrickAttackLuaChar = std::nullopt;
        if (taChar)
        {
            optTrickAttackLuaChar = CLuaBaseEntity(taChar);
        }

        auto result = onUseWeaponSkill(CLuaBaseEntity(PChar), CLuaBaseEntity(PMob), wskill->getID(), tp, primary, CLuaAction(&action), optTrickAttackLuaChar);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onUseWeaponSkill: %s", err.what());
            return std::tuple<int32, uint8, uint8>();
        }

        uint8 tpHitsLanded    = result.get_type(0) == sol::type::number ? result.get<uint8>(0) : 0;
        uint8 extraHitsLanded = result.get_type(1) == sol::type::number ? result.get<uint8>(1) : 0;
        bool  criticalHit     = result.get_type(2) == sol::type::boolean ? result.get<bool>(2) : false;
        int32 dmg             = result.get_type(3) == sol::type::number ? result.get<int32>(3) : 0;

        if (criticalHit)
        {
            luautils::OnCriticalHit((CBattleEntity*)PMob, (CBattleEntity*)PChar);
        }

        return std::make_tuple(dmg, tpHitsLanded, extraHitsLanded);
    }

    uint16 OnMobWeaponSkillPrepare(CBattleEntity* PMob, CBattleEntity* PTarget)
    {
        TracyZoneScoped;

        if (PMob == nullptr || PTarget == nullptr)
        {
            return 0;
        }

        sol::function onMobWeaponSkillPrepare = getEntityCachedFunction(PMob, "onMobWeaponSkillPrepare");
        if (!onMobWeaponSkillPrepare.valid())
        {
            return 0;
        }

        auto result = onMobWeaponSkillPrepare(CLuaBaseEntity(PMob), CLuaBaseEntity(PTarget));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobWeaponSkillPrepare: %s", err.what());
            return 0;
        }

        uint16 retVal = result.get_type(0) == sol::type::number ? result.get<uint16>(0) : 0;
        if (retVal > 0)
        {
            return static_cast<uint16>(retVal);
        }

        return 0;
    }

    int32 OnMobWeaponSkill(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill, action_t* action)
    {
        TracyZoneScoped;

        // Mob Script
        {
            auto zone = (const char*)PMob->loc.zone->GetName();
            auto name = (const char*)PMob->GetName();

            auto onMobWeaponSkill = lua["xi"]["zones"][zone]["mobs"][name]["onMobWeaponSkill"];
            if (onMobWeaponSkill.valid())
            {
                auto result = onMobWeaponSkill(CLuaBaseEntity(PTarget), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill), CLuaAction(action));
                if (!result.valid())
                {
                    sol::error err = result;
                    ShowError("luautils::onMobWeaponSkill (mob) %s", err.what());
                    return 0;
                }
            }
        }

        // Mob Skill Script
        auto mobskill_name = (const char*)PMobSkill->getName();

        auto onMobWeaponSkill = lua["xi"]["globals"]["mobskills"][mobskill_name]["onMobWeaponSkill"];
        if (!onMobWeaponSkill.valid())
        {
            return 0;
        }

        auto result = onMobWeaponSkill(CLuaBaseEntity(PTarget), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobWeaponSkill (mobskill) %s", err.what());
            return 0;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    int32 OnMobSkillCheck(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill)
    {
        TracyZoneScoped;

        auto name = (const char*)PMobSkill->getName();

        auto onMobSkillCheck = lua["xi"]["globals"]["mobskills"][name]["onMobSkillCheck"];
        if (!onMobSkillCheck.valid())
        {
            return 1;
        }

        auto result = onMobSkillCheck(CLuaBaseEntity(PTarget), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobSkillCheck: %s", err.what());
            return 1;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : -5;
    }

    CBattleEntity* OnMobSkillTarget(CBattleEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill)
    {
        TracyZoneScoped;

        auto zone = (const char*)PMob->loc.zone->GetName();
        auto name = (const char*)PMob->GetName();

        auto onMobSkillTarget = lua["xi"]["zones"][zone]["mobs"][name]["onMobSkillTarget"];
        if (!onMobSkillTarget.valid())
        {
            return PTarget;
        }

        auto result = onMobSkillTarget(CLuaBaseEntity(static_cast<CBaseEntity*>(PTarget)), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMobSkillTarget: %s", err.what());
            return PTarget;
        }

        if (result.get_type(0) == sol::type::userdata || result.get_type(0) == sol::type::lua_nil)
        {
            CLuaBaseEntity* PEntity = result.get<CLuaBaseEntity*>(0);

            return (PEntity && PEntity->GetBaseEntity()) ? static_cast<CBattleEntity*>(PEntity->GetBaseEntity()) : PTarget;
        }

        return PTarget;
    }

    int32 OnAutomatonAbilityCheck(CBaseEntity* PTarget, CAutomatonEntity* PAutomaton, CMobSkill* PMobSkill)
    {
        TracyZoneScoped;

        auto filename = fmt::format("./scripts/globals/abilities/pets/automaton/{}.lua", (const char*)PMobSkill->getName());

        sol::function onAutomatonAbilityCheck = GetCacheEntryFromFilename(filename)["onAutomatonAbilityCheck"];
        if (!onAutomatonAbilityCheck.valid())
        {
            return 1;
        }

        auto result = onAutomatonAbilityCheck(CLuaBaseEntity(PTarget), CLuaBaseEntity(PAutomaton), CLuaMobSkill(PMobSkill));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onAutomatonAbilityCheck: %s", err.what());
            return 1;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : -5;
    }

    int32 OnAutomatonAbility(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill, CBaseEntity* PMobMaster, action_t* action)
    {
        auto filename = fmt::format("./scripts/globals/abilities/pets/automaton/{}.lua", (const char*)PMobSkill->getName());

        sol::function onAutomatonAbility = GetCacheEntryFromFilename(filename)["onAutomatonAbility"];
        if (!onAutomatonAbility.valid())
        {
            return 0;
        }

        auto result = onAutomatonAbility(CLuaBaseEntity(PTarget), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill), CLuaBaseEntity(PMobMaster), CLuaAction(action));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onAutomatonAbility: %s", err.what());
            return 0;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    /***********************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    int32 OnMagicCastingCheck(CBaseEntity* PChar, CBaseEntity* PTarget, CSpell* PSpell)
    {
        TracyZoneScoped;

        auto onMagicCastingCheck = getSpellCachedFunction(PSpell, "onMagicCastingCheck");
        if (!onMagicCastingCheck.valid())
        {
            ShowWarning("luautils::onMagicCastingCheck");
            return 47;
        }

        auto result = onMagicCastingCheck(CLuaBaseEntity(PChar), CLuaBaseEntity(PTarget), CLuaSpell(PSpell));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onMagicCastingCheck (%s): %s", PSpell->getName(), err.what());
            return 47;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : -5;
    }

    /***********************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    int32 OnAbilityCheck(CBaseEntity* PChar, CBaseEntity* PTarget, CAbility* PAbility, CBaseEntity** PMsgTarget)
    {
        TracyZoneScoped;

        if (PAbility == nullptr)
        {
            ShowError("luautils::OnAbilityCheck: Invalid PAbility");
            return 87;
        }

        std::string filename;
        if (PAbility->isPetAbility())
        {
            filename = fmt::format("./scripts/globals/abilities/pets/{}.lua", PAbility->getName());
        }
        else
        {
            filename = fmt::format("./scripts/globals/abilities/{}.lua", PAbility->getName());
        }

        sol::function onAbilityCheck = GetCacheEntryFromFilename(filename)["onAbilityCheck"];
        if (!onAbilityCheck.valid())
        {
            // TODO: We rely on this to fail silently in certain cases, but this is bad :(
            //ShowWarning("luautils::onAbilityCheck - Ability %s not found.", PAbility->getName());
            return 0;
        }

        auto result = onAbilityCheck(CLuaBaseEntity(PChar), CLuaBaseEntity(PTarget), CLuaAbility(PAbility));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onAbilityCheck (%s): %s", PAbility->getName(), err.what());
            return 87;
        }

        auto result0 = result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0; // Message (0 = None)
        auto result1 = result.get_type(1) == sol::type::number ? result.get<int32>(1) : 0;
        if (result1 != 0)
        {
            *PMsgTarget = (CBaseEntity*)PTarget;
        }

        return result0 ? result0 : 0; // Default to no Message
    }

    /***********************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    int32 OnPetAbility(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill, CBaseEntity* PMobMaster, action_t* action)
    {
        TracyZoneScoped;

        std::string filename = fmt::format("./scripts/globals/abilities/pets/{}.lua", PMobSkill->getName());

        sol::function onPetAbility = GetCacheEntryFromFilename(filename)["onPetAbility"];
        if (!onPetAbility.valid())
        {
            return 0;
        }

        auto result = onPetAbility(CLuaBaseEntity(PTarget), CLuaBaseEntity(PMob), CLuaMobSkill(PMobSkill), CLuaBaseEntity(PMobMaster), CLuaAction(action));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPetAbility: %s", err.what());
            return 0;
        }

        // Bloodpact Skillups
        // TODO: This probably shouldn't be in here
        if (PMob->objtype == TYPE_PET && map_config.skillup_bloodpact)
        {
            CPetEntity* PPet = (CPetEntity*)PMob;
            if (PPet->getPetType() == PET_TYPE::AVATAR && PPet->PMaster->objtype == TYPE_PC)
            {
                CCharEntity* PMaster = (CCharEntity*)PPet->PMaster;
                if (PMaster->GetMJob() == JOB_SMN)
                {
                    charutils::TrySkillUP(PMaster, SKILL_SUMMONING_MAGIC, PMaster->GetMLevel());
                }
            }
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    /************************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    int32 OnUseAbility(CBattleEntity* PUser, CBattleEntity* PTarget, CAbility* PAbility, action_t* action)
    {
        TracyZoneScoped;

        std::string filename;
        if (PAbility->isPetAbility())
        {
            filename = fmt::format("./scripts/globals/abilities/pets/{}.lua", PAbility->getName());
        }
        else
        {
            filename = fmt::format("./scripts/globals/abilities/{}.lua", PAbility->getName());
        }

        sol::function onUseAbility = GetCacheEntryFromFilename(filename)["onUseAbility"];
        if (!onUseAbility.valid())
        {
            ShowWarning("luautils::onUseAbility - Ability %s not found.", PAbility->getName());
            return 0;
        }

        auto result = onUseAbility(CLuaBaseEntity(PUser), CLuaBaseEntity(PTarget), CLuaAbility(PAbility), CLuaAction(action));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onUseAbility: %s", err.what());
            return 0;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    void ClearVarFromAll(std::string const& varName)
    {
        TracyZoneScoped;
        sql->Query("DELETE FROM char_vars WHERE varname = '%s';", varName);
    }

    void Terminate()
    {
        TracyZoneScoped;
        zoneutils::ForEachZone([](CZone* PZone) {
            PZone->ForEachChar([](CCharEntity* PChar) {
                charutils::SaveCharPosition(PChar);
                charutils::SaveCharStats(PChar);
                charutils::SaveCharExp(PChar, PChar->GetMJob());
            });
        });
        exit(1);
    }

    auto GetCachedInstanceScript(uint16 instanceId) -> sol::table
    {
        TracyZoneScoped;

        auto instanceData = instanceutils::GetInstanceData(instanceId);

        auto cachedInstanceScript = GetCacheEntryFromFilename(instanceData.filename);
        if (!cachedInstanceScript.valid())
        {
            ShowError("luautils::GetCachedInstanceScript: Could not retrieve cache entry for %d", instanceId);
            return sol::lua_nil;
        }

        return cachedInstanceScript;
    }

    int32 OnInstanceZoneIn(CCharEntity* PChar, CInstance* PInstance)
    {
        TracyZoneScoped;

        CZone* PZone = PInstance->GetZone();

        auto name = (const char*)PZone->GetName();

        auto onInstanceZoneIn = lua["xi"]["zones"][name]["Zone"]["onInstanceZoneIn"];
        if (!onInstanceZoneIn.valid())
        {
            return -1;
        }

        auto result = onInstanceZoneIn(CLuaBaseEntity(PChar), CLuaInstance(PInstance));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceZoneIn %s", err.what());
            return -1;
        }

        return 0;
    }

    void AfterInstanceRegister(CBaseEntity* PChar)
    {
        XI_DEBUG_BREAK_IF(!PChar->PInstance);

        TracyZoneScoped;

        auto zone     = (const char*)PChar->loc.zone->GetName();
        auto instance = (const char*)PChar->PInstance->GetName();

        auto afterInstanceRegister = lua["xi"]["zones"][zone]["instances"][instance]["afterInstanceRegister"];
        if (!afterInstanceRegister.valid())
        {
            return;
        }

        auto result = afterInstanceRegister(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::afterInstanceRegister %s", err.what());
        }
    }

    int32 OnInstanceLoadFailed(CZone* PZone)
    {
        TracyZoneScoped;

        auto name = (const char*)PZone->GetName();

        auto onInstanceLoadFailed = lua["xi"]["zones"][name]["Zone"]["onInstanceLoadFailed"];
        if (!onInstanceLoadFailed.valid())
        {
            return -1;
        }

        auto result = onInstanceLoadFailed();
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceLoadFailed %s", err.what());
            return 0;
        }

        return result.get_type(0) == sol::type::number ? result.get<int32>(0) : 0;
    }

    int32 OnInstanceTimeUpdate(CZone* PZone, CInstance* PInstance, uint32 time)
    {
        TracyZoneScoped;

        auto instanceData = instanceutils::GetInstanceData(PInstance->GetID());

        auto onInstanceTimeUpdate = GetCacheEntryFromFilename(instanceData.filename)["onInstanceTimeUpdate"];
        if (!onInstanceTimeUpdate.valid())
        {
            return -1;
        }

        auto result = onInstanceTimeUpdate(CLuaInstance(PInstance), time);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceTimeUpdate %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnInstanceFailure(CInstance* PInstance)
    {
        TracyZoneScoped;

        auto instanceData = instanceutils::GetInstanceData(PInstance->GetID());

        auto onInstanceFailure = GetCacheEntryFromFilename(instanceData.filename)["onInstanceFailure"];
        if (!onInstanceFailure.valid())
        {
            return -1;
        }

        auto result = onInstanceFailure(CLuaInstance(PInstance));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceFailure %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  When instance is created, let player know it's finished              *
     *                                                                       *
     ************************************************************************/

    int32 OnInstanceCreatedCallback(CCharEntity* PChar, CInstance* PInstance)
    {
        TracyZoneScoped;

        auto instanceData = instanceutils::GetInstanceData(PInstance->GetID());

        auto onInstanceCreatedCallback = GetCacheEntryFromFilename(instanceData.filename)["onInstanceCreatedCallback"];
        if (!onInstanceCreatedCallback.valid())
        {
            ShowError("luautils::OnInstanceCreatedCallback: undefined procedure onInstanceCreatedCallback");
            return -1;
        }

        auto result = onInstanceCreatedCallback(CLuaBaseEntity(PChar), CLuaInstance(PInstance));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::OnInstanceCreatedCallback %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *  When instance is created, run setup script for instance              *
     *                                                                       *
     ************************************************************************/

    int32 OnInstanceCreated(CInstance* PInstance)
    {
        TracyZoneScoped;

        auto zone = (const char*)PInstance->GetZone()->GetName();
        auto name = (const char*)PInstance->GetName();

        auto onInstanceCreated = lua["xi"]["zones"][zone]["instances"][name]["onInstanceCreated"];
        if (!onInstanceCreated.valid())
        {
            return -1;
        }

        auto result = onInstanceCreated(CLuaInstance(PInstance));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceCreated %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnInstanceProgressUpdate(CInstance* PInstance)
    {
        TracyZoneScoped;

        auto zone = (const char*)PInstance->GetZone()->GetName();
        auto name = (const char*)PInstance->GetName();

        auto onInstanceProgressUpdate = lua["xi"]["zones"][zone]["instances"][name]["onInstanceProgressUpdate"];
        if (!onInstanceProgressUpdate.valid())
        {
            return -1;
        }

        auto result = onInstanceProgressUpdate(CLuaInstance(PInstance), PInstance->GetProgress());
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceProgressUpdate %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnInstanceStageChange(CInstance* PInstance)
    {
        TracyZoneScoped;

        auto zone = (const char*)PInstance->GetZone()->GetName();
        auto name = (const char*)PInstance->GetName();

        auto onInstanceStageChange = lua["xi"]["zones"][zone]["instances"][name]["onInstanceStageChange"];
        if (!onInstanceStageChange.valid())
        {
            return -1;
        }

        auto result = onInstanceStageChange(CLuaInstance(PInstance), PInstance->GetStage());
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceStageChange %s", err.what());
            return -1;
        }

        return 0;
    }

    int32 OnInstanceComplete(CInstance* PInstance)
    {
        TracyZoneScoped;

        auto zone = (const char*)PInstance->GetZone()->GetName();
        auto name = (const char*)PInstance->GetName();

        auto onInstanceComplete = lua["xi"]["zones"][zone]["instances"][name]["onInstanceComplete"];
        if (!onInstanceComplete.valid())
        {
            return -1;
        }

        auto result = onInstanceComplete(CLuaInstance(PInstance));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onInstanceComplete %s", err.what());
            return -1;
        }

        return 0;
    }

    /************************************************************************
     *                                                                       *
     *                                                                       *
     *                                                                       *
     ************************************************************************/

    void StartElevator(uint32 ElevatorID)
    {
        TracyZoneScoped;
        CTransportHandler::getInstance()->startElevator(ElevatorID);
    }

    /************************************************************************
     *                                                                       *
     *  Получаем значение глобальной переменной сервера.                     *
     *  Переменная действительна лишь в пределах зоны, в которой установлена *
     *                                                                       *
     ************************************************************************/

    int32 GetServerVariable(std::string const& varName)
    {
        TracyZoneScoped;

        int32 value = 0;

        int32 ret = sql->Query("SELECT value FROM server_variables WHERE name = '%s' LIMIT 1;", varName);

        if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
        {
            value = (int32)sql->GetIntData(0);
        }

        return value;
    }

    /************************************************************************
     *                                                                       *
     *  Устанавливаем значение глобальной переменной сервера.                *
     *                                                                       *
     ************************************************************************/

    void SetServerVariable(std::string const& name, int32 value)
    {
        TracyZoneScoped;

        if (value == 0)
        {
            sql->Query("DELETE FROM server_variables WHERE name = '%s' LIMIT 1;", name);
            return;
        }
        sql->Query("INSERT INTO server_variables VALUES ('%s', %i) ON DUPLICATE KEY UPDATE value = %i;", name, value, value);
    }

    int32 OnTransportEvent(CCharEntity* PChar, uint32 TransportID)
    {
        TracyZoneScoped;

        auto name = (const char*)PChar->loc.zone->GetName();

        auto onTransportEvent = lua["xi"]["zones"][name]["Zone"]["onTransportEvent"];
        if (!onTransportEvent.valid())
        {
            return -1;
        }

        auto result = onTransportEvent(CLuaBaseEntity(PChar), TransportID);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onTransportEvent: %s", err.what());
            return -1;
        }

        return 0;
    }

    void OnTimeTrigger(CNpcEntity* PNpc, uint8 triggerID)
    {
        TracyZoneScoped;

        auto onTimeTrigger = getEntityCachedFunction(PNpc, "onTimeTrigger");
        if (!onTimeTrigger.valid())
        {
            return;
        }

        auto result = onTimeTrigger(CLuaBaseEntity(PNpc), triggerID);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onTimeTrigger: %s", err.what());
            return;
        }
    }

    int32 OnConquestUpdate(CZone* PZone, ConquestUpdate type)
    {
        TracyZoneScoped;

        auto name = (const char*)PZone->GetName();

        auto onConquestUpdate = lua["xi"]["zones"][name]["Zone"]["onConquestUpdate"];
        if (!onConquestUpdate.valid())
        {
            return -1;
        }

        CLuaZone LuaZone(PZone);

        auto result = onConquestUpdate(LuaZone, type);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onConquestUpdate: %s", err.what());
            return -1;
        }

        return 0;
    }

    /********************************************************************
        onBattlefieldEnter - callback when you enter a BCNM via a lua call to bcnmEnter(bcnmid)
    *********************************************************************/
    void OnBattlefieldEnter(CCharEntity* PChar, CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

        auto zone = (const char*)PZone->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldEnter = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldEnter"];
        if (!onBattlefieldEnter.valid())
        {
            return;
        }

        auto result = onBattlefieldEnter(CLuaBaseEntity(PChar), CLuaBattlefield(PBattlefield));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldEnter: %s", err.what());
        }
    }

    /********************************************************************
        onBattlefieldLeave - callback when you leave a BCNM via multiple means.
        The method of leaving is given by the LeaveCode as follows:
        1 - Leaving via burning circle e.g. "run away"
        2 - Leaving via win
        3 - Leaving via warp or d/c
        4 - Leaving via lose
        This callback is executed for everyone in the BCNM when they leave
        so if they leave via win, this will be called for each char.
    *********************************************************************/
    void OnBattlefieldLeave(CCharEntity* PChar, CBattlefield* PBattlefield, uint8 LeaveCode)
    {
        TracyZoneScoped;

        CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

        auto filename = fmt::format("./scripts/zones/{}/bcnms/{}.lua", PZone->GetName(), PBattlefield->GetName());

        auto zone = (const char*)PZone->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldLeave = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldLeave"];
        if (!onBattlefieldLeave.valid())
        {
            return;
        }

        PChar->eventPreparation->targetEntity = PChar;
        PChar->eventPreparation->scriptFile = filename;

        auto result = onBattlefieldLeave(CLuaBaseEntity(PChar), CLuaBattlefield(PBattlefield), LeaveCode);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldLeave: %s", err.what());
        }
    }

    /********************************************************************
        onBattlefieldRegister - callback when you successfully register a BCNM.
        For example, trading an orb, selecting the battle.
        Called AFTER assigning BCNM status to all valid characters.
        This callback is called only for the character initiating the
        registration, and after CBattlefield:init() procedure.
    *********************************************************************/
    void OnBattlefieldRegister(CCharEntity* PChar, CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

        auto zone = (const char*)PZone->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldRegister = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldRegister"];
        if (!onBattlefieldRegister.valid())
        {
            return;
        }

        auto result = onBattlefieldRegister(CLuaBaseEntity(PChar), CLuaBattlefield(PBattlefield));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldRegister: %s", err.what());
        }
    }

    /********************************************************************
    onBattlefieldDestroy - called when BCNM is destroyed (cleanup)
    *********************************************************************/
    void OnBattlefieldDestroy(CBattlefield* PBattlefield)
    {
        TracyZoneScoped;

        auto zone = (const char*)PBattlefield->GetZone()->GetName();
        auto name = PBattlefield->GetName();

        auto onBattlefieldDestroy = lua["xi"]["zones"][zone]["bcnms"][name]["onBattlefieldDestroy"];
        if (!onBattlefieldDestroy.valid())
        {
            return;
        }

        auto result = onBattlefieldDestroy(CLuaBattlefield(PBattlefield));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onBattlefieldDestroy: %s", err.what());
        }
    }
    /************************************************************************
     *                                                                       *
     * Set SpawnType of mob to scripted (128) or normal (0) usind mob id     *
     *                                                                       *
     ************************************************************************/
    void DisallowRespawn(uint32 mobid, bool allowRespawn)
    {
        TracyZoneScoped;

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        if (PMob != nullptr)
        {
            PMob->m_AllowRespawn = !allowRespawn;
        }
        else
        {
            ShowDebug("DisallowRespawn: mob <%u> not found", mobid);
        }
    }

    /************************************************************************
     *                                                                       *
     * Update the NM spawn point to a new point, retrieved from the database *
     *                                                                       *
     ************************************************************************/

    void UpdateNMSpawnPoint(uint32 mobid)
    {
        TracyZoneScoped;

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        if (PMob != nullptr)
        {
            int32 r   = 0;
            int32 ret = sql->Query("SELECT count(mobid) FROM `nm_spawn_points` where mobid=%u", mobid);
            if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS && sql->GetUIntData(0) > 0)
            {
                r = xirand::GetRandomNumber(sql->GetUIntData(0));
            }
            else
            {
                ShowDebug("UpdateNMSpawnPoint: SQL error: No entries for mobid <%u> found.", mobid);
                return;
            }

            ret = sql->Query("SELECT pos_x, pos_y, pos_z FROM `nm_spawn_points` WHERE mobid=%u AND pos=%i", mobid, r);
            if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
            {
                PMob->m_SpawnPoint.rotation = xirand::GetRandomNumber(256);
                PMob->m_SpawnPoint.x        = sql->GetFloatData(0);
                PMob->m_SpawnPoint.y        = sql->GetFloatData(1);
                PMob->m_SpawnPoint.z        = sql->GetFloatData(2);
                // ShowDebug(CL_RED"UpdateNMSpawnPoint: After %i - %f, %f, %f, %i", r,
                // PMob->m_SpawnPoint.x,PMob->m_SpawnPoint.y,PMob->m_SpawnPoint.z,PMob->m_SpawnPoint.rotation);
            }
            else
            {
                ShowDebug("UpdateNMSpawnPoint: SQL error or NM <%u> not found in nmspawnpoints table.", mobid);
            }
        }
        else
        {
            ShowDebug("UpdateNMSpawnPoint: mob <%u> not found", mobid);
        }
    }

    /************************************************************************
     *                                                                       *
     *  Get Mob Respawn Time in seconds by Mob ID.                           *
     *                                                                       *
     ************************************************************************/

    uint32 GetMobRespawnTime(uint32 mobid)
    {
        TracyZoneScoped;

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);

        if (PMob != nullptr)
        {
            return PMob->m_RespawnTime / 1000;
        }

        ShowError("luautils::GetMobAction: mob <%u> was not found", mobid);
        return 0;
    }

    /************************************************************************
     *   Change drop rate of a mob                                           *
     *   1st number: dropid in mob_droplist.sql                              *
     *   2nd number: itemid in mob_droplist.sql                              *
     *   3rd number: new rate                                                *
     ************************************************************************/

    void SetDropRate(uint16 dropid, uint16 itemid, uint16 rate)
    {
        TracyZoneScoped;

        DropList_t* DropList = itemutils::GetDropList(dropid);

        if (DropList != nullptr)
        {
            for (auto& Item : DropList->Items)
            {
                if (Item.ItemID == itemid)
                {
                    Item.DropRate = rate;
                }
            }
        }
    }

    uint8 GetHealingTickDelay()
    {
        TracyZoneScoped;
        return map_config.healing_tick_delay;
    }

    /***************************************************************************
     *                                                                          *
     *  Creates an item object of the type specified by the itemID.             *
     *  This item is ephemeral, and doesn't exist in-game but can and should    *
     *  be used to lookup item information or access item functions when only   *
     *  the ItemID is known.                                                    *
     *                                                                          *
     *  ## These items should be used to READ ONLY!                             *
     *  ## Should lua functions be written which modify items, care must be     *
     *     taken to ensure these are NEVER modified.                            *
     *                                                                          *
     *  example: local item = GetReadOnlyItem(16448)                            *
     *           item:GetName()                 --Bronze Dagger                 *
     *           item:isTwoHanded()             --False                         *
     *                                                                          *
     ***************************************************************************/

    std::optional<CLuaItem> GetReadOnlyItem(uint32 id)
    {
        TracyZoneScoped;
        CItem* PItem = itemutils::GetItemPointer(id);
        return PItem ? std::optional<CLuaItem>(PItem) : std::nullopt;
    }

    std::optional<CLuaAbility> GetAbility(uint16 id)
    {
        TracyZoneScoped;
        CAbility* PAbility = ability::GetAbility(id);
        return PAbility ? std::optional<CLuaAbility>(PAbility) : std::nullopt;
    }

    std::optional<CLuaSpell> GetSpell(uint16 id)
    {
        TracyZoneScoped;
        CSpell* PSpell = spell::GetSpell(static_cast<SpellID>(id));
        return PSpell ? std::optional<CLuaSpell>(PSpell) : std::nullopt;
    }

    int32 UpdateServerMessage()
    {
        TracyZoneScoped;

        int8  line[1024];
        FILE* fp;

        // Clear old messages..
        map_config.server_message.clear();

        // Load the English server message..
        fp = fopen("./conf/server_message.conf", "rb");
        if (fp == nullptr)
        {
            ShowError("Could not read English server message from: ./conf/server_message.conf");
            return 1;
        }

        while (fgets((char*)line, sizeof(line), fp))
        {
            string_t sline((const char*)line);
            map_config.server_message += sline;
        }

        fclose(fp);

        // Ensure both messages have NULL terminates..
        if (map_config.server_message.at(map_config.server_message.length() - 1) != 0x00)
        {
            map_config.server_message += (char)0x00;
        }

        return 0;
    }

    sol::table GetServerVersion()
    {
        sol::table version = lua.create_table();
        version["branch"]  = XI_RELEASE_FLAG;
        version["major"]   = XI_MAJOR_VERSION;
        version["minor"]   = XI_MINOR_VERSION;
        version["rev"]     = XI_REVISION;
        return version;
    }

    sol::table NearLocation(sol::table const& table, float radius, float theta)
    {
        TracyZoneScoped;

        position_t center;
        center.x        = table.get<float>("x");
        center.y        = table.get<float>("y");
        center.z        = table.get<float>("z");
        center.rotation = table.get<uint8>("rot");

        position_t pos = nearPosition(center, radius, theta);

        sol::table nearPos = lua.create_table();
        nearPos["x"]       = pos.x;
        nearPos["y"]       = pos.y;
        nearPos["z"]       = pos.z;

        return nearPos;
    }

    void OnPlayerDeath(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto onPlayerDeath = lua["xi"]["player"]["onPlayerDeath"];
        if (!onPlayerDeath.valid())
        {
            ShowWarning("luautils::onPlayerDeath");
            return;
        }

        auto result = onPlayerDeath(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerDeath: %s", err.what());
            return;
        }
    }

    void OnPlayerLevelUp(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto onPlayerLevelUp = lua["xi"]["player"]["onPlayerLevelUp"];
        if (!onPlayerLevelUp.valid())
        {
            ShowWarning("luautils::onPlayerLevelUp");
            return;
        }

        auto result = onPlayerLevelUp(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerLevelUp: %s", err.what());
            return;
        }
    }

    void OnPlayerLevelDown(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto onPlayerLevelDown = lua["xi"]["player"]["onPlayerLevelDown"];
        if (!onPlayerLevelDown.valid())
        {
            ShowWarning("luautils::onPlayerLevelDown");
            return;
        }

        auto result = onPlayerLevelDown(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerLevelDown: %s", err.what());
            return;
        }
    }

    void OnPlayerMount(CCharEntity* PChar)
    {
        TracyZoneScoped;

        auto onPlayerMount = lua["xi"]["player"]["onPlayerMount"];
        if (!onPlayerMount.valid())
        {
            ShowWarning("luautils::onPlayerMount");
            return;
        }

        auto result = onPlayerMount(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerMount: %s", err.what());
            return;
        }
    }

    void OnPlayerEmote(CCharEntity* PChar, Emote EmoteID)
    {
        TracyZoneScoped;

        auto onPlayerEmote = lua["xi"]["player"]["onPlayerEmote"];
        if (!onPlayerEmote.valid())
        {
            ShowWarning("luautils::onPlayerEmote");
            return;
        }

        auto result = onPlayerEmote(CLuaBaseEntity(PChar), static_cast<uint8>(EmoteID));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerEmote: %s", err.what());
            return;
        }
    }

    void OnPlayerVolunteer(CCharEntity* PChar, std::string text)
    {
        TracyZoneScoped;

        auto onPlayerVolunteer = lua["xi"]["player"]["onPlayerVolunteer"];
        if (!onPlayerVolunteer.valid())
        {
            ShowWarning("luautils::onPlayerVolunteer");
            return;
        }

        auto result = onPlayerVolunteer(CLuaBaseEntity(PChar), text);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onPlayerVolunteer: %s", err.what());
            return;
        }
    }

    bool OnChocoboDig(CCharEntity* PChar, bool pre)
    {
        TracyZoneScoped;

        auto name = (const char*)PChar->loc.zone->GetName();

        auto onChocoboDig = lua["xi"]["zones"][name]["Zone"]["onChocoboDig"];
        if (!onChocoboDig.valid())
        {
            ShowWarning("luautils::onChocoboDig");
            return false;
        }

        auto result = onChocoboDig(CLuaBaseEntity(PChar), pre);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onChocoboDig: %s", err.what());
            return false;
        }

        return result.get_type(0) == sol::type::boolean ? result.get<bool>() : false;
    }

    // Loads a Lua function with a fallback hierarchy
    //
    // 1) 1st try: PChar->currentEvent->scriptFile
    // 2) 2nd try: The instance script if the player is in one
    // 3) 3rd try: The battlefield script if the player is in one
    // 4) 4th try: The zone script for the zone the player is in
    sol::function LoadEventScript(CCharEntity* PChar, const char* functionName)
    {
        TracyZoneScoped;

        auto funcFromChar = GetCacheEntryFromFilename(PChar->currentEvent->scriptFile)[functionName];
        if (funcFromChar.valid())
        {
            return funcFromChar;
        }

        if (PChar->PInstance)
        {
            auto instance_filename = fmt::format(
                "./scripts/zones/{}/instances/{}",
                PChar->PInstance->GetZone()->GetName(),
                PChar->PInstance->GetName());

            auto funcFromInstance = GetCacheEntryFromFilename(instance_filename)[functionName];
            if (funcFromInstance.valid())
            {
                return funcFromInstance;
            }
        }

        if (PChar->PBattlefield)
        {
            auto battlefield_filename = fmt::format("./scripts/zones/{}/bcnms/{}", PChar->loc.zone->GetName(), PChar->PBattlefield->GetName());

            auto funcFromBattlefield = GetCacheEntryFromFilename(battlefield_filename)[functionName];
            if (funcFromBattlefield.valid())
            {
                return funcFromBattlefield;
            }
        }

        auto zone_filename = fmt::format("./scripts/zones/{}/Zone.lua", PChar->loc.zone->GetName());
        auto funcFromZone  = GetCacheEntryFromFilename(zone_filename)[functionName];
        if (funcFromZone.valid())
        {
            return funcFromZone;
        }

        return sol::lua_nil;
    }

    uint16 GetDespoilDebuff(uint16 itemId)
    {
        TracyZoneScoped;

        uint16 effectId = 0;
        int32  ret      = sql->Query("SELECT effectId FROM despoil_effects WHERE itemId = %u", itemId);
        if (ret != SQL_ERROR && sql->NumRows() != 0 && sql->NextRow() == SQL_SUCCESS)
        {
            effectId = (uint16)sql->GetUIntData(0);
        }

        return effectId;
    }

    void OnFurniturePlaced(CCharEntity* PChar, CItemFurnishing* PItem)
    {
        TracyZoneScoped;

        auto name = (const char*)PItem->getName();

        auto onFurniturePlaced = lua["xi"]["globals"]["items"][name]["onFurniturePlaced"];
        if (!onFurniturePlaced.valid())
        {
            return;
        }

        auto result = onFurniturePlaced(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onFurniturePlaced: %s", err.what());
            return;
        }
    }

    void OnFurnitureRemoved(CCharEntity* PChar, CItemFurnishing* PItem)
    {
        TracyZoneScoped;

        auto name = (const char*)PItem->getName();

        auto onFurnitureRemoved = lua["xi"]["globals"]["items"][name]["onFurnitureRemoved"];
        if (!onFurnitureRemoved.valid())
        {
            return;
        }

        auto result = onFurnitureRemoved(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::onFurnitureRemoved: %s", err.what());
            return;
        }
    }

    uint16 SelectDailyItem(CLuaBaseEntity* PLuaBaseEntity, uint8 dial)
    {
        TracyZoneScoped;
        CCharEntity* player = dynamic_cast<CCharEntity*>(PLuaBaseEntity->GetBaseEntity());
        return daily::SelectItem(player, dial);
    }

    std::string SetCustomMenuContext(CCharEntity* PChar, sol::table table)
    {
        customMenuContext[PChar->id] = table;

        auto onStart = table["onStart"];
        if (onStart.valid())
        {
            onStart(CLuaBaseEntity(PChar));
        }

        auto escape = [](std::string s)
        {
            return fmt::format("\"{}\"", s);
        };

        std::string outStr;

        // Title
        outStr += escape(table["title"].get<std::string>());

        // Options
        for (auto& entry : table["options"].get<sol::table>())
        {
            outStr += escape(entry.second.as<sol::table>()[1]);
        }

        return outStr;
    }

    bool HasCustomMenuContext(CCharEntity* PChar)
    {
        auto context = customMenuContext.find(PChar->id);
        return context != customMenuContext.end();
    }

    void HandleCustomMenu(CCharEntity* PChar, std::string selection)
    {
        // selection is of the form:
        // GMTELL(Testo): Question(Test Menu): Result (Option 1)
        // Cancelled:
        // GMTELL(Testo): Question(Test Menu (Play Effect)): Result (Canceled.)

        std::string cleanedSelection = selection.substr(selection.find("): Result (") + 11);
        cleanedSelection.pop_back(); // Remove trailing ')'

        auto context = customMenuContext[PChar->id];
        if (strcmp(cleanedSelection.c_str(), "Canceled.") == 0)
        {
            auto onCancelled = context["onCancelled"];
            if (onCancelled.valid())
            {
                onCancelled(CLuaBaseEntity(PChar));
            }
        }
        else
        {
            for (auto& entry : context["options"].get<sol::table>())
            {
                if (entry.second.get_type() == sol::type::table)
                {
                    auto table = entry.second.as<sol::table>();
                    auto name  = table[1].get<std::string>();
                    auto func  = table[2].get<sol::function>();

                    if (cleanedSelection.compare(name) == 0)
                    {
                        func(CLuaBaseEntity(PChar));
                    }
                }
            }
        }

        auto onEnd = context["onEnd"];
        if (onEnd.valid())
        {
            onEnd(CLuaBaseEntity(PChar));
        }

        customMenuContext.erase(PChar->id);
    }

    bool isRightRecipe(CCharEntity* PChar)
    {
        auto luaIsRightRecipe = lua["xi"]["qr_crafting"]["isRightRecipe"];
        if (!luaIsRightRecipe.valid())
        {
            ShowError("luautils::isRightRecipe: qr_crafting or isRightRecipe is not valid.");
            return false;
        }

        auto ingredients = getSynthIngredients(PChar);

        auto result = luaIsRightRecipe(CLuaBaseEntity(PChar), ingredients);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::isRightRecipe: %s", err.what());
            return false;
        }

        if (result.get_type(0) != sol::type::boolean)
        {
            ShowError("luautils::isRightRecipe: result return is not boolean.");
            return false;
        }
        return result.get<bool>(0);
    }

    void setIsLuaRecipe(CCharEntity* PChar)
    {
        PChar->CraftContainer->setItem(9, 0, 0xFF, 0);
    }

    uint8 calcSynthResult(CCharEntity* PChar)
    {
        auto luaCalcSynthResult = lua["xi"]["qr_crafting"]["calcSynthResult"];
        if (!luaCalcSynthResult.valid())
        {
            ShowError("luautils::calcSynthResult: qr_crafting or calcSynthResult is not valid.");
            return false;
        }

        auto ingredients = getSynthIngredients(PChar);

        auto result = luaCalcSynthResult(CLuaBaseEntity(PChar), ingredients);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::calcSynthResults: %s", err.what());
            return false;
        }

        if (result.get_type(0) != sol::type::number)
        {
            ShowError("luautils::calcSynthResults: result return is not a number.");
            return false;
        }

        auto success = result.get<uint8>(0);
        PChar->CraftContainer->setQuantity(0, success);

        switch (success)
        {
            case synthutils::SYNTHESIS_FAIL:
                success = RESULT_FAIL;
                break;
            case synthutils::SYNTHESIS_SUCCESS:
                success = RESULT_SUCCESS;
                break;
            case synthutils::SYNTHESIS_HQ:
                success = RESULT_HQ;
                break;
            case synthutils::SYNTHESIS_HQ2:
                success = RESULT_HQ;
                break;
            case synthutils::SYNTHESIS_HQ3:
                success = RESULT_HQ;
                break;
        }

        return success;
    }

    double doSynthFail(CCharEntity* PChar, double current_break_rate)
    {
        auto luaDoSynthFail = lua["xi"]["qr_crafting"]["doSynthFail"];
        if (!luaDoSynthFail.valid())
        {
            ShowError("luautils::doSynthFail: qr_crafting or doSynthFail is not valid.");
            return current_break_rate;
        }

        auto result = luaDoSynthFail(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::doSynthFail: %s", err.what());
            return current_break_rate;
        }

        if (result.get_type(0) != sol::type::number)
        {
            ShowError("luautils::doSynthFail: result return is not a number.");
            return current_break_rate;
        }

        return result.get<double>(0);
    }

    std::tuple<uint16, uint8, bool> doSynthResult(CCharEntity* PChar)
    {
        auto luaDoSynthResult = lua["xi"]["qr_crafting"]["doSynthResult"];
        if (!luaDoSynthResult.valid())
        {
            ShowError("luautils::doSynthResult: qr_crafting or doSynthResult is not valid.");
            return {0, 0, false};
        }

        auto ingredients = getSynthIngredients(PChar);

        auto result = luaDoSynthResult(CLuaBaseEntity(PChar), ingredients);
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::doSynthResults: %s", err.what());
            return {0, 0, false};
        }

        if (result.get_type(0) != sol::type::number)
        {
            ShowError("luautils::doSynthResults: result return is not a number.");
            return {0, 0, false};
        }

        return {result.get<uint16>(0), result.get<uint8>(1), result.get<bool>(2)};
    }

    void doSynthSkillUp(CCharEntity* PChar)
    {
        auto luaDoSynthSkillUp = lua["xi"]["qr_crafting"]["doSynthSkillUp"];
        if (!luaDoSynthSkillUp.valid())
        {
            ShowError("luautils::doSynthFail: qr_crafting or doSynthSkillUp is not valid.");
            return;
        }

        auto result = luaDoSynthSkillUp(CLuaBaseEntity(PChar));
        if (!result.valid())
        {
            sol::error err = result;
            ShowError("luautils::doSynthSkillUp: %s", err.what());
            return;
        }
    }

    bool isLuaRecipe(CCharEntity* PChar)
    {
        return PChar->CraftContainer->getItemID(9) == 0;
    }

    sol::table getSynthIngredients(CCharEntity* PChar)
    {
        auto ingredients = lua.create_table();
        auto* inventory = PChar->getStorage(LOC_INVENTORY);

        ingredients["crystal"] = PChar->CraftContainer->getItemID(0);
        for (uint8 i = 1; i < 9; i++)
        {
            uint16 item_id = PChar->CraftContainer->getItemID(i);
            if (item_id == 0)
                continue;
            auto ingredient = lua.create_table();

            ingredient["item"] = CLuaItem(inventory->GetItem(PChar->CraftContainer->getInvSlotID(i)));
            ingredient["quantity"] = PChar->CraftContainer->getQuantity(i);
            ingredients.add(ingredient);
        }
        return ingredients;
    }
}; // namespace luautils
