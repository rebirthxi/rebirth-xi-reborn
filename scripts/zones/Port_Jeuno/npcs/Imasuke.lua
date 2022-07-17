-----------------------------------
-- Area: Port Jeuno
--  NPC: Imasuke
-- Starts and Finishes Quest: The Antique Collector
-- !pos -165 11 94 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- THE ANTIQUE COLLECTOR (kaiser sword)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ANTIQUE_COLLECTOR) == QUEST_ACCEPTED and
        trade:hasItemQty(16631, 1) and
        trade:getItemCount() == 1
    then
        player:startEvent(15) -- End quest
    end
end

entity.onTrigger = function(player, npc)
    local circleOfTime        = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CIRCLE_OF_TIME)
    local theAntiqueCollector = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ANTIQUE_COLLECTOR)
    local circleProgress      = player:getCharVar("circleTime")

    -- CIRCLE OF TIME
    if circleOfTime == QUEST_ACCEPTED then
        if circleProgress == 1 then
            player:startEvent(30)
        elseif circleProgress == 2 then
            player:startEvent(29)
        elseif circleProgress == 3 then
            player:startEvent(32)
        elseif circleProgress == 4 then
            player:startEvent(33)
        elseif circleProgress == 5 then
            player:startEvent(31)
        end

    -- THE ANTIQUE COLLECTOR
    elseif
        theAntiqueCollector == QUEST_AVAILABLE and
        player:getFameLevel(xi.quest.fame_area.JEUNO) >= 3
    then
        player:startEvent(13) -- Start quest

    elseif theAntiqueCollector == QUEST_ACCEPTED then
        player:startEvent(14) -- Mid CS

    -- DEFAULT DIALOG
    else
        player:startEvent(12)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- THE ANTIQUE COLLECTOR
    if csid == 13 and option == 1 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ANTIQUE_COLLECTOR)
    elseif csid == 15 then
        player:addTitle(xi.title.TRADER_OF_ANTIQUITIES)
        if not player:hasKeyItem(xi.ki.MAP_OF_DELKFUTTS_TOWER) then
            player:addKeyItem(xi.ki.MAP_OF_DELKFUTTS_TOWER)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MAP_OF_DELKFUTTS_TOWER)
        else
            player:addGil(2000 * xi.settings.main.GIL_RATE)
            player:messageSpecial(ID.text.GIL_OBTAINED, 2000 * xi.settings.main.GIL_RATE)
            player:addExp(2000 * xi.settings.main.EXP_RATE)
        end
        player:addFame(xi.quest.fame_area.JEUNO, 30)
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ANTIQUE_COLLECTOR)

    -- CIRCLE OF TIME
    elseif csid == 29 and option == 1 then
        player:setCharVar("circleTime", 3)
    elseif csid == 30 and option == 1 then
        player:setCharVar("circleTime", 3)
    elseif csid == 30 and option == 0 then
        player:setCharVar("circleTime", 2)
    elseif csid == 33 then
        player:setCharVar("circleTime", 5)
    end
end

return entity
