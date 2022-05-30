-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Andreas
-- Type: Guildworker's Union Representative
-- !pos -189.282 10.999 262.626 231
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Northern_San_dOria/IDs")
-----------------------------------
local entity = {}

local keyitems =
{
    [0] =
    {
        id = xi.ki.WOOD_PURIFICATION,
        rank = 3,
        cost = 40000
    },

    [1] =
    {
        id = xi.ki.WOOD_ENSORCELLMENT,
        rank = 3,
        cost = 40000
    },

    [2] =
    {
        id = xi.ki.LUMBERJACK,
        rank = 3,
        cost = 10000
    },

    [3] =
    {
        id = xi.ki.BOLTMAKER,
        rank = 3,
        cost = 10000
    },

    [4] =
    {
        id = xi.ki.WAY_OF_THE_CARPENTER,
        rank = 9,
        cost = 20000
    }
}

local items =
{
    [0] =
    {
        id = 15444, -- Carpenter's Belt
        rank = 1,
        cost = 10000
    },

    [1] =
    {
        id = 14830, -- Carpenter's Gloves
        rank = 5,
        cost = 70000
    },

    [2] =
    {
        id = 14392, -- Carpenter's Apron
        rank = 7,
        cost = 100000
    },

    [3] =
    {
        id = 28, -- Drawing Desk
        rank = 9,
        cost = 150000
    },

    [4] =
    {
        id = 341, -- Carpenter's Signboard
        rank = 9,
        cost = 200000
    },

    [5] =
    {
        id = 15819, -- Carpenter's Ring
        rank = 6,
        cost = 80000
    },

    [6] =
    {
        id = 3672, -- Carpenter's Kit
        rank = 8,
        cost = 50000
    },

    [7] =
    {
        id = 3331, -- Carpenter's Emblem
        rank = 9,
        cost = 15000
    }
}

entity.onTrade = function(player, npc, trade)
    xi.crafting.unionRepresentativeTrade(player, npc, trade, 732, 1)
end

entity.onTrigger = function(player, npc)
    xi.crafting.unionRepresentativeTrigger(player, 1, 731, "guild_woodworking", keyitems)
end

entity.onEventUpdate = function(player, csid, option, target)
    if (csid == 731) then
        xi.crafting.unionRepresentativeTriggerFinish(player, option, target, 1, "guild_woodworking", keyitems, items)
    end
end

entity.onEventFinish = function(player, csid, option, target)
    if (csid == 731) then
        xi.crafting.unionRepresentativeTriggerFinish(player, option, target, 1, "guild_woodworking", keyitems, items)
    elseif (csid == 732) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
