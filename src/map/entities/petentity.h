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

#ifndef _CPETENTITY_H
#define _CPETENTITY_H

#include "mobentity.h"

enum class PET_TYPE : uint8
{
    AVATAR             = 0,
    WYVERN             = 1,
    JUG_PET            = 2,
    CHARMED_MOB        = 3,
    AUTOMATON          = 4,
    ADVENTURING_FELLOW = 5,
    CHOCOBO            = 6,
    LUOPAN             = 7,
};

enum class WYVERN_TYPE : uint8
{
    NONE         = 0,
    DEFENSIVE    = 1,
    MULTIPURPOSE = 2,
    OFFENSIVE    = 3
};

class CPetEntity : public CMobEntity
{
public:
    CPetEntity(PET_TYPE petType); // конструктор
    ~CPetEntity();                // деструктор

    PET_TYPE    getPetType();
    bool        isBstPet();
    uint8       m_Element;
    uint32      m_PetID;
    std::string GetScriptName();

    WYVERN_TYPE  getWyvernType();
    virtual void PostTick() override;
    virtual void FadeOut() override;
    virtual void Die() override;
    virtual void Spawn() override;
    virtual void OnAbility(CAbilityState&, action_t&) override;
    virtual bool ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags) override;

private:
    PET_TYPE m_PetType; // the type of pet e.g. avatar/wyvern/jugpet etc
};

#endif
