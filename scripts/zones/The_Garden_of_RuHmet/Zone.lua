-----------------------------------
--
-- Zone: The_Garden_of_RuHmet (35)
--
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    zone:registerRegion(1, -421, -2, 377,  -417, 0, 381) -- RDC
    zone:registerRegion(2, -422, -2, -422,  -418, 0, -418) -- +1
    zone:registerRegion(3, 418, -2, 378,  422, 0, 382) -- +2

    zone:registerRegion(4,  -506, -4, 697,  -500, 4, 703)--hume niv 0  150   vers niv 1
    zone:registerRegion(5,  -507, -4, -103,  -501, 4, -97)--hume niv 1  158   vers niv 0
    zone:registerRegion(6,  -339, -4, -103,  -332, 4, -97)--hume niv 1  159   vers niv 2
    zone:registerRegion(7,  501, -4, 697,  507, 4, 702)--hume niv 2  169   vers niv 1
    zone:registerRegion(8,  332, -4, 696,  339, 4, 702)--hume niv 2  168   vers niv 3
    zone:registerRegion(9,  332, -4, -102,  338, 4, -97)--hume niv 3  178   vers niv 2

    zone:registerRegion(10,  -102, -4, 541,  -96, 4, 546)--elvaan niv 0 151 vers niv 1
    zone:registerRegion(11,  -103, -4, -259,  -96, 4, -252)--elvaan niv 1 160 vers niv 0
    zone:registerRegion(12,  -103, -4, -427,  -67, 4, -420)--elvaan niv 1 161 vers niv 2
    zone:registerRegion(13,  736, -4, 372,  742, 4, 379)--elvaan niv 2 171 vers niv 1
    zone:registerRegion(14,  736, -4, 540,  743, 4, 546)--elvaan niv 2 170 vers niv 3
    zone:registerRegion(15,  737, -4, -259,  743, 4, -252)--elvaan niv 3 179 vers niv 2

    zone:registerRegion(16,  -178, -4, 97,  -173, 4, 103)--galka niv 0 152 vers niv 1
    zone:registerRegion(17,  -178, -4, -703,  -173, 4, -697)--galka niv 1 162 vers niv 0
    zone:registerRegion(18,  -347, -4, -703,  -340, 4, -696)--galka niv 1 163 vers niv 2
    zone:registerRegion(19,  492, -4, 96,  499, 4, 103)--galka niv 2 173 vers niv 1
    zone:registerRegion(20,  660, -4, 96,  667, 4, 102)--galka niv 2 172 vers niv 3
    zone:registerRegion(21,  660, -4, -702,  667, 4, -697)--galka niv 3 180 vers niv 2

    zone:registerRegion(22,  -498, -4, 97,  -492, 4, 102)--taru niv 0 153 vers niv 1
    zone:registerRegion(23,  -499, -4, -703,  -492, 4, -697)--taru niv 1 164 vers niv 0
    zone:registerRegion(24,  -667, -4, -703,  -661, 4, -696)--taru niv 1 165 vers niv 2
    zone:registerRegion(25,  172, -4, 96,  178, 4, 102)--taru niv 2 175 vers niv 1
    zone:registerRegion(26,  340, -4, 97,  347, 4, 102)--taru niv 2 174 vers niv 3
    zone:registerRegion(27,  340, -4, -703,  347, 4, -697)--taru niv 3 181 vers niv 2

    zone:registerRegion(28,  -742, -4, 373,  -736, 4, 379)--mithra niv 0 154 vers niv 1
    zone:registerRegion(29,  -743, -4, -427,  -736, 4, -421)--mithra niv 1 166 vers niv 0
    zone:registerRegion(30,  -742, -4, -259,  -737, 4, -252)--mithra niv 1 167 vers niv 2
    zone:registerRegion(31,  97, -4, 541,  102, 4, 547)--mithra niv 2 177 vers niv 1
    zone:registerRegion(32,  97, -4, 372,  102, 4, 379)--mithra niv 2 176 vers niv 3
    zone:registerRegion(33,  97, -4, -427, 102, 4, -421)--mithra niv 3 182 vers niv 2

    -- Give the Fortitude ??? a random spawn
    local qmFort = GetNPCByID(ID.npc.QM_JAILER_OF_FORTITUDE)
    qmFort:setPos(unpack(ID.npc.QM_JAILER_OF_FORTITUDE_POS[math.random(1, 5)]))

    -- Give the Ix'Aern DRK ??? a random spawn
    local qmDrk = GetNPCByID(ID.npc.QM_IXAERN_DRK)
    local qmDrkPos = math.random(1, 4)
    qmDrk:setLocalVar("position", qmDrkPos)
    qmDrk:setPos(unpack(ID.npc.QM_IXAERN_DRK_POS[qmDrkPos]))
    qmDrk:setLocalVar("hatedPlayer", 0)

    -- Give the Faith ??? a random spawn
    local qmFaith = GetNPCByID(ID.npc.QM_JAILER_OF_FAITH)
    qmFaith:setPos(unpack(ID.npc.QM_JAILER_OF_FAITH_POS[math.random(1, 5)]))

    -- Give Ix'DRG a random placeholder by picking one of the four groups at random, then adding a random number of 0-2 for the specific mob.
    local groups = ID.mob.AWAERN_DRG_GROUPS
    SetServerVariable("[SEA]IxAernDRG_PH", groups[math.random(1, #groups)] + math.random(0, 2))
end

zone_object.afterZoneIn = function(player)
    player:entityVisualPacket("door")
    player:entityVisualPacket("lst1")
    player:entityVisualPacket("lst2")
    player:entityVisualPacket("lst3")
    player:entityVisualPacket("lop1")
    player:entityVisualPacket("lop2")
    player:entityVisualPacket("lop3")
    player:entityVisualPacket("lpmy")
    player:entityVisualPacket("clop")
    player:entityVisualPacket("slp1")
    player:entityVisualPacket("slp2")
    player:entityVisualPacket("slp3")
end

zone_object.onGameHour = function(zone)
    local vanadielHour = VanadielHour()
    local qmDrk = GetNPCByID(ID.npc.QM_IXAERN_DRK) -- Ix'aern drk
    local s = math.random(6, 12) -- wait time till change to next spawn pos, random 15~30 mins.

    -- Jailer of Faith spawn randomiser
    if (vanadielHour % s == 0) then
        local qmFaith = GetNPCByID(ID.npc.QM_JAILER_OF_FAITH) -- Jailer of Faith
        qmFaith:hideNPC(60) -- Hide it for 60 seconds
        qmFaith:setPos(unpack(ID.npc.QM_JAILER_OF_FAITH_POS[math.random(1, 5)])) -- Set the new position
    end

    -- Ix'DRK spawn randomiser
    if (vanadielHour % 12 == 0 and qmDrk:getStatus() ~= xi.status.DISAPPEAR) then -- Change ??? position every 12 hours Vana'diel time (30 mins)
        qmDrk:hideNPC(30)
        local qmDrkPos = math.random(1, 4)
        qmDrk:setLocalVar("position", qmDrkPos)
        qmDrk:setPos(unpack(ID.npc.QM_IXAERN_DRK_POS[qmDrkPos]))
    end
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-351.136, -2.25, -380, 253)
    end
    if (player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.WHEN_ANGELS_FALL and player:getCharVar("PromathiaStatus") == 0) then
        cs = 201
    end
    player:setCharVar("Ru-Hmet-TP", 0)
    return cs
end

zone_object.onRegionEnter = function(player, region)
    if (player:getCharVar("Ru-Hmet-TP") == 0 and player:getAnimation() == 0) then
        switch (region:GetRegionID()): caseof
        {
            [1] = function (x)
                if (player:getCurrentMission(xi.mission.log_id.COP)==xi.mission.id.cop.DAWN or player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DAWN) or player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_LAST_VERSE) ) then
                    player:startEvent(101)
                else
                    player:startEvent(155)
                end
            end, --101

            [2] = function (x)
                if (player:hasKeyItem(xi.ki.BRAND_OF_DAWN) and player:hasKeyItem(xi.ki.BRAND_OF_TWILIGHT)) then
                    player:startEvent(156)
                else
                    player:startEvent(183)
                end
            end, --102

            [3] = function (x)
                player:startEvent(103)
            end, --103

            [4] = function (x) player:startEvent(150); end, --hume niv 0  150 vers niv 1
            [5] = function (x) player:startEvent(158); end, --hume niv 1  158 vers niv 0
            [6] = function (x) player:startEvent(159); end, --hume niv 1  159 vers niv 2
            [7] = function (x) player:startEvent(169); end, --hume niv 2  169 vers niv 1
            [8] = function (x) player:startEvent(168); end, --hume niv 2  168 vers niv 3
            [9] = function (x) player:startEvent(178); end, --hume niv 3  178 vers niv 2

            [10] = function (x) player:startEvent(151); end, --elvaan niv 0 151 vers niv 1
            [11] = function (x) player:startEvent(160); end, --elvaan niv 1 160 vers niv 0
            [12] = function (x) player:startEvent(161); end, --elvaan niv 1 161 vers niv 2
            [13] = function (x) player:startEvent(171); end, --elvaan niv 2 171 vers niv 1
            [14] = function (x) player:startEvent(170); end, --elvaan niv 2 170 vers niv 3
            [15] = function (x) player:startEvent(179); end, --elvaan niv 3 179 vers niv 2

            [16] = function (x) player:startEvent(152); end, --galka niv 0 152 vers niv 1
            [17] = function (x) player:startEvent(162); end, --galka niv 1 162 vers niv 0
            [18] = function (x) player:startEvent(163); end, --galka niv 1 163 vers niv 2
            [19] = function (x) player:startEvent(173); end, --galka niv 2 173 vers niv 1
            [20] = function (x) player:startEvent(172); end, --galka niv 2 172 vers niv 3
            [21] = function (x) player:startEvent(180); end, --galka niv 3 180 vers niv 2

            [22] = function (x) player:startEvent(153); end, --taru niv 0 153 vers niv 1
            [23] = function (x) player:startEvent(164); end, --taru niv 1 164 vers niv 0
            [24] = function (x) player:startEvent(165); end, --taru niv 1 165 vers niv 2
            [25] = function (x) player:startEvent(175); end, --taru niv 2 175 vers niv 1
            [26] = function (x) player:startEvent(174); end, --taru niv 2 174 vers niv 3
            [27] = function (x) player:startEvent(181); end, --taru niv 3 181 vers niv 2

            [28] = function (x) player:startEvent(154); end, --mithra niv 0 154 vers niv 1
            [29] = function (x) player:startEvent(166); end, --mithra niv 1 166 vers niv 0
            [30] = function (x) player:startEvent(167); end, --mithra niv 1 167 vers niv 2
            [31] = function (x) player:startEvent(177); end, --mithra niv 2 177 vers niv 1
            [32] = function (x) player:startEvent(176); end, --mithra niv 2 176 vers niv 3
            [33] = function (x) player:startEvent(182); end, --mithra niv 3 182 vers niv 2
        }
    end
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)

    if ((csid >149 and csid < 184) or csid == 102 or csid == 103 or csid == 101) then
        player:setCharVar("Ru-Hmet-TP", 1)
    end
end

zone_object.onEventFinish = function(player, csid, option)

    if (csid == 101 and option == 1) then
        player:setPos(540, -1, -499.900, 62, 36)
        player:setCharVar("Ru-Hmet-TP", 0)
    elseif ((csid > 149 and csid < 184) or csid == 102 or csid == 103 or csid == 101) then
        player:setCharVar("Ru-Hmet-TP", 0)
    elseif (csid == 201) then
        player:setCharVar("PromathiaStatus", 1)
        player:addKeyItem(xi.ki.MYSTERIOUS_AMULET_PRISHE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MYSTERIOUS_AMULET)
    elseif (csid == 32000 and option==1) then
        player:setPos(420, 0, 398, 68)
    end
end

return zone_object
