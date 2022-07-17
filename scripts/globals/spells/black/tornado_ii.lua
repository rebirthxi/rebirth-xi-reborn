-----------------------------------
-- Spell: Tornado II
-----------------------------------
require("scripts/globals/spells/damage_spell")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    target:addStatusEffectEx(xi.effect.NINJUTSU_ELE_DEBUFF, 0, 30, 0, 10, 0, xi.mod.ICE_RES, 0)

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spell_object
