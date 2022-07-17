-----------------------------------
--  Thunder Breath
--
--  Description: Deals thunder damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Thunder)
--
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if target:isInDynamis() or target:hasStatusEffect(xi.effect.BATTLEFIELD)  then
        return 0
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.5, 1, xi.magic.ele.THUNDER, 700)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.LIGHTNING, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.LIGHTNING)
    return dmg
end

return mobskill_object
