-----------------------------------
-- Area: Port Bastok
--  NPC: Paujean
-- Starts & Finishes Quest: Silence of the Rams
-- !pos -93.738 4.649 34.373 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local silenceOfTheRams = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SILENCE_OF_THE_RAMS)

    if (silenceOfTheRams == QUEST_ACCEPTED) then
        local count = trade:getItemCount()
        local lumberingHorn = trade:hasItemQty(910, 1)
        local rampagingHorn = trade:hasItemQty(911, 1)

        if (lumberingHorn == true and rampagingHorn == true and count == 2) then
            player:startEvent(196)
        end
    end
end

entity.onTrigger = function(player, npc)
    local silenceOfTheRams = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SILENCE_OF_THE_RAMS)
    local wildcatBastok = player:getCharVar("WildcatBastok")

    if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(wildcatBastok, 2)) then
        player:startEvent(355)
    elseif (silenceOfTheRams == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.NORG) >= 2) then
        player:startEvent(195)
    elseif (silenceOfTheRams == QUEST_ACCEPTED) then
        player:showText(npc, ID.text.PAUJEAN_DIALOG_1)
    else
        player:startEvent(25)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 195) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SILENCE_OF_THE_RAMS)
    elseif (csid == 196) then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SILENCE_OF_THE_RAMS)
        player:addFame(3, 125)
        player:addItem(13201)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 13201)
        player:addTitle(xi.title.PURPLE_BELT)
    elseif (csid == 355) then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 2, true))
    end
end

return entity
