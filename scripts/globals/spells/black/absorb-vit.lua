-----------------------------------
-- Spell: Absorb-VIT
-- Steals an enemy's vitality.
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

    if (target:hasStatusEffect(xi.effect.VIT_DOWN) or caster:hasStatusEffect(xi.effect.VIT_BOOST)) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        -- local dINT = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = xi.mod.INT
        params.skillType = xi.skill.DARK_MAGIC
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
        if (resist <= 0.125) then
            spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        else
            spell:setMsg(xi.msg.basic.MAGIC_ABSORB_VIT)
            caster:addStatusEffect(xi.effect.VIT_BOOST, xi.settings.main.ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(xi.mod.AUGMENTS_ABSORB)))/100), xi.settings.main.ABSORB_SPELL_TICK, xi.settings.main.ABSORB_SPELL_AMOUNT*xi.settings.main.ABSORB_SPELL_TICK) -- caster gains VIT
            target:addStatusEffect(xi.effect.VIT_DOWN, xi.settings.main.ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(xi.mod.AUGMENTS_ABSORB)))/100), xi.settings.main.ABSORB_SPELL_TICK, xi.settings.main.ABSORB_SPELL_AMOUNT*xi.settings.main.ABSORB_SPELL_TICK)    -- target loses VIT
        end
    end
    return xi.effect.VIT_DOWN
end

return spell_object
