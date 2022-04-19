-----------------------------------
--- QR Augments
--- * Lowbie Augments
-----------------------------------
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/globals/items")
require("scripts/globals/qr_synth")
-----------------------------------
xi.augments = xi.augments or {}

xi.augments.sources = xi.augments.sources or {
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
}

xi.augments.strings = xi.augments.strings or {
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

xi.augments.page_pools = xi.augments.page_pools or {
    [1] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
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
