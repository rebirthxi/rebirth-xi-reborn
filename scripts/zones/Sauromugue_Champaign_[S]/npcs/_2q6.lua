-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Ebon Door
-- !pos -103.959 -26 -416.869 98
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(103)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if
        csid == 103 and
        option == 1
    then
        player:setPos(-300, -12.08, 157, 64, xi.zone.GARLAIGE_CITADEL_S)
    end
end

return entity
