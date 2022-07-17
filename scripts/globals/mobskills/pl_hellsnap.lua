-----------------------------------
-- Hellsnap
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    local mobSkin = mob:getModelId()

    if (mobSkin == 1839) then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 10
    local dmgmod = 4.0
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded*math.random(2, 3))
    local typeEffect = xi.effect.STUN

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end

return mobskill_object
