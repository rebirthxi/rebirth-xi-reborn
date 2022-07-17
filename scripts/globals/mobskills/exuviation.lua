-----------------------------------
-- Exuviation
-- Family: Wamoura
-- Type: Healing and Full Erase
-- Range: Self
-- Notes: Erases all negative effects on the mob and heals an amount for each removed.
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
    local baseHeal = 500
    local statusHeal = 300
    local effectCount = 0
    local dispel = mob:eraseStatusEffect()

    while (dispel ~= xi.effect.NONE)
    do
        effectCount = effectCount + 1
        dispel = mob:eraseStatusEffect()
    end

    skill:setMsg(xi.msg.basic.SELF_HEAL)
    return xi.mobskills.mobHealMove(mob, statusHeal * effectCount + baseHeal)
end

return mobskill_object
