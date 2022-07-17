-----------------------------------
-- Sickle Slash
-- Deals critical damage. Chance of critical hit varies with TP.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

-----------------------------------
-- onMobSkillCheck
-- Check for Grah Family id 122, 123, 124
-- if not in Spider form, then ignore.
-----------------------------------
mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if ((mob:getFamily() == 122 or mob:getFamily() == 123 or mob:getFamily() == 124) and mob:getAnimationSub() ~= 2) then
        return 1
    else
        return 0
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = math.random(2, 4) + math.random()
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.CRIT_VARIES, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskill_object
