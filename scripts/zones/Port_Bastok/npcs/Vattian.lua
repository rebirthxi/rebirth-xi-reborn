-----------------------------------
-- Area: Port Bastok
--  NPC: Vattian
-- Kuzotz Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.KUZOTZ) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.VATTIAN_CLOSED_DIALOG)
    else
        local stock =
        {
            916,  855,    -- Cactuar Needle
            4412, 299,    -- Thundermelon
            4491, 184,    -- Watermelon
        }

        player:showText(npc, ID.text.VATTIAN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
