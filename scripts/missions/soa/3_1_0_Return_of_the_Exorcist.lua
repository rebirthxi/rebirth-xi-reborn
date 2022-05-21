-----------------------------------
-- Return of the Exorcist
-- Seekers of Adoulin M3-1-0
-----------------------------------
-- !addmission 12 37
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/interaction/mission')
require('scripts/globals/zone')
-----------------------------------

local mission = Mission:new(xi.mission.log_id.SOA, xi.mission.id.soa.RETURN_OF_THE_EXORCIST)

mission.reward =
{
    nextMission = { xi.mission.log_id.SOA, xi.mission.id.soa.THE_MERCILESS_ONE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(138),

            onRegionEnter =
            {
                [1] = function(player, region)
                    return mission:progressEvent(130, 256, 23, 2964)
                end,
            },

            onEventFinish =
            {
                [130] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
