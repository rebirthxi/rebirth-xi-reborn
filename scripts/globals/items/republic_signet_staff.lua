-----------------------------------
-- ID: 17583
-- Item: Republic Signet Staff
-- Effect: Signet
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/conquest")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target, user)
    if target:getNation() ~= xi.nation.BASTOK then
        return xi.msg.basic.ITEM_CANNOT_USE_ON
    end

    -- If target's current region is not a conquest region or not a nation city involved with conquest
    if target:getCurrentRegion() > xi.region.JEUNO then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    -- Can only use on targets within party or self
    if target:getID() ~= user:getID() then
        if user:getPartyLeader() == nil or target:getPartyLeader():getID() ~= user:getPartyLeader():getID() then
            return xi.msg.basic.ITEM_CANNOT_USE_ON
        end
    end

    return 0
end

item_object.onItemUse = function(target)
    target:delStatusEffectsByFlag(xi.effectFlag.INFLUENCE, true)
    target:addStatusEffect(xi.effect.SIGNET, 0, 0, 18000)
end

return item_object
