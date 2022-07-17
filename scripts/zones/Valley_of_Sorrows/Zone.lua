-----------------------------------
--
-- Zone: Valley_of_Sorrows (128)
--
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    if (xi.settings.main.LandKingSystem_NQ ~= 1) then
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(900 + math.random(0, 6) * 1800)
    end
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(45.25, -2.115, -140.562, 0)
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
