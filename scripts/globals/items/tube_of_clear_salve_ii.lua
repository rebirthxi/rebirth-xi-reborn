-----------------------------------
-- ID: 5838
-- Item: tube_of_clear_salve_ii
-- Item Effect: Instantly removes all negative status effects from pet
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
require("scripts/globals/item_utils")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if not target:hasPet() then
        return xi.msg.basic.REQUIRES_A_PET
    end
    return 0
end

item_object.onItemUse = function(target)
    local pet = target:getPet()

    local effects =
    {
        xi.effect.PETRIFICATION,
        xi.effect.SILENCE,
        xi.effect.BANE,
        xi.effect.CURSE_II,
        xi.effect.CURSE_I,
        xi.effect.PARALYSIS,
        xi.effect.PLAGUE,
        xi.effect.POISON,
        xi.effect.DISEASE,
        xi.effect.BLINDNESS
    }

    local count = 10

    xi.item_utils.removeMultipleEffects(pet, effects, count)
end

return item_object
