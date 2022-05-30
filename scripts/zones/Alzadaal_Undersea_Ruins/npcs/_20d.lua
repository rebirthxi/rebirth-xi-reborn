-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Doors (South)
-- !pos 180 0 -39 62 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if player:checkDistance(npc) < 3 then
        if player:getZPos() > -40 then
            player:messageSpecial(ID.text.STAGING_GATE_NYZUL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(115)
        elseif not player:hasKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS) then
            player:messageSpecial(ID.text.STAGING_GATE_NYZUL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(114)
        else
            player:messageSpecial(ID.text.CANNOT_LEAVE, xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
        end
    else
        player:messageSpecial(ID.text.STAGING_GATE_CLOSER)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
