-----------------------------------
-- Area: Port Jeuno
--  NPC: Illauvolahaut
-- !pos -12 8 54 246

-- event 41:  without addons (ZM) ?
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local kazhamPass = player:hasKeyItem(xi.ki.AIRSHIP_PASS_FOR_KAZHAM)

    if not kazhamPass then
        player:startEvent(35) -- without pass
    elseif kazhamPass and player:getGil() < 200 then
        player:startEvent(45) -- Pass without money
    elseif kazhamPass then
        player:startEvent(37) -- Pass with money
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 37 then
        local zPos = player:getZPos()

        if zPos >= 58 and zPos <= 61 then
            player:delGil(200)
        end
    end
end

return entity
