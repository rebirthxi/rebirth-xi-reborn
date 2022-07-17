-----------------------------------
-- Area: Port Bastok
--  NPC: Jabbar
-- Type: Tenshodo Merchant
-- Involved in Quests: Tenshodo Menbership
-- !pos -99.718 -2.299 26.027 236
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/shop")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD)) then
        if (player:sendGuild(60419, 1, 23, 4)) then
            player:showText(npc, ID.text.TENSHODO_SHOP_OPEN_DIALOG)
        end
    elseif (player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.TENSHODO_MEMBERSHIP) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(xi.ki.TENSHODO_APPLICATION_FORM)) then
            player:startEvent(152)
        else
            player:startEvent(151)
        end
    else
        player:startEvent(150)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 151) then
        player:addKeyItem(xi.ki.TENSHODO_APPLICATION_FORM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TENSHODO_APPLICATION_FORM)
    end
end

return entity
