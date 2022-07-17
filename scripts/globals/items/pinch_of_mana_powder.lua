-----------------------------------
-- ID: 4255
-- Item: bottle_of_mana_powder
-- Item Effect: Restores 25% of Maximum MP to Party members within 10'
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
        member:messageBasic(xi.msg.basic.RECOVERS_MP, 0, member:addMP((member:getMaxMP()/100)*25))
    end)
end

return item_object
