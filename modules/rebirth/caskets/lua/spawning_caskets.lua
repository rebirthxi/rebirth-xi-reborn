-----------------------------------
-- Modules overrides the original casket spawning mechanic with one specifically
-- used by QR.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/caskets")
require("scripts/globals/qr_caskets")
-----------------------------------
local m = Module:new("global_casket_spawning")

m:addOverride("xi.caskets.spawnCasket", function(player, mob, x, y, z, r)
    xi.caskets.generalSpawnCasket(player, mob, x, y, z, r)
end)

return m