-----------------------------------
-- Spell: Sound Blast
-- Lowers Intelligence of enemies within range.
-- Spell cost: 25 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: None
-- Level: 32
-- Casting Time: 4 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Magic Attack Bonus
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.effect = xi.effect.INT_DOWN
    local resist = applyResistance(caster, target, spell, params)
    local duration = 30 * resist
    local power = 6

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(params.effect, power, 0, duration)) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spell_object
