-----------------------------------
-- Area: Nashmau
--  NPC: Dnegan
-- Standard Info NPC
-- Involved in quest: Wayward Automation
-- !pos 29.89 -6 55.83 53
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local TheWaywardAutomation = player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATON)
    local TheWaywardAutomationProgress = player:getCharVar("TheWaywardAutomationProgress")
    local OperationTeatimeProgress = player:getCharVar("OperationTeatimeProgress")
    local OTT_DayWait = player:getCharVar("OTT_DayWait")
    local Gameday = VanadielDayOfTheYear()

    -- Quest: The WayWard Automation
    if (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 1) then
        player:startEvent(289) -- he tells u to go Caedarva Mire
    elseif (TheWaywardAutomationProgress == 2) then
        player:startEvent(289) -- Hint to go to Caedarva Mire

    -- Quest: Operation Teatime
    elseif (OperationTeatimeProgress == 2 and OTT_DayWait ~= Gameday) then
        player:startEvent(290) -- CS for Chai
    else
        player:startEvent(288)
    end
end


entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 289) then
        player:setCharVar("TheWaywardAutomationProgress", 2)
    elseif (csid == 290 and option == 0) then
        player:setCharVar("OTT_DayWait", VanadielDayOfTheYear())
    elseif (csid == 290 and option == 1) then
        player:setCharVar("OperationTeatimeProgress", 3)
        player:setCharVar("OTT_DayWait", 0)
    end
end

return entity
