-----------------------------------
-- Sidewinder
-- Trust: Semih Lafihna
-- Delivers an inaccurate attack that deals quintuple damage. Accuracy varies with TP.
-- Reverberation/Transfixtion/Detonation skillchain properties
-- Modifiers: STR:20%; AGI:50%
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
    local dmgmod = 5.0
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, xi.mobskills.shadowBehavior.NUMSHADOWS_1)
    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
    return dmg
end

return mobskill_object
