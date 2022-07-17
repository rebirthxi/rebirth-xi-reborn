-----------------------------------
-- Ability: Mana Wall
-- Description: Allows you to take damage with MP.
-- Obtained: BLM Level 76
-- Recast Time: 00:10:00
-- Duration: 00:05:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.MANA_WALL, 4, 0, 300)
end

return ability_object
