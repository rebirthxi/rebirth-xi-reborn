-----------------------------------
-- Area: Balga's Dais
--  NPC: Burning Circle
-- Balga's Dais Burning Circle
-- !pos 299 -123 345 146
-----------------------------------
require("scripts/globals/bcnm")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.bcnm.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.bcnm.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.bcnm.onEventFinish(player, csid, option)
end

return entity
