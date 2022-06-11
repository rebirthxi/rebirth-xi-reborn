-----------------------------------
-- Area: Western Adoulin
--  NPC: Berstrogus
-- Type: Standard NPC
-- !pos -44 4 -10 256
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local soaMission = player:getCurrentMission(xi.mission.log_id.SOA)

    if soaMission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER then
        -- Standard dialogue, after joining colonization effort
        player:startEvent(587)
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(504)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
