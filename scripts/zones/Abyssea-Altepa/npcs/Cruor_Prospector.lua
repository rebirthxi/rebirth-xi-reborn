-----------------------------------
-- Area: Abyssea - Altepa
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------
local entity = {}

local itemType =
{
    ITEM        = 1,
    TEMP        = 2,
    KEYITEM     = 3,
    ENHANCEMENT = 4,
}

local prospectorItems =
{
    [itemType.ITEM] =
    {-- Sel      Item                            Cost,  Qty
        [ 1] = { xi.items.RAVAGERS_MUFFLERS,     5000 },
        [ 2] = { xi.items.TANTRA_GLOVES,         5000 },
        [ 3] = { xi.items.ORISON_MITTS,          5000 },
        [ 4] = { xi.items.GOETIA_GLOVES,         5000 },
        [ 5] = { xi.items.ESTOQUEURS_GANTHEROTS, 5000 },
        [ 6] = { xi.items.RAIDERS_ARMLETS,       5000 },
        [ 7] = { xi.items.UTILIS_SHIELD,         5000 },
        [ 8] = { xi.items.PYF_HARP,              5000 },
        [ 9] = { xi.items.FORBIDDEN_KEY,          500 },
        [10] = { xi.items.SHADOW_THRONE,      2000000 },
    },

    [itemType.TEMP] =
    {-- Sel      Item                          Cost, Qty
        [ 1] = { xi.items.LUCID_POTION_I,             80 },
        [ 2] = { xi.items.LUCID_ETHER_I,              80 },
        [ 3] = { xi.items.BOTTLE_OF_CATHOLICON,       80 },
        [ 4] = { xi.items.DUSTY_ELIXIR,              120 },
        [ 5] = { xi.items.TUBE_OF_CLEAR_SALVE_I,     120 },
        [ 6] = { xi.items.BOTTLE_OF_STALWARTS_TONIC, 150 },
        [ 7] = { xi.items.BOTTLE_OF_ASCETICS_TONIC,  150 },
        [ 8] = { xi.items.BOTTLE_OF_CHAMPIONS_TONIC, 150 },
        [ 9] = { xi.items.LUCID_POTION_II,           200 },
        [10] = { xi.items.LUCID_ETHER_II,            200 },
        [11] = { xi.items.LUCID_ELIXIR_I,            300 },
        [12] = { xi.items.FLASK_OF_HEALING_POWDER,   300 },
        [13] = { xi.items.PINCH_OF_MANA_POWDER,      300 },
        [14] = { xi.items.TUBE_OF_HEALING_SALVE_I,   300 },
        [15] = { xi.items.BOTTLE_OF_VICARS_DRINK,    300 },
        [16] = { xi.items.TUBE_OF_CLEAR_SALVE_II,    300 },
        [17] = { xi.items.PRIMEVAL_BREW,         2000000 },
    },

    [itemType.KEYITEM] =
    {-- Sel     Item                                 Cost
        [1] = { xi.ki.MAP_OF_ABYSSEA_ALTEPA,         4500 },
        [2] = { xi.ki.IVORY_ABYSSITE_OF_MERIT,       6000 },
        [3] = { xi.ki.IVORY_ABYSSITE_OF_FURTHERANCE, 7500 },
        [4] = { xi.ki.IVORY_ABYSSITE_OF_CELERITY,    9000 },
        [5] = { xi.ki.CLEAR_DEMILUNE_ABYSSITE,        300 },
    },

    [itemType.ENHANCEMENT] =
    {-- Sel          Effect (Abyssea)       Actual Effect          Amt, KeyItem for Bonus,           Bonus Mult      Cost
        [ 6] = { { { xi.effect.ABYSSEA_HP,  xi.effect.MAX_HP_BOOST, 20, xi.abyssea.abyssiteType.MERIT,       10 }, },  50 },
        [ 7] = { { { xi.effect.ABYSSEA_MP,  xi.effect.MAX_MP_BOOST, 10, xi.abyssea.abyssiteType.MERIT,        5 }, }, 120 },
        [ 8] = { { { xi.effect.ABYSSEA_STR, xi.effect.STR_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_DEX, xi.effect.DEX_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 }, }, 120 },
        [ 9] = { { { xi.effect.ABYSSEA_VIT, xi.effect.VIT_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_AGI, xi.effect.AGI_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 }, }, 100 },
        [10] = { { { xi.effect.ABYSSEA_INT, xi.effect.INT_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_CHR, xi.effect.CHR_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_MND, xi.effect.MND_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 }, }, 100 },
        [11] = { { { xi.effect.ABYSSEA_HP,  xi.effect.MAX_HP_BOOST, 20, xi.abyssea.abyssiteType.MERIT,       10 },
                   { xi.effect.ABYSSEA_MP,  xi.effect.MAX_MP_BOOST, 10, xi.abyssea.abyssiteType.MERIT,        5 },
                   { xi.effect.ABYSSEA_STR, xi.effect.STR_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_DEX, xi.effect.DEX_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_VIT, xi.effect.VIT_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_AGI, xi.effect.AGI_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_INT, xi.effect.INT_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_CHR, xi.effect.CHR_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 },
                   { xi.effect.ABYSSEA_MND, xi.effect.MND_BOOST,    10, xi.abyssea.abyssiteType.FURTHERANCE, 10 }, }, 470 },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local cruor = player:getCurrency("cruor")
    local demilune = xi.abyssea.getDemiluneAbyssite(player)

    player:startEvent(2002, cruor, demilune)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local itemCategory = bit.band(option, 0x07)
    local itemSelected = bit.band(bit.rshift(option, 16), 0x1F)
    local cruorTotal = player:getCurrency("cruor")

    if itemCategory == itemType.ITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemQty = itemData[1] ~= xi.items.FORBIDDEN_KEY and 1 or bit.rshift(option, 24)
        local itemCost = itemData[2] * itemQty

        if
            itemCost <= cruorTotal and
            npcUtil.giveItem(player, {{ itemData[1], itemQty }})
        then
            player:delCurrency("cruor", itemCost)
        end
    elseif itemCategory == itemType.TEMP then
        local itemData = prospectorItems[itemCategory][itemSelected]
        local itemCost = itemData[2]

        if
            itemCost <= cruorTotal and
            npcUtil.giveTempItem(player, {{ itemData[1], 1 }})
        then
            player:delCurrency("cruor", itemCost)
        end
    elseif itemCategory == itemType.KEYITEM then
        local itemData = prospectorItems[itemCategory][itemSelected]

        if
            itemData[2] <= cruorTotal and
            npcUtil.giveKeyItem(player, itemData[1])
        then
            player:delCurrency("cruor", itemData[2])
        end
    elseif itemCategory == itemType.ENHANCEMENT then
        local enhanceData = prospectorItems[itemCategory][itemSelected]

        if enhanceData <= cruorTotal then
            for _, v in ipairs(enhanceData[1]) do
                player:addStatusEffectEx(v[1], v[2], v[3] + xi.abyssea.getAbyssiteTotal(player, v[4]) * v[5])

                if v[1] == xi.effect.ABYSSEA_HP then
                    player:addHP(v[3] + xi.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                elseif v[1] == xi.effect.ABYSSEA_MP then
                    player:addMP(v[3] + xi.abyssea.getAbyssiteTotal(player, v[4]) * v[5])
                end
            end

            player:delCurrency("cruor", enhanceData[2])
        end
    end
end

return entity
