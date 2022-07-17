-----------------------------------
-- Ability: Aspir Samba II
-- Inflicts the next target you strike with Aspir daze, allowing all those engaged in battle with it to drain its MP.
-- Obtained: Dancer Level 60
-- Recast Time: 1:00
-- TP Cost: 25%
-- Duration: 1:30
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    if (player:hasStatusEffect(xi.effect.FAN_DANCE)) then
        return xi.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif (player:hasStatusEffect(xi.effect.TRANCE)) then
        return 0, 0
    elseif (player:getTP() < 250) then
        return xi.msg.basic.NOT_ENOUGH_TP, 0
    else
        return 0, 0
    end
end

ability_object.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(xi.effect.TRANCE) then
        player:delTP(250)
    end

    local duration = 120 + player:getMod(xi.mod.SAMBA_DURATION) + (player:getJobPointLevel(xi.jp.SAMBA_DURATION) * 2)
    duration = duration * (100 + player:getMod(xi.mod.SAMBA_PDURATION))/100
    player:delStatusEffect(xi.effect.HASTE_SAMBA)
    player:delStatusEffect(xi.effect.DRAIN_SAMBA)
    player:addStatusEffect(xi.effect.ASPIR_SAMBA, 2, 0, duration)

end

return ability_object
