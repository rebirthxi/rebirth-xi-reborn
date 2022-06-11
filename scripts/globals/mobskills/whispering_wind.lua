-----------------------------------
-- Whispering Wind
--
-- Description: Restores HP
-- Type: Magical (Wind)
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    -- Formula needs redone with retail MOB VERSION not players avatar
    local base = mob:getMainLvl() + 2*mob:getMainLvl()*(skill:getTP()/1000) --base is around 5~150 level depending
    local m = 5
    local multiplier = 1+(1- (mob:getHP()/mob:getMaxHP())) * m    --higher multiplier the lower your HP. at 15% HP, multiplier is 1+0.85*M
    base = base * multiplier

    skill:setMsg(xi.msg.basic.SELF_HEAL)

    return xi.mobskills.mobHealMove(target, base)
end

return mobskill_object
