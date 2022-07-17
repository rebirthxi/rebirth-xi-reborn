-----------------------------------------
-- ID: 5394
-- Item: bottle_of_gnostics_drink
-- Item Effect: Enmity -
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/item_utils")
-----------------------------------------

local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    local effect    = xi.effect.PAX
    local power     = -10   -- Power Level unknown, using Animus Minueo Value as baseline.
    local duration  = 60

    xi.item_utils.addItemEffect(target, effect, power, duration)
end

return item_object
