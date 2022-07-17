-----------------------------------
-- Slumber Powder
-- 10' AoE sleep
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
    local typeEffect = xi.effect.SLEEP_I
    local power = math.random(15, 20) + mob:getMainLvl()/4


    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, power))

    return typeEffect
end

return mobskill_object
