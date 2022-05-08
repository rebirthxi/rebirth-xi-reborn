-----------------------------------
-- Adds regional augment items
-- * Increases regional item rate to 33%
-- * Adds Augmented items from level 75 items in Abyssea chests
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/caskets")
require("scripts/globals/qr_caskets")
-----------------------------------
local m = Module:new("glowing_caskets")

m:addOverride("xi.zones.Kuftal_Tunnel.Zone.onInitialize", function(zone)
    xi.glowingCaskets.insertGlowingCaskets(zone)
    super(zone)
end)

return m