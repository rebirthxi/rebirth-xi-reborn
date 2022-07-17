-----------------------------------
-- Aeolian Void
--
-- Description: Fan AoE damage plus Silence and Blind
-- Type: Earth Damage/Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffectOne = xi.effect.SILENCE
    local typeEffectTwo = xi.effect.BLINDNESS

    xi.mobskills.mobStatusEffectMove(mob, target, typeEffectOne, 1, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, typeEffectTwo, 15, 0, 60)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.25, 2.5, xi.magic.ele.EARTH, 300)
    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.EARTH, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.EARTH)
    return dmg
end

return mobskill_object
