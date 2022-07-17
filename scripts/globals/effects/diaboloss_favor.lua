-----------------------------------
-- xi.effect.DIABOLOSS_FAVOR
-----------------------------------
require("scripts/globals/status")
-----------------------------------

local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.REFRESH, effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.REFRESH, effect:getPower())
end

return effect_object
