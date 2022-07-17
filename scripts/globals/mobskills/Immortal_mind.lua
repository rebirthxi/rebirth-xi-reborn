-----------------------------------
-- Immortal Mind
-- Description: Gains Magic Attack Bonus and Magic Defense Bonus.
-- Type: Self
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
    local typeEffect1 = xi.effect.MAGIC_ATK_BOOST
    local typeEffect2 = xi.effect.MAGIC_DEF_BOOST
    local mabTotal = 10
    local mdbTotal = 10

    if mob:getStatusEffect(xi.effect.MAGIC_ATK_BOOST) ~= nil then
        mabTotal = mabTotal:getPower() + 10
    end
    if mob:getStatusEffect(xi.effect.MAGIC_DEF_BOOST) ~= nil then
        mabTotal = mabTotal:getPower() + 10
    end

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect1, mabTotal, 0, 180))
    xi.mobskills.mobBuffMove(mob, typeEffect2, mdbTotal, 0, 180)

    return typeEffect1
end

return mobskill_object
