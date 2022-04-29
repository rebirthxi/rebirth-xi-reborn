﻿/*
===========================================================================

  Copyright (c) 2021 LandSandBoat Dev Teams

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

#include "moduleutils.h"

#include "../lua/luautils.h"
#include "common/cbasetypes.h"
#include "common/utils.h"

#include <filesystem>
#include <regex>
#include <string>
#include <vector>
#include <iostream>
#include <fstream>

namespace
{
    // static storage, init and access
    std::vector<CPPModule*>& cppModules()
    {
        static std::vector<CPPModule*> cppModules{};
        return cppModules;
    }
}

namespace moduleutils
{
    void RegisterCPPModule(CPPModule* ptr)
    {
        cppModules().emplace_back(ptr);
    }

    // Hooks for calling modules
    void OnInit()
    {
        TracyZoneScoped;
        for (auto* module : cppModules())
        {
            module->OnInit();
        }
    }

    void OnZoneTick(CZone* PZone)
    {
        TracyZoneScoped;
        for (auto* module : cppModules())
        {
            module->OnZoneTick(PZone);
        }
    }

    void OnTimeServerTick()
    {
        TracyZoneScoped;
        for (auto* module : cppModules())
        {
            module->OnTimeServerTick();
        }
    }

    void OnCharZoneIn(CCharEntity* PChar)
    {
        TracyZoneScoped;
        for (auto* module : cppModules())
        {
            module->OnCharZoneIn(PChar);
        }
    }

    void OnCharZoneOut(CCharEntity* PChar)
    {
        TracyZoneScoped;
        for (auto* module : cppModules())
        {
            module->OnCharZoneOut(PChar);
        }
    }

    struct Override
    {
        std::string              filename;
        std::string              overrideName;
        std::vector<std::string> nameParts;
        sol::object              func;
        bool                     applied;
    };

    // Lua-side Module
    // obj.name = name
    // obj.overrides = {}
    // obj.enabled = false

    std::vector<Override> overrides;

    void LoadLuaModules()
    {
        sol::state& lua = luautils::lua;

        // Load the helper file
        lua.script_file("./modules/module_utils.lua");

        // Read lines from init.txt
        std::vector<std::string> list;
        std::ifstream file("./modules/init.txt", std::ios_base::in);
        std::string line;
        while (std::getline(file, line))
        {
            if (!line.empty() && line.at(0) != '#')
            {
                list.emplace_back("./modules/" + line);
            }
        }

        // Expand out folders
        for (auto const& entry : list)
        {
            if (std::filesystem::is_directory(entry))
            {
                for (auto const& innerEntry : std::filesystem::recursive_directory_iterator(entry))
                {
                    auto path = innerEntry.path().relative_path();
                    list.emplace_back(path.generic_string());
                }
            }
        }

        // Load each module file that isn't the helpers.lua file or a directory
        for (auto const& entry : list)
        {
            auto path          = std::filesystem::path(entry).relative_path();
            bool isHelpersFile = path.filename() == "module_utils.lua";

            if (!isHelpersFile &&
                !std::filesystem::is_directory(path) &&
                path.extension() == ".lua")
            {
                std::string filename  = path.filename().generic_string();
                std::string relPath   = path.relative_path().generic_string();

                auto res = lua.safe_script_file(relPath);
                if (!res.valid())
                {
                    sol::error err = res;
                    ShowError("Failed to load module: %s", filename);
                    ShowError(err.what());
                    continue;
                }

                sol::table table = res;
                if (table["overrides"].valid()) // Check the file is a valid module
                {
                    auto moduleName = table.get_or("name", std::string());
                    ShowScript(fmt::format("=== Module: {} ===", moduleName));
                    for (auto& override : table.get_or("overrides", std::vector<sol::table>()))
                    {
                        std::string name = override["name"];
                        sol::object func = override["func"];

                        ShowScript(fmt::format("Preparing override: {}", name));

                        auto parts = split(name, '.');
                        overrides.emplace_back(Override{ filename, name, parts, func, false });
                    }
                }
            }
        }
    }

    void TryApplyLuaModules(const std::string& potentialOverridePath)
    {
        sol::state& lua = luautils::lua;

        for (auto& override : overrides)
        {
            // e.g. see if "xi.zones.Valley_Of_Sorrows.mobs.Peryton.onMobSpawn" contains "xi.zones.Valley_of_Sorrows.mobs.Peryton" as its base
            // if true, we need to apply, or even re-apply, this override
            if (!override.applied || override.overrideName.find(potentialOverridePath) == 0)
            {
                auto firstElem  = override.nameParts.front();
                auto lastTable = override.nameParts.size() < 2 ? firstElem : *(override.nameParts.end() - 2);
                auto lastElem  = override.nameParts.back();

                sol::table table = lua["_G"];
                for (auto& part : override.nameParts)
                {
                    table = table[part].get_or<sol::table>(sol::lua_nil);
                    if (table == sol::lua_nil)
                    {
                        break;
                    }

                    if (part == lastTable)
                    {
                        if (override.applied)
                        {
                            ShowScript(fmt::format("Re-Applying override: {}", override.overrideName));
                        }
                        else
                        {
                            ShowScript(fmt::format("Applying override: {}", override.overrideName));
                        }

                        lua["applyOverride"](table, lastElem, override.func);

                        override.applied = true;

                        break;
                    }
                }
            }
        }
    }

    void ReportLuaModuleUsage()
    {
        for (auto& override : overrides)
        {
            if (!override.applied)
            {
                ShowWarning(fmt::format("Override not applied: {} ({})", override.overrideName, override.filename));
            }
        }
    }
}; // namespace moduleutils
