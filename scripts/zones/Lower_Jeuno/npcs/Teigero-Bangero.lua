-----------------------------------
-- Area: Lower Jeuno
--  NPC: Teigero Bangero
-- Involved in Quests: Save the Clock Tower, The Lost Cardian
-- !pos -58 0 -143 245
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:hasItemQty(555, 1) == true and
        trade:getItemCount() == 1
    then
        local a = player:getCharVar("saveTheClockTowerNPCz2") -- NPC Zone2
        if
            a == 0 or
            (
                a ~= 128 and
                a ~= 160 and
                a ~= 192 and
                a ~= 384 and
                a ~= 640 and
                a ~= 224 and
                a ~= 896 and
                a ~= 416 and
                a ~= 704 and
                a ~= 448 and
                a ~= 672 and
                a ~= 480 and
                a ~= 736 and
                a ~= 928 and
                a ~= 960 and
                a ~= 992
            )
        then
            player:startEvent(74, 10 - player:getCharVar("saveTheClockTowerVar")) -- "Save the Clock Tower" Quest
        end
    end
end

entity.onTrigger = function(player, npc)
    local theKindCardian = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_KIND_CARDIAN)

    if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_WONDER_MAGIC_SET) == QUEST_AVAILABLE then
        player:startEvent(34) -- Base Standard CS & dialog
    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.COOK_S_PRIDE) ~= QUEST_COMPLETED then
        local rand = math.random(1, 2)
        if rand == 1 then
            player:startEvent(75) -- During Panta and Naruru Quests
        else
            player:startEvent(32) -- Same...
        end
    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_LOST_CARDIAN) == QUEST_AVAILABLE then
        if player:getCharVar("theLostCardianVar") == 0 then
            player:startEvent(29) -- First dialog for "The lost cardien" quest
        else
            player:startEvent(66)
        end
    elseif theKindCardian == QUEST_ACCEPTED then
        player:startEvent(66) -- During quest "The kind cardien"
    elseif theKindCardian == QUEST_COMPLETED then
        player:startEvent(67) -- New standard dialog after "The kind cardien"
    else
        player:startEvent(34) -- Base Standard CS & dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 74 then
        player:addCharVar("saveTheClockTowerVar", 1)
        player:addCharVar("saveTheClockTowerNPCz2", 128)
    elseif csid == 29 then
        player:setCharVar("theLostCardianVar", 1)
    end
end

return entity
