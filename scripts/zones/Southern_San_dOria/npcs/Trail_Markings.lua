-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Trail Markings
-- Dynamis-San d'Oria Enter
-- !pos 139 -2 122 230
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.dynamis.entryNpcOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.dynamis.entryNpcOnEventFinish(player, csid, option)
end

return entity
