-----------------------------------
-- Area: Windurst Walls
--  NPC: Zokima-Rokima
-- Starts Windurst Missions
-- !pos 0 -16 124 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getNation() ~= xi.nation.WINDURST then
        player:startEvent(87) -- for other nation
    else
        local currentMission = player:getCurrentMission(xi.mission.log_id.WINDURST)

        if currentMission ~= xi.mission.id.windurst.NONE then
            player:startEvent(91) -- Have mission already activated
        else
            -- NPC dialog changes when starting 3-2 according to whether it's the first time or being repeated
            local param3 = player:hasCompletedMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.WRITTEN_IN_THE_STARS) and 1 or 0
            local flagMission, repeatMission = xi.mission.getMissionMask(player)

            player:startEvent(93, flagMission, 0, param3, 0, xi.ki.STAR_CRESTED_SUMMONS_1, repeatMission) -- Mission List
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
