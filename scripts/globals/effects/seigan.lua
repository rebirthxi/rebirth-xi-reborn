-----------------------------------
-- tpz.effect.SEIGAN
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.COUNTER, (target:getMod(tpz.mod.ZANSHIN)/4))
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.COUNTER, (target:getMod(tpz.mod.ZANSHIN)/4))
end

return effect_object
