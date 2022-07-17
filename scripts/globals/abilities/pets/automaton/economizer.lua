-----------------------------------
-- Economizer
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
    automaton:addRecast(xi.recast.ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(xi.effect.DARK_MANEUVER)
    local amount = math.floor(automaton:getMaxMP() * 0.2 * maneuvers)
    skill:setMsg(xi.msg.basic.SKILL_RECOVERS_MP)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(xi.effect.DARK_MANEUVER)
    end

    return automaton:addMP(amount)
end

return ability_object
