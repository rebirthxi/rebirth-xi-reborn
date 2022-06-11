-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Madaline
-- Standard Info NPC
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local telmoda_Madaline = player:getCharVar("Telmoda_Madaline_Event")
    if (telmoda_Madaline ~= 1) then
        player:setCharVar("Telmoda_Madaline_Event", 1)
        player:startEvent(531)
    else
        player:startEvent(617)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
