-----------------------------------
-- Zone: Western Adoulin
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
require("scripts/globals/quests")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    local heartwingsAndTheKindhearted = player:getCurrentMission(xi.mission.log_id.SOA) == xi.mission.id.soa.HEARTWINGS_AND_THE_KINDHEARTED

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-142, 4, -18, 4)
    end

    if (player:getCharVar("Raptor_Rapture_Status") == 2) then
        -- Resuming cutscene for Quest: 'Raptor Rapture', after Pagnelle warps you to Rala Waterways mid-CS, then back here.
        cs = 5056
    end

    if heartwingsAndTheKindhearted then
        cs = 2
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 5056 then
        -- Successfully finished introduction CS event chain for Quest: 'Raptor Rapture'.
        player:setCharVar("Raptor_Rapture_Status", 3)

        if (option == 1) then
            -- Starts Quest: 'Raptor Rapture'
            player:addQuest(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.RAPTOR_RAPTURE)
            player:setCharVar("Raptor_Rapture_Status", 4)
        end
    elseif csid == 2 then
        player:completeMission(xi.mission.log_id.SOA, xi.mission.id.soa.HEARTWINGS_AND_THE_KINDHEARTED)
        player:addMission(xi.mission.log_id.SOA, xi.mission.id.soa.PIONEER_REGISTRATION)
    end
end

return zone_object
