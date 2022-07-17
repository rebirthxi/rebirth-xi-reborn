-----------------------------------
-- ID: 4557
-- Item: steamed_catfish
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 30
-- Magic % 1 (cap 110)
-- Dex 3
-- Intelligence 1
-- Mind -3
-- Earth Res 10
-- Ranged Accuracy +6% (cap 15)
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4557)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 30)
    target:addMod(xi.mod.FOOD_MPP, 1)
    target:addMod(xi.mod.FOOD_MP_CAP, 110)
    target:addMod(xi.mod.DEX, 3)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.MND, -3)
    target:addMod(xi.mod.EARTH_MEVA, 10)
    target:addMod(xi.mod.FOOD_RACCP, 6)
    target:addMod(xi.mod.FOOD_RACC_CAP, 15)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 30)
    target:delMod(xi.mod.FOOD_MPP, 1)
    target:delMod(xi.mod.FOOD_MP_CAP, 110)
    target:delMod(xi.mod.DEX, 3)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.MND, -3)
    target:delMod(xi.mod.EARTH_MEVA, 10)
    target:delMod(xi.mod.FOOD_RACCP, 6)
    target:delMod(xi.mod.FOOD_RACC_CAP, 15)
end

return item_object
