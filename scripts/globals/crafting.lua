-----------------------------------
-- Crafting functions
-- Info from:
-- http://wiki.ffxiclopedia.org/wiki/Crafts_%26_Hobbies
-----------------------------------
require("scripts/globals/status")
-----------------------------------

xi = xi or {}
xi.crafting = {}
-----------------------------------
-- IDs for signupGuild bitmask
-----------------------------------

xi.crafting.guild =
{
    ["alchemy"]      = 2,
    ["bonecraft"]    = 4,
    ["clothcraft"]   = 8,
    ["cooking"]      = 16,
    ["fishing"]      = 32,
    ["goldsmithing"] = 64,
    ["leathercraft"] = 128,
    ["smithing"]     = 256,
    ["woodworking"]  = 512
    -- Synergy not implemented yet
}

-----------------------------------
-- Table for Test Item
-----------------------------------

local testItem_Alchemy =      {  937,  4157,  4163,   947, 16543,  4116, 16479,  4120, 16609, 10792}
local testItem_Bonecraft =    {13442, 13441, 13323, 13459, 13091, 17299, 16420, 12508, 13987, 11058}
local testItem_Clothcraft =   {13583, 13584, 13204, 13075, 12723, 13586, 13752, 12612, 14253, 11000}
local testItem_Cooking =      { 4355,  4416,  4489,  4381,  4413,  4558,  4546,  4440,  4561,  5930}
local testItem_Fishing =      { 4401,  4379,  4469,  4480,  4462,  4479,  4471,  4478,  4474,  5817}
local testItem_Goldsmithing = {12496, 12497, 12495, 13082, 13446, 13084, 12545, 13125, 16515, 11060}
local testItem_Leathercraft = {13594, 16386, 13588, 13195, 12571, 12572, 12980, 12702, 12447, 10577}
local testItem_Smithing =     {16530, 12299, 16512, 16650, 16651, 16559, 12427, 16577, 12428, 19788}
local testItem_Woodworking =  {   22,    23, 17354, 17348, 17053, 17156, 17054,    56, 17101, 18884}
-- local testItem_Synergy =      {}

local hqCrystals =
{
    [1] =
    {
        id = 4238,
        cost = 200
    },
    [2] =
    {
        id = 4239,
        cost = 200
    },
    [3] =
    {
        id = 4240,
        cost = 200
    },
    [4] =
    {
        id = 4241,
        cost = 200
    },
    [5] =
    {
        id = 4242,
        cost = 200
    },
    [6] =
    {
        id = 4243,
        cost = 200
    },
    [7] =
    {
        id = 4244,
        cost = 500
    },
    [8] =
    {
        id = 4245,
        cost = 500
    },
}

-----------------------------------
-- isGuildMember Action
-----------------------------------

xi.crafting.isGuildMember = function(player, guild)
    local guildOK = player:getCharVar("Guild_Member")
    local bit = {}

    for i = 12, 1, -1 do
        local twop = 2^i

        if guildOK >= twop then
            bit[i]=1 guildOK = guildOK - twop
        else
            bit[i]=0
        end
    end

    return bit[guild]
end

-----------------------------------
-- signupGuild Action
-----------------------------------

xi.crafting.signupGuild = function(player, nbr)
    player:addCharVar("Guild_Member", nbr)
end

-----------------------------------
-- getTestItem Action
-----------------------------------

xi.crafting.getTestItem = function(player, npc, craftID)
    local testItemList = {}
    local nextRank  = player:getSkillRank(craftID) + 1

    switch (npc:getName()): caseof
    {
        ["Abd-al-Raziq"]   = function (x) testItemList = testItem_Alchemy end,
        ["Peshi_Yohnts"]   = function (x) testItemList = testItem_Bonecraft end,
        ["Ponono"]         = function (x) testItemList = testItem_Clothcraft end,
        ["Piketo-Puketo"]  = function (x) testItemList = testItem_Cooking end,
        ["Thubu_Parohren"] = function (x) testItemList = testItem_Fishing end,
        ["Reinberta"]      = function (x) testItemList = testItem_Goldsmithing end,
        ["Faulpie"]        = function (x) testItemList = testItem_Leathercraft end,
        ["Mevreauche"]     = function (x) testItemList = testItem_Smithing end,
        ["Ghemp"]          = function (x) testItemList = testItem_Smithing end,
        ["Cheupirudaux"]   = function (x) testItemList = testItem_Woodworking end,
    }

    return testItemList[nextRank]
end

-----------------------------------
-- canGetNewRank Action
-----------------------------------

local function canGetNewRank(player, skillLvL, craftID)
    local rank = player:getSkillRank(craftID) + 1
    local canGet = 0

    if
        (rank == 1 and skillLvL >= 256) or
        (rank == 2 and skillLvL >= 577) or
        (rank == 3 and skillLvL >= 898) or
        (rank == 4 and skillLvL >= 1219) or
        (rank == 5 and skillLvL >= 1540) or
        (rank == 6 and skillLvL >= 1861) or
        (rank == 7 and skillLvL >= 2182) or
        (rank == 8 and skillLvL >= 2503) or
        (rank == 9 and skillLvL >= 2824) or
        (rank == 10 and skillLvL >= 3145)
    then
        canGet = 1
    end

    return canGet
end

-----------------------------------
-- tradeTestItem Action
-----------------------------------

xi.crafting.tradeTestItem = function(player, npc, trade, craftID)
    local guildID  = craftID - 48
    local skillLvL = player:getSkillLevel(craftID)
    local myTI     = xi.crafting.getTestItem(player, npc, craftID)
    local newRank  = 0
    -- local signed = trade:getItem():getSignature() == player:getName() and 1 or 0

    if
        canGetNewRank(player, skillLvL, craftID) == 1 and
        trade:hasItemQty(myTI, 1) and
        trade:getItemCount() == 1
    then
        newRank = player:getSkillRank(craftID) + 1
        if player:getCharVar('[GUILD]currentGuild') == guildID + 1 then
            player:setCharVar('[GUILD]daily_points', 1)
        end
    end

    return newRank
end

-- 1: test item
-- 2: skill point
-- 3: ??
-- 4: 0 Not in the guild 1 In the guild
-- 7: 0 Not in a guild already, 11: Multiple guilds

-----------------------------------
-- getCraftSkillCap
-----------------------------------
xi.crafting.getCraftSkillCap = function(player, craftID)
    local rank = player:getSkillRank(craftID)
    return (rank + 1) * 10
end

-----------------------------------
-- getAdvImageSupportCost
-----------------------------------
xi.crafting.getAdvImageSupportCost = function(player, craftID)
    local rank = player:getSkillRank(craftID)
    return (rank + 1) * 30
end

-----------------------------------
-- unionRepresentative
-----------------------------------
xi.crafting.unionRepresentativeTrigger = function(player, guildID, csid, currency, keyitems)
    local gpItem, remainingPoints = player:getCurrentGPItem(guildID)
    local rank   = player:getSkillRank(guildID + 48)
    local cap    = (rank + 1) * 10
    local kibits = 0

    for kbit, ki in pairs(keyitems) do
        if rank >= ki.rank then
            if not player:hasKeyItem(ki.id) then
                kibits = bit.bor(kibits, bit.lshift(1, kbit))
            end
        end
    end

    player:startEvent(csid, player:getCurrency(currency), player:getCharVar('[GUILD]currentGuild') - 1, gpItem, remainingPoints, cap, 0, kibits)
end

xi.crafting.unionRepresentativeEventUpdateRenounce = function(player, craftID)
    local ID   = zones[player:getZoneID()]

    player:setSkillRank(craftID, 6)
    player:setSkillLevel(craftID, 700)
    player:messageSpecial(ID.text.RENOUNCE_CRAFTSMAN, 0, craftID - 49)
end

xi.crafting.unionRepresentativeTriggerRenounceCheck = function(player, eventId, realSkill, rankCap, param3)
    if player:getLocalVar("renounceDialog") == 0 then
        local count   = 0
        local bitmask = 0

        for craftID = xi.skill.WOODWORKING, xi.skill.COOKING do
            local rank = player:getSkillRank(craftID)
            if rank < 7 then
                bitmask = bit.bor(bitmask, bit.lshift(1, craftID - 48))
            else
                count = count + 1
            end
        end

        if count > 1 then
            player:setLocalVar("renounceDialog", 1)
            player:startEvent(eventId, VanadielTime(), realSkill, rankCap, param3, 0, 0, count, bitmask)
            return true
        end
    end

    return false
end

xi.crafting.unionRepresentativeTriggerFinish = function(player, option, target, guildID, currency, keyitems, items)
    local rank     = player:getSkillRank(guildID + 48)
    local category = bit.band(bit.rshift(option, 2), 3)
    local text     = zones[player:getZoneID()].text

    if bit.tobit(option) == -1 and rank >= 3 then
        local oldGuild = player:getCharVar('[GUILD]currentGuild') - 1
        player:setCharVar('[GUILD]currentGuild', guildID + 1)

        if oldGuild == -1 then
            player:messageSpecial(text.GUILD_NEW_CONTRACT, guildID)
        else
            player:messageSpecial(text.GUILD_TERMINATE_CONTRACT, guildID, oldGuild)
            player:setCharVar('[GUILD]daily_points', 1)
        end
    elseif category == 3 then -- keyitem
        local ki = keyitems[bit.band(bit.rshift(option, 5), 15) - 1]

        if ki and rank >= ki.rank then
            if (player:getCurrency(currency) >= ki.cost) then
                player:delCurrency(currency, ki.cost)
                player:addKeyItem(ki.id)
                player:messageSpecial(text.KEYITEM_OBTAINED, ki.id)
            else
               player:messageText(target, text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end
    elseif category == 2 or category == 1 then -- item
        local idx      = bit.band(option, 3)
        local i        = items[(category - 1) * 4 + idx]
        local quantity = math.min(bit.rshift(option, 9), 12)
        local cost     = quantity * i.cost

        if i and rank >= i.rank then
            if player:getCurrency(currency) >= cost then
                local delivered = 0
                for count = 1, quantity do -- addItem does not appear to honor quantity if the item doesn't stack.
                    if (player:addItem(i.id, true)) then
                        player:delCurrency(currency, i.cost)
                        player:messageSpecial(text.ITEM_OBTAINED, i.id)
                        delivered = delivered + 1
                    end
                end
                if delivered == 0 then
                    player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED, i.id)
                end
            else
               player:messageText(target, text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end
    elseif category == 0 and option ~= 1073741824 then -- HQ crystal
        local i = hqCrystals[bit.band(bit.rshift(option, 5), 15)]
        local quantity = bit.rshift(option, 9)
        local cost = quantity * i.cost
        if i and rank >= 3 then
            if player:getCurrency(currency) >= cost then
                if player:addItem(i.id, quantity) then
                    player:delCurrency(currency, cost)
                    player:messageSpecial(text.ITEM_OBTAINED, i.id)
                else
                    player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED, i.id)
                end
            else
               player:messageText(target, text.NOT_HAVE_ENOUGH_GP, false, 6)
            end
        end
    end
end

xi.crafting.unionRepresentativeTrade = function(player, npc, trade, csid, guildID)
    local _, remainingPoints = player:getCurrentGPItem(guildID)
    local text = zones[player:getZoneID()].text

    if player:getCharVar('[GUILD]currentGuild') - 1 == guildID then
        if remainingPoints == 0 then
            player:messageText(npc, text.NO_MORE_GP_ELIGIBLE)
        else
            local totalPoints = 0
            for i = 0, 8 do
                local items, points = player:addGuildPoints(guildID, i)
                if items ~= 0 and points ~= 0 then
                    totalPoints = totalPoints + points
                    trade:confirmSlot(i, items)
                end
            end
            if totalPoints > 0 then
                player:confirmTrade()
                player:startEvent(csid, totalPoints)
            end
        end
    end
end
