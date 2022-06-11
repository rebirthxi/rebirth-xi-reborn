-----------------------------------
-- Area: Windurst Woods
--  NPC: Taraihi-Perunhi
-- Only sells when Windurst controlls Derfland Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.DERFLAND)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.TARAIHIPERUNHI_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.TARAIHIPERUNHI_OPEN_DIALOG)

        local stock =
        {
            4352,  128, -- Derfland Pear
            617,   142, -- Ginger
            4545,   62, -- Gysahl Greens
            1412, 1656, -- Olive Flower
            633,    14, -- Olive Oil
            951,   110  -- Wijnruit
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
