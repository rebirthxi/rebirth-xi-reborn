-----------------------------------
-- Temporal Shift
-- Family: Hpemde
-- Description: Enemies within range are temporarily prevented from acting.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15 yalms
-- Notes:
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
    local typeEffect = xi.effect.STUN

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 5))

    return typeEffect
end

return mobskill_object
