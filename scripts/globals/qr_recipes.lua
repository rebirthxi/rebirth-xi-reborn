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
            xi.augments.synthIsAugmentRecipe
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = xi.augments.synthResultAugmentBond(xi.augments.ingredients.LOWBIE_AUG),
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
    },
    -- Mid Tier Augment Bonding to Item
    [3] = {
        crystal = xi.items.EARTH_CRYSTAL,
        total_ingredients = 3,
        required_inventory_slots = 1,
        ingredients = {
            {id=xi.augments.ingredients.COMBINER, quantity=1},
            {id=xi.augments.ingredients.MID_AUG, quantity=1},
            xi.augments.synthIsAugmentRecipe,
            xi.augments.itemIsOverLevel(34)
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = xi.augments.synthResultAugmentBond(xi.augments.ingredients.MID_AUG),
        skill_up = function(player, ingredients) return; end
    },
    -- Fotia Gorget
    [4] = {
        crystal = 4102,
        total_ingredients = 8,
        required_inventory_slots = 1,
        ingredients = {
            {id=15495, quantity=1}, -- Flame Gorget
            {id=15500, quantity=1}, -- Aqua Gorget
            {id=15496, quantity=1}, -- Snow Gorget
            {id=15499, quantity=1}, -- Thunder Gorget
            {id=15498, quantity=1}, -- Soil Gorget
            {id=15497, quantity=1}, -- Breeze Gorget
            {id=15501, quantity=1}, -- Light Gorget
            {id=15502, quantity=1}, -- Shadow Gorget
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = function(player, ingredients)
            local item_id = 27510

            player:addItem({id=item_id})

            return item_id, 1, true
        end,
        skill_up = function(player, ingredients) return; end,
    },
    -- Hachirin-no-obi
    [5] = {
        crystal = 4102,
        total_ingredients = 8,
        required_inventory_slots = 1,
        ingredients = {
            {id=15441, quantity=1}, -- Korin Obi
            {id=15442, quantity=1}, -- Anrin Obi
            {id=15435, quantity=1}, -- Karin Obi
            {id=15436, quantity=1}, -- Hyorin Obi
            {id=15437, quantity=1}, -- Furin Obi
            {id=15438, quantity=1}, -- Dorin Obi
            {id=15439, quantity=1}, -- Rairin Obi
            {id=15440, quantity=1}, -- Suirin Obi
        },
        break_rate_adjustment = function(initial_break_rate) return 0.0; end,
        calc_synth_result = function(player, ingredients) return xi.recipe.results.SYNTHESIS_SUCCESS; end,
        do_synth_result = function(player, ingredients)
            local item_id = 28419

            player:addItem({id=item_id})

            return item_id, 1, true
        end,
        skill_up = function(player, ingredients) return; end,
    },
}