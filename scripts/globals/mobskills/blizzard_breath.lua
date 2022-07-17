-----------------------------------
--  Blizzard Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Ice)
--
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
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.5, 1, xi.magic.ele.ICE, 700)
    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.ICE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.ICE)
    return dmg
end

return mobskill_object
