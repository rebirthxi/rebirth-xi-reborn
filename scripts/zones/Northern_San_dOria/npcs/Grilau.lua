-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Grilau
-- !pos -241.987 6.999 57.887 231
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(xi.mission.log_id.SANDORIA) ~= xi.mission.id.sandoria.NONE then
        player:startEvent(1008) -- Wrong Item
    else
        player:startEvent(1010) -- Mission not activated
    end
end

entity.onTrigger = function(player, npc)
    if player:getNation() ~= xi.nation.SANDORIA then
        player:startEvent(1011) -- for Non-San d'Orians
    else
        local currentMission = player:getCurrentMission(xi.mission.log_id.SANDORIA)

        if currentMission ~= xi.mission.id.sandoria.NONE then
            player:startEvent(1001) -- Have mission already activated
        else
            local mission_mask, repeat_mask = xi.mission.getMissionMask(player)
            player:startEvent(1009, mission_mask, 0, 0 , 0 , 0 , repeat_mask) -- Mission List
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
