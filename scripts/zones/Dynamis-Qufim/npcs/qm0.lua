-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: ??? (qm0)
-- Note: Spawns Antaeus / Arch Antaeus
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.dynamis.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.dynamis.qmOnTrigger(player, npc)
end

return entity
