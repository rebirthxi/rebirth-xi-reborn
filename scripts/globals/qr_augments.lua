-----------------------------------
--- QR Augments
--- * Lowbie Augments
-----------------------------------
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/globals/items")
require("scripts/globals/qr_synth")
require("scripts/globals/zone_lights")
-----------------------------------
xi.augments = xi.augments or {}

xi.augments.sources = {
    -- Lowbie Augments
    [1]   = {1,   0,   4}, -- HP range 1 - 10
    [2]   = {9,   0,   2}, -- MP range 1 - 5
    [3]   = {17,  0,   4}, -- HP and MP 1-5
    [4]   = {23,  0,   1}, -- Accuracy 1-2
    [5]   = {25,  0,   3}, -- Attack 1-4
    [6]   = {27,  0,   1}, -- Ranged Acc 1-2
    [7]   = {29,  0,   3}, -- Ranged Attack 1-4
    [8]   = {33,  0,   1}, -- Def 1-2
    [9]   = {35,  0,   0}, -- Magic Accuracy 1
    [19]  = {133, 0,   0}, -- Magic Attack Bonus
    [10]  = {39,  0,   2}, -- Enmity 1-3
    [11]  = {40,  0,   2}, -- -Enmity 1-3
    [12]  = {512, 0,   0}, -- Str 1
    [13]  = {513, 0,   0}, -- Dex 1
    [14]  = {514, 0,   0}, -- Vit 1
    [15]  = {515, 0,   0}, -- Agi 1
    [16]  = {516, 0,   0}, -- Int 1
    [17]  = {517, 0,   0}, -- Mnd 1
    [18]  = {518, 0,   0}, -- Chr 1
    [20]  = {45,  0,   1}, -- DMG +1-2 Melee (Main Hand Only) / Ranged
    [21]  = {96,  0,   3}, -- Pet Acc / RAcc 1-4
    [22]  = {97,  0,   2}, -- Pet Atk / RAtk1-3
    [23]  = {101, 0,   0}, -- Pet Mab 1
    [24]  = {100, 0,   1}, -- Pet Macc 1-2
    [25]  = {1792, 0,  0}, -- Pet Str +1
    [26]  = {1796, 0,  0}, -- Pet Int +1

    -- Red Light Sources
    [27]  = {23,    0,   5 }, -- Accuracy
    [28]  = {27,    0,   5 }, -- Ranged Acc
    [29]  = {25,    1,   9 }, -- Attack
    [30]  = {29,    1,   9 }, -- Ranged Attack
    [31]  = {41,    0,   0 }, -- Crit hit
    [32]  = {68,    0,   3 }, -- Accuracy and Attack
    [33]  = {69,    0,   3 }, -- Ranged Accuracy and Ranged Attack
    [34]  = {132,    0,   0 }, -- Double Atk and Crit Hit rate
    [35]  = {139,    0,   2 }, -- Rapid Shot
    [36]  = {143,    0,   1 }, -- Double Attack
    [37]  = {144,    0,   1 }, -- Triple Attack
    [38]  = {146,    0,   1 }, -- Dual Wield
    [39]  = {151,    0,   1 }, -- Martial Arts
    [40]  = {194,    0,   1 }, -- Kick Attacks Rate
    [41]  = {198,    0,   1 }, -- Zanshin
    [42]  = {211,    0,   2 }, -- Snapshot
    [43]  = {257,    0,   2 }, -- Hand To Hand Skill
    [44]  = {258,    0,   2 }, -- Dagger Skill
    [45]  = {260,    0,   2 }, -- Great Sword Skill
    [46]  = {261,    0,   2 }, -- Axe Skill
    [47]  = {262,    0,   2 }, -- Great Axe Skill
    [48]  = {263,    0,   2 }, -- Scythe Skill
    [49]  = {264,    0,   2 }, -- Polearm Skill
    [50]  = {265,    0,   2 }, -- Katana Skill
    [51]  = {266,    0,   2 }, -- Great Katana Skill
    [52]  = {281,    0,   2 }, -- Archery Skill
    [53]  = {282,    0,   2 }, -- Marksmanship Skill
    [54]  = {283,    0,   2 }, -- Throwing Skill
    [55]  = {328,    0,   2 }, -- Crit hit damage
    [56]  = {332,    0,   4 }, -- Skillchain Dmg
    [57]  = {512,    0,   2 }, -- STR
    [58]  = {513,    0,   2 }, -- DEX

    -- Blue Light Sources
    [59]  = {35,    0,   4 }, -- Magic Accuracy
    [60]  = {40,    0,   5 }, -- Enmity -
    [61]  = {51,    0,   4 }, -- MP Recovery while resting
    [62]  = {53,    0,   4 }, -- Spell Interrupt
    [63]  = {57,    0,   3 }, -- Magic Crit Rate
    [64]  = {131,    0,   0 }, -- Magic Accuracy and Magic Attack
    [65]  = {133,    0,   2 }, -- Magic Attack
    [66]  = {140,    0,   1 }, -- Fast Cast
    [67]  = {141,    0,   3 }, -- Conserve MP
    [68]  = {288,    0,   4 }, -- Divine Magic Skill
    [69]  = {289,    0,   4 }, -- Healing Magic Skill
    [70]  = {290,    0,   4 }, -- Enhancing Magic Skill
    [71]  = {291,    0,   4 }, -- Enfeebling Magic Skill
    [72]  = {292,    0,   4 }, -- Elemental Magic Skill
    [73]  = {293,    0,   4 }, -- Dark Magic Skill
    [74]  = {294,    0,   4 }, -- Summoning Magic Skill
    [75]  = {295,    0,   4 }, -- Ninjutsu Skill
    [76]  = {296,    0,   4 }, -- Singing Skill
    [77]  = {298,    0,   4 }, -- Wind Skill
    [78]  = {299,    0,   4 }, -- Blue Skill
    [79]  = {322,    0,   1 }, -- Songspell Casting time
    [80]  = {334,    0,   4 }, -- Magic Burst Dmg %
    [81]  = {335,    0,   4 }, -- Magic Crit Dmg%
    [82]  = {343,    0,   4 }, -- Drain and Aspir Potency
    [83]  = {362,    4,   9 }, -- Magic Damage
    [84]  = {516,    0,   2 }, -- INT
    [85]  = {517,    0,   2 }, -- MND
    [86]  = {518,    0,   2 }, -- CHR
    [88]  = {896,    0,   4 }, -- Sword Enhancement Spell Damage
    [89]  = {1249,    0,   4 }, -- Helix Duration
    [90]  = {267,    0,   2 }, -- Club Skill
    [91]  = {268,    0,   2 }, -- Staff Skill

    -- Yellow Light Sources
    [92]  = {1, 14, 29}, -- HP
    [93]  = {9, 9, 19}, -- MP
    [94]  = {31, 0, 4}, -- Evasion
    [95]  = {33, 0, 4}, -- Def
    [96]  = {37, 0, 4}, -- Magic Evasion
    [97]  = {39, 0, 5}, -- Enmity +
    [98]  = {51, 0, 4}, -- HP Recovery while resting
    [99]  = {54, 0, 3}, -- Phys %Dmg Down
    [100]  = {55, 0, 3}, -- Magic %Dmg Down
    [101]  = {56, 0, 9}, -- Breath %Dmg Down
    [102]  = {71, 0, 1}, -- Damage Taken
    [103]  = {42, 0, 3}, -- Enemy Crit Rate
    [104]  = {134, 0, 2}, -- Magic Defense Bonus
    [105]  = {137, 0, 3}, -- Regen
    [106]  = {153, 0, 1}, -- Shield Mastery
    [107]  = {286, 0, 4}, -- Shield Skill
    [108]  = {329, 0, 4}, -- Cute Potency
    [109]  = {330, 0, 4}, -- Waltz Potency
    [110]  = {356, 0, 4}, -- Cure Potency Received
    [111]  = {363, 0, 2}, -- Block Chance
    [112]  = {368, 0, 2}, -- Phalanx
    [113]  = {514, 0, 2}, -- VIT
    [114]  = {515, 0, 2}, -- AGI
    [115]  = {259, 0, 2}, -- Sword Skill
    [116]  = {145, 0, 1}, -- Counter
    [87]  =  {796, 0, 4 }, -- All Elemental Resist

    -- Green Light Sources
    [117]  = {96, 0, 6}, -- Accuracy and Ranged Accuracy
    [118]  = {97, 0, 14}, -- Attack and Ranged Attack
    [119]  = {98, 0, 9}, -- Evasion
    [120]  = {99, 0, 9}, -- Def
    [121]  = {100, 0, 6}, -- Magic Accuracy
    [122]  = {101, 0, 4}, -- Magic Attack
    [123]  = {102, 0, 3}, -- Crit Rate
    [124]  = {108, 0, 2}, -- Magic Accuracy and Magic Attack
    [125]  = {109, 0, 1}, -- Double Attack and Crit Hit Rate
    [126]  = {122, 0, 2}, -- TP Bonus
    [127]  = {123, 0, 3}, -- Double Attack
    [128]  = {278, 1, 5}, -- Automation Melee Skill
    [129]  = {279, 1, 5}, -- Automation Ranged Skill
    [130]  = {280, 1, 5}, -- Automation Magic Skill
    [131]  = {320, 0, 0}, -- Blood Pact Ability Delay
    [132]  = {369, 4, 9}, -- Blood Pact Damage
    [133]  = {1792, 0, 4}, -- STR
    [134]  = {1793, 0, 4}, -- DEX
    [135]  = {1794, 0, 4}, -- VIT
    [136]  = {1795, 0, 4}, -- AGI
    [137]  = {1796, 0, 4}, -- INT
    [138]  = {1797, 0, 4}, -- MND
    [139]  = {1798, 0, 4}, -- CHR
}

xi.augments.strings = {
    [23] = "Accuracy",
    [27] = "Ranged Acc",
    [25] = "Attack",
    [29] = "Ranged Attack",
    [41] = "Crit hit",
    [68] = "Accuracy and Attack",
    [69] = "Ranged Accuracy and Ranged Attack",
    [132] = "Double Atk and Crit Hit rate",
    [139] = "Rapid Shot",
    [143] = "Double Attack",
    [144] = "Triple Attack",
    [146] = "Dual Wield",
    [151] = "Martial Arts",
    [194] = "Kick Attacks Rate",
    [198] = "Zanshin",
    [211] = "Snapshot",
    [257] = "Hand To Hand Skill",
    [258] = "Dagger Skill",
    [260] = "Great Sword Skill",
    [261] = "Axe Skill",
    [262] = "Great Axe Skill",
    [263] = "Scythe Skill",
    [264] = "Polearm Skill",
    [265] = "Katana Skill",
    [266] = "Great Katana Skill",
    [281] = "Archery Skill",
    [282] = "Marksmanship Skill",
    [283] = "Throwing Skill",
    [328] = "Crit hit damage",
    [332] = "Skillchain Dmg",
    [512] = "STR",
    [513] = "DEX",
    [35] = "Magic Accuracy",
    [40] = "Enmity -",
    [51] = "MP Recovery while resting",
    [53] = "Spell Interrupt",
    [57] = "Magic Crit Rate",
    [131] = "Magic Accuracy and Magic Attack",
    [133] = "Magic Attack",
    [140] = "Fast Cast",
    [141] = "Conserve MP",
    [288] = "Divine Magic Skill",
    [289] = "Healing Magic Skill",
    [290] = "Enhancing Magic Skill",
    [291] = "Enfeebling Magic Skill",
    [292] = "Elemental Magic Skill",
    [293] = "Dark Magic Skill",
    [294] = "Summoning Magic Skill",
    [295] = "Ninjutsu Skill",
    [296] = "Singing Skill",
    [298] = "Wind Skill",
    [299] = "Blue Skill",
    [322] = "Songspell Casting time",
    [334] = "Magic Burst Dmg %",
    [335] = "Magic Crit Dmg%",
    [343] = "Drain and Aspir Potency",
    [362] = "Magic Damage",
    [516] = "INT",
    [517] = "MND",
    [518] = "CHR",
    [796] = "All Elemental Resist",
    [896] = "Sword Enhancement Spell Damage",
    [1249] = "Helix Duration",
    [267] = "Club Skill",
    [268] = "Staff Skill",
    [1] = "HP",
    [9] = "MP",
    [31] = "Evasion",
    [33] = "Def",
    [37] = "Magic Evasion",
    [39] = "Enmity +",
    [51] = "HP Recovery while resting",
    [54] = "Phys %Dmg Down",
    [55] = "Magic %Dmg Down",
    [56] = "Breath %Dmg Down",
    [71] = "Damage Taken",
    [42] = "Enemy Crit Rate",
    [134] = "Magic Defense Bonus",
    [137] = "Regen",
    [153] = "Shield Mastery",
    [286] = "Shield Skill",
    [329] = "Cute Potency",
    [330] = "Waltz Potency",
    [356] = "Cure Potency Received",
    [363] = "Block Chance",
    [368] = "Phalanx",
    [514] = "VIT",
    [515] = "AGI",
    [259] = "Sword Skill",
    [145] = "Counter",
    [96] = "Pet: Accuracy and Ranged Accuracy",
    [97] = "Pet: Attack and Ranged Attack",
    [98] = "Pet: Evasion",
    [99] = "Pet: Def",
    [100] = "Pet: Magic Accuracy",
    [101] = "Pet: Magic Attack",
    [102] = "Pet: Crit Rate",
    [108] = "Pet: Magic Accuracy and Magic Attack",
    [109] = "Pet: Double Attack and Crit Hit Rate",
    [122] = "Pet: TP Bonus",
    [123] = "Pet: Double Attack",
    [278] = "Pet: Automation Melee Skill",
    [279] = "Pet: Automation Ranged Skill",
    [280] = "Pet: Automation Magic Skill",
    [320] = "Pet: Blood Pact Ability Delay",
    [369] = "Pet: Blood Pact Damage",
    [1792] = "Pet: STR",
    [1793] = "Pet: DEX",
    [1794] = "Pet: VIT",
    [1795] = "Pet: AGI",
    [1796] = "Pet: INT",
    [1797] = "Pet: MND",
    [1798] = "Pet: CHR",
}

xi.augments.item_strings = {
    [16481] = "Augment Dagger",
    [13450] = "Diamond Ring",
    [13087] = "Jeweled Collar",
    [13925] = "Rasetsu Jinpachi",
    [13212] = "Tarutaru Sash",
    [14644] = "Dark Ring",
    [16128] = "Wivre Hairpin",
    [12324] = "Tower Shield",
    [12420] = "Adaman Barbuta",
}

xi.augments.regional_item_augments = {
    --augid, min, max
    -- diamond ring, wiki order
    [13450] = {
        { 769, 0, 4 },
        { 516, 0, 2 },
        { 517, 0, 2 },
        { 180, 0, 2 },
        { 53, 0, 4  },
    },
    -- jeweled collar, wiki order
    [13087] = {
        { 516, 0, 3 },
        { 518, 0, 3 },
        { 517, 0, 3 },
        { 140, 0, 2 },
        { 141, 0, 1 },
    },
    -- rasetsu jinpachi, wiki order
    [13925] = {
        { 182, 0, 4 },
        { 183, 0, 2 },
        { 768, 0, 3 },
        { 198, 1, 4 },
        { 31, 1, 9  },
    },
    -- tarutaru sash, wiki order
    [13212] = {
        { 1, 2, 10  },
        { 516, 0, 3 },
        { 517, 0, 2 },
        { 518, 0, 2 },
        { 148, 0, 2 },
        { 147, 0, 0 },
    },
    -- dark rings, wiki order
    [14644] = {
        { 56, 0, 5 },
        { 54, 0, 5 },
        { 55, 0, 5 },
        { 42, 0, 2 },
        { 53, 0, 4 },
        { 33, 1, 3 },
    },
    -- wivre hairpin, wiki order
    [16128] = {
        { 771, 0, 9 },
        { 773, 0, 7 },
        { 769, 0, 7 },
        { 775, 2, 9 },
        { 9, 12, 15 },
        { 138, 0, 0 },
    },
    -- tower shield, wiki order
    [12324] = {
        { 153, 0, 1 },
        { 188, 0, 4 },
        { 180, 0, 3 },
        { 181, 0, 4 },
        { 1, 1, 16  },
        { 39, 0, 1  },
    },
    -- adaman barbuta, wiki order
    [12420] = {
        { 53, 0, 2  },
        { 188, 0, 4 },
        { 774, 2, 8 },
        { 329, 1, 4 },
        { 1, 15, 15 },
        { 137, 0, 2 },
    },
}

xi.augments.page_pools = {
    [1] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
}

xi.augments.lights_pools = {
    [xi.zone_lights.lights.BRIGHT_RED]   = {
        27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
        27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
        27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
    },
    [xi.zone_lights.lights.DIM_RED]      = {
        27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
    },
    [xi.zone_lights.lights.BRIGHT_BLUE]  = {
        59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91,
        59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91,
        59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91,
    },
    [xi.zone_lights.lights.DIM_BLUE]     = {
        59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 88, 89, 90, 91,
    },
    [xi.zone_lights.lights.BRIGHT_GOLD]  = {
        92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105,
        106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 87,
        92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105,
        106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 87,
        92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105,
        106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 87,
    },
    [xi.zone_lights.lights.DIM_GOLD]     = {
        92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105,
        106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 87,
    },
    [xi.zone_lights.lights.BRIGHT_GREEN] = {
        117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
        128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
        117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
        128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
        117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
        128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
    },
    [xi.zone_lights.lights.DIM_GREEN]    = {
        117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
        128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
    },
}

xi.augments.ingredients = {
    LOWBIE_AUG = 16485,
    MID_AUG    = 16481,
    COMBINER   = 9847,
    SEPARATOR  = 9848,
}

xi.augments.synthIsLowbieAugmentRecipe = function(ingredients)
    local item = xi.augments.getItemToAugmentFromIngredients(ingredients)

    return xi.augments.itemIsAugmentable(item)
end

xi.augments.synthIsCleansableRecipe = function(ingredients)
    local item = xi.augments.getItemToAugmentFromIngredients(ingredients)

    return xi.augments.itemIsCleansable(item)
end

xi.augments.getItemToAugmentFromIngredients = function(ingredients)
    for _, ingredient in ipairs(ingredients) do
        if not utils.contains(ingredient.item:getID(), xi.augments.ingredients) then
            return ingredient.item
        end
    end
    return nil
end

xi.augments.itemIsAugmentable = function(item)
    -- do a nil check (just cause)
    if item == nil then
        return false
    end

    -- Make sure it's not already augmented
    if item:isSubType(4) then
        print("Already augmented")
        return false
    end

    -- Make sure it is armor or weapon
    if not item:isType(0x08) and not item:isType(0x10) then
        print("Not weapon or armor")
        return false
    end

    -- Make sure it is not RARE or EX
    local flags = item:getFlag()
    if bit.band(flags, 16384) == 16384 or bit.band(flags, 32768) == 32768 then
        print("It is rare or EX")
        return false
    end

    return true
end

xi.augments.itemIsCleansable = function(item)
    -- do a nil check (just cause)
    if item == nil then
        return false
    end

    -- Make sure it IS augmented
    if not item:isSubType(4) then
        return false
    end

    -- Make sure it is armor or weapon
    if not item:isType(0x08) and not item:isType(0x10) then
        return false
    end

    -- Don't allow to cleanse an augment from an augment...
    local item_id = item:getID()
    if item_id == xi.augments.ingredients.LOWBIE_AUG or item_id == xi.augments.ingredients.MID_AUG then
        return false
    end

    -- Make sure it is cleansable (has an augment src)
    local aug_src = item:getAugSrc()
    if not aug_src then
        return false
    end

    -- Make sure the augment item src is an augment and not something else
    local aug_src_id = aug_src.augment_item_src
    if aug_src_id ~= xi.augments.ingredients.LOWBIE_AUG and aug_src_id ~= xi.augments.ingredients.MID_AUG then
        return false
    end

    return true
end

xi.augments.synthResultLowbieAugmentBond = function(player, ingredients)
    local aug = xi.synth.ingredientFromIngredients(ingredients, xi.augments.ingredients.LOWBIE_AUG)
    local item = xi.augments.getItemToAugmentFromIngredients(ingredients)
    local item_id = item:getID()

    player:addItem({id=item_id, augments=aug:getAugTable(), aug_src=aug:getAugSrc(), signature=item:getSignature()})

    return item_id, 1, true
end

xi.augments.synthCleanseAugmentSplit = function(player, ingredients)
    local item = xi.augments.getItemToAugmentFromIngredients(ingredients)
    local item_id = item:getID()
    local sig = item:getSignature()
    local augments = item:getAugTable()
    local aug_src = item:getAugSrc()

    player:addItem({id=item_id, signature=sig})
    player:addItem({id=aug_src.augment_item_src, augments=augments, aug_src=aug_src})
    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, aug_src.augment_item_src)

    return item_id, 1, true
end

--{chances = {100}, pool = {1}}
function xi.augments.RollAugments(augment_entry)
    local augments = {}
    local augment_src = {}

    for i, chance in ipairs( augment_entry.chances ) do
        if( math.random(1, 100) <= chance ) then
            -- get the pool ID that contains augment srcs
            local pool_id = augment_entry.pool[i]
            -- select a random augment source from the pool
            local src_id = xi.augments.page_pools[pool_id][math.random(1, #xi.augments.page_pools[pool_id])]
            -- grab the actual augment src
            local aug_src = xi.augments.sources[src_id]

            local aug_pos = i - 1
            augment_src[string.format("aug%d_src", aug_pos)] = src_id
            augment_src[string.format("aug%d_min", aug_pos)] = aug_src[2] -- min
            augment_src[string.format("aug%d_max", aug_pos)] = aug_src[3] -- max

            if( augments[aug_src[1]] ~= nil ) then
                augments[aug_src[1]] = augments[aug_src[1]] + math.random(aug_src[2], aug_src[3])
            else
                local amt = math.random(aug_src[2], aug_src[3])
                augments[aug_src[1]] = amt
            end
        end
    end

    return augments, augment_src
end

xi.augments.RollRegionalItemAugment = function(itemId)
    local augments = {}
    -- 100, 50, 25 for rolls 1, 2, 3
    if xi.augments.regional_item_augments[itemId] ~= nil then
        local augment_pool = xi.augments.regional_item_augments[itemId]

        -- Select First Augment
        local selection = math.random(1, #augment_pool)
        local augment   = augment_pool[selection]
        local augmentId = augment[1]
        local value     = math.random(augment[2], augment[3])

        augments[augmentId] = value

        -- Should we select a second augment?
        if math.random() < 0.5 then
            selection = math.random(1, #augment_pool)
            augment   = augment_pool[selection]
            augmentId = augment[1]
            value     = math.random(augment[2], augment[3])

            if augments[augmentId] == nil then
                -- If the augment is not on the item, add it
                augments[augmentId] = value
            else
                -- If the augment is already on the item, take the better version
                if augments[augmentId] < value then
                    augments[augmentId] = value
                end
            end
        end

        -- Should we select a third augment?
        if math.random() < 0.25 then
            selection = math.random(1, #augment_pool)
            augment   = augment_pool[selection]
            augmentId = augment[1]
            value     = math.random(augment[2], augment[3])

            if augments[augmentId] == nil then
                -- If the augment is not on the item, add it
                augments[augmentId] = value
            else
                -- If the augment is already on the item, take the better version
                if augments[augmentId] < value then
                    augments[augmentId] = value
                end
            end
        end
    end
    return augments
end

xi.augments.rollLightsAugment = function(zone)
    local augments     = {}
    local augment_srcs = {}

    -- Build the Augment Pool
    local augment_pool = {}
    local lights = {zone:getLights()}

    for _, light in ipairs(lights) do
        if light ~= 0 then
            for _, source_id in ipairs(xi.augments.lights_pools[light]) do
                table.insert(augment_pool, source_id)
            end
        end
    end

    local on_aug = 0
    for i, light in ipairs(lights) do
        if light ~= 0 then
            -- Do we do an augment selection?
            local chance = math.random()
            if chance < xi.zone_lights.zones[zone:getID()][i] then
                -- pick an augment
                local augment_src_id = augment_pool[math.random(1, #augment_pool)]
                local augment_src = xi.augments.sources[augment_src_id]

                augment_srcs[string.format("aug%d_src", on_aug)] = augment_src_id
                augment_srcs[string.format("aug%d_min", on_aug)] = augment_src[2] -- min
                augment_srcs[string.format("aug%d_max", on_aug)] = augment_src[3] -- max

                -- roll the range on the augment
                if( augments[augment_src[1]] ~= nil ) then
                    augments[augment_src[1]] = augments[augment_src[1]] + math.random(augment_src[2], augment_src[3])
                else
                    local amt = math.random(augment_src[2], augment_src[3])
                    augments[augment_src[1]] = amt
                end
                on_aug = on_aug + 1
            end
        else
            break
        end
    end

    return augments, augment_srcs
end