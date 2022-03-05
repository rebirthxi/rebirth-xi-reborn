-----------------------------------
-- Change the Duration of Seigan
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("seigan_duration_increase")
m:setEnabled(true)

m:addOverride("xi.globals.abilities.seigan.onUseAbility", function(player, target, ability)
    if (target:isWeaponTwoHanded()) then
        target:delStatusEffect(xi.effect.HASSO)
        target:delStatusEffect(xi.effect.SEIGAN)
        target:addStatusEffect(xi.effect.SEIGAN, 0, 0, 3600)
    end
end)

return m