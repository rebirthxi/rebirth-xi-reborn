-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Beastmen_s_Banner
-- !pos -116.204 4.000 -113.608 104
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs")
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
