-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_sarcophilus (???)
-- Spawns Sarcophilus
-- !pos -235.000 -15.882 -120.000 15
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.SARCOPHILUS, { xi.items.RIPPED_EFT_SKIN })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.RIPPED_EFT_SKIN })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
