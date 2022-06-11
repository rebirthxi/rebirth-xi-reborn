-----------------------------------
--
-- Zone: Quicksand_Caves (208)
--
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/settings/main")
require("scripts/globals/treasure")
require("scripts/globals/status")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    -- Weight Door System (RegionID, X, Radius, Z)
    zone:registerRegion(1, -15, 5, -60, 0, 0, 0)
    zone:registerRegion(3, 15, 5, -180, 0, 0, 0)
    zone:registerRegion(5, -580, 5, -420, 0, 0, 0)
    zone:registerRegion(7, -700, 5, -420, 0, 0, 0)
    zone:registerRegion(9, -700, 5, -380, 0, 0, 0)
    zone:registerRegion(11, -780, 5, -460, 0, 0, 0)
    zone:registerRegion(13, -820, 5, -380, 0, 0, 0)
    zone:registerRegion(15, -260, 5, 740, 0, 0, 0)
    zone:registerRegion(17, -340, 5, 660, 0, 0, 0)
    zone:registerRegion(19, -420, 5, 740, 0, 0, 0)
    zone:registerRegion(21, -340, 5, 820, 0, 0, 0)
    zone:registerRegion(23, -409, 5, 800, 0, 0, 0)
    zone:registerRegion(25, -400, 5, 670, 0, 0, 0)

    -- Hole in the Sand
    zone:registerRegion(30, 495, -9, -817, 497, -7, -815) -- E-11 (Map 2)
    zone:registerRegion(31, 815, -9, -744, 817, -7, -742) -- M-9 (Map 2)
    zone:registerRegion(32, 215, 6, -17, 217, 8, -15)     -- K-6 (Map 3)
    zone:registerRegion(33, -297, 6, 415, -295, 8, 417)   -- E-7 (Map 6)
    zone:registerRegion(34, -137, 6, -177, -135, 8, -175) -- G-7 (Map 8)

    xi.treasure.initZone(zone)

    npcUtil.UpdateNPCSpawnPoint(ID.npc.ANTICAN_TAG_QM, 60, 120, ID.npc.ANTICAN_TAG_POSITIONS, "[POP]Antican_Tag")
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-980.193, 14.913, -282.863, 60)
    end

    return cs
end

local function getWeight(player)
    local race = player:getRace()

    if race == xi.race.GALKA then
        return 3
    elseif race == xi.race.TARU_M or race == xi.race.TARU_F then
        return 1
    else
        return 2
    end
end

zone_object.onRegionEnter = function(player, region)
    local regionID = region:GetRegionID()

    -- holes in the sand
    if (regionID >= 30) then
        switch (regionID): caseof
        {
            [30] = function (x)
                player:setPos(496, -6, -816)
            end,
            [31] = function (x)
                player:setPos(816, -6, -743)
            end,
            [32] = function (x)
                player:setPos(216, 9, -16)
            end,
            [33] = function (x)
                player:setPos(-296, 9, 416)
            end,
            [34] = function (x)
                player:setPos(-136, 9, -176)
            end,
        }

    -- ornate door pressure plates
    else
        local door = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + regionID - 1)
        local plate = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + regionID)

        local totalWeight = plate:getLocalVar("weight")
        totalWeight = totalWeight + getWeight(player)
        plate:setLocalVar("weight", totalWeight)

        if (player:hasKeyItem(xi.ki.LOADSTONE) or totalWeight >= 3) then
            door:openDoor(15) -- open door with a 15 second time delay.
            plate:setAnimation(xi.anim.OPEN_DOOR) -- this is supposed to light up the platform but it's not working. Tried other values too.
        end
    end
end

zone_object.onRegionLeave = function(player, region)
    local regionID = region:GetRegionID()

    if (regionID < 30) then
        -- local door = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + regionID - 1)
        local plate = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + regionID)

        local totalWeight = plate:getLocalVar("weight")
        totalWeight = totalWeight - getWeight(player)
        plate:setLocalVar("weight", totalWeight)

        if (plate:getAnimation() == xi.anim.OPEN_DOOR and totalWeight < 3) then
            plate:setAnimation(xi.anim.CLOSE_DOOR)
        end
    end
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
