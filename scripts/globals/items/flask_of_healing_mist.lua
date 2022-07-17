-----------------------------------
-- ID: 5832
-- Item: flask_of_healing_mist
-- Item Effect: Restores 600 HP to Party members within 10'
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    target:forMembersInRange(10, function(member)
        member:messageBasic(xi.msg.basic.RECOVERS_HP, 0, member:addHP(600*xi.settings.main.ITEM_POWER))
    end)
end

return item_object
