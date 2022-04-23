-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Komalata
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/missions")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4376, 110, -- Meat Jerky
        936,   14, -- Rock Salt
        611,   36, -- Rye Flour
        4509,  10, -- Distilled Water
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            625,   88, -- Apple Vinegar
            4364, 120, -- Black Bread
            4376, 120, -- Meat Jerky
            936,   16, -- Rock Salt
            611,   40, -- Rye Flour
            610,   60, -- San d'Orian Flour
            4389,  32, -- San d'Orian Carrot
            629,   48, -- Millioncorn
            1523, 316, -- Apple Mint
            4509,  12, -- Distilled Water
        }
    end

    player:showText(npc, ID.text.KOMALATA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
