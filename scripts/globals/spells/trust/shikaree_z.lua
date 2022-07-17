-----------------------------------
-- Trust: Shikaree Z
-- Possesses MP+100%
-- Uses Ancient Circle if the enemy is a dragon
-- Super Jump is used when ShikareeZ is in the top enmity slot
-- Gains 205 TP on hit; has high TP return on Jump (655 TP) and High Jump (1065 TP).
-- TODO: Add/Apply MOD for HIGH_JUMP_TP_BONUS
-- Holds TP to 2000 to try to close skillchains. (TODO)
-- Saves Cure for party members under 50% HP or affected by Sleep
-- Prioritizes Haste over other spells, except to cast Erase when Slow would prevent Haste.
-----------------------------------
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

    -- TODO: Load/Apply MODs from mob_pool_mods instead
    mob:addMod(xi.mod.MPP, 100)
    mob:addMod(xi.mod.STORETP, 174)
    mob:addMod(xi.mod.JUMP_TP_BONUS, 164)

    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, xi.effect.SLOW, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.STATUS, xi.effect.SLOW, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.IS_ECOSYSTEM, xi.ecosystem.DRAGON, ai.r.JA, ai.s.SPECIFIC, xi.ja.ANCIENT_CIRCLE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.JUMP)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.HIGH_JUMP)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SUPER_JUMP)

    -- TODO: Hold TP to 2000 before closing SC
    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
