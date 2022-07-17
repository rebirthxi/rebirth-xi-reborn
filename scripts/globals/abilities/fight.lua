-----------------------------------
-- Ability: Fight
-- Commands your pet to attack the target.
-- Obtained: Beastmaster Level 1
-- Recast Time: 10 seconds
-- Duration: N/A
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    if (player:getPet() == nil) then
        return xi.msg.basic.REQUIRES_A_PET, 0
    else
        if (target:getID() == player:getPet():getID() or (target:getMaster() ~= nil and target:getMaster():isPC())) then
            return xi.msg.basic.CANNOT_ATTACK_TARGET, 0
        else
            return 0, 0
        end
    end
end

ability_object.onUseAbility = function(player, target, ability)
    local pet = player:getPet()

    if (player:checkDistance(pet) <= 25) then
        if (pet:hasStatusEffect(xi.effect.HEALING)) then
            pet:delStatusEffect(xi.effect.HEALING)
        end

        player:petAttack(target)
    end
end

return ability_object
