-----------------------------------
-- Jet Stream
-- Delivers a threefold attack. Accuracy varies with TP.
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
    local dmgmod = 0.9 + (mob:getMainLvl() / 100)
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.ACC_VARIES, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskill_object
