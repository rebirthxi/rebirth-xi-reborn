-----------------------------------
-- Ability: Fan Dance
-- Reduces physical damage taken and increases enmity but renders Samba unusable. Physical damage reduction gradually decreases with each hit taken.
-- Obtained: Dancer Level 75 Merit Group 2
-- Recast Time: 3 minutes
-- Duration: 5 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
   return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.FAN_DANCE, 9000, 0, 300)
end

return ability_object
