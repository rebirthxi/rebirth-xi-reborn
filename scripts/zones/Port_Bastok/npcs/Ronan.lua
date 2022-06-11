-----------------------------------
-- Area: Port Bastok
--  NPC: Ronan
-- Start & Finishes Quest: Out of One's Shell
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/titles")
require("scripts/globals/quests")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.OUT_OF_ONE_S_SHELL) == QUEST_ACCEPTED and player:getCharVar("OutOfOneShell") == 0 then
        if trade:hasItemQty(17397, 3) and trade:getItemCount() == 3 then
            player:startEvent(84)
        end
    end
end

entity.onTrigger = function(player, npc)
    local outOfOneShell = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.OUT_OF_ONE_S_SHELL)

    if outOfOneShell == QUEST_ACCEPTED and player:getCharVar("OutOfOneShell") == 1 then
        if player:needToZone() then
            player:startEvent(85)
        else
            player:startEvent(86)
        end
    elseif outOfOneShell == QUEST_ACCEPTED then
        player:showText(npc, ID.text.RONAN_DIALOG_1)
    elseif outOfOneShell == QUEST_COMPLETED then
        player:startEvent(89)
    elseif player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_QUADAV_S_CURSE) == QUEST_COMPLETED and player:getFameLevel(xi.quest.fame_area.BASTOK) >= 2 then
        player:startEvent(82)
    else
        player:startEvent(37)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 82 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.OUT_OF_ONE_S_SHELL)
    elseif csid == 84 then
        player:needToZone(true)
        player:setCharVar("OutOfOneShell", 1)
        player:tradeComplete()
    elseif csid == 86 then
        if (player:getFreeSlotsCount() >= 1) then
            player:addTitle(xi.title.SHELL_OUTER)
            player:setCharVar("OutOfOneShell", 0)
            player:addItem(12501)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12501)
            player:addFame(xi.quest.fame_area.BASTOK, 120)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.OUT_OF_ONE_S_SHELL)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12501)
        end
    end
end

return entity
