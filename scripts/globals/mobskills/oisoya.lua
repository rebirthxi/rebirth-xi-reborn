---------------------------------------------------
--  Oisoya
--  Description:
--  Type: Weaponskill
--  Utsusemi/Blink absorb:
--  Range: Ranged Attack
--  Notes: Unique ranged weaponskill used by Tenzen during The Warrior's Path. Also used by Trust: Tenzen II.
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/mobskills")
---------------------------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if
        mob:getAnimationSub() == 5 or
        mob:getAnimationSub() == 6
    then -- if tenzen is in bow mode
        return 0
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 5.5

    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, 2, 2.75, 2.75, 2.75)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
    return dmg
end

return mobskill_object
