-----------------------------------
-- Change the Rampart to give a perfect Magic Shield
-- Like RebirthXI Classic
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("rampart_as_magic_shield")
m:setEnabled(true)

m:addOverride("xi.globals.effects.rampart.onEffectGain", function(target, effect)
    target:addMod(xi.mod.UDMGMAGIC, -10000)

    if target:isPC() and target:hasTrait(77) then -- Iron Will
        target:addMod(xi.mod.SPELLINTERRUPT, target:getMerit(xi.merit.IRON_WILL))
    end
end)

m:addOverride("xi.globals.effects.rampart.onEffectLose", function(target, effect)
    target:delMod(xi.mod.UDMGMAGIC, -10000)

    if target:isPC() and target:hasTrait(77) then -- Iron Will
        target:delMod(xi.mod.SPELLINTERRUPT, target:getMerit(xi.merit.IRON_WILL))
    end
end)

return m