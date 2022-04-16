-----------------------------------
-- Area: Heaven's Tower
--  NPC: Jerrett
-- Type: Abyssea Service NPC
-- !pos -7.85 0.5 -3.4 242
-----------------------------------
require("scripts/globals/abyssea")
----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.traverserNPCOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.traverserNPCOnUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.traverserNPCOnEventFinish(player, csid, option, npc)
end

return entity
