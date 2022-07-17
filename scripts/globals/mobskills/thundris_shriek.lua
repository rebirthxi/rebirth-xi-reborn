-----------------------------------
-- Thundris Shriek
--
-- Description: Deals heavy lightning damage to targets in area of effect. Additional effect: Terror
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown
-- Notes: Players will begin to be intimidated by the dvergr after this attack.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1840) then
        return 0
    else
        return 1
    end
  end

  if (mob:getFamily() == 91) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1839) then
        return 0
    else
        return 1
    end
  end

  return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.TERROR

    xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 15)

    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg()*5, xi.magic.ele.THUNDER, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.LIGHTNING, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.LIGHTNING)
    return dmg
end

return mobskill_object
