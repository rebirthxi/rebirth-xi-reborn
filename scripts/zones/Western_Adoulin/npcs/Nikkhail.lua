-----------------------------------
-- Area: Western Adoulin
--  NPC: Nikkhail
-- Type: Standard NPC and Quest NPC
--  Involved With Quest: 'A Thirst for the Ages'
-- !pos -101 3 9 256
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
    local atfta = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_THIRST_FOR_THE_AGES)
    local atftaNeedKI = ((player:getCharVar("ATFTA_Status") < 2) and (not player:hasKeyItem(xi.ki.COPY_OF_THE_ALLIANCE_AGREEMENT)))

    local soaMission = player:getCurrentMission(xi.mission.log_id.SOA)

    if (soaMission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER) then
        if ((atfta == QUEST_ACCEPTED) and atftaNeedKI) then
            -- Progresses Quest: 'A Thirst for the Ages'
            player:startEvent(5053)
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(584)
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(510)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 5053) then
        -- Progresses Quest: 'A Thirst for the Ages'
        player:addKeyItem(xi.ki.COPY_OF_THE_ALLIANCE_AGREEMENT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.COPY_OF_THE_ALLIANCE_AGREEMENT)
    end
end

return entity
