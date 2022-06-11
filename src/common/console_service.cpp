﻿/*
===========================================================================

  Copyright (c) 2022 LandSandBoat Dev Teams

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

#include "console_service.h"

extern std::atomic<bool> gRunFlag;

ConsoleService::ConsoleService()
{
    // clang-format off
    RegisterCommand("help", "Print a list of available console commands.",
    [this](std::vector<std::string> inputs)
    {
        fmt::print("> Available commands:\n");
        for (auto& [name, command] : m_commands)
        {
            fmt::print("> {} : {}\n", command.name, command.description);
        }
    });

    RegisterCommand("tasks", "Show the current amount of tasks registered to the application task manager.",
    [](std::vector<std::string> inputs)
    {
        fmt::print("> tasks registered to the application task manager: {}\n", CTaskMgr::getInstance()->getTaskList().size());
    });

    RegisterCommand("exit", "Terminate the program.",
    [](std::vector<std::string> inputs)
    {
        fmt::print("> Goodbye!\n");
        gRunFlag = false;
    });

    bool attached = isatty(0);
    if (attached)
    {
        ShowStatus("Console input thread is ready...");
        ShowStatus("Type 'help' for a list of available commands.");
        m_consoleInputThread = std::thread([&]()
        {
            auto lastInputTime = server_clock::now();

            // TODO: condition_variable
            while (gRunFlag)
            {
                if ((server_clock::now() - lastInputTime) > 1s)
                {
                    std::lock_guard lock(m_consoleInputBottleneck);

                    std::string line;
                    std::getline(std::cin, line);

                    std::istringstream stream(line);
                    std::string        input;

                    std::vector<std::string> inputs;
                    while (stream >> input)
                    {
                        for (auto& part : split(input))
                        {
                            inputs.emplace_back(part);
                        }
                    }

                    if (!inputs.empty())
                    {
                        TracyZoneScoped;

                        auto entry = m_commands.find(inputs[0]);
                        if (entry != m_commands.end())
                        {
                            entry->second.func(std::move(inputs));
                        }
                        else
                        {
                            fmt::print("> Unknown command.\n");
                        }
                    }
                }
                std::this_thread::sleep_for(250ms); // TODO: Do this better
            };
            ShowStatus("Console input thread exiting...");
        });
    }
    // clang-format on
}

ConsoleService::~ConsoleService()
{
    m_consoleThreadRun = false;
    m_consoleInputThread.join();
}

// NOTE: If you capture things in this function, make sure they're protected (locked or atomic)!
// NOTE: If you're going to print, use fmt::print, rather than ShowInfo etc.
void ConsoleService::RegisterCommand(std::string const& name, std::string const& description, std::function<void(std::vector<std::string>)> func)
{
    std::lock_guard lock(m_consoleInputBottleneck);
    m_commands[name] = ConsoleCommand{ name, description, func };
}
