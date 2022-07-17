-----------------------------------
-- Ability: Entrust
-- Causes the next indicolure spell cast to be able to target a party member.
-- Obtained: Geomancer Level 75
-- Recast Time: 00:10:00
-- Duration: 00:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.ENTRUST, 1, 0, 60)
end

return ability_object
