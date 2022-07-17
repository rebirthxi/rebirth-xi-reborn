-----------------------------------
-- Area: Kazham
--  NPC: Dodmos
--  Starts Quest: Trial Size Trial By Fire
-- !pos 102.647 -14.999 -97.664 250
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/quests")
require("scripts/globals/teleports")
local ID = require("scripts/zones/Kazham/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (trade:hasItemQty(1544, 1) == true and player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE) == QUEST_ACCEPTED  and player:getMainJob() == xi.job.SMN) then
        player:startEvent(287, 0, 1544, 0, 20)
    end
end

entity.onTrigger = function(player, npc)
    local trialSizeFire = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE)

    if (player:getMainLvl() >= 20 and player:getMainJob() == xi.job.SMN and trialSizeFire == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.WINDURST) >= 2) then --Requires player to be Summoner at least lvl 20
        player:startEvent(286, 0, 1544, 0, 20)     --mini tuning fork, zone, level
    elseif (trialSizeFire == QUEST_ACCEPTED) then
        local fireFork = player:hasItem(1544)

        if (fireFork == true) then
            player:startEvent(272) --Dialogue given to remind player to be prepared
        else
            player:startEvent(290, 0, 1544, 0, 20) --Need another mini tuning fork
        end
    elseif (trialSizeFire == QUEST_COMPLETED) then
        player:startEvent(289) --Defeated Avatar
    else
        player:startEvent(275) --Standard dialogue
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 286 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1544) --Mini tuning fork
        else
            player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE)
            player:addItem(1544)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1544)
        end
    elseif (csid == 290 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1544) --Mini tuning fork
        else
            player:addItem(1544)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1544)
        end
    elseif (csid == 287 and option == 1) then
        xi.teleport.to(player, xi.teleport.id.CLOISTER_OF_FLAMES)
    end
end

return entity
