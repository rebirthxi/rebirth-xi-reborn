-----------------------------------
-- Rebirth Divine Seal Enmity Reduction MOD
-- * -Enmity Decrease when you have the MOD
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("rebirth_divine_seal_buff")

m:addOverride("xi.globals.abilities.divine_seal.onUseAbility", function(player, target, ability)
    local mod_enm = player:getMod(xi.mod.DIVINE_SEAL_ENM)

    if mod_enm ~= 0 then
        player:addStatusEffect(xi.effect.DIVINE_SEAL, mod_enm, 0, 60, 0, xi.mod.ENMITY)
    else
        player:addStatusEffect(xi.effect.DIVINE_SEAL, 1, 0, 60)
    end
end)

m:addOverride("xi.globals.effects.divine_seal.onEffectGain", function(target, effect)
    if effect:getSubPower() == xi.mod.ENMITY then
        target:addMod(xi.mod.ENMITY, effect:getPower())
    end
end)

m:addOverride("xi.globals.effects.divine_seal.onEffectLose", function(target, effect)
    if effect:getSubPower() == xi.mod.ENMITY then
        target:delMod(xi.mod.ENMITY, effect:getPower())
    end
end)

return m