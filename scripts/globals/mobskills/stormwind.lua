-----------------------------------
--  Stormwind
--
--  Description: Creates a whirlwind that deals Wind damage to targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes:
-----------------------------------
local mobskill_object = {}

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 1

    if (mob:getName() == "Kreutzet") then
        local stormwindDamage = mob:getLocalVar("stormwindDamage")
        if (stormwindDamage == 2) then
            dmgmod = 1.25
        elseif (stormwindDamage == 3) then
            dmgmod = 1.6
        end
    end

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WIND)
    return dmg
end

return mobskill_object
