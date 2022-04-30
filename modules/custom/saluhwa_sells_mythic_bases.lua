-----------------------------------
-- Saluhwa now carries Mythic Weapons from Nyzul Isle
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/shop")
-----------------------------------
local m = Module:new("saluhwa_sells_mythic_bases")

m:addOverride("xi.zones.Aht_Urhgan_Whitegate.npcs.Saluhwa.onTrigger", function(player, npc)
    local stock =
    {
        12290,   605,    -- Mapple Shield (Requires Astral Candescence)
        12291,  1815,    -- Elm Shield (Requires Astral Candescence)
        12292,  4980,    -- Mahogany Shield (Requires Astral Candescence)
        12293, 15600,    -- Oak Shield (Requires Astral Candescence)
        12295, 64791,    -- Round Shield (Requires Astral Candescence)
        -- Mythics
        18492, 100000,   -- Sturdy Axe
        18753, 100000,   -- Burning Fists
        18851, 100000,   -- Werebuster
        18589, 100000,   -- Mage's Staff
        17742, 100000,   -- Vorpal Sword
        18003, 100000,   -- Swordbreaker
        17744, 100000,   -- Brave Blade
        18944, 100000,   -- Death Sickle
        17956, 100000,   -- Double Axe
        18034, 100000,   -- Dancing Dagger
        18719, 100000,   -- Killer Bow
        18443, 100000,   -- Windslicer
        18426, 100000,   -- Sasuke Katana
        18120, 100000,   -- Radiant Lance
        18590, 100000,   -- Scepter Staff
        17743, 100000,   -- Wightslayer
        18720, 100000,   -- Quicksilver
        18754, 100000,   -- Inferno Claws
        19102, 100000,   -- Main Gauche
        18592, 100000,   -- Elder Staff
    }

    player:showText(npc, ID.text.SALUHWA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

return m

