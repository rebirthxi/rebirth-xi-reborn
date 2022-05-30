-----------------------------------
-- Area: Western Adoulin
--  NPC: Kanil
-- Type: Shop NPC
-- !pos 154 4 -5 256
-----------------------------------
require("scripts/globals/shop")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard shop
    player:showText(npc, ID.text.KANIL_SHOP_TEXT)
    local stock =
    {
        610, 60,     -- San D'Or. Flour
        4509, 12,     -- Distilled Water
        936, 16,     -- Rock Salt
        633, 16,     -- Olive Oil
        5299, 148,    -- Salsa
        1523, 316,    -- Apple Mint
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
