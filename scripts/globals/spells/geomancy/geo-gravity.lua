-----------------------------------------
-- Spell: Geo-Gravity
-- Weighs down enemies within area of effect and lowers their movement speed.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/job_utils/geomancer")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.job_utils.geomancer.geoOnMagicCastingCheck(caster, target, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    xi.job_utils.geomancer.spawnLuopan(caster, target, spell)
end

return spell_object
