-----------------------------------
-- Module makes leaping lizzy and valkurm emporer spawn faster
-----------------------------------
require("modules/module_utils")
local valkurm_ID = require("scripts/zones/Valkurm_Dunes/IDs")
local gustaberg_ID = require("scripts/zones/South_Gustaberg/IDs")
require("scripts/globals/mobs")
-----------------------------------
local m = Module:new("leaping_lizzy_and_valkurm_emporer_spawn_faster")
m:setEnabled(true)

m:addOverride("xi.zones.Valkurm_Dunes.mobs.Damselfly.onMobDespawn", function(mob)
    xi.mob.phOnDespawn(mob, valkurm_ID.mob.VALKURM_EMPEROR_PH, 5, 300) -- 5 minutes
end)

m:addOverride("xi.zones.South_Gustaberg.mobs.Rock_Lizard.onMobDespawn", function(mob)
    xi.mob.phOnDespawn(mob, gustaberg_ID.mob.LEAPING_LIZZY_PH, 5, 300) -- 5 minutes
end)

return m
