-----------------------------------
-- Goblin Dice
--
-- Description: Stun
-- Type: Physical (Blunt)
--
--
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
    local effect = target:dispelStatusEffect()
    local effect2 = target:dispelStatusEffect()
    local effect3 = target:dispelStatusEffect()
    local num = 0

    if (effect ~= xi.effect.NONE) then
        num = num + 1
    end

    if (effect2 ~= xi.effect.NONE) then
        num = num + 1
    end

    if (effect3 ~= xi.effect.NONE) then
        num = num + 1
    end

    if (num == 0) then
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(xi.msg.basic.DISAPPEAR_NUM)
    end

    return num
end

return mobskill_object
