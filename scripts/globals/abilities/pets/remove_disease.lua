-----------------------------------
-- Remove Disease
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(xi.effect.DISEASE)) then
        skill:setMsg(xi.msg.basic.JA_REMOVE_EFFECT)
        effect = xi.effect.DISEASE
    elseif (target:delStatusEffect(xi.effect.PLAGUE)) then
        skill:setMsg(xi.msg.basic.JA_REMOVE_EFFECT)
        effect = xi.effect.PLAGUE
    else
        skill:setMsg(xi.msg.basic.JA_NO_EFFECT)
    end

    return effect
end

return ability_object
