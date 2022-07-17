-----------------------------------
-- Area: Bastok Markets
--  NPC: Nbu Latteh
-- Starts & Finishes Quest: Mom, The Adventurer?
-- Starts Quest: The Signpost Marks the Spot
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
require("scripts/globals/quests")
local ID = require("scripts/zones/Bastok_Markets/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local pFame = player:getFameLevel(xi.quest.fame_area.BASTOK)
    local momTheAdventurer = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER)
    local questStatus = player:getCharVar("MomTheAdventurer_Event")

    if (player:needToZone()) then
        player:startEvent(127) -- chat about my work
    elseif (pFame < 2 and momTheAdventurer ~= QUEST_ACCEPTED and questStatus == 0) then
        player:startEvent(230)
    elseif (momTheAdventurer >= QUEST_ACCEPTED and questStatus == 2) then
        if (player:seenKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)) then
            player:startEvent(234)
        elseif (player:hasKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)) then
            player:startEvent(233)
        else
            player:startEvent(231)
        end
    elseif (pFame >= 2 and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_SIGNPOST_MARKS_THE_SPOT) == QUEST_AVAILABLE) then
        player:startEvent(235)
    else
        player:startEvent(127)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 230 and option == 0) then
        if (player:getFreeSlotsCount(0) > 0) then
            player:setCharVar("MomTheAdventurer_Event", 1)
            player:addItem(4096)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4096) -- Fire Crystal
            if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER) == QUEST_AVAILABLE) then
                player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER)
            end
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 4096)
        end
    elseif csid == 233 or csid == 234 then
        local gilReward = 200
        if player:seenKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH) then
            gilReward = 100
        end
        player:needToZone(true)
        player:delKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)
        player:addTitle(xi.title.RINGBEARER)
        player:addGil(xi.settings.main.GIL_RATE * gilReward)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * gilReward)
        player:setCharVar("MomTheAdventurer_Event", 0)

        if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER) == QUEST_ACCEPTED) then
            player:addFame(xi.quest.fame_area.BASTOK, 20)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER)
        else
            player:addFame(xi.quest.fame_area.BASTOK, 8)
        end
    elseif (csid == 235 and option == 0) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_SIGNPOST_MARKS_THE_SPOT)
        player:setCharVar("MomTheAdventurer_Event", 0)
    end

end

return entity
