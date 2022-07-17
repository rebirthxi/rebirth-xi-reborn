-----------------------------------
-- Ability: Cooldown
-- Description: Reduces the strain on your automaton.
-- Obtained: PUP Level 95
-- Recast Time: 00:05:00
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    local pet = player:getPet()
    if not pet then
        -- TODO: Add check to verify this is an automaton
        return xi.msg.basic.REQUIRES_A_PET, 0
    else
        return 0, 0
    end
end

ability_object.onUseAbility = function(player, target, ability)
    local jpValue = player:getJobPointLevel(xi.jp.COOLDOWN_EFFECT)

    player:reduceBurden(50, jpValue)

    if player:hasStatusEffect(xi.effect.OVERLOAD) then
        player:delStatusEffect(xi.effect.OVERLOAD)
    end
end

return ability_object
