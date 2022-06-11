-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------
local riverneBGlobal = require("scripts/zones/Riverne-Site_B01/globals")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    riverneBGlobal.unstableDisplacementTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    riverneBGlobal.unstableDisplacementTrigger(player, npc, 22)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
