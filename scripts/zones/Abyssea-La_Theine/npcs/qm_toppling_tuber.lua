-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_toppling_tuber (???)
-- Spawns Toppling Tuber
-- !pos -325 38 201 132
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TOPPLING_TUBER, { xi.items.GIANT_AGARICUS_MUSHROOM })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.GIANT_AGARICUS_MUSHROOM })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
