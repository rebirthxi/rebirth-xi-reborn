-----------------------------------
-- Area: Mhaura
--  NPC: Orlando
-- Type: Standard NPC
-- !pos -37.268 -9 58.047 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/keyitems")
require("scripts/settings/main")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    local itemID = trade:getItemId()
    local itemList =
    {
        {564, 200},   -- Fingernail Sack
        {565, 250},   -- Teeth Sack
        {566, 200},   -- Goblin Cup
        {568, 120},   -- Goblin Die
        {656, 600},   -- Beastcoin
        {748, 900},   -- Gold Beastcoin
        {749, 800},   -- Mythril Beastcoin
        {750, 750},   -- Silver Beastcoin
        {898, 120},   -- Chicken Bone
        {900, 100},   -- Fish Bone
        {16995, 150}, -- Rotten Meat
    }

    for x, item in pairs(itemList) do
        if (questStatus == QUEST_ACCEPTED) or (player:getLocalVar("OrlandoRepeat") == 1) then
            if (item[1] == itemID) then
                if (trade:hasItemQty(itemID, 8) and trade:getItemCount() == 8) then
                    -- Correct amount, valid item.
                    player:setCharVar("ANTIQUE_PAYOUT", (xi.settings.GIL_RATE * item[2]))
                    player:startEvent(102, xi.settings.GIL_RATE * item[2], itemID)
                elseif (trade:getItemCount() < 8) then
                    -- Wrong amount, but valid item.
                    player:startEvent(104)
                end
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)

    if (player:getFameLevel(xi.quest.fame_area.WINDURST) >= 2) then
        if (player:hasKeyItem(xi.ki.CHOCOBO_LICENSE)) then
            if (questStatus ~= QUEST_AVAILABLE) then
                player:startEvent(103)
            elseif (questStatus == QUEST_AVAILABLE) then
                player:startEvent(101)
            end
        else
            player:startEvent(100)
        end
    else
        player:startEvent(106)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local questStatus = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    local payout = player:getCharVar("ANTIQUE_PAYOUT")

    if (csid == 101) then
        player:addQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
    elseif (csid == 102) then
        player:tradeComplete()
        player:addFame(xi.quest.fame_area.WINDURST, 10)
        player:addGil(payout)
        player:messageSpecial(ID.text.GIL_OBTAINED, payout)
        player:completeQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ORLANDO_S_ANTIQUES)
        player:setCharVar("ANTIQUE_PAYOUT", 0)
        player:setLocalVar("OrlandoRepeat", 0)
    elseif (csid == 103) then
        if (questStatus == QUEST_COMPLETED) then
            player:setLocalVar("OrlandoRepeat", 1)
        end
    end
end

return entity
