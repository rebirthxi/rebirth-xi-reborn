-----------------------------------
-- ID: 4531
-- Item: rolanberry_864_ce)
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4531)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, -3)
    target:addMod(xi.mod.INT, 1)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, -3)
    target:delMod(xi.mod.INT, 1)
end

return item_object
