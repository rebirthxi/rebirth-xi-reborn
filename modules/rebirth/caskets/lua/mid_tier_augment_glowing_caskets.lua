-----------------------------------
-- Adds regional augment items
-- * Increases regional item rate to 33%
-- * Adds Augmented items from level 75 items in Abyssea chests
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("mid_tier_augment_glowing_caskets")

m:addOverride("xi.zones.Kuftal_Tunnel.Zone.onInitialize", function(zone)
    local zoneId = zone:getID()
    local ID = zones[zoneId]

    local glowingCasket = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Glowing Casket",
        look = 1932,
        x = 27.0964,
        y = -12.6502,
        z = 263.7245,
        rotation = 128
    })

    ID.glowingCaskets = {
        glowingCasket:getID()
    }

    super(zone)
end)


return m