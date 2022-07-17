-----------------------------------
-- xi.effect.RAMUHS_FAVOR
-----------------------------------
require("scripts/globals/status")
---------------------------------------------

local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.CRITHITRATE, effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.CRITHITRATE, effect:getPower())
end

return effect_object
