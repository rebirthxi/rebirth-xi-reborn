-----------------------------------
--- QR Crafting
--- * Hooks Lua based crafting
-----------------------------------
require("scripts/globals/qr_synth")
require("scripts/globals/qr_recipes")
-----------------------------------
xi.qr_crafting = xi.qr_crafting or {}

xi.qr_crafting.recipe_index_key = "luaSynth"

---
--- Functions determines if the given set of ingredients is valid.
--- ingredients = {
---     crystal = crystalID
---     [1] = [item=CLuaItem, quantity=int]
---     ...
---     [8] = [item=CLuaItem, quantity=int]
--- }
---
--- Returns true if it is
--- Returns false if it is not
---
xi.qr_crafting.isRightRecipe = function(player, ingredients)
    local recipe_id = xi.synth.lookup(ingredients, xi.recipe.recipes, player)

    -- Bail out if it didn't find a good recipe
    if recipe_id == 0 then
        return false
    end

    -- Due to the item remove / adding order of this system
    -- we need to enforce a strict number of inventory slots available
    local recipe = xi.recipe.recipes[recipe_id]
    if player:getFreeSlotsCount() < recipe.required_inventory_slots then
        player:PrintToPlayer(string.format(
            "The recipe is actually valid but you need %d inventory slots free.",
            recipe.required_inventory_slots
        ))
        return false
    end

    player:setLocalVar(xi.qr_crafting.recipe_index_key, recipe_id)

    return true
end

---
--- Functions returns whether or not the recipe was successful
--- ingredients = see above
---
--- Returns one of the options from synth_results
---
xi.qr_crafting.calcSynthResult = function(player, ingredients)
    local recipe_id = player:getLocalVar(xi.qr_crafting.recipe_index_key)

    if recipe_id == 0 then
        return xi.recipe.results.SYNTHESIS_FAIL
    end

    return xi.recipe.recipes[recipe_id].calc_synth_result(player, ingredients)
end

---
--- Function returns a "new" break rate to the core doSynthFail function
--- break_rate: is the original breakrate after all the normal mods, you can change this, or just return it, etc
---
xi.qr_crafting.doSynthFail = function(player, break_rate)
    local recipe_id = player:getLocalVar(xi.qr_crafting.recipe_index_key)

    if recipe_id == 0 then
        return 0.0
    end

    return xi.recipe.recipes[recipe_id].break_rate_adjustment(break_rate)
end

---
--- Function determines the result of a recipe
--- ingredients: see above
---
--- Returns (1) the item it granted (for messaging, nothing in core actually gives items, that must be handled here)
---         (2) the quantity of the item rewarded (again, only for messaging)
---         (3) boolean representing whether the item ID in the messaging should be removed if it was in the crafting
---             container. IE, usually all the ingredients in a crafting container are removed from your inventory
---             because they are lost in the synth and something else is yielded. This little boolean, however, enables
---             a check that if the itemID used for the messaging matches one of the items in the crafting container, it
---             will not be removed. Remove = true, everything in the container will be removed from the players inventory.
---             Remove = false, if an itemID in the container matches the one returned from (1), it will not be removed.
---
---             This is little remove mechanic supports custom crafts like augment merging where we don't want a new item,
---             but instead just want to add to an existing.
xi.qr_crafting.doSynthResult = function(player, ingredients)
    local recipe_id = player:getLocalVar(xi.qr_crafting.recipe_index_key)

    if recipe_id == 0 then
        return 0, 0, false
    end

    return xi.recipe.recipes[recipe_id].do_synth_result(player, ingredients)
end

---
--- Function handles specific skill ups for a recipe
--- ingredients = see above
---
--- Returns nothing
---
xi.qr_crafting.doSynthSkillUp = function(player, ingredients)
end
