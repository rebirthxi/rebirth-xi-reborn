-----------------------------------
-- ID: 5322
-- Item: flask_of_healing_powder
-- Item Effect: Restores 25% of Maximum HP to Party members within 10'
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
        member:messageBasic(xi.msg.basic.RECOVERS_HP, 0, member:addHP((member:getMaxHP()/100)*25))
    end)
end

return item_object
