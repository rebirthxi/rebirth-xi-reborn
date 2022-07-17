-----------------------------------
-- Global Casket utility script
-----------------------------------
require("scripts/globals/casket_loot")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/roe")
-----------------------------------

-----------------------------------
-- Notes:
-----------------------------------
-- chest MiD's
-- 960  -- Basic Chest
-- 965  -- Blue Casket
-- 966  -- Brown Casket
-- 967  -- Bronze
-- 968  -- Red
-- 969  -- Gold
-- 1524 -- Odd Chest
-- 1932 -- Black with Red chest
-- 2425 -- Black with Red chest 2
-----------------------------------

xi = xi or {}
xi.caskets = xi.caskets or {}

xi.caskets.casketInfo =
{
    spawnStatus =
    {
        DESPAWNED      = 0,
        SPAWNED_CLOSED = 1,
        SPAWNED_OPEN   = 2,
    },
    messageOffset =
    {
        NO_COMBINATION           = 6,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 9,  -- It appears that the correct combination was ≺NUMBER≻.
        OPENED_LOCK              = 10, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 11, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 12, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 13, -- You have a hunch that the combination is greater than ≺NUMBER≻ and less than ≺NUMBER≻.
        COMBINATION_LESS_THAN    = 14, -- You have a hunch that the combination is less than ≺NUMBER≻.
        COMBINATION_GREATER_THAN = 15, -- You have a hunch that the combination is greater than ≺NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 16, -- You have a hunch that one of the two digits is ≺NUMBER≻.
        SECOND_DIGIT_IS          = 17, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 18, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 19, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 21, -- The monster was concealing a treasure chest!
    },
    casketZones =
    {
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
        112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123,
        124, 125, 126, 127, 128, 130, 153, 157, 158, 159, 160, 166,
        167, 169, 172, 173, 174, 176, 177, 178, 184, 190, 191, 192,
        193, 194, 195, 196, 197, 198, 204, 205, 207, 208, 212, 213
    },
    splitZones = set{
       xi.zone.ZERUHN_MINES,
       xi.zone.KORROLOKA_TUNNEL,
       xi.zone.DANGRUF_WADI,
       xi.zone.KING_RANPERRES_TOMB,
       xi.zone.ORDELLES_CAVES,
       xi.zone.OUTER_HORUTOTO_RUINS,
       xi.zone.GUSGEN_MINES,
       xi.zone.MAZE_OF_SHAKHRAMI
    },
    cs =
    {
        [0]  = 1000, [1]  = 1003, [2]  = 1006, [3]  = 1009, [4]  = 1012, [5]  = 1015,
        [6]  = 1018, [7]  = 1021, [8]  = 1024, [9]  = 1027, [10] = 1030, [11] = 1033,
        [12] = 1036, [13] = 1039, [14] = 1042, [15] = 1045, [16] = 1048
    },
    dropTypes =
    {
        [1]  = "tempItems",
        [2]  = "items",
        [3]  = "evolith" -- NOTE: not implemented! item id: 2783
    },
    evolithAugs =
    {
        -- TODO: find all augments for evoliths.
    },
}

-----------------------------------
-- Desc: Helper function for making it easier to read time between spawns.
-----------------------------------
xi.caskets.convertTime = function(rawTime)
   local rawSeconds = tonumber(rawTime)
   local timeTable = {0, 0, 0}

    timeTable[1] = string.format("%02.f", math.floor(rawSeconds/3600))
    timeTable[2] = string.format("%02.f", math.floor(rawSeconds/60 - (timeTable[1]*60)))
    timeTable[3] = string.format("%02.f", math.floor(rawSeconds - timeTable[1]*3600 - timeTable[2] *60))

    return timeTable
end

-----------------------------------
-- Desc: Check for time elapsed since last spawned
-- NOTE: will NOT allow a spawn if time since last spanwed is under 5 mins.
-----------------------------------
xi.caskets.timeElapsedCheck = function(npc)
    local spawnTime   = os.time() + 360000 -- defualt time in case no var set.
    local timeTable   = {0, 0, 0}          -- HOURS, MINUTES, SECONDS.

    if npc == nil then
        return false
    end

    if npc:getLocalVar("[caskets]SPAWNTIME") then
        spawnTime = npc:getLocalVar("[caskets]SPAWNTIME")
    end

    local lastSpawned = os.time() - spawnTime

    timeTable = xi.caskets.convertTime(lastSpawned)

    if tonumber(timeTable[1]) >= 01 or tonumber(timeTable[1]) < 01 and tonumber(timeTable[2]) >= 05 then
        return true
    end

    return false
end

-----------------------------------
-- Desc: Grabs an id for a casket if one is available if not, no casket will spawn.
-----------------------------------
xi.caskets.getCasketID = function(mob)
    local baseChestId = zones[mob:getZoneID()].npc.CASKET_BASE
    local chestId     = 0

    for i = baseChestId, baseChestId + 15 do
        if xi.caskets.timeElapsedCheck(GetNPCByID(i)) then
            if GetNPCByID(i):getLocalVar("[caskets]SPAWNSTATUS") == xi.caskets.casketInfo.spawnStatus.DESPAWNED or
                GetNPCByID(i):getLocalVar("[caskets]SPAWNSTATUS") == 0 then
                chestId = i
                break
            end
        end
    end

    if GetNPCByID(chestId) == nil then
        return 0
    end

    return chestId
end

-----------------------------------
-- Desc: Drop rate check, calculates all drop rate modifiers.
-----------------------------------
xi.caskets.dropChance = function(player)
    -----------------------------------
    -- NOTES: 10% base drop rate.
    -- Super Kupowers(Myriad Mystery Boxes) adds 10% drop rate to the base rate.
    -- GoV Prowess Increased Treasure Casket Discovery adds 5% per level (max 5 levels)
    -- for a total of 25% increase. -- NOTE this needs to be confirmed!
    -----------------------------------
    --local kupowerMMBEffect    = player:getStatusEffect(xi.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES)  -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    local casketProwessEffect = player:getStatusEffect(xi.effect.PROWESS_CASKET_RATE)
    local kupowersMMBPower    = 0
    local prowessCasketsPower = 0

    --if player:hasStatusEffect(xi.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES) then                       -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    --     kupowersMMBPower = kupowerMMBEffect:getPower()
    --end

    if player:hasStatusEffect(xi.effect.PROWESS_CASKET_RATE) then
        prowessCasketsPower = casketProwessEffect:getPower()
    end

    local rand = math.random()
    if rand < utils.clamp(xi.settings.CASKET_DROP_RATE + kupowersMMBPower + prowessCasketsPower, 0, 1) then
        return true
    end

    return false
end

-----------------------------------
-- Desc: Sends the message: "The monster was concealing a treasure chest!" to all in party/alliance
-----------------------------------
xi.caskets.sendChestDropMessage = function(player)
    local ID          = zones[player:getZoneID()]
    local dropMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM + xi.caskets.casketInfo.messageOffset.MONSTER_CONCEALED_CHEST
    local party       = {}

    party = player:getAlliance()

    for _, member in pairs(party) do
        if member:getZoneID() == player:getZoneID() then
            member:messageSpecial(dropMessage , 0)
        end
    end
end

-----------------------------------
-- Desc: Despawn a chest and reset its local var's
-----------------------------------
xi.caskets.removeChest = function(npc)
    npc:setAnimationSub(0)
    npc:setStatus(xi.status.DISAPPEAR)
    npc:setLocalVar("[caskets]SPAWNSTATUS", xi.caskets.casketInfo.spawnStatus.DESPAWNED)
end

-----------------------------------
-- Desc: Sets all the base localVar's, type of chest and if locked, sets the random number.
-----------------------------------
xi.caskets.setCasketData = function(player, x, y, z, r, npc, partyID, mobLvl)
    -----------------------------------
    -- NOTE: Super Kupowers Myriad Mystery Boxes add an additional 20% chance the chest will be locked.
    -----------------------------------
    local typeChance       = math.random()
    local chestStyle       = 965
    local correctNum       = math.random(10, 99)
    local attempts         = math.random(4, 6)
    local kupowersBonus    = 0

    -- if player:hasStatusEffect(xi.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES) then    -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    --     kupowersBonus = 0.2
    -- end

    if typeChance < 0.2 + kupowersBonus then
        chestStyle = 966 -- Brown locked
    else
        chestStyle = 965 -- Blue
    end

    if npc ~= nil then
        npc:resetLocalVars()
        npc:setAnimation(0)
        npc:setAnimationSub(4)
        -----------------------------------
        -- Chest data
        -----------------------------------
        npc:setLocalVar("[caskets]PARTYID", partyID)
        npc:setLocalVar("[caskets]ITEMS_SET", 0)
        npc:setLocalVar("[caskets]MOBLVL", mobLvl)

        if chestStyle == 966 then
            npc:setLocalVar("[caskets]ATTEMPTS", attempts)
            npc:setLocalVar("[caskets]CORRECT_NUM", correctNum)
            npc:setLocalVar("[caskets]FAILED_ATEMPTS", 0)
            npc:setLocalVar("[caskets]LOCKED", 1)
            npc:setLocalVar("[caskets]LOOT_TYPE", 2)
            npc:setLocalVar("[caskets]HINTS_TABLE", 1234567)
        else
            npc:setLocalVar("[caskets]LOCKED", 0)
            npc:setLocalVar("[caskets]LOOT_TYPE", 1)
        end

        npc:setLocalVar("[caskets]SPAWNSTATUS", xi.caskets.casketInfo.spawnStatus.SPAWNED_CLOSED)
        npc:setLocalVar("[caskets]SPAWNTIME", os.time())
        npc:setPos(x, y, z, r)
        npc:setStatus(xi.status.NORMAL)
        npc:entityAnimationPacket("deru")
        npc:setModelId(chestStyle)
        xi.caskets.sendChestDropMessage(player)
        -----------------------------------
        -- Despawn chest after 3 Mins
        -----------------------------------
        npc:timer(180000, function(npcArg)
            xi.caskets.removeChest(npcArg)
        end)
    end
end

-----------------------------------
-- Desc: Checks to see if the item needs multiples, i.e. Arrowheads, if so, sends true and the item is multiplied
-----------------------------------
xi.caskets.multipleItemCheck = function(itemId)
    local multiples = {1214, 1215, 1211, 1212, 1213, 1217, 1222, 1962}

    for i = 1, #multiples do
        if (itemId == multiples[i]) then
            return true
        end
    end
    return false
end

-----------------------------------
-- Desc: Checks to see if all the items have been removed from the casket then removes it.
-----------------------------------
xi.caskets.checkItemChestIsEmpty = function(npc)
    local item1 = npc:getLocalVar("[caskets]ITEM1")
    local item2 = npc:getLocalVar("[caskets]ITEM2")
    local item3 = npc:getLocalVar("[caskets]ITEM3")
    local item4 = npc:getLocalVar("[caskets]ITEM4")

    if item1 == 0 and item2 == 0 and item3 == 0 and item4 == 0 then
        xi.caskets.removeChest(npc)
    end
end

-----------------------------------
-- ******Additional Functions******
-----------------------------------

-----------------------------------
-- Desc: Messages sent to all players in a party in the zone
-----------------------------------
xi.caskets.messageChest = function(player, messageString, param1, param2, param3, param4, npc)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    local msg         = 0

    if messageString == "UNABLE_TO_OPEN_LOCK" then
        msg = baseMessage + xi.caskets.casketInfo.messageOffset.UNABLE_TO_OPEN_LOCK
    elseif messageString == "OPENED_LOCK" then
        msg = baseMessage + xi.caskets.casketInfo.messageOffset.OPENED_LOCK
    elseif messageString == "PLAYER_OBTAINS_ITEM" then
        msg = ID.text.PLAYER_OBTAINS_ITEM
    elseif messageString == "PLAYER_OBTAINS_TEMP_ITEM" then
        msg = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    end

    local alliance = player:getAlliance()
    for _, member in pairs(alliance) do
        if member:getZoneID() == player:getZoneID() then
            member:messageName(msg, player, param1, param2, param3, param4, nil)
        end
    end
end

-----------------------------------
-- Desc: Checks attempts and despawns the chest if all attempts have been used up.
-----------------------------------
xi.caskets.checkRemainingAttempts = function(player, npc, remaining, correctNumber)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM

    if remaining == 1 then
        player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.CORRECT_NUMBER_WAS, correctNumber, 0, 0, 0, 0)
        xi.caskets.messageChest(player, "UNABLE_TO_OPEN_LOCK", 0, 0, 0, 0, npc)
        xi.caskets.removeChest(npc)
    end
end

-----------------------------------
-- Desc: Removes hint so they are not repeated, is no hints left, this enables the message,
--       "You were unable to glean anything from your examination of the lock."
-----------------------------------
xi.caskets.removeHint = function(npc, hintNum)
    local hintVar       = npc:getLocalVar("[caskets]HINTS_TABLE")
    local hintString    = tostring(hintVar)
    local newHintString = ""

    if #hintString > 1 then
        newHintString = hintString:gsub(tostring(hintNum), "")
    else
        newHintString = "0"
    end

    npc:setLocalVar("[caskets]HINTS_TABLE", tonumber(newHintString))
end

-----------------------------------
-- Desc: Checks number to see if they are even or not for the locked minigame.
-----------------------------------
xi.caskets.isEven = function(number)
    if number % 2 == 0 then
        return true
    else
        return false
    end
end

-----------------------------------
-- Desc: Sets the items id in a local variable for the casket.
-----------------------------------
xi.caskets.setItems = function(npc, item1, item2, item3, item4)
    npc:setLocalVar("[caskets]ITEM1", item1)
    npc:setLocalVar("[caskets]ITEM2", item2)
    npc:setLocalVar("[caskets]ITEM3", item3)
    npc:setLocalVar("[caskets]ITEM4", item4)
    npc:setLocalVar("[caskets]ITEMS_SET", 1)
end

-----------------------------------
-- Desc: Sets the temp items id in a local variable for the casket.
-----------------------------------
xi.caskets.setTempItems = function(npc, temp1, temp2, temp3)
    npc:setLocalVar("[caskets]TEMP1", temp1)
    npc:setLocalVar("[caskets]TEMP2", temp2)
    npc:setLocalVar("[caskets]TEMP3", temp3)
    npc:setLocalVar("[caskets]ITEMS_SET", 1)
end

-----------------------------------
-- Desc: Function selects items from a table with the fallback being a potion.
--       It then applies a resultFunction to that selection (this is typically used to
--       potentially swap out regional items).
-----------------------------------
xi.caskets.selectItemsFromTable = function(possibleCountSelection, possibleItems, resultFunction)
    local countOfDrops = possibleCountSelection[math.random(1, #possibleCountSelection)]
    local selections = {0, 0, 0, 0} -- covers all cases, 3 drops and 4 drops

    for i = 1, countOfDrops do
        local sum = 0

        for _, v in pairs(possibleItems) do
            sum = sum + v[1]
        end

        local rand = math.random() * sum -- note: NOT math.random(sum). That will truncate the fractional part of sum
        local selection = 0

        for _, v in pairs(possibleItems) do
            rand = rand - v[1]
            if rand <= 0 then
                selection = v[2]
                break
            end
        end
        if selection == 0 or selection == nil then
            selections[i] = 4112 -- default to potion
        else
            local index, resultSelection = resultFunction(selection, i)

            selections[index] = resultSelection
        end
    end

    return selections
end

-----------------------------------
-- Desc: Function returns a table of the temp items this casket (npc) is going to be filled with.
-----------------------------------
xi.caskets.getTempItems = function(npc, zoneId)
    local randomTable  = {1, 3, 1, 2, 1, 2, 1, 1, 3, 1, 2, 1}
    local tempDrops = xi.casket_loot.casketItems[zoneId].temps

    if xi.caskets.casketInfo.splitZones[zoneId] then
        local mobLvl = npc:getLocalVar("[caskets]MOBLVL")
        if mobLvl > 50 then
            tempDrops = xi.casket_loot.casketItems[zoneId].tempsHi
        else
            tempDrops = xi.casket_loot.casketItems[zoneId].tempsLow
        end
    end

    return xi.caskets.selectItemsFromTable(randomTable, tempDrops, function(originalSelection, index)
        return index, originalSelection;
    end)
end

-----------------------------------
-- Desc: Function returns a table of the items this casket (npc) is going to be filled with.
-----------------------------------
xi.caskets.getCasketItems = function(npc, zoneId)
    local randomTable  = {1, 4, 1, 3, 1, 1, 2, 1, 3, 1, 2, 1}
    local drops = xi.casket_loot.casketItems[zoneId].items

    if xi.caskets.casketInfo.splitZones[zoneId] then
        local mobLvl = npc:getLocalVar("[caskets]MOBLVL")
        if mobLvl > 50 then
            drops = xi.casket_loot.casketItems[zoneId].itemsHi
        else
            drops = xi.casket_loot.casketItems[zoneId].itemsLow
        end
    end

    return xi.caskets.selectItemsFromTable(randomTable, drops, function(originalSelection, index)
        if math.random() < 0.05 then
            return 1, xi.casket_loot.casketItems[zoneId].regionalItems[math.random(1, #xi.casket_loot.casketItems[zoneId].regionalItems)]
        else
            return index, originalSelection
        end
    end)
end

-----------------------------------
-- Grab random drops from zone item or temp tables depending on type of chest
-----------------------------------
xi.caskets.getDrops = function(npc, dropType, zoneId)
    local chestType = xi.caskets.casketInfo.dropTypes[dropType]

    if npc:getLocalVar("[caskets]ITEMS_SET") == 1 then
        return
    end

    -----------------------------------
    -- Temp drops
    -----------------------------------
    if chestType == "tempItems" then
        local temps = xi.caskets.getTempItems(npc, zoneId)

        xi.caskets.setTempItems(npc, temps[1], temps[2], temps[3])
    -----------------------------------
    -- Item drops
    -----------------------------------
    elseif chestType == "items" then
        local items = xi.caskets.getCasketItems(npc, zoneId)

        xi.caskets.setItems(npc, items[1], items[2], items[3], items[4])
    -----------------------------------
    -- Evolith drops
    -----------------------------------
    elseif chestType == "evolith" then
        -- local evolith = 2783
        -- NOTE: Not implimented yet and will be incorperated into items once implimented.
        -- this is mainly here as a means of testing before implimentation.
    end
end

-----------------------------------
-- Temp item functions
-----------------------------------

-----------------------------------
-- Desc: Returns an temp items id based on the the local variable i.e. npc:getLocalVariable("TEMP1").
-----------------------------------
xi.caskets.getTempDrop = function(npc, tempNum)
    local query = string.format("[caskets]TEMP" ..tempNum.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

-----------------------------------
-- Desc: Checks to see if the casket is empty after a player removes an item, if so, despawns the casket
-----------------------------------
xi.caskets.checkTempChestIsEmpty = function(npc)
    local temp1 = npc:getLocalVar("[caskets]TEMP1")
    local temp2 = npc:getLocalVar("[caskets]TEMP2")
    local temp3 = npc:getLocalVar("[caskets]TEMP3")

    if temp1 == 0 and temp2 == 0 and temp3 == 0 then
        xi.caskets.removeChest(npc)
    end
end

-----------------------------------
-- Desc: Gives the player the temp item from a casket based on the selection of the csid
-----------------------------------
xi.caskets.giveTempItem = function(player, npc, tempNum)
    local tempQuery   = string.format("[caskets]TEMP" ..tempNum.. "")
    local tempID      = npc:getLocalVar(tempQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("[caskets]SPAWNSTATUS")

    if spawnStatus == xi.caskets.casketInfo.spawnStatus.DESPAWNED then
        return
    end

    if tempID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:hasItem(tempID, 3) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            if player:addTempItem(tempID) then
                xi.caskets.messageChest(player, "PLAYER_OBTAINS_TEMP_ITEM", tempID, 0, 0, 0)
                npc:setLocalVar(tempQuery, 0)
                xi.caskets.checkTempChestIsEmpty(npc)
            end
        end
    end
end

-----------------------------------
-- Basic item functions
-----------------------------------

-----------------------------------
-- Desc: Returns an items id based on the the local variable i.e. npc:getLocalVariable("ITEM1").
-----------------------------------
xi.caskets.getChestItem = function(npc, slot)
    local query = string.format("[caskets]ITEM" ..slot.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

-----------------------------------
-- Desc: Gives the player the item from a casket based on the selection of the csid
-----------------------------------
xi.caskets.giveItem = function(player, npc, itemNum)
    local itemQuery   = string.format("[caskets]ITEM" ..itemNum.. "")
    local itemID      = npc:getLocalVar(itemQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("[caskets]SPAWNSTATUS")

    if spawnStatus == xi.caskets.casketInfo.spawnStatus.DESPAWNED then
        return
    end

    if itemID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)
            return
        elseif player:getFreeSlotsCount() > 0 then
            if itemID ~= 0 then
                if xi.caskets.multipleItemCheck(itemID) then
                    if player:addItem(itemID, 33) then
                        xi.caskets.messageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                        xi.caskets.checkItemChestIsEmpty(npc)
                    end
                else
                    if player:addItem(itemID) then
                        xi.caskets.messageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                        xi.caskets.checkItemChestIsEmpty(npc)
                    end
                end
            end
        end
    end
end

-----------------------------------
-- Desc: Casket spawn checks, runs through all checks before spawning
-----------------------------------
xi.caskets.spawnCasket = function (player, mob, x, y, z, r)
    local chestId    = xi.caskets.getCasketID(mob)
    local npc        = GetNPCByID(chestId)
    local chestOwner = player:getLeaderID()

    if chestId == 0 then
        return
    end

    if xi.caskets.dropChance(player) then
        xi.caskets.setCasketData(player, x, y, z, r, npc, chestOwner, mob:getMainLvl())
    end
end

-----------------------------------
-- Main public casket functions
-----------------------------------
xi.caskets.onTrigger = function(player, npc)
    -----------------------------------
    -- Basic chest var's
    -----------------------------------
    local chestId           = npc:getID()                             -- ID of the chest
    local itemType          = npc:getLocalVar("[caskets]LOOT_TYPE")   -- Type: 1 Temps, 2 Items.
    local locked            = npc:getLocalVar("[caskets]LOCKED")      -- enter two-digit combination (10~99).
    local chestOwner        = npc:getLocalVar("[caskets]PARTYID")     -- the id of the party that has rights to the chest.
    local leaderId          = player:getLeaderID()
    --local aumentflag      = 0x0202                                  -- Used for Evoliths (not implemented yet).
    local eventBase         = zones[npc:getZoneID()].npc.CASKET_BASE           -- base id of the current chest.
    local lockedEvent       = xi.caskets.casketInfo.cs[chestId - eventBase] + 2  -- Chest locked cs's.
    local unlockedEvent     = xi.caskets.casketInfo.cs[chestId - eventBase]      -- Chest unlocked cs's.

    -----------------------------------
    -- Locked chest var's
    -----------------------------------
    local attemptsAllowed   = npc:getLocalVar("[caskets]ATTEMPTS")
    local failedAtempts     = npc:getLocalVar("[caskets]FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts

    if leaderId ~= chestOwner then
        return
    end

    xi.caskets.getDrops(npc, itemType, player:getZoneID())

    -----------------------------------
    -- Chest Locked
    -----------------------------------
    if locked ~= 0 then
        player:startEvent(lockedEvent, remainingAttempts, 0, 0, 0, 0, 0, 0, 0) -- Start the minigame if locked.
    else
    -----------------------------------
    -- Chest Unlocked
    -----------------------------------
        if npc:getLocalVar("[caskets]SPAWNSTATUS") == xi.caskets.casketInfo.spawnStatus.SPAWNED_CLOSED then      -- is the chest shut?, then open it.
            npc:setAnimationSub(1)
            npc:setLocalVar("[caskets]SPAWNSTATUS", xi.caskets.casketInfo.spawnStatus.SPAWNED_OPEN)
            -- RoE Timed Record #4019 - Crack Tresure Caskets
            if player:getEminenceProgress(4019) then
                xi.roe.onRecordTrigger(player, 4019)
            end
        end

        if itemType == 1 then                -- temp items
            player:startEvent(unlockedEvent + 1,
                xi.caskets.getTempDrop(npc, 1),
                xi.caskets.getTempDrop(npc, 2),
                xi.caskets.getTempDrop(npc, 3),
                0, 0, 0, 0, 0)
        elseif itemType == 2 then            -- items
            player:startEvent(unlockedEvent,
                xi.caskets.getChestItem(npc, 1),
                xi.caskets.getChestItem(npc, 2),
                xi.caskets.getChestItem(npc, 3),
                xi.caskets.getChestItem(npc, 4),
                0, 0, 0, 0)
        end
    end
end

-----------------------------------
-- Retail notes: from wiki
-- Thieves can use tools to gain a free hint, without expending one of their attempts.
-- The only clues that you can obtain via Thief's Tools is a hint that tells you it's between 2 numbers,
-- (e.g. its between 24 and 58) its usually a good idea to start with this clue.
-- Multiple tools may be used, however there is a low rate of success after the first.
-----------------------------------
xi.caskets.onTrade = function(player, npc, trade)
    local zoneId            = player:getZoneID()
    local ID                = zones[zoneId]
    local baseMessage       = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    local locked            = npc:getLocalVar("[caskets]LOCKED")
    local correctNumber     = npc:getLocalVar("[caskets]CORRECT_NUM")
    local chestOwner        = npc:getLocalVar("[caskets]PARTYID")         -- the id of the player, party or alliance that has rights to the chest.
    local leaderId          = player:getLeaderID()

    -- NOTE: The client blocks actions like this while invisible, but it's very easy to inject an action packet to get
    -- around this restriction. Strip invisible to make sure that case is covered.
    player:delStatusEffect(xi.effect.INVISIBLE)

    if leaderId ~= chestOwner then
        return
    end

    if locked == 1 then
        if player:getMainJob() == xi.job.THF and npcUtil.tradeHasExactly(trade, 1022) then
            local splitNumbers = {}
            local tradeAttempt = math.random()
            local firstAttempt = npc:getLocalVar("[caskets]HINT_TRADE")
            local canGetHint   = false

            for digit in string.gmatch(tostring(correctNumber), "%d") do
                table.insert(splitNumbers, tonumber(digit))
            end

            if firstAttempt == 0 or firstAttempt == nil then
                npc:setLocalVar("[caskets]HINT_TRADE", 1)
                canGetHint = true
            else
                if tradeAttempt < 0.2 then
                    canGetHint = true
                else
                    canGetHint = false
                end
            end

            if canGetHint then
                local highNum = 0
                local lowNum  = 0

                if splitNumbers[1] == 1 then
                    lowNum  = 10
                    highNum = 20 + math.random(1, 9)
                elseif splitNumbers[1] > 1 and splitNumbers[1] < 9 then
                    lowNum  = splitNumbers[1] * 10 - 10 + math.random(1, 9)
                    highNum = splitNumbers[1] * 10 + 10 + math.random(1, 9)
                elseif splitNumbers[1] == 9 then
                    lowNum  = 80 + math.random(1, 9)
                    highNum = 99
                end
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
            else
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
            end
            player:confirmTrade()
        end
    end
end

-----------------------------------
-- Desc: Function handles what happens when a player examines a chest.
-----------------------------------
xi.caskets.playerExamineChest = function(player, option, chestObj, baseMessage)
    local correctNumber     = chestObj:getLocalVar("[caskets]CORRECT_NUM")
    local attemptsAllowed   = chestObj:getLocalVar("[caskets]ATTEMPTS")
    local failedAtempts     = chestObj:getLocalVar("[caskets]FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts

    -----------------------------------
    -- Minigame
    -----------------------------------

    local splitNumbers   = {}
    local hintsVar       = chestObj:getLocalVar("[caskets]HINTS_TABLE")
    local availableHints = {}

    if hintsVar ~= 0 then
        for hint in string.gmatch(tostring(hintsVar), "%d") do
            table.insert(availableHints, hint)
        end
    end

    for digit in string.gmatch(tostring(correctNumber), "%d") do
        table.insert(splitNumbers, tonumber(digit))
    end

    if option == 258 then
        local randText = tonumber(availableHints[math.random(#availableHints)])

        if randText == 0 or randText == nil then
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
            return
        end

        if randText == 1 then
            if xi.caskets.isEven(splitNumbers[1]) then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 0, 0, 0, 0)
                chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
            else
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 1, 0, 0, 0)
                chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
            end
        elseif randText == 2 then
            if xi.caskets.isEven(splitNumbers[2]) then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 0, 0, 0, 0)
                chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
            else
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 1, 0, 0, 0)
                chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
            end
        elseif randText == 3 then
            if splitNumbers[1] <= 6 then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1],
                        splitNumbers[1] +1,
                        splitNumbers[1] +2, 0)
            elseif splitNumbers[1] == 9 then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1] -2,
                        splitNumbers[1] -1,
                        splitNumbers[1], 0)
            else
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1] -1,
                        splitNumbers[1],
                        splitNumbers[1] +1, 0)
            end
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
        elseif randText == 4 then
            if splitNumbers[2] <= 6 then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2],
                        splitNumbers[2] +1,
                        splitNumbers[2] +2, 0)
            elseif splitNumbers[2] == 9 then
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -2,
                        splitNumbers[2] -1,
                        splitNumbers[2], 0)
            else
                player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -1,
                        splitNumbers[2],
                        splitNumbers[2] +1, 0)
            end
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
        elseif randText == 5 then
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[1], 0, 0, 0)
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
        elseif randText == 6 then
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[2], 0, 0, 0)
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
        elseif randText == 7 then
            local highNum = 0
            local lowNum  = 0

            if splitNumbers[1] == 1 then
                lowNum  = 10
                highNum = 20 + math.random(1, 9)
            elseif splitNumbers[1] > 1 and splitNumbers[1] < 9 then
                lowNum  = splitNumbers[1] * 10 - 10 + math.random(1, 9)
                highNum = splitNumbers[1] * 10 + 10 + math.random(1, 9)
            elseif splitNumbers[1] == 9 then
                lowNum  = 80 + math.random(1, 9)
                highNum = 99
            end

            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAtempts +1)
        else
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
        end
        xi.caskets.checkRemainingAttempts(player, chestObj, remainingAttempts, correctNumber)
        xi.caskets.removeHint(chestObj, randText)
    end
end

-----------------------------------
-- Desc: Function handles what happens if the player inputs a correct number.
-----------------------------------
xi.caskets.playerInputCorrectNumber = function(player, chestObj, locked, baseMessage)
    if locked == 0 then
        player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
    else
        xi.caskets.messageChest(player, "OPENED_LOCK", 0 , 0, 0, 0, chestObj)
        chestObj:setLocalVar("[caskets]LOCKED", 0)

        if chestObj:getLocalVar("[caskets]SPAWNSTATUS") == xi.caskets.casketInfo.spawnStatus.SPAWNED_CLOSED then  -- is the chest shut?, then open it.
            chestObj:setAnimationSub(1)
            chestObj:setLocalVar("[caskets]SPAWNSTATUS", xi.caskets.casketInfo.spawnStatus.SPAWNED_OPEN)
            -- RoE Timed Record #4019 - Crack Tresure Caskets
            if player:getEminenceProgress(4019) then
                xi.roe.onRecordTrigger(player, 4019)
            end
        end
    end
end

-----------------------------------
-- Desc: Function handles what happens if the player inputs an incorrect number.
-----------------------------------
xi.caskets.playerInputIncorrectNumber = function(player, chestObj, locked, inputNumber, correctNumber, baseMessage)
    local attemptsAllowed = chestObj:getLocalVar("[caskets]ATTEMPTS")
    local failedAttempts = chestObj:getLocalVar("[caskets]FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAttempts

    if inputNumber < correctNumber then
        if locked == 0 then
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
        else
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 0, 0, 0, 0)
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAttempts +1)
            xi.caskets.checkRemainingAttempts(player, chestObj, remainingAttempts, correctNumber)
        end
    elseif inputNumber > correctNumber then
        if locked == 0 then
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
        else
            player:messageSpecial(baseMessage + xi.caskets.casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 1, 0, 0, 0)
            chestObj:setLocalVar("[caskets]FAILED_ATEMPTS", failedAttempts +1)
            xi.caskets.checkRemainingAttempts(player, chestObj, remainingAttempts, correctNumber)
        end
    end
end

-----------------------------------
-- Desc: Function handles the general option of a player inputting a number.
-----------------------------------
xi.caskets.playerInputNumber = function(player, option, chestObj, baseMessage)
    local inputNumber = bit.rshift(option, 16)

    if inputNumber > 9 and inputNumber < 100 then
        local correctNumber = chestObj:getLocalVar("[caskets]CORRECT_NUM")
        local locked = chestObj:getLocalVar("[caskets]LOCKED")

        if inputNumber == correctNumber then
            xi.caskets.playerInputCorrectNumber(player, chestObj, locked, baseMessage)
        else
            xi.caskets.playerInputIncorrectNumber(player, chestObj, locked, inputNumber, correctNumber, baseMessage)
        end
    end
end

-----------------------------------
-- Desc: Function handles what should happen on a locked casket.
-----------------------------------
xi.caskets.onCasketLocked = function(player, option, chestObj, baseMessage)
    local lockedChoice = bit.lshift(1, option -1)
    local spawnStatus = chestObj:getLocalVar("[caskets]SPAWNSTATUS")

    if option > 0 and spawnStatus ~= xi.caskets.casketInfo.spawnStatus.SPAWNED_CLOSED then -- prevent minigame from working if chest is opened.
        return
    end

    if lockedChoice == 2 then -- Examine chest
        xi.caskets.playerExamineChest(player, option, chestObj, baseMessage)
    elseif lockedChoice == 1 then -- Input a number
        xi.caskets.playerInputNumber(player, option, chestObj, baseMessage)
    end
end

-----------------------------------
-- Desc: Function handles the option of a player picking an item from a chest.
-----------------------------------
xi.caskets.onItemSelected = function(player, option, chestObj, lootType)
    if lootType == 1 then
        if option == 65537 then
            xi.caskets.giveTempItem(player, chestObj, 1)
        elseif option == 65538 then
            xi.caskets.giveTempItem(player, chestObj, 2)
        elseif option == 65539 then
            xi.caskets.giveTempItem(player, chestObj, 3)
        end
    elseif lootType == 2 then
        if option == 65537 then
            xi.caskets.giveItem(player, chestObj, 1)
        elseif option == 65538 then
            xi.caskets.giveItem(player, chestObj, 2)
        elseif option == 65539 then
            xi.caskets.giveItem(player, chestObj, 3)
        elseif option == 65540 then
            xi.caskets.giveItem(player, chestObj, 4)
        end
    end
end

xi.caskets.onEventFinish = function(player, csid, option, npc)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM

    -----------------------------------
    -- Basic chest var's
    -----------------------------------
    local chestObj          = player:getEventTarget()
    local locked            = chestObj:getLocalVar("[caskets]LOCKED")
    local lootType          = chestObj:getLocalVar("[caskets]LOOT_TYPE")

    if locked == 1 then
        xi.caskets.onCasketLocked(player, option, chestObj, baseMessage)
    elseif locked == 0 then
        xi.caskets.onItemSelected(player, option, chestObj, lootType)
    end
end
