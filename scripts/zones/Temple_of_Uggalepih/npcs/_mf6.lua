-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: _mf8 (Granite Door)
-- Note: Opens with Uggalepih Key
-- !pos -208 -1.89 -20
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, xi.items.UGGALEPIH_KEY) then
        player:confirmTrade()
        player:messageSpecial(ID.text.YOUR_KEY_BREAKS, 0, xi.items.UGGALEPIH_KEY)
        npc:openDoor()
    end
end

entity.onTrigger = function(player, npc)
    if player:getXPos() >= -208 then
        player:messageSpecial(ID.text.THE_DOOR_IS_LOCKED, xi.items.UGGALEPIH_KEY)
    else
        npc:openDoor(11)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
