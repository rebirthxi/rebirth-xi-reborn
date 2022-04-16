-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-- Note: entrance for "Ouryu Cometh"
-- !pos 183.390 -3.250 341.550 30
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/bcnm")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.A_GLOWING_MIST)
end

entity.onEventUpdate = function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
