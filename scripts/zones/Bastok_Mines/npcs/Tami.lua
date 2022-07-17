-----------------------------------
-- Area: Bastok Mines
--  NPC: Tami
-- Involved In Quest: Groceries
-- !pos 62.617 0.000 -68.222 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- GROCERIES (trade meat jerky)
    if
        player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GROCERIES) == QUEST_ACCEPTED and
        player:getCharVar("Groceries") == 3 and
        trade:getItemCount() == 1 and
        trade:hasItemQty(4376, 1)
    then
        player:startEvent(113)
    end
end

entity.onTrigger = function(player, npc)
    local groceries = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GROCERIES)
    local groceriesProgress = player:getCharVar("Groceries")

    -- GROCERIES
    if
        groceries == QUEST_AVAILABLE or
        (groceries == QUEST_ACCEPTED and groceriesProgress == 0)
    then
        player:startEvent(110)

    elseif
        groceries == QUEST_ACCEPTED and
        groceriesProgress == 1
    then
        player:showText(npc, ID.text.TAMI_MY_HUSBAND)

    elseif
        groceries == QUEST_ACCEPTED and
        groceriesProgress == 2
    then
        player:startEvent(112)

    elseif
        groceries == QUEST_ACCEPTED and
        groceriesProgress == 3
    then
        player:startEvent(111)

    -- DEFAULT DIALOG
    else
        player:startEvent(115)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- GROCERIES
    if csid == 110 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GROCERIES)
        player:addKeyItem(xi.ki.TAMIS_NOTE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TAMIS_NOTE)
        player:setCharVar("Groceries", 1)
    elseif csid == 112 then
        player:addFame(xi.quest.fame_area.BASTOK, 8)
        player:setCharVar("Groceries", 0)
        player:addGil(xi.settings.main.GIL_RATE * 10)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * 10)
    elseif csid == 113 then
        if player:getFreeSlotsCount() >= 1 then
            player:tradeComplete()
            player:setCharVar("Groceries", 0)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GROCERIES)
            player:addFame(xi.quest.fame_area.BASTOK, 75)
            player:addItem(13594) -- Rabbit Mantle
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13594)
        else
            player:messageSpecial(ID.text.FULL_INVENTORY_AFTER_TRADE, 13594)
        end
    end
end

return entity
