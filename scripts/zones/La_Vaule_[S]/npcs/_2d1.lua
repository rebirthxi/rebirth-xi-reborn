-----------------------------------
-- Area: La Vaule [S]
--  NPC: _2d1 (Reinforced Gateway)
-- !pos -114.386 -3.599 -179.804 85
-----------------------------------
require("scripts/globals/bcnm")
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if not xi.bcnm.onTrigger(player, npc) then
        player:messageSpecial(ID.text.GATE_IS_LOCKED)
    end
end

entity.onEventUpdate = function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
    xi.bcnm.onEventFinish(player, csid, option)
end

return entity
