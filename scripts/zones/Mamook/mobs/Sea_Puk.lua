-----------------------------------
-- Area: Mamook
--  Mob: Sea Puk
-----------------------------------
mixins = {require("scripts/mixins/families/puk")}
-----------------------------------

local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.WIND_ABSORB, 100)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
