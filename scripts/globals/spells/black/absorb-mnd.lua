-----------------------------------
-- Spell: Absorb-MND
-- Steals an enemy's mind.
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

    if (target:hasStatusEffect(xi.effect.MND_DOWN) or caster:getStatusEffect(xi.effect.MND_BOOST)) then
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
            spell:setMsg(xi.msg.basic.MAGIC_ABSORB_MND)
            caster:addStatusEffect(xi.effect.MND_BOOST, xi.settings.main.ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(xi.mod.AUGMENTS_ABSORB)))/100), xi.settings.main.ABSORB_SPELL_TICK, xi.settings.main.ABSORB_SPELL_AMOUNT*xi.settings.main.ABSORB_SPELL_TICK) -- caster gains MND
            target:addStatusEffect(xi.effect.MND_DOWN, xi.settings.main.ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(xi.mod.AUGMENTS_ABSORB)))/100), xi.settings.main.ABSORB_SPELL_TICK, xi.settings.main.ABSORB_SPELL_AMOUNT*xi.settings.main.ABSORB_SPELL_TICK)    -- target loses MND
        end
    end
    return xi.effect.MND_DOWN
end

return spell_object
