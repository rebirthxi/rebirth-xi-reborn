-----------------------------------
-- Area: Port Bastok
--  NPC: Hilda
-- Involved in Quest: Cid's Secret, Riding on the Clouds
-- Starts & Finishes: The Usual
-- !pos -163 -8 13 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if trade:getGil() == 0 and trade:getItemCount() == 1 then
        if trade:hasItemQty(4530, 1) and player:getCharVar("CidsSecret_Event") == 1 and player:hasKeyItem(xi.ki.UNFINISHED_LETTER) == false then -- Trade Rollanberry
            player:startEvent(133)
        elseif trade:hasItemQty(4386, 1) and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL) == QUEST_ACCEPTED then -- Trade King Truffle
            player:startEvent(135)
        end
    end
end

entity.onTrigger = function(player, npc)
    local wildcatBastok = player:getCharVar("WildcatBastok")

    if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(wildcatBastok, 3) then
        player:startEvent(356)
    elseif player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL) ~= QUEST_COMPLETED then
        if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.CID_S_SECRET) == QUEST_ACCEPTED then
            player:startEvent(132)
            if player:getCharVar("CidsSecret_Event") ~= 1 then
                player:setCharVar("CidsSecret_Event", 1)
            end
        elseif player:getFameLevel(xi.quest.fame_area.BASTOK) >= 5 and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.CID_S_SECRET) == QUEST_COMPLETED then
            if player:getCharVar("TheUsual_Event") == 1 then
                player:startEvent(136)
            elseif (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL) == QUEST_ACCEPTED) then
                player:startEvent(49) --Hilda thanks the player for all the help; there is no reminder dialogue for this quest
            else
                player:startEvent(134)
            end
        else
            player:startEvent(48) --Standard dialogue if fame isn't high enough to start The Usual and Cid's Secret is not active
        end
    elseif player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL) == QUEST_COMPLETED and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.CID_S_SECRET) == QUEST_COMPLETED then
        player:startEvent(49) --Hilda thanks the player for all the help
    else
        player:startEvent(48) --Standard dialogue if no quests are active or available
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 133 then
        player:tradeComplete()
        player:addKeyItem(xi.ki.UNFINISHED_LETTER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.UNFINISHED_LETTER)
    elseif csid == 134 and option == 0 then
        if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL) == QUEST_AVAILABLE then
            player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL)
        end
    elseif csid == 135 then
        player:tradeComplete()
        player:addKeyItem(xi.ki.STEAMING_SHEEP_INVITATION)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.STEAMING_SHEEP_INVITATION)
    elseif csid == 136 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17170)
        else
            player:addTitle(xi.title.STEAMING_SHEEP_REGULAR)
            player:delKeyItem(xi.ki.STEAMING_SHEEP_INVITATION)
            player:setCharVar("TheUsual_Event", 0)
            player:addItem(17170)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17170) -- Speed Bow
            player:addFame(xi.quest.fame_area.BASTOK, 30)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_USUAL)
        end
    elseif csid == 356 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 3, true))
    end
end

return entity
