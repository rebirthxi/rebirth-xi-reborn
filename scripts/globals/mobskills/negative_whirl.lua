-----------------------------------
--  Negative Whirl
--
--  Description: Slow Wipes shadows
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' cone
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.SLOW

    xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1250, 0, 120)

    local dmgmod = 1

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WIND)
    return dmg
end

return mobskill_object
