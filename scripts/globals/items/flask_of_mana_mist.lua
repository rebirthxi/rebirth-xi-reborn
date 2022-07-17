-----------------------------------
-- ID: 5833
-- Item: flask_of_mana_mist
-- Item Effect: Restores 300 MP to Party members within 10'
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
        member:messageBasic(xi.msg.basic.RECOVERS_MP, 0, member:addMP(300*xi.settings.main.ITEM_POWER))
    end)
end

return item_object
