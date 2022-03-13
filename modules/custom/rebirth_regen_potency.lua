-----------------------------------
-- Rebirth Regen Potency Buff
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("rebirth_potency_buff")
m:setEnabled(true)

m:addOverride("xi.globals.spells.white.regen.onSpellCast", function(caster, target, spell)
    local hp = math.ceil(5 * (1 + 0.01 * caster:getMod(xi.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(xi.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(xi.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts
    hp = hp + caster:getMod(xi.mod.REGEN_BONUS)      -- bonus hp from jobpoint gift
    hp = hp + caster:getMod(xi.mod.REGEN_POTENCY) -- regen potency from eq

    local duration = calculateDuration(75 + caster:getMod(xi.mod.REGEN_DURATION), spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 21, target:getMainLvl())
    duration = duration + (caster:getJobPointLevel(xi.jp.REGEN_DURATION) * 3)

    if target:addStatusEffect(xi.effect.REGEN, hp, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return xi.effect.REGEN
end)

m:addOverride("xi.globals.spells.white.regen_ii.onSpellCast", function(caster, target, spell)
    local hp = math.ceil(12 * (1 + 0.01 * caster:getMod(xi.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(xi.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(xi.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts
    hp = hp + caster:getMod(xi.mod.REGEN_BONUS)      -- bonus hp from jobpoint gift
    hp = hp + caster:getMod(xi.mod.REGEN_POTENCY) -- regen potency from eq

    local duration = calculateDuration(60 + caster:getMod(xi.mod.REGEN_DURATION), spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 44, target:getMainLvl())
    duration = duration + (caster:getJobPointLevel(xi.jp.REGEN_DURATION) * 3)

    if target:addStatusEffect(xi.effect.REGEN, hp, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return xi.effect.REGEN
end)

m:addOverride("xi.globals.spells.white.regen_iii.onSpellCast", function(caster, target, spell)
    local hp = math.ceil(20 * (1 + 0.01 * caster:getMod(xi.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(xi.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(xi.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts
    hp = hp + caster:getMod(xi.mod.REGEN_BONUS)      -- bonus hp from jobpoint gift
    hp = hp + caster:getMod(xi.mod.REGEN_POTENCY) -- regen potency from eq

    local duration = calculateDuration(60 + caster:getMod(xi.mod.REGEN_DURATION), spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 66, target:getMainLvl())
    duration = duration + (caster:getJobPointLevel(xi.jp.REGEN_DURATION) * 3)

    if target:addStatusEffect(xi.effect.REGEN, hp, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return xi.effect.REGEN
end)

m:addOverride("xi.globals.spells.white.regen_iv.onSpellCast", function(caster, target, spell)
    local hp = math.ceil(30 * (1 + 0.01 * caster:getMod(xi.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(xi.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(xi.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts
    hp = hp + caster:getMod(xi.mod.REGEN_BONUS)      -- bonus hp from jobpoint gift
    hp = hp + caster:getMod(xi.mod.REGEN_POTENCY) -- regen potency from eq

    local duration = calculateDuration(60 + caster:getMod(xi.mod.REGEN_DURATION), spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 86, target:getMainLvl())
    duration = duration + (caster:getJobPointLevel(xi.jp.REGEN_DURATION) * 3)

    if target:addStatusEffect(xi.effect.REGEN, hp, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return xi.effect.REGEN
end)

return m

