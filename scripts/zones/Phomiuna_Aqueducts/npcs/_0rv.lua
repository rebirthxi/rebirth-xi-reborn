-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: Oil Lamp - South (West)
-- Opens Door at F-9 from inside.
-- !pos -63 -26 37
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local DoorOffset = npc:getID() - 1

    if (GetNPCByID(DoorOffset):getAnimation() == 9) then
        if (player:getZPos() > 35) then
            npc:openDoor(7) -- lamp animation
            GetNPCByID(DoorOffset):openDoor(7) -- _0rg
        end
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
