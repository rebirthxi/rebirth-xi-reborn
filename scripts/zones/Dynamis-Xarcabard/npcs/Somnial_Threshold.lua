-----------------------------------
-- Area: Dynamis
--  NPC: Somnial Threshold
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.dynamis.somnialThresholdOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.dynamis.somnialThresholdOnEventFinish(player, csid, option)
end

return entity
