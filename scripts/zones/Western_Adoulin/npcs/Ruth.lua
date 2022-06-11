-----------------------------------
-- Area: Western Adoulin
--  NPC: Ruth
-- Type: Standard NPC and Quest NPC
-- Involved With Quest: 'A Pioneers Best (Imaginary) Friend'
-- !pos -144 4 -10 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local apbif = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_PIONEERS_BEST_IMAGINARY_FRIEND)
    local soaMission = player:getCurrentMission(xi.mission.log_id.SOA)

    if (soaMission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER) then
        if ((apbif == QUEST_ACCEPTED) and (not player:hasStatusEffect(xi.effect.IONIS))) then
            -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(2523)
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(590)
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(503)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2523) then
        -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
        player:delStatusEffectsByFlag(xi.effectFlag.INFLUENCE, true)
        player:addStatusEffect(xi.effect.IONIS, 0, 0, 9000)
    end
end

return entity
