-----------------------------------
-- Flame Breath
-- Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
-- Type: Magical Fire (Element)
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

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.2, 0.75, xi.magic.ele.FIRE, 600)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end

return mobskill_object
