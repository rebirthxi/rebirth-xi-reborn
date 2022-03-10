-----------------------------------
-- Change behaviour of Nexus Cape
-- * Reduced recast delay
-- * Allow new areas
-- * Check that quests are complete for the new areas
-----------------------------------
require("modules/module_utils")
require("scripts/globals/teleports")
require("scripts/globals/status")
require('scripts/globals/zone')
-----------------------------------
local m = Module:new("rebirth_nexus_cape")
m:setEnabled(true)

m:addOverride("xi.globals.items.nexus_cape.onItemCheck", function(target)
    local result = xi.msg.basic.ITEM_UNABLE_TO_USE -- Default is fail.
    local leader = target:getPartyLeader()
    local leaderRegion = leader:getZone():getRegionID()
    local zilartProgress = target:getCurrentMission(xi.mission.log_id.ZILART)
    local copProgress = target:getCurrentMission(xi.mission.log_id.COP)
    local toauProgress = target:getCurrentMission(xi.mission.log_id.TOAU)

    if leader == nil or leader:isInMogHouse() or (target:getID() == leader:getID()) then
        return result
    end

    if leaderRegion == xi.region.TULIA then
        if zilartProgress < xi.mission.id.zilart.THE_GATE_OF_THE_GODS or zilartProgress == xi.mission.id.zilart.NONE then
            return result
        end
    elseif leaderRegion == xi.region.LIMBUS or leaderRegion == xi.region.LUMORIA then
        if copProgress < xi.mission.id.cop.GARDEN_OF_ANTIQUITY or copProgress == xi.mission.id.cop.NONE then
            return result
        end
    elseif leaderRegion == xi.region.ARRAPAGO          or
            leaderRegion == xi.region.ALZADAAL         or
            leaderRegion == xi.region.HALVUNG          or
            leaderRegion == xi.region.WEST_AHT_URHGAN  or
            leaderRegion == xi.region.MAMOOL_JA_SAVAGE then
        if toauProgress < xi.mission.id.toau.IMMORTAL_SENTRIES or toauProgress == xi.mission.id.toau.NONE then
            return result
        end
    end

    return 0
end)

return m