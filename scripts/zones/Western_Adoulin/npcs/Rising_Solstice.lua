-----------------------------------
-- Area: Western Adoulin
--  NPC: Rising Solstice
-- Type: Standard NPC and Quest Giver
-- Starts, Involved With, and Finishes Quest: 'A Certain Substitute Patrolman'
-- !pos -154 4 -29 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local ACSP = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN)
    local SOA_Mission = player:getCurrentMission(xi.mission.log_id.SOA)

    if (SOA_Mission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER) then
        if (ACSP == QUEST_ACCEPTED) then
            -- Finishing Quest: 'A Certain Substitute Patrolman'
            if (player:getCharVar("ACSP_NPCs_Visited") >= 8) then
                player:startEvent(2552)
            -- During Quest: 'A Certain Substitute Patrolman'
            else
                player:startEvent(2551)
            end
        -- Starts Quest: 'A Certain Substitute Patrolman'
        elseif (ACSP == QUEST_AVAILABLE) then
            player:startEvent(2550)
        else
            if ((SOA_Mission >= xi.mission.id.soa.BEAUTY_AND_THE_BEAST) and (SOA_Mission <= xi.mission.id.soa.SALVATION)) then
                -- Speech while Arciela is 'kidnapped'
                player:startEvent(150)
            else
                -- Standard dialogue, after joining colonization effort
                player:startEvent(580)
            end
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(502)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2550) then
        -- Starting Quest: 'A Certain Substitute Patrolman'
        player:addQuest(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN)
        player:addKeyItem(xi.ki.WESTERN_ADOULIN_PATROL_ROUTE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WESTERN_ADOULIN_PATROL_ROUTE)
        player:setCharVar("ACSP_NPCs_Visited", 1)
    elseif (csid == 2552) then
        -- Finishing Quest: 'A Certain Substitute Patrolman'
        player:completeQuest(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN)
        player:addExp(1000 * xi.settings.EXP_RATE)
        player:addCurrency('bayld', 500 * xi.settings.BAYLD_RATE)
        player:messageSpecial(ID.text.BAYLD_OBTAINED, 500 * xi.settings.BAYLD_RATE)
        player:delKeyItem(xi.ki.WESTERN_ADOULIN_PATROL_ROUTE)
        player:addFame(xi.quest.fame_area.ADOULIN)
        player:setCharVar("ACSP_NPCs_Visited", 0)
    end
end

return entity
