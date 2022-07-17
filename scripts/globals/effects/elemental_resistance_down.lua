-----------------------------------
-- xi.effect.ELEMENTAL_RESISTANCE_DOWN
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FIRE_MEVA, -effect:getPower())
    target:addMod(xi.mod.ICE_MEVA, -effect:getPower())
    target:addMod(xi.mod.WIND_MEVA, -effect:getPower())
    target:addMod(xi.mod.EARTH_MEVA, -effect:getPower())
    target:addMod(xi.mod.THUNDER_MEVA, -effect:getPower())
    target:addMod(xi.mod.WATER_MEVA, -effect:getPower())
    target:addMod(xi.mod.LIGHT_MEVA, -effect:getPower())
    target:addMod(xi.mod.DARK_MEVA, -effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FIRE_MEVA, -effect:getPower())
    target:delMod(xi.mod.ICE_MEVA, -effect:getPower())
    target:delMod(xi.mod.WIND_MEVA, -effect:getPower())
    target:delMod(xi.mod.EARTH_MEVA, -effect:getPower())
    target:delMod(xi.mod.THUNDER_MEVA, -effect:getPower())
    target:delMod(xi.mod.WATER_MEVA, -effect:getPower())
    target:delMod(xi.mod.LIGHT_MEVA, -effect:getPower())
    target:delMod(xi.mod.DARK_MEVA, -effect:getPower())
end

return effect_object
