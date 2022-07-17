-----------------------------------
--  Ill Wind
--  Description: Deals Wind damage to enemies within an area of effect. Additional effect: Dispel
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes Shadows
--  Range: Unknown radial
--  Notes: Only used by Puks in Mamook, Besieged, and the following Notorious Monsters: Vulpangue, Nis Puk, Nguruvilu, Seps , Phantom Puk and Waugyl. Dispels one xi.effect.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")

-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if (mob:getFamily() == 316 and mob:getModelId() == 1746) then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.5, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:dispelStatusEffect()
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WIND)

    return dmg
end

return mobskill_object
