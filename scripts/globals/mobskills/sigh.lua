-----------------------------------
-- Sigh
--
-- Description: Self Evasion Boost. Extremely potent, but quickly decays over time.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Very sharp evasion increase.
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
    local typeEffect = xi.effect.EVASION_BOOST

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, 50, 0, 30))
    return typeEffect
end

return mobskill_object
