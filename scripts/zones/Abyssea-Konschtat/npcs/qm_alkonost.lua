-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_alkonost (???)
-- Spawns Alkonost
-- !pos 54.000 30.654 414.000 15
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ALKONOST, { xi.items.GIANT_BUGARD_TUSK })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.GIANT_BUGARD_TUSK })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
