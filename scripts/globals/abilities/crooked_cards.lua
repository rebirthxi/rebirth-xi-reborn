-----------------------------------
-- Ability: Crooked Cards
-- Description: Increases the effects of the next phantom roll.
-- Obtained: COR Level 95
-- Recast Time: 0:10:00
-- Duration: 0:01:00(or the next roll used)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    target:addStatusEffect(xi.effect.CROOKED_CARDS, 20, 0, 60)
end

return ability_object
