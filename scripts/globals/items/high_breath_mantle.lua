-----------------------------------
-- ID: 15487
-- Item: High Breath Mantle
-- Item Effect: HP+38 / Enmity+5
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if (effect ~= nil) then
        if (effect:getSubType() == 15487) then
            target:delStatusEffect(xi.effect.ENCHANTMENT)
        end
    end
    return 0
end

item_object.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
        target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 1800, 15487)
    else
        target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 1800, 15487)
    end
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 38)
    target:addMod(xi.mod.ENMITY, 5)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 38)
    target:delMod(xi.mod.ENMITY, 5)
end

return item_object
