-----------------------------------
-- Zone: Port_San_dOria (232)
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/quests/flyers_for_regine")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/settings/main")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    quests.ffr.initZone(zone) -- register regions 1 through 5
end

zone_object.onZoneIn = function(player,prevZone)
    local cs = -1

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if xi.settings.NEW_CHARACTER_CUTSCENE == 1 then
            cs = 500
        end
        player:setPos(-104, -8, -128, 227)
        player:setHomePoint()
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == xi.zone.SAN_DORIA_JEUNO_AIRSHIP) then
            cs = 702
            player:setPos(-1.000, 0.000, 44.000, 0)
        else
            player:setPos(80, -16, -135, 165)
        end
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
    quests.ffr.onRegionEnter(player, region) -- player approaching Flyers for Regine NPCs
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onTransportEvent = function(player, transport)
    player:startEvent(700)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if (csid == 500) then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536)
    elseif (csid == 700) then
        player:setPos(0, 0, 0, 0, 223)
    end
end

return zone_object
