-----------------------------------
-- Zone: Abyssea - Altepa
-----------------------------------
local ID = require("scripts/zones/Abyssea-Altepa/IDs")
require("scripts/globals/abyssea")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    zone:registerRegion(1, 375, -10, 259, 460, 10, 420)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(435, 0, 320, 136)
    end

    xi.abyssea.onZoneIn(player)

    return cs
end

zone_object.afterZoneIn = function(player)
    xi.abyssea.afterZoneIn(player)
end

zone_object.onRegionEnter = function(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function()
            xi.abyssea.onWardRegionEnter(player)
        end,
    }
end

zone_object.onRegionLeave = function(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function()
            xi.abyssea.onWardRegionLeave(player)
        end,
    }
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
