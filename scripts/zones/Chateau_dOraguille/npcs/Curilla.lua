-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit,
--                            Lure of the Wildcat (San d'Oria), Old Wounds
-- !pos 27 0.1 0.1 233
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

local sandyQuests = xi.quest.id.sandoria

local trustMemory = function(player)
    local memories = 0
    -- 2 - PEACE_FOR_THE_SPIRIT
    if player:hasCompletedQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.PEACE_FOR_THE_SPIRIT) then
        memories = memories + 2
    end
    -- 4 - OLD_WOUNDS
    if player:hasCompletedQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.OLD_WOUNDS) then
        memories = memories + 4
    end
    -- 8 - THE_HEIR_TO_THE_LIGHT
    if player:hasCompletedMission(xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT) then
        memories = memories + 8
    end
    -- 16 - Heroine's Combat BCNM
    -- if (playervar for Heroine's Combat) then
    --  memories = memories + 16
    -- end
    -- 32 - FIT_FOR_A_PRINCE
    if player:hasCompletedQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.FIT_FOR_A_PRINCE) then
        memories = memories + 32
    end
    return memories
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local mLvl = player:getMainLvl()
    local mJob = player:getMainJob()
    local envelopedInDarkness = player:getQuestStatus(xi.quest.log_id.SANDORIA, sandyQuests.ENVELOPED_IN_DARKNESS)
    local peaceForTheSpirit = player:getQuestStatus(xi.quest.log_id.SANDORIA, sandyQuests.PEACE_FOR_THE_SPIRIT)
    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0

    -- Trust: San d'Oria (Curilla)
    if
        player:hasKeyItem(xi.ki.SAN_DORIA_TRUST_PERMIT) and
        not player:hasSpell(xi.magic.spell.CURILLA) and
        player:getLocalVar("TrustDialogue") == 0
    then
        player:setLocalVar("TrustDialogue", 1)
        player:startEvent(573, 0, 0, 0, trustMemory(player), 0, 0, 0, rank3)

    -- "Lure of the Wildcat"
    elseif
        player:getQuestStatus(xi.quest.log_id.SANDORIA, sandyQuests.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(player:getCharVar("WildcatSandy"), 15)
    then
        player:startEvent(562)

    -- "Peace for the Spirit" (RDM AF Body)
    elseif peaceForTheSpirit == QUEST_ACCEPTED then
        local questStatus = player:getCharVar("peaceForTheSpiritCS")
        if questStatus == 5 then
            player:startEvent(51)
        elseif questStatus > 1 then
            player:startEvent(113)
        else
            player:startEvent(108)
        end
    elseif
        mJob == xi.job.RDM and mLvl >= xi.settings.main.AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and
        peaceForTheSpirit == QUEST_AVAILABLE
    then
        player:startEvent(109) -- Start

    -- "Enveloped in Darkness" (RDM AF Shoes)
    elseif envelopedInDarkness == QUEST_ACCEPTED then
        if player:hasKeyItem(xi.ki.OLD_POCKET_WATCH) and not player:hasKeyItem(xi.ki.OLD_BOOTS) then
            player:startEvent(93)
        elseif player:hasKeyItem(xi.ki.OLD_BOOTS) and player:getCharVar("needs_crawler_blood") == 0 then
            player:startEvent(101)
        elseif player:getCharVar("needs_crawler_blood") == 1 then
            player:startEvent(117)
        end
    elseif
        mJob == xi.job.RDM and mLvl >= xi.settings.main.AF2_QUEST_LEVEL and
        player:getQuestStatus(xi.quest.log_id.SANDORIA, sandyQuests.THE_CRIMSON_TRIAL) == QUEST_COMPLETED and
        envelopedInDarkness == QUEST_AVAILABLE
    then
        player:startEvent(94) -- Start

    -- Default dialogue after "Peace for the Spirit"
    elseif peaceForTheSpirit == QUEST_COMPLETED then
        player:startEvent(52)

    -- Default dialogue after "Enveloped in Darkness"
    elseif envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE then
        player:startEvent(114)

    -- Default dialogue
    else
        player:startEvent(530)
    end
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 94 and option == 1) then
        player:addQuest(xi.quest.log_id.SANDORIA, sandyQuests.ENVELOPED_IN_DARKNESS)
        player:addKeyItem(xi.ki.OLD_POCKET_WATCH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.OLD_POCKET_WATCH)
    elseif (csid == 109 and option == 1) then
        player:addQuest(xi.quest.log_id.SANDORIA, sandyQuests.PEACE_FOR_THE_SPIRIT)
        player:setCharVar("needs_crawler_blood", 0)
    elseif (csid == 101) then
        player:setCharVar("needs_crawler_blood", 1)
    elseif (csid == 562) then
        player:setCharVar("WildcatSandy", utils.mask.setBit(player:getCharVar("WildcatSandy"), 15, true))
    elseif csid == 573 and option == 2 then
        player:addSpell(902, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, 902)
    end
end

return entity
