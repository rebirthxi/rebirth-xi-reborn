-----------------------------------
-- Area: Upper Jeuno
--  NPC: Galmut's door
-- Starts and Finishes Quest: A Clock Most Delicate, Save the Clock Tower, The Clockmaster
-- !pos -80 0 104 244
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local aClockMostdelicate = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)

    if
        aClockMostdelicate == QUEST_AVAILABLE and
        player:getCharVar("aClockMostdelicateVar") == 1
    then
        player:startEvent(119) -- Start long cs quest with option "a clock most delicate"

    elseif
        aClockMostdelicate == QUEST_AVAILABLE and
        player:getCharVar("aClockMostdelicateVar") == 2
    then
        player:startEvent(118) -- Start short cs quest with option "a clock most delicate"

    elseif aClockMostdelicate == QUEST_ACCEPTED then
        if player:hasKeyItem(xi.ki.CLOCK_TOWER_OIL) == true then
            player:startEvent(202) -- Ending quest "a clock most delicate"
        else
            player:startEvent(117) -- During quest "a clock most delicate"
        end

    elseif
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_THE_CLOCK_TOWER) == QUEST_COMPLETED and
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER) == QUEST_AVAILABLE
    then
        player:startEvent(152) -- Start & finish quest "The Clockmaster"

    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER) == QUEST_COMPLETED then
        player:startEvent(110) -- After quest "The Clockmaster"

    else
        player:startEvent(116) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 118 and option == 1 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
        player:setCharVar("aClockMostdelicateVar", 0)

    elseif csid == 119 then
        if option == 0 then
            player:setCharVar("aClockMostdelicateVar", 2)
        elseif option == 1 then
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
            player:setCharVar("aClockMostdelicateVar", 0)
        end

    elseif csid == 152 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17083)
        else
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER)
            player:addTitle(xi.title.TIMEKEEPER)
            player:addGil(1200)
            player:messageSpecial(ID.text.GIL_OBTAINED, 1200)
            player:addItem(17083)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17083)
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER)
        end

    elseif csid == 202 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12727)
        else
            player:addTitle(xi.title.PROFESSIONAL_LOAFER)
            player:delKeyItem(xi.ki.CLOCK_TOWER_OIL)
            player:addGil(1200)
            player:messageSpecial(ID.text.GIL_OBTAINED, 1200)
            player:addItem(12727)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12727)
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_THE_CLOCK_TOWER) -- Start next quest "Save the Clock Tower"
        end
    end
end

return entity
