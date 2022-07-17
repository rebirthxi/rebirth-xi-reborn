-----------------------------------
-- Ability: Rampart
-- Grants all party members within the area of effect -25% SDT.
-- SDT is multiplicative with regular Damage Taken; many forms of SDT are for a single type or element of damage
-- However, Rampart's SDT is for all damage types.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local duration = 30 + player:getMod(xi.mod.RAMPART_DURATION)
    target:addStatusEffect(xi.effect.RAMPART, 2500, 0, duration)
end

return ability_object
