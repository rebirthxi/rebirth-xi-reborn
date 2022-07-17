-----------------------------------
-- Zone: Talacca_Cove (57)
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/titles")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(64.007, -9.281, -99.988, 88)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
