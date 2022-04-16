-----------------------------------
-- Zone: Abyssea - Uleguerand
--  NPC: Atma Fabricant
-----------------------------------
require("scripts/globals/abyssea/atma_fabricant")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.atmaFabricant.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.atmaFabricant.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.atmaFabricant.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.atmaFabricant.onEventFinish(player, csid, option, npc)
end

return entity
