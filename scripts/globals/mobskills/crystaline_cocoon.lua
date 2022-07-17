-----------------------------------
-- Crystaline Cocoon
-- Family: Aern
-- Type: Enhancing
-- Can be dispelled: Yes
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
    local typeEffect1 = xi.effect.PROTECT
    local typeEffect2 = xi.effect.SHELL
    local power1 = 50
    local power2 = 20
    local duration = 300

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect1, power1, 0, duration))
    xi.mobskills.mobBuffMove(mob, typeEffect2, power2, 0, duration)

    return typeEffect1
end

return mobskill_object
