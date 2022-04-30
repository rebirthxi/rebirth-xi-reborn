-----------------------------------
-- Adds regional augment items
-- * Increases regional item rate to 33%
-- * Adds Augmented items from level 75 items in Abyssea chests
-----------------------------------
require("modules/module_utils")
require("scripts/globals/caskets")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("regional_augment_items")

m:addOverride("xi.caskets.getCasketItems", function(npc, zoneId)
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
        if
            math.random() < 0.33 and
            #xi.casket_loot.casketItems[zoneId].regionalItems > 0 and -- make sure there are enough regionalItems
            npc:getLocalStringVar("[Augments]ITEM1") == "" -- make sure we don't already have an augmented item
        then
            local itemId = xi.casket_loot.casketItems[zoneId].regionalItems[math.random(1, #xi.casket_loot.casketItems[zoneId].regionalItems)]

            -- Apply regional augments
            if xi.augments.regional_item_augments[itemId] ~= nil then
                local augs = xi.augments.RollRegionalItemAugment(itemId)

                npc:setLocalStringVar("[Augments]ITEM1", utils.serializeTable(augs))
                npc:setLocalStringVar("[AugSrcs]ITEM1", "nil")
            end

            return 1, itemId
        else
            return index, originalSelection
        end
    end)
end)

m:addOverride("xi.caskets.giveItem", function(player, npc, itemNum)
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
                    local success = false

                    if xi.augments.regional_item_augments[itemID] ~= nil or itemID == xi.augments.ingredients.MID_AUG then
                        local augs = loadstring(npc:getLocalStringVar("[Augments]ITEM" .. itemNum))()
                        local aug_src_str = npc:getLocalStringVar("[AugSrcs]ITEM" .. itemNum)

                        local augment_srcs
                        if aug_src_str ~= "nil" then
                            augment_srcs = loadstring(aug_src_str)()
                        end

                        success = player:addItem({id=itemID, augments=augs, aug_src=augment_srcs})
                    else
                        success = player:addItem(itemID)
                    end

                    if success then
                        xi.caskets.messageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                        xi.caskets.checkItemChestIsEmpty(npc)
                    end
                end
            end
        end
    end
end)

m:addOverride("xi.caskets.playerInputCorrectNumber", function(player, chestObj, locked, baseMessage)
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

            for i = 1, 4, 1 do
                local aug_str = chestObj:getLocalStringVar("[Augments]ITEM" .. i)
                if aug_str ~= "" and aug_str ~= nil then
                    local itemId = chestObj:getLocalVar("[caskets]ITEM" .. i)
                    local itemStr = xi.augments.item_strings[itemId] or string.format("Slot %d", i)
                    local augs = loadstring(aug_str)()
                    -- Heading
                    local msg = string.format("\n===== %s ======\n", itemStr)

                    -- Build Aug
                    for index, v in pairs(augs) do
                        msg = msg .. string.format(" - %s for %d\n", xi.augments.strings[index], v+1)
                    end

                    -- Send Message to Players
                    local players = player:getAlliance()
                    for _, p in pairs(players) do
                        p:PrintToPlayer(msg, 0xF)
                    end
                end
            end
        end
    end
end)

return m
