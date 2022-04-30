-----------------------------------
-- Ability: Bolster
-- Enhances the effects of your geomancy spells.
-- Doubles the potency of Geomancy spells while Bolster is active.
-- Obtained: Geomancer Level 1
-- Recast Time: 01:00:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/job_utils/geomancer")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.geomancer.bolster(player, target, ability)
end

return ability_object
