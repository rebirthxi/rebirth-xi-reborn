-----------------------------------
-- Rebirth Etude Buff from Custom Artifact Equip
-- * STR Etude Increases Atk/R.Atk
-- * DEX Etude Increases ACC
-- * AGI Etude Increases EVA/RACC
-- * VIT Etude Increases DEF
-- * INT Etude Decreases Enmity
-- * MND Etude Adds Small Refresh
-- * CHA Etude Adds Small Haste (Counts towards Magical)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local m = Module:new("rebirth_etude_buff")

xi.artifacts = xi.artifacts or {}
xi.artifacts.brd = xi.artifacts.brd or {}

xi.artifacts.brd.etude_mod_to_mod = {
    [xi.mod.STR] = {xi.mod.ATT, xi.mod.RATT},
    [xi.mod.DEX] = {xi.mod.ACC},
    [xi.mod.AGI] = {xi.mod.EVA, xi.mod.RACC},
    [xi.mod.VIT] = {xi.mod.DEF},
    [xi.mod.INT] = {xi.mod.ENMITY},
    [xi.mod.MND] = {xi.mod.REFRESH},
    [xi.mod.CHR] = {xi.mod.HASTE_MAGIC},
}

xi.artifacts.brd.etude_mod_to_amount_nq = {
    [xi.mod.ATT]         = 10,
    [xi.mod.RATT]        = 10,
    [xi.mod.ACC]         = 10,
    [xi.mod.EVA]         = 10,
    [xi.mod.RACC]        = 10,
    [xi.mod.DEF]         = 20,
    [xi.mod.ENMITY]      = -10,
    [xi.mod.REFRESH]     = 1,
    [xi.mod.HASTE_MAGIC] = 2,
}

xi.artifacts.brd.etude_mod_to_amount_hq = {
    [xi.mod.ATT]         = 15,
    [xi.mod.RATT]        = 15,
    [xi.mod.ACC]         = 15,
    [xi.mod.EVA]         = 15,
    [xi.mod.RACC]        = 15,
    [xi.mod.DEF]         = 30,
    [xi.mod.ENMITY]      = -15,
    [xi.mod.REFRESH]     = 1,
    [xi.mod.HASTE_MAGIC] = 4,
}

m:addOverride("xi.globals.effects.etude.onEffectGain", function(target, effect)
    local main_mod = effect:getSubPower()
    target:addMod(main_mod, effect:getPower())

    local tier = effect:getTier()
    if tier == 3 or tier == 4 then
        -- Choral Roundlet
        local sub_mod_tab = xi.artifacts.brd.etude_mod_to_mod[main_mod]
        for _, extra_mod in ipairs(sub_mod_tab) do
            target:addMod(
                extra_mod,
                xi.artifacts.brd.etude_mod_to_amount_nq[extra_mod]
            )
        end
    elseif tier == 5 or tier == 6 then
        -- Choral Roundlet +1
        local sub_mod_tab = xi.artifacts.brd.etude_mod_to_mod[main_mod]
        for _, extra_mod in ipairs(sub_mod_tab) do
            target:addMod(
                extra_mod,
                xi.artifacts.brd.etude_mod_to_amount_hq[extra_mod]
            )
        end
    end
end)

m:addOverride("xi.globals.effects.etude.onEffectTick", function(target, effect)
    -- the effect loses modifier of 1 every 10 ticks.
    local song_effect_size = effect:getPower()
    local tier = effect:getTier()

    if ((tier == 2 or tier == 4 or tier == 6) and effect:getPower() > 0) then
        effect:setPower(song_effect_size -1)
        target:delMod(effect:getSubPower(), 1)
    end
end)

m:addOverride("xi.globals.effects.etude.onEffectLose", function(target, effect)
    local main_mod = effect:getSubPower()
    target:delMod(main_mod, effect:getPower())

    local tier = effect:getTier()
    if tier == 3 or tier == 4 then
        -- Choral Roundlet
        local sub_mod_tab = xi.artifacts.brd.etude_mod_to_mod[main_mod]
        for _, extra_mod in ipairs(sub_mod_tab) do
            target:delMod(
                extra_mod,
                xi.artifacts.brd.etude_mod_to_amount_nq[extra_mod]
            )
        end
    elseif tier == 5 or tier == 6 then
        -- Choral Roundlet +1
        local sub_mod_tab = xi.artifacts.brd.etude_mod_to_mod[main_mod]
        for _, extra_mod in ipairs(sub_mod_tab) do
            target:delMod(
                extra_mod,
                xi.artifacts.brd.etude_mod_to_amount_hq[extra_mod]
            )
        end
    end
end)

return m