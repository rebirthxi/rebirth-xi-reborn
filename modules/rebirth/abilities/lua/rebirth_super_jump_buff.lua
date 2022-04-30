-----------------------------------
-- Rebirth Super Jump +ATK Buff
-- * Using Super Jump increases attack when the MOD is present
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("rebirth_super_jump_buff")

m:addOverride("xi.globals.abilities.super_jump.onUseAbility", function(player, target, ability)
    local super_jump_atk_mod = player:getMod(xi.mod.SUPER_JUMP_ATK_BUFF)

    if super_jump_atk_mod ~= 0 then
        player:addStatusEffectEx(xi.effect.SUPER_JUMP_ATK, 0, super_jump_atk_mod, 0, 10)
    end

    super(player, target, ability)
end)

return m