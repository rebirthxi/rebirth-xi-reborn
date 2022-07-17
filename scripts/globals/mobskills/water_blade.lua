-----------------------------------
-- Water Blade
-- Description: Applies Enwater and absorbs Water damage.
-- Type: Enhancing
-- Used only by Kam'lanaut. Enwater aspect adds 70+ to his melee attacks.
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
    local typeEffect = xi.effect.ENWATER
    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, 65, 0, 60))
    return typeEffect
end

return mobskill_object
