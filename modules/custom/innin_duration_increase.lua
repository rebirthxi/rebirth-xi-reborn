-----------------------------------
-- Change the Duration of Innin
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("innin_duration_increase")

m:addOverride("xi.globals.abilities.innin.onUseAbility", function(player, target, ability)
    target:delStatusEffect(xi.effect.INNIN)
    target:delStatusEffect(xi.effect.YONIN)
    target:addStatusEffect(xi.effect.INNIN, 30, 15, 3600, 0, 20)
end)

return m