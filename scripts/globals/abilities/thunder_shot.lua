-----------------------------------
-- Ability: Thunder Shot
-- Consumes a Thunder Card to enhance lightning-based debuffs. Deals lightning-based magic damage
-- Shock Effect: Enhanced DoT and MND-
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/jobpoints")
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if player:getWeaponSkillType(xi.slot.RANGED) ~= xi.skill.MARKSMANSHIP or player:getWeaponSkillType(xi.slot.AMMO) ~= xi.skill.MARKSMANSHIP then
        return 216, 0
    end
    if player:hasItem(2180, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

ability_object.onUseAbility = function(player, target, ability, action)
    local params = {}
    params.includemab = true
    local dmg = (2 * (player:getRangedDmg() + player:getAmmoDmg()) + player:getMod(xi.mod.QUICK_DRAW_DMG)) * (1 + player:getMod(xi.mod.QUICK_DRAW_DMG_PERCENT) / 100)
    dmg = dmg + 2 * player:getJobPointLevel(xi.jp.QUICK_DRAW_EFFECT)
    dmg  = addBonusesAbility(player, xi.magic.ele.LIGHTNING, target, dmg, params)
    local bonusAcc = player:getStat(xi.mod.AGI) / 2 + player:getMerit(xi.merit.QUICK_DRAW_ACCURACY) + player:getMod(xi.mod.QUICK_DRAW_MACC)
    dmg = dmg * applyResistanceAbility(player, target, xi.magic.ele.LIGHTNING, xi.skill.NONE, bonusAcc)
    dmg = adjustForTarget(target, dmg, xi.magic.ele.LIGHTNING)

    params.targetTPMult = 0 -- Quick Draw does not feed TP
    dmg = takeAbilityDamage(target, player, params, true, dmg, xi.attackType.MAGICAL, xi.damageType.LIGHTNING, xi.slot.RANGED, 1, 0, 0, 0, action, nil)

    if dmg > 0 then
        local effects = {}
        local shock = target:getStatusEffect(xi.effect.SHOCK)
        if shock ~= nil then
            table.insert(effects, shock)
        end

        local threnody = target:getStatusEffect(xi.effect.THRENODY)
        if threnody ~= nil and threnody:getSubPower() == xi.mod.WATER_MEVA then
            table.insert(effects, threnody)
        end

        if #effects > 0 then
            local effect = effects[math.random(#effects)]
            local duration = effect:getDuration()
            local startTime = effect:getStartTime()
            local tick = effect:getTick()
            local power = effect:getPower()
            local subpower = effect:getSubPower()
            local tier = effect:getTier()
            local effectId = effect:getType()
            local subId = effect:getSubType()
            power = power * 1.2
            target:delStatusEffectSilent(effectId)
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
            local newEffect = target:getStatusEffect(effectId)
            newEffect:setStartTime(startTime)
        end
    end

    local _ = player:delItem(2180, 1) or player:delItem(2974, 1)
    target:updateClaim(player)
    return dmg
end

return ability_object
