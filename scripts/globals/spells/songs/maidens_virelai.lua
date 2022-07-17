-----------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    if (caster:getPet() ~= nil) then
        return xi.msg.basic.ALREADY_HAS_A_PET
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return xi.msg.basic.THAT_SOMEONES_PET
    end

    -- Per wiki, Virelai wipes all shadows even if it resists or the target is immune to charm
    -- This can't be done in the onSpellCast function (that runs after it "hits")
    spell:setFlag(xi.magic.spellFlag.WIPE_SHADOWS)

    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    -- local dCHR = (caster:getStat(xi.mod.CHR) - target:getStat(xi.mod.CHR))
    local bonus = 0 -- No idea what value, but seems likely to need this edited later to get retail resist rates.
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = bonus
    params.effect = xi.effect.CHARM_I
    local resist = applyResistanceEffect(caster, target, spell, params)

    if (resist >= 0.25 and caster:getCharmChance(target, false) > 0) then
        spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        if (caster:isMob()) then
            target:addStatusEffect(xi.effect.CHARM_I, 0, 0, 30*resist)
            caster:charm(target)
        else
            caster:charmPet(target)
        end
    else
        -- Resist
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return xi.effect.CHARM_I
end

return spell_object
