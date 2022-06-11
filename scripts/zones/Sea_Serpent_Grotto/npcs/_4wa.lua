-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: Sahagin Key Door
-- !pos 40 8.6 20.012 176
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, 1197) then
        npc:openDoor(8) -- Open the door if a Sahagin key has been traded
        player:messageSpecial(ID.text.SAHAGIN_DOOR_TRADED, 0, 1197) -- Give a message telling the PC the item is lost
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    local xPos = player:getXPos()
    local zPos = player:getZPos()

    if xPos > 94 and zPos >= 40 then
        player:messageSpecial(ID.text.SAHAGIN_DOOR_OUTSIDE) -- Give a message if standing on the "outside" of the door (closest to Norg)
    elseif xPos < 104 and xPos >= 94 and zPos <= 40 then
        player:messageSpecial(ID.text.SAHAGIN_DOOR_INSIDE) -- Give a message if standing on the "inside" of the door
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
