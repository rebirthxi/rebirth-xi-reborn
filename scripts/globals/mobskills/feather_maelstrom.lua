-----------------------------------
-- Feather Maelstrom
-- Sends a storm of feathers to a single target.
-- Additional effect: Bio & Amnesia
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
    local typeEffect1 = xi.effect.BIO
    local typeEffect2 = xi.effect.AMNESIA
    local numhits = 1
    local accmod = 2
    local dmgmod = 2.8
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, info.hitslanded)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 6, 3, 60)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 0, 60)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)
    return dmg
end

return mobskill_object
