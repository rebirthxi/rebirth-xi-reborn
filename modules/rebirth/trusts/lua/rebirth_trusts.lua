-----------------------------------
-- Module ensures that players have the correct trusts and updates their AIs
-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("rebirth_trusts")

---
--- Koru-Moru
---
--- Red Mage meant to assist melee focused parties
---
m:addOverride("xi.globals.spells.trust.koru-moru.onMobSpawn", function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.SHANTOTTO] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.SHANTOTTO_II] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.message_offset.TEAMWORK_2,
    })

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REFRESH)

    local cure_threshold = 25 -- 25%
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, cure_threshold, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA, 10)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 10)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL, 10)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 10)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELL)

    mob:SetAutoAttackEnabled(false)
end)

---
--- King of Hearts
---
--- Red Mage meant to assist mage focused parties
---
m:addOverride("xi.globals.spells.trust.king_of_hearts.onMobSpawn", function(mob)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)


    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REFRESH)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REFRESH, 15)


    local cure_threshold = 25 -- 25%
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, cure_threshold, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BIND, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BIND, 20)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.WEIGHT, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.GRAVITY, 20)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SLEEP, 20)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELL)

    mob:SetAutoAttackEnabled(false)
end)

---
--- Joachim
---
--- Bard meant to assist melee focused parties
---
m:addOverride("xi.globals.spells.trust.joachim.onMobSpawn", function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MINUET, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.VALOR_MINUET)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MARCH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.MARCH)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.ELEGY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ELEGY, 20)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.REQUIEM, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FOE_REQUIEM, 20)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MAGIC_FINALE, 20)

    local cure_threshold = 25 -- 25%
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, cure_threshold, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:SetAutoAttackEnabled(false)
end)

---
--- Ulmia
---
--- Bard meant to assist mage focused parties
---
m:addOverride("xi.globals.spells.trust.ulmia.onMobSpawn", function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.PRISHE] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.MILDAURION] = xi.trust.message_offset.TEAMWORK_2,
    })

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BALLAD, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.MAGES_BALLAD)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ETUDE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.INT_ETUDE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.LULLABY, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FOE_LULLABY, 20)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MAGIC_FINALE, 20)

    local cure_threshold = 25 -- 25%
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, cure_threshold, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:SetAutoAttackEnabled(false)
end)

---
--- Zeid II
---
--- Dark Knight meant to act as a sort of WS closer and enfeebler that melees
---
m:addOverride("xi.globals.spells.trust.zeid_ii.onMobSpawn", function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0,
            ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0,
            ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0,
            ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0,
            ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BIO, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.BIO)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.VIT_DOWN, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ABSORB_VIT)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.TP_GTE, 500, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ABSORB_TP, 30)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
end)

---
--- Iron Eater
---
--- Warrior meant to be a damage dealer that tries to off tank if you are low.
---
m:addOverride("xi.globals.spells.trust.iron_eater.onMobSpawn", function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.NAJI] = xi.trust.message_offset.TEAMWORK_1,
    })

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 900, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 900, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.RETALIATION)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)
end)

---
--- Curilla
---
--- Paladin meant to be able to tank for a party
---
m:addOverride("xi.globals.spells.trust.curilla.onMobSpawn", function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.TRION] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.RAINEMARD] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.RAHAL] = xi.trust.message_offset.TEAMWORK_3,
        [xi.magic.spell.HALVER] = xi.trust.message_offset.TEAMWORK_4,
    })

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)
end)

m:addOverride("xi.player.onGameIn", function(player, firstLogin, zoning)
    if not zoning then
        player:addSpell(xi.magic.spell.KUPIPI, true, true, false)
        player:addSpell(xi.magic.spell.AYAME, true, true, false)
        player:addSpell(xi.magic.spell.CURILLA, true, true, false)
        player:addSpell(xi.magic.spell.IRON_EATER, true, true, false)
        player:addSpell(xi.magic.spell.ZEID_II, true, true, false)
        player:addSpell(xi.magic.spell.ULMIA, true, true, false)
        player:addSpell(xi.magic.spell.JOACHIM, true, true, false)
        player:addSpell(xi.magic.spell.KING_OF_HEARTS, true, true, false)
        player:addSpell(xi.magic.spell.KORU_MORU, true, true, true)
    end

    super(player, firstLogin, zoning)
end)

return m
