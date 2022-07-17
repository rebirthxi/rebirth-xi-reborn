-----------------------------------
-- Hundred Fists
-- Meant for Ix'Aern (MNK)
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if (mob:getPool() == 4661 and mob:getHPP() <= 50
    and mob:getLocalVar("BracerMode") == 1) then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.HUNDRED_FISTS
    xi.mobskills.mobBuffMove(mob, typeEffect, 1, 0, 45)
    mob:setLocalVar("BracerMode", 2)
    skill:setMsg(xi.msg.basic.USES)
    return typeEffect
end

return mobskill_object
