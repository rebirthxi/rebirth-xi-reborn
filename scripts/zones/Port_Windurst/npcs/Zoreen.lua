-----------------------------------
-- Area: Port Windurst
--  NPC: Zoreen
-- Valdeaunia Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.VALDEAUNIA) ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.ZOREEN_CLOSED_DIALOG)
    else
        local stock =
        {
            4382, 29,    -- Frost Turnip
            638, 170,    -- Sage
        }

        player:showText(npc, ID.text.ZOREEN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
