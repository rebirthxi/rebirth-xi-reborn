-----------------------------------
-- Purulent Ooze
-- Family: Slugs
-- Description: Deals Water damage in a fan-shaped area of effect. Additional effect: Bio and Max HP Down
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Cone
-- Notes:
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
    local dmgmod = 1
    local baseDamage = mob:getWeaponDmg()*3
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, baseDamage, xi.magic.ele.WATER, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WATER, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BIO, 5, 3, 120, 0, 10)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.MAX_HP_DOWN, 10, 0, 120)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WATER)
    return dmg
end

return mobskill_object
