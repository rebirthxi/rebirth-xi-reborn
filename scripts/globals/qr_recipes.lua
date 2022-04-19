-----------------------------------
--- QR Recipes
-----------------------------------
require("scripts/globals/qr_augments")
require("scripts/globals/items")
-----------------------------------

xi.recipe = xi.recipe or {}

xi.recipe.results = {
    SYNTHESIS_FAIL    = 0,
    SYNTHESIS_SUCCESS = 1,
    SYNTHESIS_HQ      = 2,
    SYNTHESIS_HQ2     = 3,
    SYNTHESIS_HQ3     = 4
}

---
--- Table's "base" index is the recipeID
---
--- crystal: ID of the crystal used in the recipe
--- total_ingredients: the totals items in the ingredients container
--- required_inventory_slots: a player must have this many free inventory slots to do the synthesis
--- ingredients: a table of either item IDs and their quantities or functions to test the ingredients
--- break_rate_adjustment: is a function that takes an initial break rate and returns a new one
--- calc_synth_rate: is a function that takes player, ingredients and returns whether the synth result is break, nq, hq1/2/3
--- do_synth_result: is a function that takes player, ingredients and returns the itemID for messaging, the quantity for messaging, and a boolean (see xi.qr_crafting.doSynthResult for more)
--- skill_up: is a function that takes player, ingredients and returns nothing but presumably handles any skilling up
xi.recipe.recipes = {
    -- Lowbie Augment Bonding to Item
    [1] = {
        crystal = xi.items.EARTH_CRYSTAL,
        total_ingredients = 3,
        required_inventory_slots = 1,
        ingredients = {
            {id=xi.augments.ingredients.COMBINER, quantity=1},
            {id=xi.augments.ingredients.LOWBIE_AUG, quantity=1},
            xi.augments.synthIsLowbieAugmentRecipe
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = xi.augments.synthResultLowbieAugmentBond,
        skill_up = function(player, ingredients) return; end
    },
    -- Augment Cleansing
    [2] = {
        crystal = 4100, -- lightning crystal? why this not in xi.items?
        total_ingredients = 2,
        required_inventory_slots = 2,
        ingredients = {
            {id=xi.augments.ingredients.SEPARATOR, quantity=1},
            xi.augments.synthIsCleansableRecipe,
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = xi.augments.synthCleanseAugmentSplit,
        skill_up = function(player, ingredients) return;  end
    }
}