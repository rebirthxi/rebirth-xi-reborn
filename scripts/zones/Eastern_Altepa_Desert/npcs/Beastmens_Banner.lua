-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Beastmen_s_Banner
-- !pos -257 8 -249 114
-----------------------------------
local ID = require("scripts/zones/Eastern_Altepa_Desert/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.BEASTMEN_BANNER)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
