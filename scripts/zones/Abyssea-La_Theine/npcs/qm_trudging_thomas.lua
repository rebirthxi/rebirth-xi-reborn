-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_trudging_thomas (???)
-- Spawns Trudging Thomas
-- !pos 278 24 -82 132
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TRUDGING_THOMAS, { xi.items.RAW_MUTTON_CHOP })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.RAW_MUTTON_CHOP })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
