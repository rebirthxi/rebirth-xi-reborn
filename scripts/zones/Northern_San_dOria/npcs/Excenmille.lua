-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Excenmille
-- Type: Trust NPC, Ballista Pursuivant
-- !pos -229.344 6.999 22.976 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

local trustMemory = function(player)
    local memories = 0
    if player:hasKeyItem(xi.ki.BALLISTA_LICENSE) then
        memories = memories + 2
    end
    -- 4 - Chocobo racing
    --  memories = memories + 4
    if player:hasCompletedQuest(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) then
        memories = memories + 8
    end
    if player:hasCompletedQuest(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.BLOOD_OF_HEROES) then
        memories = memories + 16
    end
    return memories
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local trustSandoria = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRUST_SANDORIA)
    local trustBastok = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TRUST_BASTOK)
    local trustWindurst = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TRUST_WINDURST)
    local sandoriaFirstTrust = player:getCharVar("SandoriaFirstTrust")
    local excenmilleTrustChatFlag = player:getLocalVar("ExcenmilleTrustChatFlag")
    local rank3 = player:getRank(player:getNation()) >= 3 and 1 or 0

    if trustSandoria == QUEST_ACCEPTED and (trustWindurst == QUEST_COMPLETED or trustBastok == QUEST_COMPLETED) then
        player:startEvent(897, 0, 0, 0, trustMemory(player), 0, 0, 0, rank3)
    elseif trustSandoria == QUEST_ACCEPTED and sandoriaFirstTrust == 0 then
        player:startEvent(893, 0, 0, 0, trustMemory(player), 0, 0, 0, rank3)
    elseif trustSandoria == QUEST_ACCEPTED and sandoriaFirstTrust == 1 and excenmilleTrustChatFlag == 0 then
        player:startEvent(894)
        player:setLocalVar("ExcenmilleTrustChatFlag", 1)
    elseif trustSandoria == QUEST_ACCEPTED and sandoriaFirstTrust == 2 then
        player:startEvent(895)
    elseif trustSandoria == QUEST_COMPLETED and not player:hasSpell(902) and excenmilleTrustChatFlag == 0 then
        player:startEvent(896, 0, 0, 0, 0, 0, 0, 0, rank3)
        player:setLocalVar("ExcenmilleTrustChatFlag", 1)
    else
        player:startEvent(29)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- TRUST
    if csid == 893 then
        player:addSpell(899, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, 899)
        player:setCharVar("SandoriaFirstTrust", 1)
    elseif csid == 895 then
        player:delKeyItem(xi.ki.RED_INSTITUTE_CARD)
        player:messageSpecial(ID.text.KEYITEM_LOST, xi.ki.RED_INSTITUTE_CARD)
        npcUtil.completeQuest(player, xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRUST_SANDORIA, {
            ki = xi.ki.SAN_DORIA_TRUST_PERMIT,
            title = xi.title.THE_TRUSTWORTHY,
            var = "SandoriaFirstTrust"
        })
        player:messageSpecial(ID.text.CALL_MULTIPLE_ALTER_EGO)
    elseif csid == 897 then
        player:addSpell(899, true, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, 899)
        player:delKeyItem(xi.ki.RED_INSTITUTE_CARD)
        player:messageSpecial(ID.text.KEYITEM_LOST, xi.ki.RED_INSTITUTE_CARD)
        npcUtil.completeQuest(player, xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRUST_SANDORIA, {
            ki = xi.ki.SAN_DORIA_TRUST_PERMIT
        })
    end
end

return entity
