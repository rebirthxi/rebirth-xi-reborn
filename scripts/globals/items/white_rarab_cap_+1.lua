-----------------------------------
-- ID: 25679
-- White Rarab Cap +1
--  This Hairpin functions in the same way as the spell Reraise.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    local duration = 7200
    target:delStatusEffect(xi.effect.RERAISE)
    target:addStatusEffect(xi.effect.RERAISE, 1, 0, duration)
    target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.RERAISE)
end

return item_object
