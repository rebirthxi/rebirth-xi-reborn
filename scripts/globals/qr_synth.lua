-----------------------------------
--- QR Synth
-----------------------------------
xi.synth = xi.synth or {}

---
--- recipes at the bottom of the file for now
---

---
--- Function should return a recipe "ID" if it exists
--- and 0 if the recipe does not exist.
---
--- Recipe IDs should be Ints
---
xi.synth.lookup = function(ingredients, recipes, player)
    for recipe_id, recipe_info in ipairs(recipes) do
        if xi.synth.recipeMatchesIngredients(recipe_info, ingredients, player) then return recipe_id; end
    end
    return 0
end

xi.synth.recipeMatchesIngredients = function(recipe_info, ingredients, player)
    if recipe_info.crystal ~= ingredients.crystal then return false; end

    if recipe_info.total_ingredients ~= #ingredients then return false; end

    for _, ingredient in ipairs(recipe_info.ingredients) do
        if xi.synth.checkForIngredientInIngredients(ingredient, ingredients, player) == false then return false; end
    end

    return true
end

xi.synth.checkForIngredientInIngredients = function(ingredient, ingredients, player)
    if type(ingredient) == "table" then
        return xi.synth.ingredientsHasItemIDAndQuantity(ingredients, ingredient.id, ingredient.quantity)
    end
    if type(ingredient) == "function" then
        return ingredient(ingredients, player)
    end
end

xi.synth.ingredientsHasItemIDAndQuantity = function(ingredients, item_id, quantity)
    for _, ingredient in ipairs(ingredients) do
        if item_id == ingredient.item:getID() and quantity == ingredient.quantity then
            return true
        end
    end
    return false
end

xi.synth.ingredientFromIngredients = function(ingredients, item_id)
    for _, ingredient in ipairs(ingredients) do
        if item_id == ingredient.item:getID() then return ingredient.item; end
    end
    return nil
end
