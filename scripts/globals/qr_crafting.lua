-----------------------------------
--- QR Crafting
--- * Hooks Lua based crafting
-----------------------------------
require("scripts/globals/qr_augments")
-----------------------------------
xi.qr_crafting = xi.qr_crafting or {}

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
    local crystalID = ingredients.crystal

    return xi.augments.recipes.is_augment_recipe[crystalID](ingredients)
end

xi.qr_crafting.synth_results = {
    SYNTHESIS_FAIL    = 0,
    SYNTHESIS_SUCCESS = 1,
    SYNTHESIS_HQ      = 2,
    SYNTHESIS_HQ2     = 3,
    SYNTHESIS_HQ3     = 4
}

---
--- Functions returns whether or not the recipe was successful
--- ingredients = see above
---
--- Returns one of the options from synth_results
---
xi.qr_crafting.calcSynthResult = function(player, ingredients)
    return xi.qr_crafting.synth_results.SYNTHESIS_SUCCESS
end

---
--- Function returns a "new" break rate to the core doSynthFail function
--- break_rate: is the original breakrate after all the normal mods, you can change this, or just return it, etc
---
xi.qr_crafting.doSynthFail = function(player, break_rate)
    return 0.0
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
    local aug = xi.augments.ingredientsHasItemIDAndQuantity(ingredients, xi.augments.augment_items.LOWBIE_AUG, 1)
    local item = xi.augments.getItemToAugmentFromIngredients(ingredients)
    local item_id = item:getID()

    player:addItem({id=item_id, augments=aug:getAugTable(), aug_src=aug:getAugSrc(), signature=item:getSignature()})

    return item_id, 1, true
end

---
--- Function handles specific skill ups for a recipe
--- ingredients = see above
---
--- Returns nothing
---
xi.qr_crafting.doSynthSkillUp = function(player, ingredients)
end
