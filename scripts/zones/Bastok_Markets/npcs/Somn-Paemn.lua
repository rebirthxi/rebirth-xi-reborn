-----------------------------------
-- Area: Bastok Markets
--  NPC: Somn-Paemn
-- Sarutabaruta Regional Goods
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.SARUTABARUTA) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.SOMNPAEMN_CLOSED_DIALOG)
    else
        local stock =
        {
            689,  33,    --Lauan Log
            619,  43,    --Popoto
            4444, 22,    --Rarab Tail
            4392, 29,    --Saruta Orange
            635,  18,     --Windurstian Tea Leaves
        }

        player:showText(npc, ID.text.SOMNPAEMN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
