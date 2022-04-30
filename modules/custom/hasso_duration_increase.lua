-----------------------------------
-- Change the Duration of Hasso
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("hasso_duration_increase")

m:addOverride("xi.globals.abilities.hasso.onUseAbility", function(player, target, ability)
    local strboost = 0

    if target:getMainJob() == xi.job.SAM then
        strboost = (target:getMainLvl() / 7) + target:getJobPointLevel(xi.jp.HASSO_EFFECT)
    elseif target:getSubJob() == xi.job.SAM then
        strboost = target:getSubLvl() / 7
    end

    if strboost > 0 then
        target:delStatusEffect(xi.effect.HASSO)
        target:delStatusEffect(xi.effect.SEIGAN)
        target:addStatusEffect(xi.effect.HASSO, strboost, 0, 3600)
    end
end)

return m