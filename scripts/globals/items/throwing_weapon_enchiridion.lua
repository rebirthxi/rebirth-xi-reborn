-----------------------------------------
-- ID: 6161
-- Item: T.W. Enchiridion
-- A guide to the finer points of hurling projectile objects at opponents,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's throwing skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return xi.item_utils.skillBookCheck(target, xi.skill.THROWING)
end

item_object.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.THROWING)
end

return item_object
