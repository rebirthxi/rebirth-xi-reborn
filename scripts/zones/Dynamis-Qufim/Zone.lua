-----------------------------------
-- Zone: Dynamis-Qufim
-----------------------------------
local ID = require("scripts/zones/Dynamis-Qufim/IDs")
require("scripts/globals/conquest")
require("scripts/globals/dynamis")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.dynamis.zoneOnInitialize(zone)
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    return xi.dynamis.zoneOnZoneIn(player, prevZone)
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    xi.dynamis.zoneOnEventFinish(player, csid, option)
end

return zone_object
