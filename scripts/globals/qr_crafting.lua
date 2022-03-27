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

    return true
end

xi.qr_crafting.synth_results = {
    SYNTHESIS_FAIL    = 0,
    SYNTHESIS_SUCCESS = 1,
    SYNTHESIS_HQ      = 2,
    SYNTHESIS_HQ2     = 3,
    SYNTHESIS_HQ3     = 4
}

xi.qr_crafting.calcSynthResult = function(player, ingredients)
    print("lua -> calcSynthResults")
    return xi.qr_crafting.synth_results.SYNTHESIS_FAIL
end

xi.qr_crafting.doSynthFail = function(player, break_rate)
    print("lua -> doSynthFail")
    return 0.0
end

xi.qr_crafting.doSynthResult = function(player, ingredients)
    print("lua -> doSynthResult")
    return 9847, 1, true
end

xi.qr_crafting.doSynthSkillUp = function(player, ingredients)
    print("lua -> doSynthSkillUp")
end