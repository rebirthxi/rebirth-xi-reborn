-----------------------------------
-- The Salt of the Earth
-- Bastok M9-1
-----------------------------------
-- !addmission 1 22
-- Argus        : !pos 132.157 7.496 -2.187 236
-- Cleades      : !pos -358 -10 -168 235
-- Malduc       : !pos 66.200 -14.999 4.426 237
-- Rashid       : !pos -8.444 -2 -123.575 234
-- Alois        : !pos 96 -20 14 237
-- Dancing Wolf : !pos 7.619 7 81.209 247
-- qm2 (Gustav) : !pos -130 1.256 252.696 212
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/missions')
require('scripts/globals/npc_util')
require('scripts/globals/settings')
require('scripts/globals/interaction/mission')
require('scripts/globals/zone')
-----------------------------------
local bastokMarketsID = require("scripts/zones/Bastok_Markets/IDs")
local bastokMinesID   = require("scripts/zones/Bastok_Mines/IDs")
local metalworksID    = require("scripts/zones/Metalworks/IDs")
local portBastokID    = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------

local mission = Mission:new(xi.mission.log_id.BASTOK, xi.mission.id.bastok.THE_SALT_OF_THE_EARTH)

mission.reward =
{
    rankPoints = 1500,
}

local handleAcceptMission = function(player, csid, option, npc)
    if option == 22 then
        mission:begin(player)
        player:messageSpecial(zones[player:getZoneID()].text.YOU_ACCEPT_THE_MISSION)
    end
end

local isPlasmsAlive = function()
    for i = ID.mob.GIGAPLASM, ID.mob.GIGAPLASM + 14 do
        if GetMobByID(i):isAlive() then
            return true
        end
    end

    return false
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == xi.mission.id.nation.NONE and
                player:getNation() == mission.areaId
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [xi.zone.BASTOK_MINES] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [xi.zone.METALWORKS] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            onEventFinish =
            {
                [1001] = handleAcceptMission,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Cleades'] = mission:messageSpecial(bastokMarketsID.text.EXTENDED_MISSION_OFFSET + 14),
        },

        [xi.zone.BASTOK_MINES] =
        {
            ['Rashid'] = mission:messageSpecial(bastokMinesID.text.EXTENDED_MISSION_OFFSET + 14),
        },

        [xi.zone.METALWORKS] =
        {
            ['Alois'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 0 then
                        return mission:progressEvent(773)
                    elseif missionStatus == 1 then
                        return mission:progressEvent(774)
                    elseif missionStatus == 3 then
                        return mission:progressEvent(775)
                    elseif missionStatus == 4 then
                        return mission:progressEvent(776)
                    end
                end,
            },

            ['Malduc'] = mission:messageSpecial(metalworksID.text.EXTENDED_MISSION_OFFSET + 14),

            onEventFinish =
            {
                [773] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 1)
                end,

                [776] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        -- TODO: Figure out where this goes (Franziska)
                        player:setCharVar("OptionalcsCornelia", 1)
                    end
                end,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            ['Argus'] = mission:messageSpecial(portBastokID.text.EXTENDED_MISSION_OFFSET + 14),
        },

        [xi.zone.RABAO] =
        {
            ['Dancing_Wolf'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if missionStatus == 1 then
                        return mission:progressEvent(102)
                    elseif missionStatus == 2 then
                        return mission:progressEvent(103)
                    elseif missionStatus == 3 then
                        return mission:progressEvent(104)
                    elseif missionStatus == 4 then
                        return mission:progressEvent(105)
                    end
                end,
            },

            onEventFinish =
            {
                [102] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 2)
                end,

                [104] = function(player, csid, option, npc)
                    player:setMissionStatus(mission.areaId, 4)
                end,
            },
        },

        [xi.zone.GUSTAV_TUNNEL] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    local missionStatus = player:getMissionStatus(mission.areaId)

                    if
                        missionStatus == 2 and
                        not isPlasmsAlive()
                    then
                        SpawnMob(ID.mob.GIGAPLASM):updateClaim(player)
                        -- Message Here
                    elseif
                        missionStatus == 3 and
                        not player:hasKeyItem(xi.ki.MIRACLESALT)
                    then
                        npcUtil.giveKeyItem(player, xi.ki.MIRACLESALT)
                    end
                end,
            },

            ['Nanoplasm'] =
            {
                onMobDeath = function(mob, player, isKiller, noKiller)
                    if
                        player:getMissionStatus(mission.areaId) == 2 and
                        not isPlasmsAlive()
                    then
                        player:setMissionStatus(mission.areaId, 3)
                    end
                end,
            },
        },
    },
}

return mission
