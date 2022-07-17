-----------------------------------
--  Wild Rage
--
--  Description: Deals physical damage to enemies within area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 15' radial
--  Notes: Has additional effect of Poison when used by King Vinegarroon.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

local platoonScorpionPoolID  = 3157
local wildRageDamageIncrease = 0.10

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.1


    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    if mob:getPool() == platoonScorpionPoolID then
        -- should not have to verify because platoon scorps only in battlefield
        local num_scorps_dead= mob:getBattlefield():getLocalVar("[ODS]NumScorpsDead")

        -- Increase the strength of Wild Rage as scorps in the BC die
        -- https://ffxiclopedia.fandom.com/wiki/Operation_Desert_Swarm
        info.dmg = info.dmg * (1 + wildRageDamageIncrease * num_scorps_dead)
    end

    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.NUMSHADOWS_3)

    -- king vinegrroon
    if (mob:getPool() == 2262) then
        local typeEffect = xi.effect.POISON
        local power = 25
        xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60)
    end

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskill_object
