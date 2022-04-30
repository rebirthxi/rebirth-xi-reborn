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
#include <cstring>

#include "../ai/ai_container.h"
#include "../battlefield.h"
#include "../instance.h"
#include "../map.h"
#include "../zone.h"
#include "baseentity.h"

CBaseEntity::CBaseEntity()
: status(STATUS_TYPE::DISAPPEAR)
, isRenamed(false)
{
    id       = 0;
    targid   = 0;
    objtype  = ENTITYTYPE::TYPE_NONE;
    m_TargID = 0;
    memset(&look, 0, sizeof(look));
    memset(&mainlook, 0, sizeof(mainlook));
    // False positive: any reasonable compiler is IEEE754-1985 compatible
    // portability: Using memset() on struct which contains a floating point number.
    // This is not portable because memset() sets each byte of a block of memory to a specific value and
    // the actual representation of a floating-point value is implementation defined. Note: In case of an IEEE754-1985 compatible
    // implementation setting all bits to zero results in the value 0.0. [memsetClassFloat]
    // cppcheck-suppress memsetClassFloat
    memset(&loc, 0, sizeof(loc));
    animation    = ANIMATION_NONE;
    animationsub = 0;
    speed        = 50 + map_config.speed_mod; // It is downright dumb to init every entity at PLAYER speed, but until speed is reworked this hack stays.
    speedsub     = 50; // Retail does NOT adjust this when speed is adjusted.
    namevis      = 0;
    allegiance   = ALLEGIANCE_TYPE::MOB;
    updatemask   = 0;
    PAI          = nullptr;
    PBattlefield = nullptr;
    PInstance    = nullptr;
}

CBaseEntity::~CBaseEntity()
{
    if (PBattlefield)
    {
        PBattlefield->RemoveEntity(this, BATTLEFIELD_LEAVE_CODE_WARPDC);
    }
}

void CBaseEntity::Spawn()
{
    status = allegiance == ALLEGIANCE_TYPE::MOB ? STATUS_TYPE::MOB : STATUS_TYPE::NORMAL;
    updatemask |= UPDATE_HP;
    ResetLocalVars();
    PAI->Reset();
    PAI->EventHandler.triggerListener("SPAWN", CLuaBaseEntity(this));
}

void CBaseEntity::FadeOut()
{
    status = STATUS_TYPE::DISAPPEAR;
    updatemask |= UPDATE_HP;
}

const int8* CBaseEntity::GetName()
{
    return (const int8*)name.c_str();
}

const int8* CBaseEntity::GetPacketName()
{
    return (const int8*)packetName.c_str();
}

uint16 CBaseEntity::getZone() const
{
    return loc.zone != nullptr ? loc.zone->GetID() : loc.destination;
}

float CBaseEntity::GetXPos() const
{
    return loc.p.x;
}

float CBaseEntity::GetYPos() const
{
    return loc.p.y;
}

float CBaseEntity::GetZPos() const
{
    return loc.p.z;
}

uint8 CBaseEntity::GetRotPos() const
{
    return loc.p.rotation;
}

void CBaseEntity::HideName(bool hide)
{
    if (hide)
    {
        // I totally guessed this number
        namevis |= FLAG_HIDE_NAME;
    }
    else
    {
        namevis &= ~FLAG_HIDE_NAME;
    }
    updatemask |= UPDATE_HP;
}

bool CBaseEntity::IsNameHidden() const
{
    return namevis & FLAG_HIDE_NAME;
}

bool CBaseEntity::IsTargetable() const
{
    return (namevis & FLAG_UNTARGETABLE) == 0;
}

bool CBaseEntity::isWideScannable()
{
    return status != STATUS_TYPE::DISAPPEAR && !IsNameHidden() && IsTargetable();
}

CBaseEntity* CBaseEntity::GetEntity(uint16 targid, uint8 filter) const
{
    if (targid == 0)
    {
        return nullptr;
    }
    else if (PInstance)
    {
        return PInstance->GetEntity(targid, filter);
    }
    else
    {
        return loc.zone->GetEntity(targid, filter);
    }
}

void CBaseEntity::ResetLocalVars()
{
    m_localVars.clear();
}

uint32 CBaseEntity::GetLocalVar(const char* var)
{
    return m_localVars[var];
}

void CBaseEntity::SetLocalVar(const char* var, uint32 val)
{
    m_localVars[var] = val;
}

std::string CBaseEntity::GetLocalStringVar(const std::string& key)
{
    return m_localStringVars[key];
}

void CBaseEntity::SetLocalStringVar(const std::string& key, const std::string& value)
{
    m_localStringVars[key] = value;
}

void CBaseEntity::SetModelId(uint16 modelid)
{
    look.modelid = modelid;
}

uint16 CBaseEntity::GetModelId() const
{
    return look.modelid;
}

bool CBaseEntity::IsDynamicEntity() const
{
    return this->targid >= 0x800;
}
