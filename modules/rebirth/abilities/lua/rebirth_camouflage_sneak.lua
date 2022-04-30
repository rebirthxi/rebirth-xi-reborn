-----------------------------------
-- Rebirth Elemental Seal Enmity Reduction MOD
-- * -Enmity Decrease when you have the MOD
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("rebirth_ele_seal_buff")

m:addOverride("xi.globals.abilities.camouflage.onUseAbility", function(player, target, ability)
    local mod_sneak = player:getMod(xi.mod.CAMOUFLAGE_SNEAK)

    if mod_sneak > 0 then
        player:addStatusEffect(xi.effect.SNEAK, 0, 10, mod_sneak)
    end
    super(player, target, ability)
end)

return m