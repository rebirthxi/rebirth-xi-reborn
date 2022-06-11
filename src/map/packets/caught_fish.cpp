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

#include "caught_fish.h"
#include "../../common/socket.h"
#include "../entities/charentity.h"
#include <string.h>

CCaughtFishPacket::CCaughtFishPacket(CCharEntity* PChar, uint16 param0, uint16 messageID, uint8 count)
{
    this->setType(0x27);
    this->setSize(0x70);

    ref<uint32>(0x04) = PChar->id;
    ref<uint32>(0x08) = PChar->targid;
    ref<uint16>(0x0A) = messageID + 0x8000;
    ref<uint16>(0x10) = param0;
    ref<uint8>(0x14)  = count;
    ref<uint32>(0x1C) = 0x00;

    memcpy(data + (0x20), PChar->GetName(), PChar->name.size());
}
