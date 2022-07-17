-----------------------------------
--  Foul Breath
--
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
--
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    -- not used in Uleguerand_Range
    if (mob:getZoneID() == 5) then
        return 1
    end
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local typeEffect = xi.effect.DISEASE
    xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 300)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.333, 0.625, xi.magic.ele.FIRE, 500)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end

return mobskill_object
