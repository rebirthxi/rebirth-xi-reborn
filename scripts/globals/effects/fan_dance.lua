-----------------------------------
-- xi.effect.FAN_DANCE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(xi.effect.HASTE_SAMBA)
    target:delStatusEffect(xi.effect.ASPIR_SAMBA)
    target:delStatusEffect(xi.effect.DRAIN_SAMBA)
    target:delStatusEffect(xi.effect.SABER_DANCE)
    target:addMod(xi.mod.ENMITY, 15)
    target:addMod(xi.mod.UDMGPHYS, effect:getPower())
    target:addListener("ATTACKED", "FAN_DANCE_DMG_REDUCE", function(dancer, attacker)
        local fanDanceEffect = dancer:getStatusEffect(xi.effect.FAN_DANCE)
        local power = fanDanceEffect:getPower()
        local decayby = 1000
        print("Power is " .. power)
        if power > 2000 then
            fanDanceEffect:setPower(power - decayby)
            dancer:delMod(xi.mod.UDMGPHYS, decayby)
        end
    end)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ENMITY, 15)
    target:delMod(xi.mod.UDMGPHYS, effect:getPower())
    target:removeListener("FAN_DANCE_DMG_REDUCE")
end

return effect_object
