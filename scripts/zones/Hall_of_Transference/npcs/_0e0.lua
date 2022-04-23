-----------------------------------
-- Area: Hall of Transference
--  NPC: Cermet Gate - Holla
-- !pos -219 -6 280 14
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Note: Below the Arks uses a different scheme, but the mission script blocks actions
    -- if the player is not currently with this memory.

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.BELOW_THE_ARKS then
        player:startEvent(150)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 150 and option == 1 then
        player:setPos(92.033, 0, 80.380, 255, 16) -- To Promyvion Holla {R}
    end
end

return entity
