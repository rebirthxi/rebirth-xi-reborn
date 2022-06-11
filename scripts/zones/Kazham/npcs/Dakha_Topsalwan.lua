-----------------------------------
-- Area: Kazham
--  NPC: Dakha Topsalwan
-- !zone 250
-----------------------------------
require("scripts/settings/main")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local zPos = player:getZPos()

    if (zPos >= -20 and zPos <= -16) then
        player:startEvent(66)
    else
        player:startEvent(121)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
