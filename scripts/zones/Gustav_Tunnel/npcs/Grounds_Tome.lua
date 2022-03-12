-----------------------------------
-- Area: Gustav Tunnel
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.regime.bookOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.regime.bookOnTrigger(player, xi.regime.type.GROUNDS)
end

entity.onEventUpdate = function(player, csid, option)
    xi.regime.bookOnEventUpdate(player, option, xi.regime.type.GROUNDS)
end

entity.onEventFinish = function(player, csid, option)
    xi.regime.bookOnEventFinish(player, option, xi.regime.type.GROUNDS)
end

return entity
