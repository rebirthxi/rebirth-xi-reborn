-----------------------------------
-- Spirit Tap
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(xi.mobskills.mobType.NOTORIOUS) then
        return 1
    end
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    -- try to drain buff
    local effect = mob:stealStatusEffect(target, xi.effectFlag.DISPELABLE)
    local dmg = 0

    if (effect ~= 0) then
        skill:setMsg(xi.msg.basic.EFFECT_DRAINED)
        return 1
    else
        -- time to drain HP. 50-100
        local power = math.random(0, 51) + 50
        dmg = xi.mobskills.mobFinalAdjustments(power, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

        skill:setMsg(xi.mobskills.mobPhysicalDrainMove(mob, target, skill, xi.mobskills.drainType.HP, dmg))
    end

    return dmg
end

return mobskill_object
