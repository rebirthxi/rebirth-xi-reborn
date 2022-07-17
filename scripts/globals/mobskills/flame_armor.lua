-----------------------------------
-- Flame Armor
--
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
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
    local power = 50
    local duration = 180
    local typeEffect = xi.effect.BLAZE_SPIKES

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect
end

return mobskill_object
