-----------------------------------
-- Area: Port Windurst
--  NPC: Posso Ruhbini
-- Norvallen Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.NORVALLEN) ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.POSSORUHBINI_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            698, 87,    -- Ash Log
            618, 25,    -- Blue Peas
            621, 25,    -- Crying Mustard
        }

        player:showText(npc, ID.text.POSSORUHBINI_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
