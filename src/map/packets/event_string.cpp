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

#include "common/socket.h"

#include <cstring>

#include "../entities/charentity.h"
#include "event_string.h"

CEventStringPacket::CEventStringPacket(CCharEntity* PChar, EventInfo* eventInfo)
{
    this->setType(0x33);
    this->setSize(0x70);

    uint32       npcServerID = 0;
    uint32       npcLocalID  = 0;
    CBaseEntity* PNpc        = eventInfo->targetEntity;

    if (PNpc)
    {
        npcServerID = PNpc->id;
        npcLocalID  = PNpc->targid;
    }
    else
    {
        // Fallback to our own CharID because giving a value
        // of zero makes the game hang.
        npcServerID = PChar->id;
        npcLocalID  = PChar->targid;
    }

    ref<uint32>(0x04) = npcServerID;
    ref<uint16>(0x08) = npcLocalID;
    ref<uint16>(0x0A) = PChar->getZone();
    ref<uint16>(0x0C) = eventInfo->eventId;
    ref<uint8>(0x0E)  = 8; // camera "jumps" behind the character if < 8 params

    for (auto stringPair : eventInfo->strings)
    {
        memcpy(data + 0x10 + 0x10 * stringPair.first, stringPair.second.c_str(), stringPair.second.size());
    }

    for (auto paramPair : eventInfo->params)
    {
        // Only params 0 through 7 are valid
        if (paramPair.first <= 7)
        {
            ref<uint32>(0x50 + paramPair.first * 4) = paramPair.second;
        }
    }
}
