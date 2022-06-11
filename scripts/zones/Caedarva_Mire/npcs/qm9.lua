-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm9
-- Involved in quest: The Wayward Automation
-- !pos  129 1.396 -631 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local theWaywardAutomation = player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATON)
    local theWaywardAutomationProgress = player:getCharVar("TheWaywardAutomationProgress")

    if (theWaywardAutomation == QUEST_ACCEPTED and theWaywardAutomationProgress == 2) then
        if (player:getCharVar("TheWaywardAutomationNM") >= 1) then
            player:startEvent(14)-- Event ID 14 for CS after toad
        elseif (not GetMobByID(ID.mob.CAEDARVA_TOAD):isSpawned()) then
            SpawnMob(ID.mob.CAEDARVA_TOAD):updateClaim(player) --Caedarva toad
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 14) then
        player:setCharVar("TheWaywardAutomationProgress", 3)
        player:setCharVar("TheWaywardAutomationNM", 0)
    end
end

return entity
