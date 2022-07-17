-----------------------------------
--  Plague Swipe
--
--  Description: Delivers a threefold attack in an cone effect behind user. Additional effect: Bio + Plague
--  Type: Physical
--  2-3 Shadows
--  Range: Backward Arc
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    -- TODO: Replace this when there's a better method than isFacingTheSameDirection() aka isBehind
    if (target:isBehind(mob) == false) then
        return 1
    end
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

   xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.BIO, 7, 3, 60)
   xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.PLAGUE, 5, 3, 60)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskill_object
