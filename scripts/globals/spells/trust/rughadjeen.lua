-----------------------------------
-- Trust: Rughadjeen
-- Possesses Fast Cast, Cure Potency Received +30%, Damage Taken -5%.
-- He wields the Algol and so has an enfire effect (TODO) and a 3% triple attack rate.
-- Uses Holy Circle if the enemy is Undead.
-- Will only cast Cure I - IV when a party member is below 75% (yellow) HP or asleep.
-- Tries to use weapon skills at 1000 TP, but it is lower priority.
-- Uses Chivalry at 50% MP if it's available.
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
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.NASHMEIRA] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.GADALAR] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.NAJELITH] = xi.trust.message_offset.TEAMWORK_3,
        [xi.magic.spell.ZAZARG] = xi.trust.message_offset.TEAMWORK_4,
        [xi.magic.spell.MIHLI_ALIAPOH] = xi.trust.message_offset.TEAMWORK_5
    })

    -- TODO: Load/Apply MODs from mob_pool_mods instead
    mob:addMod(xi.mod.FASTCAST, 30)
    mob:addMod(xi.mod.CURE_POTENCY_RCVD, 30)
    mob:addMod(xi.mod.DMG, -500)
    mob:addMod(xi.mod.TRIPLE_ATTACK, 3)
    -- TODO: Add en-fire effect from Algol

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL,ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DIVINE_EMBLEM,ai.r.JA, ai.s.SPECIFIC, xi.ja.DIVINE_EMBLEM)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HOLY)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.IS_ECOSYSTEM, xi.ecosystem.UNDEAD, ai.r.JA, ai.s.SPECIFIC, xi.ja.HOLY_CIRCLE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.CHIVALRY)

    -- TODO: Add Trust Synergy for Serpent Generals

    mob:addListener("WEAPONSKILL_USE", "RUGHADJEEN_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3237 then -- Victory Beacon
        -- Do not despair! The Goddess of Victory fights by our side!
            if math.random(100) <= 33 then
                xi.trust.message(mobArg, xi.trust.message_offset.SPECIAL_MOVE_1)
            end
        end
    end)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
