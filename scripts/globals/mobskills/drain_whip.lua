-----------------------------------
-- Drain Whip
--
-- Description: Drains HP, MP, or TP from the target.
-- Type: Magical
-- Utsusemi/Blink absorb: ignores shadows
-- Range: Melee
--
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
    local drainEffect = xi.mobskills.drainType.HP
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, xi.magic.ele.DARK, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    local rnd = math.random(3)
    if rnd == 1 then
        drainEffect = xi.mobskills.drainType.TP
    elseif rnd == 2 then
        drainEffect = xi.mobskills.drainType.MP
    end

    skill:setMsg(xi.mobskills.mobPhysicalDrainMove(mob, target, skill, drainEffect, dmg))

    return dmg
end

return mobskill_object
