-----------------------------------
-- Area: Port Bastok
--  NPC: Evi
-- Starts Quests: Past Perfect (100%)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local pastPerfect = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.PAST_PERFECT)

    if (pastPerfect == QUEST_ACCEPTED and player:hasKeyItem(xi.ki.TATTERED_MISSION_ORDERS)) then
        player:startEvent(131)
    elseif (player:getFameLevel(xi.quest.fame_area.BASTOK) >= 2 and player:getCharVar("PastPerfectVar") == 2) then
        player:startEvent(130)
    elseif (pastPerfect == QUEST_AVAILABLE) then
        player:startEvent(104)
    else
        player:startEvent(21)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 104 and player:getCharVar("PastPerfectVar") == 0) then
        player:setCharVar("PastPerfectVar", 1)
    elseif (csid == 130) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.PAST_PERFECT)
    elseif (csid == 131) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12560)
        else
            if (player:addItem(12560)) then
                player:delKeyItem(xi.ki.TATTERED_MISSION_ORDERS)
                player:setCharVar("PastPerfectVar", 0)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 12560)
                player:addFame(xi.quest.fame_area.BASTOK, 110)
                player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.PAST_PERFECT)
            end
        end
    end
end

return entity
