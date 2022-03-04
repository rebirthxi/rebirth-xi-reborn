-----------------------------------
-- Change the Potency on the spell Gravity
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("gravity_potency")
m:setEnabled(true)

m:addOverride("xi.globals.spells.black.gravity.onSpellCast", function(caster, target, spell)
    local base_potency = 50
    local base_duration = 120

    -- Pull base stats.
    local dINT = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)

    local power = calculatePotency(base_potency, spell:getSkillType(), caster, target)

    -- Duration, including resistance.  Unconfirmed.
    local duration = calculateDuration(base_duration, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.WEIGHT
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then --Do it!
        if target:addStatusEffect(params.effect, power, 0, duration * resist) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST_2)
    end

    return params.effect
end)

return m

