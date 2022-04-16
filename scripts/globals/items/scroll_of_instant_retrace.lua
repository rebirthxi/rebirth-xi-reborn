-----------------------------------
-- ID: 5428
-- Scroll of Instant Retrace
-- Transports the user to their Allied Nation.
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if target:getCampaignAllegiance() == 0 then
        return 56
    else
        return 0
    end
end

item_object.onItemUse = function(target)
    if target:getCampaignAllegiance() > 0 then
        target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.RETRACE, 0, 2)
    end
end

return item_object
