-----------------------------------
-- Provides a Movement boost when out of combat
-- Requires the OUT_OF_COMBAT_MOVE effect to be added.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local m = Module:new("out_of_combat_move")

local ooc_move_gain = "%s's out of combat movement speed has returned."
local ooc_move_lose = "%s's out of combat movement speed wears off."

m:addOverride("xi.player.onGameIn", function(player, firstLogin, zoning)
    player:addStatusEffectEx(xi.effect.OUT_OF_COMBAT_MOVE, 0, 50, 0, 0)
    player:setLocalVar("OOCMove", 1)

    player:addListener("ENMITY_GAIN", "OUT_OF_COMBAT_MOVE_LOSE", function(enmityGainer)
        if enmityGainer:getLocalVar("OOCMove") == 1 then
            enmityGainer:setLocalVar("OOCMove", 0)
            enmityGainer:delStatusEffectSilent(xi.effect.OUT_OF_COMBAT_MOVE)
            enmityGainer:PrintToPlayer(string.format(ooc_move_lose, enmityGainer:getName()), xi.msg.channel.NS_SAY)
        end
    end)

    player:addListener("ENMITY_TOTALLY_GONE", "OUT_OF_COMBAT_MOVE_GAIN", function(enmityFreePlayer)
        if enmityFreePlayer:getLocalVar("OOCMove") == 0 then
            enmityFreePlayer:setLocalVar("OOCMove", 1)
            enmityFreePlayer:addStatusEffectEx(xi.effect.OUT_OF_COMBAT_MOVE, 0, 50, 0, 0)
            enmityFreePlayer:PrintToPlayer(string.format(ooc_move_gain, enmityFreePlayer:getName()), xi.msg.channel.NS_SAY)
        end
    end)

    super(player, firstLogin, zoning)
end)

return m
