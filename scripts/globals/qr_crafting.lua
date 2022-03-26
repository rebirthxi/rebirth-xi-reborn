-----------------------------------
--- QR Crafting
--- * Hooks Lua based crafting
-----------------------------------
require("scripts/globals/qr_augments")
-----------------------------------
xi.qr_crafting = xi.qr_crafting or {}

xi.qr_crafting.isRightRecipe = function(player, ingredients)
    if xi.augments.recipes.is_augment_recipe[ingredients.crystal](ingredients) then
        print("Valid recipe!")
    else
        print("Invalid recipe :(")
    end

    return false
end
