-----------------------------------
-- Upgrade the stock in Outposts
-- * Add Sneak Oils / Prism Powder
-- * Add Keys
-- Prices will be decently high
-----------------------------------
require("modules/module_utils")
require("scripts/globals/shop")

-----------------------------------
local m = Module:new("upgrade_outpost_shops")

m:addOverride("xi.shop.outpost", function(player)
    local stock =
    {
        4148,  316, -- Antidote
        4151,  800, -- Echo Drops
        4128, 4832, -- Ether
        4150, 2595, -- Eye Drops
        4112,  910, -- Potion
        1022, 4500, -- Thief's Tools
        4165, 7500, -- Silent Oil
        4164, 7500, -- Prism Powder
    }
    xi.shop.general(player, stock)
end)

return m