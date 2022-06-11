-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder Thalia
-----------------------------------
require('scripts/globals/missions')
mixins = {require('scripts/mixins/warders_cop')}
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:SetMobAbilityEnabled(false) -- ability use handled in mixin
    mob:setLocalVar('warder', 1)
    mob:setLocalVar('electro', 1)
end

entity.onMobDisengage = function(mob)
    -- reset variables so that disengaging mobs won't break mixin
    mob:setLocalVar('changeTime', 0)
    mob:setLocalVar('initiate', 0)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
