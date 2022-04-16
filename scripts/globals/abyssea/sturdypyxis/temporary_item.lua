-----------------------------------
-- Abyssea Sturdy Pyxis - Temporary item
-----------------------------------

xi = xi or {}
xi.pyxis = xi.pyxis or {}

xi.pyxis.tempItem = {}

---------------------------------
-- drop id's for temp items
-- use zone id as the key
---------------------------------
-- TODO: Add Temp Items to items.lua
local drops =
{
    [1] =
    {
        xi.items.BOTTLE_OF_CATHOLICON,
        xi.items.MEGALIXIR,
        xi.items.BOTTLE_OF_GNOSTICS_DRINK,
        xi.items.BOTTLE_OF_SPRINTERS_DRINK,
        xi.items.DUSTY_ELIXIR,
        xi.items.LUCID_POTION_I,
        xi.items.LUCID_ETHER_I,
    },

    [2] =
    {
        xi.items.BOTTLE_OF_CATHOLICON,
        xi.items.MEGALIXIR,
        xi.items.BOTTLE_OF_GNOSTICS_DRINK,
        xi.items.BOTTLE_OF_SPRINTERS_DRINK,
        xi.items.DUSTY_ELIXIR,
        xi.items.LUCID_POTION_I,
        xi.items.LUCID_ETHER_I,
        xi.items.DUSTY_WING,
        xi.items.TUBE_OF_HEALING_SALVE_I,
        xi.items.TUBE_OF_CLEAR_SALVE_I,
        xi.items.BOTTLE_OF_STALWARTS_TONIC,
        xi.items.BOTTLE_OF_ASCETICS_TONIC,
        xi.items.BOTTLE_OF_CHAMPIONS_TONIC,
        xi.items.BOTTLE_OF_SWIFTSHOT_DRINK,
        xi.items.BOTTLE_OF_BERSERKERS_DRINK,
    },

    [3] =
    {
        xi.items.BOTTLE_OF_CLERICS_DRINK,
        xi.items.BOTTLE_OF_FOOLS_DRINK,
        xi.items.BOTTLE_OF_VICARS_DRINK,
        xi.items.LUCID_POTION_II,
        xi.items.LUCID_ETHER_II,
        xi.items.LUCID_ELIXIR_I,
        xi.items.FLASK_OF_HEALING_MIST,
        xi.items.FLASK_OF_MANA_MIST,
        xi.items.PAIR_OF_LUCID_WINGS_I,
        xi.items.TUBE_OF_CLEAR_SALVE_II,
        xi.items.BOTTLE_OF_CHAMPIONS_GAMBIR,
        xi.items.BOTTLE_OF_FOOLS_TONIC,
        xi.items.BOTTLE_OF_SWIFTSHOT_TONIC,
    },

    [4] =
    {
        xi.items.BOTTLE_OF_CLERICS_DRINK,
        xi.items.BOTTLE_OF_FOOLS_DRINK,
        xi.items.BOTTLE_OF_VICARS_DRINK,
        xi.items.LUCID_POTION_II,
        xi.items.LUCID_ETHER_II,
        xi.items.LUCID_ELIXIR_I,
        xi.items.FLASK_OF_HEALING_MIST,
        xi.items.FLASK_OF_MANA_MIST,
        xi.items.PAIR_OF_LUCID_WINGS_I,
        xi.items.TUBE_OF_CLEAR_SALVE_II,
        xi.items.BOTTLE_OF_CHAMPIONS_GAMBIR,
        xi.items.BOTTLE_OF_FOOLS_TONIC,
        xi.items.BOTTLE_OF_SWIFTSHOT_TONIC,
        xi.items.PINCH_OF_MANA_POWDER,
        xi.items.FLASK_OF_HEALING_POWDER,
        xi.items.BOTTLE_OF_MONARCHS_DRINK,
        xi.items.BOTTLE_OF_FANATICS_DRINK,
        xi.items.LUCID_POTION_III,
        xi.items.LUCID_ETHER_III,
        xi.items.LUCID_ELIXIR_II,
        xi.items.TUBE_OF_HEALING_SALVE_II,
        xi.items.BOTTLE_OF_STALWARTS_GAMBIR,
        xi.items.BOTTLE_OF_ASCETICS_GAMBIR,
        xi.items.PINCH_OF_FANATICS_POWDER,
        xi.items.PINCH_OF_FOOLS_POWDER,
        xi.items.BOTTLE_OF_BERSERKERS_TONIC,
    },

    [5] =
    {
        xi.items.BOTTLE_OF_CLERICS_DRINK,
        xi.items.BOTTLE_OF_FOOLS_DRINK,
        xi.items.BOTTLE_OF_VICARS_DRINK,
        xi.items.LUCID_POTION_II,
        xi.items.LUCID_ETHER_II,
        xi.items.LUCID_ELIXIR_I,
        xi.items.FLASK_OF_HEALING_MIST,
        xi.items.FLASK_OF_MANA_MIST,
        xi.items.PAIR_OF_LUCID_WINGS_I,
        xi.items.TUBE_OF_CLEAR_SALVE_II,
        xi.items.BOTTLE_OF_CHAMPIONS_GAMBIR,
        xi.items.BOTTLE_OF_FOOLS_TONIC,
        xi.items.BOTTLE_OF_SWIFTSHOT_TONIC,
        xi.items.PINCH_OF_MANA_POWDER,
        xi.items.FLASK_OF_HEALING_POWDER,
        xi.items.BOTTLE_OF_MONARCHS_DRINK,
        xi.items.BOTTLE_OF_FANATICS_DRINK,
        xi.items.LUCID_POTION_III,
        xi.items.LUCID_ETHER_III,
        xi.items.LUCID_ELIXIR_II,
        xi.items.TUBE_OF_HEALING_SALVE_II,
        xi.items.BOTTLE_OF_STALWARTS_GAMBIR,
        xi.items.BOTTLE_OF_ASCETICS_GAMBIR,
        xi.items.PINCH_OF_FANATICS_POWDER,
        xi.items.PINCH_OF_FOOLS_POWDER,
        xi.items.BOTTLE_OF_BERSERKERS_TONIC,
        xi.items.REVITALIZER,
        xi.items.DAEDALUS_WING,
        xi.items.BOTTLE_OF_FANATICS_TONIC,
    },
}

local function GetTempDropTable(npc)
    local maxItem = npc:getLocalVar("NB_ITEM")
    local tempTable = {}

    for i = 1, maxItem do
        tempTable[i] = npc:getLocalVar("TEMP" .. i)
    end

    return tempTable
end

local function GiveTempItem(player, npc, tempNum)
    local tempItems = GetTempDropTable(npc)
    local ID = zones[player:getZoneID()]

    if tempItems[tempNum] == 0 then
        player:messageSpecial(ID.text.TEMP_ITEM_DISAPPEARED)
        return
    else
        if player:hasItem(tempItems[tempNum], 3) then
            player:messageSpecial(ID.text.ALLREADY_POSSESS_TEMP_ITEM)
            return
        else
            player:addTempItem(tempItems[tempNum])
            xi.pyxis.messageChest(player, ID.text.OBTAINS_TEMP_ITEM, tempItems[tempNum], 0, 0, 0, npc)
            npc:setLocalVar("TEMP" .. tempNum, 0)
            tempItems[tempNum] = 0
        end
    end

    if xi.pyxis.isChestEmpty(tempItems) then
        xi.pyxis.removeChest(player, npc, 0, 3)
    end
end

xi.pyxis.tempItem.setTempItems = function(npc, tier)
    local maxItem = npc:getLocalVar("NB_ITEM")

    for i = 1, maxItem do
        local temp = drops[tier][math.random(1, #drops[tier])]
        npc:setLocalVar("TEMP" .. i, temp)
    end
end

xi.pyxis.tempItem.giveTemporaryItems = function(npc, player)
    local tier = npc:getLocalVar("TIER")
    local ID = zones[npc:getZoneID()]
    local alliance = player:getAlliance()

    for i = 1, #drops[tier] do
        local item = drops[tier][math.random(1,#drops[tier])]
        for p, member in ipairs(alliance) do
            if member:isPC() and not member:hasItem(item,3) and member:getZoneID() == player:getZoneID() then
                member:addTempItem(item, 1, 0, 0, 0, 0, 0, 0, 0, 0)
            end
        end
    end

    for p, member in ipairs(alliance) do
        if member:isPC() then
            member:messageSpecial(ID.text.OBTAINS_SEVERAL_TEMPS, 0, 0, 0, 0)
        end
    end
end

xi.pyxis.tempItem.updateEvent = function(player, npc)
    player:updateEvent(unpack(GetTempDropTable(npc)))
end

xi.pyxis.tempItem.giveTemporaryItem = function(player, npc, option)
    local itemSelected = bit.rshift(option, 16)

    if itemSelected > 0 and itemSelected <= 8 then
        GiveTempItem(player, npc, itemSelected)
    end
end
