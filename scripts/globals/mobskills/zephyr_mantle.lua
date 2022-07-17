-----------------------------------
--  Zephyr Mantle
--
--  Description: Creates shadow images that each absorb a single attack directed at you.
--  Type: Magical (Wind)
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
    local base = math.random(4, 10)
    local typeEffect = xi.effect.BLINK
    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, base, 0, 180))
    return typeEffect
end

return mobskill_object
