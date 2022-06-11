-----------------------------------
-- Area: Pso'Xja
--  NPC: _i94 (Stone Gate)
-- Notes: Blue Bracelet Door
-- !pos -330.000 14.074 -261.600 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local zPos = player:getZPos()

    if zPos >= -261 then
        if player:hasKeyItem(xi.ki.BLUE_BRACELET) then -- Blue Bracelet
            player:startEvent(61)
        else
            player:messageSpecial(ID.text.ARCH_GLOW_BLUE)
        end
    elseif zPos <= -262 then
        player:messageSpecial(ID.text.CANNOT_OPEN_SIDE)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
