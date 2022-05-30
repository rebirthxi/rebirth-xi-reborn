-----------------------------------
-- Attachment: Eraser
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

local removable =
{
    xi.effect.PETRIFICATION,
    xi.effect.SILENCE,
    xi.effect.BANE,
    xi.effect.CURSE_II,
    xi.effect.CURSE_I,
    xi.effect.PARALYSIS,
    xi.effect.PLAGUE,
    xi.effect.POISON,
    xi.effect.DISEASE,
    xi.effect.BLINDNESS
}

attachment_object.onEquip = function(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_ERASER", function(automaton, target)
        local master = automaton:getMaster()
        if
            not automaton:hasRecast(xi.recast.ABILITY, xi.automaton.abilities.ERASER) and
            master and
            master:countEffect(xi.effect.LIGHT_MANEUVER) > 0
        then
            local erasetarget = false

            local function checkEffects(entity)
                for _, status in pairs(removable) do
                    if entity:hasStatusEffect(status) then return true end
                end
                return false
            end

            if automaton:hasStatusEffectByFlag(xi.effectFlag.ERASABLE) or checkEffects(automaton) then
                erasetarget = automaton
            elseif (automaton:checkDistance(master) - master:getModelSize()) < 7 and (master:hasStatusEffectByFlag(xi.effectFlag.ERASABLE) or checkEffects(master)) then
                erasetarget = master
            end

            if not erasetarget then
                return
            end

            automaton:useMobAbility(xi.automaton.abilities.ERASER, erasetarget)
        end
    end)
end

attachment_object.onUnequip = function(pet)
    pet:removeListener("ATTACHMENT_ERASER")
end

attachment_object.onManeuverGain = function(pet, maneuvers)
end

attachment_object.onManeuverLose = function(pet, maneuvers)
end

return attachment_object
