-----------------------------------
-- Area: Western Adoulin
--  NPC: Rising Solstice
-- Type: Standard NPC and Quest Giver
-- Starts, Involved With, and Finishes Quest: 'A Certain Substitute Patrolman'
-- !pos -154 4 -29 256
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local adoulinMission = player:getCurrentMission(xi.mission.log_id.SOA)

    if adoulinMission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER then
        if
            adoulinMission >= xi.mission.id.soa.BEAUTY_AND_THE_BEAST and
            adoulinMission <= xi.mission.id.soa.SALVATION
        then
            -- Speech while Arciela is 'kidnapped'
            player:startEvent(150)
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(580)
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(502)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
