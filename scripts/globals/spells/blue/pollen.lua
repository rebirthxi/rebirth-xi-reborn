-----------------------------------
-- Spell: Pollen
-- Restores HP
-- Spell cost: 8 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Light)
-- Blue Magic Points: 1
-- Stat Bonus: CHR+1, HP+5
-- Level: 1
-- Casting Time: 2 seconds
-- Recast Time: 5 seconds
-----------------------------------
-- Combos: Resist Sleep
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local minCure = 14
    local divisor = 1
    local constant = -6
    local power = getCurePowerOld(caster)

    if (power > 99) then
        divisor = 57
        constant = 33.125
    elseif (power > 59) then
        divisor =  2
        constant = 9
    end

    local final = getCureFinal(caster, spell, getBaseCureOld(power, divisor, constant), minCure, true)

    final = final + (final * (target:getMod(xi.mod.CURE_POTENCY_RCVD)/100))

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == xi.objType.PC or target:getObjType() == xi.objType.MOB)) then
        --Applying server mods
        final = final * xi.settings.main.CURE_POWER
    end

    local diff = (target:getMaxHP() - target:getHP())
    if (final > diff) then
        final = diff
    end
    target:addHP(final)

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == xi.objType.PC or target:getObjType() == xi.objType.MOB)) then
        caster:updateEnmityFromCure(target, final)
    end
    spell:setMsg(xi.msg.basic.MAGIC_RECOVERS_HP)

    return final
end

return spell_object
