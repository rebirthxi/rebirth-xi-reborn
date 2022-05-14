﻿#ifndef _CTIMERBARUTILPACKET_H
#define _CTIMERBARUTILPACKET_H

#include "common/cbasetypes.h"

#include "basic.h"

#include <string>

class CTimerBarUtilPacket : public CBasicPacket
{
public:
    CTimerBarUtilPacket();

    void addCountdown(uint32 seconds);
    void addBar1(std::string const& name, uint8 value);
    void addBar2(std::string const& name, uint8 value);

    // Yalms * 1000
    void addBattlefieldRadius(uint32 distance);

    // Yalms * 1000
    void addRenderRadius(uint32 distance);
};

#endif
