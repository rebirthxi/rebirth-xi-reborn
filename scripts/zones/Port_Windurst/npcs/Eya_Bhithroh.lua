-----------------------------------
-- Area: Port Windurst
--  NPC: Eya Bhithroh
-- Type: Weather Reporter
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(10006, 0, 0, 0, 0, 0, 0, 0, VanadielTime())
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
