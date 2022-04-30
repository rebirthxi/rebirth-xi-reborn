-----------------------------------
-- Change the Duration of Yonin
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("yonin_duration_increase")

m:addOverride("xi.globals.abilities.yonin.onUseAbility", function(player, target, ability)
    target:delStatusEffect(xi.effect.INNIN)
    target:delStatusEffect(xi.effect.YONIN)
    target:addStatusEffect(xi.effect.YONIN, 30, 15, 3600, 0, 20)
end)

return m