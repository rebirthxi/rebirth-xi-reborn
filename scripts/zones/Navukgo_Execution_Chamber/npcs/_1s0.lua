-----------------------------------
-- Area: Navukgo Execution Chamber
--  NPC: Decorative Bronze Gate
-- Involved in Missions: TOAU-22
-- !pos -601 10 -100 64
-----------------------------------
require("scripts/globals/bcnm")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.bcnm.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
    xi.bcnm.onEventFinish(player, csid, option)
end

return entity
