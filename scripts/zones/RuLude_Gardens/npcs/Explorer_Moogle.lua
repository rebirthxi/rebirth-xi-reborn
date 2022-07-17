-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Explorer Moogle
-- Type: Mog Tablet
-- !pos -5.687 8.999 -41.341 243
-----------------------------------
require('scripts/globals/mog_tablets')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.mogTablet.moogleOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.mogTablet.moogleOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.mogTablet.moogleOnEventFinish(player, csid, option)
end

return entity
