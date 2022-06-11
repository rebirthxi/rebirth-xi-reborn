-----------------------------------------
-- Spell: Indi-Languor
-- Reduces magic evasion of enemies near the caster.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/job_utils/geomancer")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.job_utils.geomancer.indiOnMagicCastingCheck(caster, target, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
   return xi.job_utils.geomancer.doIndiSpell(caster, target, spell)
end

return spell_object
