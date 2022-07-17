-----------------------------------
-- Zone: Jugner_Forest_[S] (82)
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/quests")
require("scripts/globals/helm")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.helm.initZone(zone, xi.helm.type.LOGGING)
    xi.chocobo.initZone(zone)
    xi.voidwalker.zoneOnInit(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(621.865, -6.665, 300.264, 149)
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
