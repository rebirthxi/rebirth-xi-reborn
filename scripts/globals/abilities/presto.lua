-----------------------------------
-- Ability: Presto
-- Description Enhances the effect of your next step and grants you an additional finishing move.
-- Obtained: DNC Level 77
-- Recast Time: 00:00:15 (Step)
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
    target:addStatusEffect(xi.effect.PRESTO, 19, 1, 30)

    if player:addStatusEffect(xi.effect.FINISHING_MOVE_1) then
        player:addStatusEffect(xi.effect.FINISHING_MOVE_1)
    elseif player:hasStatusEffect(xi.effect.FINISHING_MOVE_1) then
        player:delStatusEffect(xi.effect.FINISHING_MOVE_1)
        player:addStatusEffect(xi.effect.FINISHING_MOVE_3)
    elseif player:hasStatusEffect(xi.effect.FINISHING_MOVE_2) then
        player:delStatusEffect(xi.effect.FINISHING_MOVE_2)
        player:addStatusEffect(xi.effect.FINISHING_MOVE_3)
    elseif player:hasStatusEffect(xi.effect.FINISHING_MOVE_3) then
        player:delStatusEffect(xi.effect.FINISHING_MOVE_3)
        player:addStatusEffect(xi.effect.FINISHING_MOVE_4)
    elseif player:hasStatusEffect(xi.effect.FINISHING_MOVE_4) then
        player:delStatusEffect(xi.effect.FINISHING_MOVE_4)
        player:addStatusEffect(xi.effect.FINISHING_MOVE_5)
    end
end

return ability_object
