-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Qiqirn Mine
-- Note: Explosive mine from Qiqrin
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setUnkillable(true)
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:hideHP(true)
    mob:SetAutoAttackEnabled(false)
    mob:setStatus(xi.status.DISAPPEAR)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 15)
    mob:setMobMod(xi.mobMod.SOUND_RANGE, 15)
end

entity.onMobDeath = function(mob, player)
end

return entity
