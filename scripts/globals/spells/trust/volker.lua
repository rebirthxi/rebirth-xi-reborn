-----------------------------------
-- Trust: Volker
-- If there is a NIN, PLD, or RUN in the party, behaves as a damage dealer: Uses Aggressor, Berserk.
-- If there are no other tanks in the party, behaves as a tank: Uses Defender, Retaliation.
-- Uses Provoke in either role to maintain enmity as a tank or off-tank.
-- Uses weapon skills at 2000 TP with Warrior's Charge if it's available; does not try to skillchain. (TODO)
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
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
        [xi.magic.spell.NAJI] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.CID] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.KLARA] = xi.trust.message_offset.TEAMWORK_3,
    })

    -- DD Mode
    mob:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.AGGRESSOR)
    mob:addSimpleGambit(ai.t.TANK, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    -- Tank Mode
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.DEFENDER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.RETALIATION)

    mob:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    -- TODO: Add Warriors Charge + WS Logic
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
