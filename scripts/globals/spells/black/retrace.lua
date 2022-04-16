-----------------------------------
-- Spell: Retrace
-- Transports player to their Allied Nation. Can cast on allies.
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    if target:getCampaignAllegiance() == 0 then
        return 48
    else
        return 0
    end
end

spell_object.onSpellCast = function(caster, target, spell)
    if target:getCampaignAllegiance() > 0 then
        target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.RETRACE, 0, 4)
        spell:setMsg(xi.msg.basic.MAGIC_TELEPORT)
    else
        spell:setMsg(xi.msg.basic.NONE)
    end
    return 0
end

return spell_object
