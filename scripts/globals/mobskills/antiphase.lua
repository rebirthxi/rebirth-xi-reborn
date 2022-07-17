-----------------------------------
-- Antiphase
--
-- Description: Silence Area of Effect (15.0')
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
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
    local typeEffect = xi.effect.SILENCE

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 60))

    return typeEffect
end

return mobskill_object
