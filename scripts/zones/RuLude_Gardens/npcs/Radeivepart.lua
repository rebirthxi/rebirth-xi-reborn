-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Radeivepart
-- Starts and Finishes Quest: Northward
-- Involved in Quests: Save the Clock Tower
-- !pos 5 9 -39 243
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:hasItemQty(555, 1) == true and
        trade:getGil() == 0 and
        trade:getItemCount() == 1
    then
        local a = player:getCharVar("saveTheClockTowerNPCz1") -- NPC Zone1
        if
            a == 0 or
            (
                a ~= 1 and
                a ~= 3 and
                a ~= 5 and
                a ~= 7 and
                a ~= 9 and
                a ~= 11 and
                a ~= 13 and
                a ~= 15 and
                a ~= 17 and
                a ~= 19 and
                a ~= 21 and
                a ~= 23 and
                a ~= 25 and
                a ~= 27 and
                a ~= 29 and
                a ~= 31
            )
        then
            player:startEvent(160, 10 - player:getCharVar("saveTheClockTowerVar")) -- "Save the Clock Tower" Quest
        end

    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD) == QUEST_ACCEPTED then
        if
            trade:hasItemQty(16522, 1) == true and
            trade:getGil() == 0 and
            trade:getItemCount() == 1
        then
            player:startEvent(61) -- Finish quest "Northward"
        end
    end
end

entity.onTrigger = function(player, npc)
    local northward = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)

    if player:getFameLevel(xi.quest.fame_area.JEUNO) >= 4 and northward == QUEST_AVAILABLE then
        player:startEvent(159, 1, 0, 0, 0, 0, 0, 8)
    elseif northward == QUEST_ACCEPTED then
        player:startEvent(159, 2, 0, 0, 0, 0, 0, 8)
    elseif northward == QUEST_COMPLETED then
        player:startEvent(159, 3, 0, 0, 0, 0, 0, 8)
    else
        -- Standard dialogue
        player:startEvent(159)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 160 then
        player:incrementCharVar("saveTheClockTowerVar", 1)
        player:incrementCharVar("saveTheClockTowerNPCz1", 1)
    elseif csid == 159 and option == 1 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)
    elseif csid == 61 then
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)
        player:addTitle(xi.title.ENVOY_TO_THE_NORTH)
        if (player:hasKeyItem(xi.ki.MAP_OF_CASTLE_ZVAHL) == false) then
            player:addKeyItem(xi.ki.MAP_OF_CASTLE_ZVAHL)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MAP_OF_CASTLE_ZVAHL)
        end
        player:addFame(xi.quest.fame_area.JEUNO, 30)
        player:tradeComplete()
    end
end

return entity
