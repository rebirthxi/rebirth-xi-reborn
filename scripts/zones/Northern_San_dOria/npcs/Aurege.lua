-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aurege
-- Type: Quest Giver NPC
-- Starts Quest: Exit the Gambler
-- !pos -156.253 11.999 253.691 231
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local exitTheGambler = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER)
    local exitTheGamblerStat = player:getCharVar("exitTheGamblerStat")

    if exitTheGambler < QUEST_COMPLETED and exitTheGamblerStat == 0 then
        player:startEvent(521)
    elseif exitTheGambler == QUEST_ACCEPTED and exitTheGamblerStat == 1 then
        player:startEvent(516)
    else
        player:startEvent(514)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 521 and player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER) == QUEST_AVAILABLE then
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER)
    elseif csid == 516 then
        npcUtil.completeQuest(player, xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.EXIT_THE_GAMBLER, {ki = xi.ki.MAP_OF_KING_RANPERRES_TOMB, title = xi.title.DAYBREAK_GAMBLER, xp = 2000})
    end
end

return entity
