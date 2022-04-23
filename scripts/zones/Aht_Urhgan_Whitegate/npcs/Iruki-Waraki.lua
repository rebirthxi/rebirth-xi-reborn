-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Iruki-Waraki
-- Type: Standard NPC
--  Involved in quest: No Strings Attached
-- !pos 101.329 -6.999 -29.042 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/settings/main")
require("scripts/globals/items")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/pets")
-----------------------------------
local entity = {}


entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, {xi.items.FLASK_OF_SLEEPING_POTION, xi.items.CUP_OF_CHAI}) and player:getCharVar("OperationTeatimeProgress") == 1 then -- Chai, Sleeping Potion
        player:startEvent(780)
    end
end

entity.onTrigger = function(player, npc)
    local NoStringsAttached = player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
    local TheWaywardAutomation = player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION)
    local TheWaywardAutomationProgress = player:getCharVar("TheWaywardAutomationProgress")
    local OperationTeatime = player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.OPERATION_TEATIME)
    local OperationTeatimeProgress = player:getCharVar("OperationTeatimeProgress")
    local LvL = player:getMainLvl()
    local Job = player:getMainJob()

    --Quest: The Wayward Automation
    if Job == xi.job.PUP and LvL >= xi.settings.AF1_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED and TheWaywardAutomation == QUEST_AVAILABLE then
        player:startEvent(774) -- he tells you to help find his auto
    elseif TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 1 then
        player:startEvent(775) -- reminder about to head to Nashmau
    elseif TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 3 then
        player:startEvent(776) -- tell him you found automation
    elseif Job == xi.job.PUP and LvL < xi.settings.AF2_QUEST_LEVEL and TheWaywardAutomation == QUEST_COMPLETED then
        player:startEvent(777)
    elseif Job ~= xi.job.PUP and TheWaywardAutomation == QUEST_COMPLETED then
        player:startEvent(777)
    elseif Job ~= xi.job.PUP and NoStringsAttached == QUEST_COMPLETED then
        player:startEvent(267) -- asking you how are you doing with your automaton

    --Quest: Operation teatime
    elseif Job == xi.job.PUP and LvL >= xi.settings.AF2_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED and TheWaywardAutomation == QUEST_COMPLETED and OperationTeatime == QUEST_AVAILABLE then
        player:startEvent(778)
    elseif OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 1 then
        player:startEvent(779) -- Reminds you to get items
    elseif OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 2 then
        player:startEvent(781) -- Reminds you to get items
    elseif OperationTeatime == QUEST_COMPLETED then
        player:startEvent(777)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 774 then
        player:setCharVar("TheWaywardAutomationProgress", 1)
        player:addQuest(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION)
    elseif csid == 776 then
        npcUtil.completeQuest(player, xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION, {item=xi.items.TURBO_ANIMATOR, var="TheWaywardAutomationProgress"})
    elseif csid == 778 then
        player:setCharVar("OperationTeatimeProgress", 1)
        player:addQuest(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.OPERATION_TEATIME)
    elseif csid == 780 then
        player:setCharVar("OperationTeatimeProgress", 2)
        player:confirmTrade()
    end
end

return entity
