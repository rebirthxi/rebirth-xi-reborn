-----------------------------------
-- Area: Outer Ra'Kaznar
--  NPC: Vertical Transit Device (4)
-- !pos 580 99 26.606 274
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(46, 1, 300, 1, 100, 282664, 4, 578743, 0)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- TODO: Verify that CS moves the player
end

return entity
