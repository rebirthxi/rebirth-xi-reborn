-----------------------------------
-- Trust: Sylvie UC
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)
    local master = mob:getMaster()
    local mJob   = master:getMainJob()

    -- TODO: Nott weaponskill needs implemented and logic added here for Apururu to use at 50% MP at level 50.
    -- Has Regain (50/tick) and uses Nott when MP falls below 66%.
    -- cure IV cures 456 HP @99

    mob:addMod(xi.mod.GEOMANCY_SKILL, 8 * mob:getMainLvl() + 1)
    mob:addMod(xi.mod.INDI_DURATION, 180)
    mob:addMod(xi.mod.REGAIN, 50)

    if mob:getMainLvl() >= 99 then
        mob:addMod(xi.mod.GEOMANCY_BONUS, 3)
    end

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.MASTER, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)

    if mob:getMainLvl() >= 20 then
        mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COLURE_ACTIVE, ai.r.MA, ai.s.BEST_INDI, xi.magic.spellFamily.NONE)
    end

    if mob:getMainLvl() >= 93 and mJob ~= xi.job.GEO then
        mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, xi.jobAbility.ENTRUST)
        mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, xi.effect.ENTRUST, ai.r.MA, ai.s.ENTRUSTED, xi.magic.spellFamily.INDI_BUFF)
    end

    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE)
    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE)

    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
