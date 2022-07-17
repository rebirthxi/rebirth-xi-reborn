-----------------------------------
-- Area: Port Jeuno
--  NPC: Shami
-- Orb Seller (BCNM)
-- !pos -53.9 0 10.8 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

local shamiSealItems =
{-- Trade Item                     Seal ID, Retrieve Option,
    [xi.items.BEASTMENS_SEAL       ] = { 0, 2 },
    [xi.items.KINDREDS_SEAL        ] = { 1, 1 },
    [xi.items.KINDREDS_CREST       ] = { 2, 3 },
    [xi.items.HIGH_KINDREDS_CREST  ] = { 3, 4 },
    [xi.items.SACRED_KINDREDS_CREST] = { 4, 5 },
}

local shamiOrbItems =
{-- Item ID                        CS, PO, SealID, Cost,
    [xi.items.CLOUDY_ORB     ] = {  5,  1,      0,   20, },
    [xi.items.SKY_ORB        ] = {  9,  2,      0,   30, },
    [xi.items.STAR_ORB       ] = {  9,  3,      0,   40, },
    [xi.items.COMET_ORB      ] = {  9,  4,      0,   50, },
    [xi.items.MOON_ORB       ] = {  9,  5,      0,   60, },
    [xi.items.CLOTHO_ORB     ] = {  9,  6,      1,   30, },
    [xi.items.LACHESIS_ORB   ] = {  9,  7,      1,   30, },
    [xi.items.ATROPOS_ORB    ] = {  9,  8,      1,   30, },
    [xi.items.THEMIS_ORB     ] = { 11,  9,      1,   99, },
    [xi.items.PHOBOS_ORB     ] = { 11, 10,      2,   30, },
    [xi.items.DEIMOS_ORB     ] = { 11, 11,      2,   50, },
    [xi.items.ZELOS_ORB      ] = { 11, 12,      3,   30, },
    [xi.items.BIA_ORB        ] = { 11, 13,      3,   50, },
    [xi.items.MICROCOSMIC_ORB] = { 11, 14,      4,   10, },
    [xi.items.MACROCOSMIC_ORB] = { 11, 15,      4,   20, },
}

local function getSealTradeOption(trade)
    for itemID, sealData in pairs(shamiSealItems) do
        if npcUtil.tradeHasOnly(trade, itemID) then
            return sealData[1]
        end
    end

    return nil
end

local function convertSealRetrieveOption(option)
    for itemID, sealData in pairs(shamiSealItems) do
        if (option + sealData[2]) % 256 == 0 then
            local sealCount = (option + sealData[2]) / 256 - 1
            return itemID, sealData[1], sealCount
        end
    end

    return nil, nil, nil
end

-- Returns the event ID associated for displaying where the player can
-- use the orbs (BCNMs).  Event 22 is the generic cracked orb CS
local function getOrbEvent(player, trade)
    for itemID, orbData in pairs(shamiOrbItems) do
        if npcUtil.tradeHasExactly(trade, itemID) then
            if player:hasWornItem(itemID) then
                return 22
            else
                return orbData[1]
            end
        end
    end

    return nil
end

local function getOrbDataFromOption(option)
    for itemID, orbData in pairs(shamiOrbItems) do
        if orbData[2] == option then
            return itemID, orbData[3], orbData[4]
        end
    end

    return nil
end

entity.onTrade = function(player, npc, trade)
    -- Trading Seals/Crests
    local sealOption = getSealTradeOption(trade)
    if sealOption ~= nil then
        local eventParams = { 321, 0, 0, 0, 0, 0 }
        local storedSeals = player:getSeals(sealOption)
        local itemCount = trade:getItemCount()

        eventParams[sealOption + 2] = bit.lshift(storedSeals + itemCount, 16)
        player:startEvent(unpack(eventParams))
        player:addSeals(itemCount, sealOption)
        player:confirmTrade()
        return
    end

    -- Trading Orbs
    local orbEvent = getOrbEvent(player, trade)
    if orbEvent ~= nil then
        player:startEvent(orbEvent)
    end
end

entity.onTrigger = function(player, npc)
    local beastmensSeal = player:getSeals(0)
    local kindredsSeal = player:getSeals(1)
    local kindredsCrest = player:getSeals(2)
    local highKindredsCrest = player:getSeals(3)
    local sacredKindredsCrest = player:getSeals(4)
    local wildcatJeuno = player:getCharVar("WildcatJeuno")

    -- TODO: player:startEvent(322, 0, 0, 0, 0, 1, 0, 1) -- First time talking to him WITH beastmen seal in inventory
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatJeuno, 17)
    then
        player:startEvent(317)
    elseif beastmensSeal + kindredsSeal + kindredsCrest + highKindredsCrest + sacredKindredsCrest == 0 then
        player:startEvent(23) -- Standard dialog ?
    else
        player:startEvent(322, (kindredsSeal * 65536) + beastmensSeal, (highKindredsCrest * 65536) + kindredsCrest, sacredKindredsCrest, 0, 1, 0, 0) -- Standard dialog with menu
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- Cracked orb was traded
    if csid == 22 then
        player:confirmTrade()

    -- Retrieving Seals (Option 1073741824 is escaping out of cutscene, and we do not process on this)
    elseif option >= 508 and option ~= 1073741824 then
        local itemID, sealID, retrievedSealCount = convertSealRetrieveOption(option)

        if npcUtil.giveItem(player, {{itemID, retrievedSealCount}}) then
            player:delSeals(retrievedSealCount, sealID)
        end

    -- Purchasing a BCNM Orb
    -- NOTE: While Lua does short-circuit in conditionals, separating the seal check and giveItem calls
    -- to ensure that if this ever changes, it won't cause a potential exploit.
    elseif csid == 322 then
        local itemID, sealType, sealCost = getOrbDataFromOption(option)

        if
            sealType ~= nil and
            player:getSeals(sealType) >= sealCost
        then
            if npcUtil.giveItem(player, itemID) then
                player:delSeals(sealCost, sealType)
            end
        end

    elseif csid == 317 then
        player:setCharVar("WildcatJeuno", utils.mask.setBit(player:getCharVar("WildcatJeuno"), 17, true))
    end
end

return entity
