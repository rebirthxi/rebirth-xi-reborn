-----------------------------------
-- Ability: Meikyo Shisui
-- Reduces cost of weapon skills.
-- Obtained: Samurai Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    ability:setRecast(ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST))
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.MEIKYO_SHISUI, 1, 0, 30)
    player:addTP(3000)
end

return ability_object
