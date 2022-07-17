-----------------------------------
-- Earthen Ward
-- Titan grants Stoneskin to party members within area of effect.
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
    local typeEffect = xi.effect.STONESKIN
    local base = mob:getMainLvl()*2 + 50

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, base, 0, 180))

    return xi.effect.STONESKIN

end

return mobskill_object
