-----------------------------------
--  Nocturnal Combustion
--
--  Description: Self-destructs, releasing dark energy at nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20'  radial
--  Notes: Damage is based on remaining HP and time of day (more damaging near midnight). The djinn will not use this until it has been affected by the current day's element.
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
    local dmgmod = 1
    local bombTossHPP = skill:getMobHPP() / 100

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg()*20*bombTossHPP, xi.magic.ele.DARK, dmgmod, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    mob:setHP(0)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end

return mobskill_object
