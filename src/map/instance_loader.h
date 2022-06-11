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

#ifndef _CINSTANCELOADER_H
#define _CINSTANCELOADER_H

#include "common/cbasetypes.h"
#include "common/socket.h"

class CCharEntity;
class CInstance;
class CZone;

class CInstanceLoader
{
public:
    CInstanceLoader(uint16 instanceid, CCharEntity* PRequester);
    ~CInstanceLoader();

    CInstance* LoadInstance();

private:
    CInstance*   instance;
    CZone*       zone;
    CCharEntity* requester;
};

#endif
