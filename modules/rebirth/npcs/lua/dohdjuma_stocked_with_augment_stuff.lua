-----------------------------------
-- Giving Augment Ingredients to Dohdjuma
-- Combiner
-- Separator
-----------------------------------
require("modules/module_utils")
require("scripts/globals/qr_augments")
local ID = require("scripts/zones/Selbina/IDs")
-----------------------------------
local m = Module:new("dohdjuma_stock")

m:addOverride("xi.zones.Selbina.npcs.Dohdjuma.onTrigger", function(player, npc)
    local stock =
    {
        611,    36,    -- Rye Flour
        5011,  233,    -- Scroll of Sheepfoe Mambo
        4150, 2335,    -- Eye Drops
        4148,  284,    -- Antidote
        4509,   10,    -- Distilled Water
        4112,  819,    -- Potion
        17395,  10,    -- Lugworm
        4378,   54,    -- Selbina Milk
        4490,  432,    -- Pickled Herring
        4559, 4485,    -- Herb Quus
        2866, 9200,    -- Selbina Waystone
        xi.augments.ingredients.COMBINER, 4321,
        xi.augments.ingredients.SEPARATOR, 11023,
        xi.augments.ingredients.EXEMPTOR, 112310,
    }

    player:showText(npc, ID.text.DOHDJUMA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

return m

