-----------------------------------
-- Zone: Northern_San_dOria (231)
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/quests/flyers_for_regine")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    SetExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    zone:registerRegion(1, -7, -3, 110, 7, -1, 155)
    quests.ffr.initZone(zone) -- register regions 2 through 6

    applyHalloweenNpcCostumes(zone:getID())
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if xi.settings.main.NEW_CHARACTER_CUTSCENE == 1 then
            cs = 535
        end
        player:setPos(0, 0, -11, 191)
        player:setHomePoint()
    -- RDM AF3 CS
    elseif player:getCharVar("peaceForTheSpiritCS") == 5 and player:getFreeSlotsCount() >= 1 then
        cs = 49
    end

    -- MOG HOUSE EXIT
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(130, -0.2, -3, 160)
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Chateau d'Oraguille access
            local pNation = player:getNation()
            local currentMission = player:getCurrentMission(pNation)

            if (pNation == 0 and player:getRank(player:getNation()) >= 2) or (pNation > 0 and player:hasCompletedMission(pNation, 5) == 1) or (currentMission >= 5 and currentMission <= 9) or (player:getRank(player:getNation()) >= 3) then
                player:startEvent(569)
            else
                player:startEvent(568)
            end
        end,
    }
    quests.ffr.onRegionEnter(player, region) -- player approaching Flyers for Regine NPCs
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 535 then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536) -- adventurer coupon
    elseif csid == 569 then
        player:setPos(0, 0, -13, 192, 233)
    elseif csid == 49 and npcUtil.completeQuest(player, xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.PEACE_FOR_THE_SPIRIT, {item = 12513, fame = 60, title = xi.title.PARAGON_OF_RED_MAGE_EXCELLENCE}) then
        player:setCharVar("peaceForTheSpiritCS", 0)
    elseif csid == 16 then
        player:setCharVar("Wait1DayM8-1_date", 0)
        player:setCharVar("Mission8-1Completed", 1)
    end
end

return zone_object
