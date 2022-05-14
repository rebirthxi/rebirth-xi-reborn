-----------------------------------
-- Area: Western Adoulin
--  NPC: Shipilolo
-- Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
--                        'Fertile Ground'
--                        'The Old Man and the Harpoon'
--                        'Wayward Waypoints'
-- !pos 84 0 -60 256
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
    local TOMATH = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON)
    local Fertile_Ground = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.FERTILE_GROUND)
    local Wayward_Waypoints = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.WAYWARD_WAYPOINTS)
    Wayward_Waypoints = (Wayward_Waypoints == QUEST_ACCEPTED) and (player:getCharVar("WW_Need_Shipilolo") > 0)
    local SOA_Mission = player:getCurrentMission(xi.mission.log_id.SOA)

    if (SOA_Mission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER) then
        if ((TOMATH == QUEST_ACCEPTED) and player:hasKeyItem(xi.ki.BROKEN_HARPOON)) then
            -- Progresses Quest: 'The Old Man and the Harpoon'
            player:startEvent(2543)
        elseif ((Fertile_Ground == QUEST_ACCEPTED) and (not player:hasKeyItem(xi.ki.BOTTLE_OF_FERTILIZER_X))) then
            -- Progresses Quest: 'Fertile Ground'
            player:startEvent(2850)
        elseif (Wayward_Waypoints and (not player:hasKeyItem(xi.ki.WAYPOINT_RECALIBRATION_KIT))) then
            -- Progresses Quest: 'Wayward Waypoints'
            player:startEvent(79)
        else
            -- Standard dialogue
            player:startEvent(535)
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(526)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2543) then
        -- Progresses Quest: 'The Old Man and the Harpoon'
        player:delKeyItem(xi.ki.BROKEN_HARPOON)
        player:addKeyItem(xi.ki.EXTRAVAGANT_HARPOON)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.EXTRAVAGANT_HARPOON)
    elseif (csid == 2850) then
        -- Progresses Quest: 'Fertile Ground'
        player:addKeyItem(xi.ki.BOTTLE_OF_FERTILIZER_X)
    elseif (csid == 79) then
        player:addKeyItem(xi.ki.WAYPOINT_RECALIBRATION_KIT)
        player:setCharVar("WW_Need_Shipilolo", 0)
    end
end

return entity
