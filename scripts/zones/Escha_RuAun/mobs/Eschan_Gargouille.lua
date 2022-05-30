-----------------------------------
-- Area: Escha Ru'Aun
--  Mob: Eschan Gargouille
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:setAnimationSub(6)
end

entity.onMobEngaged = function(mob, target)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(0)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
