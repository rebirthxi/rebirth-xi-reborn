-----------------------------------
-- Area: Ro'Maeve
--  NPC: _3e1 (Moongate)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if (player:hasKeyItem(xi.ki.MOONGATE_PASS) == true) then
        npc:openDoor(10)
    end
end

entity.onTrade = function(player, npc, trade)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
