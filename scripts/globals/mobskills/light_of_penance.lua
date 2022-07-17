-----------------------------------
-- Light of Penance
--
-- Description: Reduces an enemy's TP. Additional effect: Blindness and "Bind".
-- Type: Magical (Light)
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local tpReduced = 0
    target:setTP(tpReduced)

    xi.mobskills.mobGazeMove(mob, target, xi.effect.BLINDNESS, 20, 0, 120)

    xi.mobskills.mobGazeMove(mob, target, xi.effect.BIND, 1, 0, 30)

    skill:setMsg(xi.msg.basic.TP_REDUCED)

    return tpReduced
end

return mobskill_object
