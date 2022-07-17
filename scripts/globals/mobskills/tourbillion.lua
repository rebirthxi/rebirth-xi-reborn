-----------------------------------
--  Tourbillion
--
--  Description: Delivers an area attack. Additional effect duration varies with TP. Additional effect: Weakens defense.
--  Type: Physical
--  Shadow per hit
--  Range: Unknown range
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1805) then
        return 0
    else
        return 1
    end
  end
   --[[TODO: Khimaira should only use this when its wings are up, which is animationsub() == 0.
   There's no system to put them "down" yet, so it's not really fair to leave it active.
   Tyger's fair game, though. :)]]
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 1.5
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    local duration = 20 * (skill:getTP() / 1000)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.DEFENSE_DOWN, 20, 0, duration)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskill_object
