-----------------------------------
-- Awful Eye
-- 15' Reduces STR of players in area of effect.
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
    local typeEffect = xi.effect.STR_DOWN

    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, typeEffect, 33, 3, 120))
    return typeEffect
end

return mobskill_object
