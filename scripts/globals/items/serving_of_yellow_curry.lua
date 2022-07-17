-----------------------------------
-- ID: 4517
-- Item: serving_of_yellow_curry
-- Food Effect: 3hours, All Races
-----------------------------------
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- HP Recovered While Healing 2
-- MP Recovered While Healing 1
-- Attack 21% (caps @ 75)
-- Ranged Attack 21% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4require("scripts/globals/status")
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4517)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 5)
    target:addMod(xi.mod.AGI, 2)
    target:addMod(xi.mod.INT, -4)
    target:addMod(xi.mod.HPHEAL, 2)
    target:addMod(xi.mod.MPHEAL, 1)
    target:addMod(xi.mod.FOOD_ATTP, 21)
    target:addMod(xi.mod.FOOD_ATT_CAP, 75)
    target:addMod(xi.mod.FOOD_RATTP, 21)
    target:addMod(xi.mod.FOOD_RATT_CAP, 75)
    target:addMod(xi.mod.SLEEPRES, 3)
    target:addMod(xi.mod.STUNRES, 4)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 5)
    target:delMod(xi.mod.AGI, 2)
    target:delMod(xi.mod.INT, -4)
    target:delMod(xi.mod.HPHEAL, 2)
    target:delMod(xi.mod.MPHEAL, 1)
    target:delMod(xi.mod.FOOD_ATTP, 21)
    target:delMod(xi.mod.FOOD_ATT_CAP, 75)
    target:delMod(xi.mod.FOOD_RATTP, 21)
    target:delMod(xi.mod.FOOD_RATT_CAP, 75)
    target:delMod(xi.mod.SLEEPRES, 3)
    target:delMod(xi.mod.STUNRES, 4)
end

return item_object
