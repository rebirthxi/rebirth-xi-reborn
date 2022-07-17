---------------------------------------------------
--  Cosmic Elucidation
--  Description: Cosmic Elucidation inflicts heavy AOE damage to everyone in the battle.
--  Type:
--  Utsusemi/Blink absorb: Ignores shadows
--  Range:
--  Notes: Ejects all combatants from the battlefield, resulting in a failure.
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/mobskills")
require("scripts/globals/msg")
---------------------------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 1 -- only scripted use
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 2
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 21, xi.magic.ele.LIGHT, dmgmod, xi.mobskills.magicalTpBonus.DMG_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.LIGHT, 0)

    dmg = math.min(0, dmg) -- Cosmic Elucidation does not have an absorb message

    target:takeDamage(dmg, mob, xi.attackType.SPECIAL, xi.damageType.ELEMENTAL)
    skill:setMsg(302)

    return dmg

end

return mobskill_object
