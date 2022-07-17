-----------------------------------
--  Triclip
--
--  Description: Deals damage in a threefold attack. Additional effect: DEX Down
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
--  Notes:
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

    local numhits = 3
    local accmod = 1
    local dmgmod = 1.3
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    local typeEffect = xi.effect.DEX_DOWN

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 120)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskill_object
