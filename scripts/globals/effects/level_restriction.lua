-----------------------------------
-- tpz.effect.LEVEL_RESTRICTION
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:levelRestriction(effect:getPower())
    target:messageBasic(314, effect:getPower()) -- <target>'s level is restricted to <param>

    if target:getObjType() == tpz.objType.PC then
        target:clearTrusts()
    end
end


function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:levelRestriction(0)
end

return effect_object
