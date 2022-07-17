-----------------------------------
-- Area: Port Bastok
--  NPC: Kaede
-- Start Quest: Ayame and Kaede
-- Involved in Quests: Riding on the Clouds
-- !pos 48 -6 67 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local ayameKaede = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.AYAME_AND_KAEDE)
    local wildcatBastok = player:getCharVar("WildcatBastok")

    if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(wildcatBastok, 0) then
        player:startEvent(352)
    elseif ayameKaede == QUEST_AVAILABLE and player:getMainLvl() >= 30 then
        player:startEvent(240)
    elseif ayameKaede == QUEST_ACCEPTED then
        player:startEvent(26)
    elseif ayameKaede == QUEST_COMPLETED then
        player:startEvent(248)
    else
        player:startEvent(26)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 240 then
        if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.AYAME_AND_KAEDE) == QUEST_AVAILABLE then
            player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.AYAME_AND_KAEDE)
        end
    elseif csid == 352 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 0, true))
    end
end

return entity
