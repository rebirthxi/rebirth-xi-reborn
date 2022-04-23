-----------------------------------
-- TOAU-42: Path of Darkness
-- !instance 7700
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/instance")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local instance_object = {}

-- Requirements for the first player registering the instance
instance_object.registryRequirements = function(player)
    return player:getCurrentMission(xi.mission.log_id.TOAU) == xi.mission.id.toau.PATH_OF_DARKNESS and
        player:hasKeyItem(xi.ki.NYZUL_ISLE_ROUTE) and
        player:getMissionStatus(xi.mission.log_id.TOAU) == 1
end

-- Requirements for further players entering an already-registered instance
instance_object.entryRequirements = function(player)
    return player:getCurrentMission(xi.mission.log_id.TOAU) >= xi.mission.id.toau.PATH_OF_DARKNESS
end

-- Called on the instance once it is created and ready
instance_object.onInstanceCreated = function(instance)
    SpawnMob(ID.mob[58].AMNAF_BLU, instance)
    SpawnMob(ID.mob[58].NAJA, instance)
end

-- Once the instance is ready inform the requester that it's ready
instance_object.onInstanceCreatedCallback = function(player, instance)
    xi.instance.onInstanceCreatedCallback(player, instance)

    -- Kill the Nyzul Isle update spam
    for _, v in ipairs(player:getParty()) do
        if v:getZoneID() == instance:getEntranceZoneID() then
            v:updateEvent(405, 3, 3, 3, 3, 3, 3, 3)
        end
    end
end

-- When the player zones into the instance
instance_object.afterInstanceRegister = function(player)
    local instance = player:getInstance()

    -- NOTE: Time Limit observed in capture prior to KI fading.  This could be asyncronyous,
    -- but moving here from that reference.
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())

    if player:hasKeyItem(xi.ki.NYZUL_ISLE_ROUTE) then
        player:delKeyItem(xi.ki.NYZUL_ISLE_ROUTE)
        player:messageSpecial(ID.text.FADES_INTO_NOTHINGNESS, xi.ki.NYZUL_ISLE_ROUTE)
    end

    player:addTempItem(xi.items.UNDERSEA_RUINS_FIREFLIES)
end

-- Instance "tick"
instance_object.onInstanceTimeUpdate = function(instance, elapsed)
    xi.instance.updateInstanceTime(instance, elapsed, ID.text)
end

-- On fail
instance_object.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(1)
    end
end

-- When something in the instance calls: instance:setProgress(...)
instance_object.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 10 and progress < 20 then
        DespawnMob(ID.mob[58].AMNAF_BLU, instance)
    elseif progress == 24 then
        local v = GetMobByID(ID.mob[58].NAJA, instance)
        v:setLocalVar("ready", 0)
        v:setLocalVar("Stage", 2)

        SpawnMob(ID.mob[58].AMNAF_BLU, instance)
    elseif progress >= 30 and progress < 40 then
        DespawnMob(ID.mob[58].AMNAF_BLU, instance)
    elseif progress == 48 then
        SpawnMob(ID.mob[58].AMNAF_PSYCHEFLAYER, instance)

        local v = GetMobByID(ID.mob[58].NAJA, instance)
        v:setLocalVar("ready", 0)
        v:setLocalVar("Stage", 3)

        local npcs = instance:getNpcs()

        for i, value in pairs(npcs) do
            if(value:getID() == ID.npc._259) then
                value:setAnimation(8)
            end
        end
    elseif progress == 50 then
        instance:complete()
    end
end

-- On win
instance_object.onInstanceComplete = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        if
            v:getCurrentMission(xi.mission.log_id.TOAU) == xi.mission.id.toau.PATH_OF_DARKNESS and
            v:getMissionStatus(xi.mission.log_id.TOAU) == 1
        then
            v:setMissionStatus(xi.mission.log_id.TOAU, 2)
        end

        v:setPos(0, 0, 0, 0, 72)
    end
end

-- Standard event hooks, these will take priority over everything apart from m_event.Script
-- Omitting this will fallthrough to the same calls in the Zone.lua

--instance_object.onEventUpdate = function(player, csid, option)
--end

--instance_object.onEventFinish = function(player, csid, option)
--end

return instance_object
