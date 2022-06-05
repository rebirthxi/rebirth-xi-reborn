-----------------------------------
--
-- Zone: VeLugannon_Palace (177)
--
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.treasure.initZone(zone)
    SetServerVariable("[POP]SteamCleaner", 0) -- should "reset" on server repop
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-100.01, -25.752, -399.468, 59)
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
