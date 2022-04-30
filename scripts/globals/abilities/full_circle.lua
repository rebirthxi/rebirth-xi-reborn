-----------------------------------
-- Ability: Full Circle
-- Causes your luopan to vanish.
-- Obtained: Geomancer Level 5
-- Recast Time: 10 seconds
-- Refunds some of the MP consumed by the Geocolure spell that created the luopan.
-- Amount of MP restored varies depending on remaining Luopan HP.
-----------------------------------
require("scripts/globals/job_utils/geomancer")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.geomancer.geoOnAbilityCheck(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.geomancer.fullCircle(player, target, ability)
end

return ability_object
