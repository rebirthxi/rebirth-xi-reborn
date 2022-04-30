-----------------------------------
-- Increase XP gained when you have Signet or Sanction
-- * 150% for Signet
-- * 300% for Sanction
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("signet_sanction_exp_boost")

m:addOverride("xi.globals.effects.signet.onEffectGain", function(target, effect)
    target:addLatent(xi.latent.SIGNET_BONUS, 0, xi.mod.DEF, 15)
    target:addLatent(xi.latent.SIGNET_BONUS, 0, xi.mod.EVA, 15)
    target:addMod(xi.mod.EXP_BONUS, 150)
end)

m:addOverride("xi.globals.effects.signet.onEffectLose", function(target, effect)
    target:delLatent(xi.latent.SIGNET_BONUS, 0, xi.mod.DEF, 15)
    target:delLatent(xi.latent.SIGNET_BONUS, 0, xi.mod.EVA, 15)
    target:delMod(xi.mod.EXP_BONUS, 150)
end)

m:addOverride("xi.globals.effects.sanction.onEffectGain", function(target, effect)
    local power = effect:getPower()
    if power == 1 then
        target:addLatent(xi.latent.SANCTION_REGEN_BONUS, 95, xi.mod.REGEN, 1)
    elseif power == 2 then
        target:addLatent(xi.latent.SANCTION_REFRESH_BONUS, 75, xi.mod.REFRESH, 1)
    elseif power == 3 then
        target:addMod(xi.mod.FOOD_DURATION, 100)
    end
    target:addMod(xi.mod.EXP_BONUS, 300)
end)

m:addOverride("xi.globals.effects.sanction.onEffectLose", function(target, effect)
    local power = effect:getPower()
    if power == 1 then
        target:delLatent(xi.latent.SANCTION_REGEN_BONUS, 95, xi.mod.REGEN, 1)
    elseif power == 2 then
        target:delLatent(xi.latent.SANCTION_REFRESH_BONUS, 75, xi.mod.REFRESH, 1)
    elseif power == 3 then
        target:delMod(xi.mod.FOOD_DURATION, 100)
    end
    target:delMod(xi.mod.EXP_BONUS, 300)
end)

return m
