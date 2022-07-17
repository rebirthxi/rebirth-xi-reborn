-----------------------------------
-- ID: 6565
-- Item: Persikos Snow Cone
-- Food Effect: 5 minutes, all Races
-----------------------------------
-- MP +35% (Max. 50 @ 143 Base MP)
-- INT +3
-- [Element: Air]+5
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 6565)
end
item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_MPP, 35)
    target:addMod(xi.mod.FOOD_MP_CAP, 50)
    target:addMod(xi.mod.INT, 3)
    target:addMod(xi.mod.WIND_MEVA, 5)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_MPP, 35)
    target:delMod(xi.mod.FOOD_MP_CAP, 50)
    target:delMod(xi.mod.INT, 3)
    target:delMod(xi.mod.WIND_MEVA, 5)
end

return item_object
