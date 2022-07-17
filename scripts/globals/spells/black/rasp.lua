-----------------------------------
-- Spell: Rasp
-- Deals earth damage that lowers an enemy's dexterity and gradually reduces its HP.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)

    if (target:getStatusEffect(xi.effect.CHOKE) ~= nil) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        -- local dINT = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = xi.mod.INT
        params.skillType = xi.skill.ELEMENTAL_MAGIC
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
        if (resist <= 0.125) then
            spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        else
            if (target:getStatusEffect(xi.effect.SHOCK) ~= nil) then
                target:delStatusEffect(xi.effect.SHOCK)
            end
            local sINT = caster:getStat(xi.mod.INT)
            local DOT = getElementalDebuffDOT(sINT)
            local effect = target:getStatusEffect(xi.effect.RASP)
            local noeffect = false
            if (effect ~= nil) then
                if (effect:getPower() >= DOT) then
                    noeffect = true
                end
            end
            if (noeffect) then
                spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
            else
                if (effect ~= nil) then
                    target:delStatusEffect(xi.effect.RASP)
                end
                spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
                local duration = math.floor(xi.settings.main.ELEMENTAL_DEBUFF_DURATION * resist)
                duration = duration + caster:getMerit(xi.merit.ELEMENTAL_DEBUFF_DURATION)

                local mbonus = caster:getMerit(xi.merit.ELEMENTAL_DEBUFF_EFFECT)
                DOT = DOT + mbonus/2 -- Damage

                target:addStatusEffect(xi.effect.RASP, DOT, 3, duration)
            end
        end
    end
    return xi.effect.RASP
end

return spell_object
