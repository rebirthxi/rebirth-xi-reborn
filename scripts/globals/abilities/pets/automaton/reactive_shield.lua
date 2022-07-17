-----------------------------------
-- Reactive Shield
-----------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

ability_object.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(xi.recast.ABILITY, skill:getID(), 65)
    local pMod = automaton:getSkillLevel(xi.skill.AUTOMATON_MAGIC)
    local duration = 60
    local power = math.floor((pMod/56)^3 / 8) + 4 -- No idea how the actual formula used Automaton skill level, so heres a placeholder (4 @ lvl 1, 10 @ lvl 61, 20 @ lvl 75, 62 @ lvl 99)

    if target:addStatusEffect(xi.effect.BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
    end

    return xi.effect.BLAZE_SPIKES
end

return ability_object
