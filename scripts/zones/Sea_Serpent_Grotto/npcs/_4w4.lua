-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: Gold Beastcoin Door
-- !pos 60 8.55 -80 176
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, 748) then
        if player:getCharVar("SSG_GoldDoor") == 7 then
            npc:openDoor(5) -- Open the door if a gold beastcoin has been traded after checking the door the required number of times
        end
    end
end

entity.onTrigger = function(player, npc)
    local xPos = player:getXPos()
    local zPos = player:getZPos()
    local goldDoorCheck = player:getCharVar("SSG_GoldDoor")

    if xPos >= 55 and zPos >= -80 then
        if goldDoorCheck == 0 then -- Door has never been checked
            player:messageSpecial(ID.text.FIRST_CHECK)
            player:setCharVar("SSG_GoldDoor", 1)
        elseif goldDoorCheck == 1 then -- Door has been checked once
            player:messageSpecial(ID.text.SECOND_CHECK)
            player:setCharVar("SSG_GoldDoor", 2)
        elseif goldDoorCheck == 2 then -- Door has been checked twice
            player:messageSpecial(ID.text.THIRD_CHECK)
            player:setCharVar("SSG_GoldDoor", 3)
        elseif goldDoorCheck == 3 then -- Door has been checked three times
            player:messageSpecial(ID.text.FOURTH_CHECK)
            player:setCharVar("SSG_GoldDoor", 4)
        elseif goldDoorCheck == 4 then -- Door has been checked four times
            player:messageSpecial(ID.text.FIFTH_CHECK)
            player:setCharVar("SSG_GoldDoor", 5)
        elseif goldDoorCheck == 5 then -- Door has been checked five times
            player:messageSpecial(ID.text.GOLD_CHECK)
            player:setCharVar("SSG_GoldDoor", 6)
        elseif goldDoorCheck == 6 or goldDoorCheck == 7 then -- Door has been checked six or more times
            player:messageSpecial(ID.text.COMPLETED_CHECK, 748)
            player:setCharVar("SSG_GoldDoor", 7)
        end
    elseif xPos > 55 and zPos < -81 then
        return -1 -- Open the door if coming from the "inside"
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
