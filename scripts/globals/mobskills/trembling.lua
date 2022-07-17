-----------------------------------
--  Trembling
--
--  Description: Deals physical damage to enemies within an area of effect. Additional effect: Dispel
--  Type: Physical
--  Wipes Shadows
--  Range: 10' radial
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 4
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
   local dispelled = math.random(2, 3)

   if (info.hitslanded ~= 0) then
      for i=1, dispelled do
         target:dispelStatusEffect()
      end
   end

   -- TODO: Dispelled messages.  No examples of damage+dispel working to crib notes from.

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskill_object
