-----------------------------------
-- Charm
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.CHARM_I
    local power = 0

    if (not target:isPC()) then
        skill:setMsg(xi.msg.basic.SKILL_MISS)
        return typeEffect
    end

    local msg = xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, power, 3, 150)
    if (msg == xi.msg.basic.SKILL_ENFEEB_IS) then
        mob:charm(target)
    end
    skill:setMsg(msg)

    return typeEffect
end

return mobskill_object
