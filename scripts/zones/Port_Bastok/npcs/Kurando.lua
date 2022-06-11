-----------------------------------
-- Area: Port Bastok
--  NPC: Kurando
-- Type: Quest Giver
-- !pos -23.887 3.898 0.870 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FEAR_OF_FLYING) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4526, 1) and trade:getItemCount() == 1) then
            player:startEvent(171) -- Quest Completion Dialogue
        end
    end
end

entity.onTrigger = function(player, npc)
    local fearofFlying = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FEAR_OF_FLYING)
    -- csid 173 ?
    if (fearofFlying == QUEST_AVAILABLE and    player:getFameLevel(xi.quest.fame_area.BASTOK) >=3) then
        player:startEvent(170) -- Quest Start Dialogue
    elseif (fearofFlying == QUEST_COMPLETED) then
        player:startEvent(172) -- Dialogue after Completion
    else
        player:startEvent(28) -- Default Dialogue

    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 170) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FEAR_OF_FLYING)
    elseif (csid == 171) then
        if    (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 13113)
        else
            player:tradeComplete()
            player:addItem(13113, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13113)
            player:setTitle(xi.title.AIRSHIP_DENOUNCER)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FEAR_OF_FLYING)
            player:addFame(xi.quest.fame_area.BASTOK, 30)
        end
    end
end

return entity
