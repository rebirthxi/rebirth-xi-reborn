-----------------------------------
-- Area: Windurst Waters
--  NPC: Ensasa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.ENSASA_SHOP_DIALOG)

    local stock =
    {
        104,  3881, 1,     --Tarutaru Folding Screen

        17336,     5, 2,     --Crossbow Bolt
        17318,     3, 2,     --Wooden Arrow
        112,   456, 2,     --Yellow Jar

        17319,     4, 3,     --Bone Arrow
        218,   920, 3,     --Earthen Flowerpot
        17396,     3, 3,     --Little Worm
        17395,     9, 3,     --Lugworm
        1890,   576, 3,     --River Foliage
        5065,   283, 3,     --Earth Threnody
        5062,   644, 3,     --Fire Threnody
        1891,   576, 3,     --Sea Foliage
        92,   905, 3,     --Tarutaru Stool
        110,  4744, 3      --White Jar
    }
    xi.shop.nation(player, stock, xi.nation.WINDURST)

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
