-----------------------------------
-- Area: Windurst Waters
--  NPC: Qhum_Knaidjn
-- Type: Guildworker's Union Representative
-- !pos -112.561 -2 55.205 238
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

local keyitems =
{
    [0] =
    {
        id = xi.ki.RAW_FISH_HANDLING,
        rank = 3,
        cost = 30000
    },

    [1] =
    {
        id = xi.ki.NOODLE_KNEADING,
        rank = 3,
        cost = 30000
    },

    [2] =
    {
        id = xi.ki.PATISSIER,
        rank = 3,
        cost = 8000
    },

    [3] =
    {
        id = xi.ki.STEWPOT_MASTERY,
        rank = 3,
        cost = 30000
    },

    [4] =
    {
        id = xi.ki.WAY_OF_THE_CULINARIAN,
        rank = 9,
        cost = 20000
    },
}

local items =
{
    [0] =
    {
        id = 15451, -- Culinarian's Belt
        rank = 4,
        cost = 10000
    },

    [1] =
    {
        id = 13948, -- Chef's Hat
        rank = 5,
        cost = 70000
    },

    [2] =
    {
        id = 14399, -- Culinarian's Apron
        rank = 7,
        cost = 100000
    },

    [3] =
    {
        id = 137, -- Cordon Bleu Cooking Set
        rank = 9,
        cost = 150000
    },

    [4] =
    {
        id = 338, -- Culinarian's Signboard
        rank = 9,
        cost = 200000
    },

    [5] =
    {
        id = 15826, -- Chef's Ring
        rank = 6,
        cost = 80000
    },

    [6] =
    {
        id = 3667, -- Brass Crock
        rank = 7,
        cost = 50000
    },

    [7] =
    {
        id = 3328, -- Culinarian's Emblem
        rank = 9,
        cost = 15000
    },
}

entity.onTrade = function(player, npc, trade)
    xi.crafting.unionRepresentativeTrade(player, npc, trade, 10025, 8)
end

entity.onTrigger = function(player, npc)
    xi.crafting.unionRepresentativeTrigger(player, 8, 10024, "guild_cooking", keyitems)
end

entity.onEventUpdate = function(player, csid, option, target)
    if (csid == 10024) then
        xi.crafting.unionRepresentativeTriggerFinish(player, option, target, 8, "guild_cooking", keyitems, items)
    end
end

entity.onEventFinish = function(player, csid, option, target)
    if (csid == 10024) then
        xi.crafting.unionRepresentativeTriggerFinish(player, option, target, 8, "guild_cooking", keyitems, items)
    elseif (csid == 10025) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
