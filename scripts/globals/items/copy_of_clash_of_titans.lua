-----------------------------------------
-- ID: 6154
-- Item: Clash of Titans
-- An article detailing the duel between Yrvaulair S Cousseraux
-- and Alphonimile M Aurchiat that became all the rage in San d'Oria after appearing in a popular newspaper.
-- Adventurers note that reading it increases one's polearm skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return xi.item_utils.skillBookCheck(target, xi.skill.POLEARM)
end

item_object.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.POLEARM)
end

return item_object
