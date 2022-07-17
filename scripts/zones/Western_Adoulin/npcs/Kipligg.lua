-----------------------------------
-- Area: Western Adoulin
--  NPC: Kipligg
-- Type: Standard NPC and Mission NPC,
-- Involved with Missions: '...Into the Fire', 'Done and Delivered'
-- !pos -32 0 22 256
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.SOA) < xi.mission.id.soa.LIFE_ON_THE_FRONTIER then
        -- Dialogue prior to joining colonization effort
        player:startEvent(571)
    else
        -- Dialogue after joining colonization effort
        player:startEvent(589)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
