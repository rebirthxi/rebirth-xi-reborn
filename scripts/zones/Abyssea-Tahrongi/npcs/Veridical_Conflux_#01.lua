-----------------------------------
-- Area: Abyssea-Tahrongi
--  NPC: Veridical Conflux #01
-- Aybssea Teleport NPC
-----------------------------------
require("scripts/globals/conflux")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
	xi.conflux.confluxOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.conflux.confluxEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.conflux.confluxEventFinish(player, csid, option, npc)
end

return entity
