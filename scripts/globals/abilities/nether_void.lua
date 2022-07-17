-----------------------------------
-- Ability: Nether Void
-- Description: Increases the absorption of your next dark magic spell.
-- Obtained: DRK Level 78
-- Recast Time: 00:05:00
-- Duration: 00:01:00 or the next Dark Magic cast
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.NETHER_VOID, 8, 1, 30)
end

return ability_object
