-----------------------------------
-- Giving Scholar spells to Brave Ox
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/Rabao/IDs")
-----------------------------------
local m = Module:new("brave_ox_spells")
m:setEnabled(true)

m:addOverride("xi.zones.Rabao.npcs.Brave_Ox.onTrigger", function(player, npc)
    local stock =
    {
        4654,  77350,    -- Protect IV
        4736,  73710,    -- Protectra IV
        4868,  63700,    -- Dispel
        4860,  31850,    -- Stun
        4720,  31850,    -- Flash
        4750, 546000,    -- Reraise III
        4638,  78260,    -- Banish III
        4701,  20092,    -- Cura
        5082,  88389,    -- Cura II
        4702,  62192,    -- Sacrifice
        4703,  64584,    -- Esuna
        4704,  30967,    -- Auspice
        4614, 141137,    -- Cure VI
        4655, 103882,    -- Protect V
        4660, 125069,    -- Shell V
        6058,  35013,    -- Klimaform
        6045,   6591,    -- Geohelix
        6042,   6786,    -- Hydrohelix
        6046,   6981,    -- Anemohelix
        6041,   7714,    -- Pyrohelix
        6044,   7896,    -- Cryohelix
        6043,   8625,    -- Ionohelix
        6048,   8790,    -- Noctohelix
        6047,   8940,    -- Luminohelix
        6053,   5200,    -- Sandstorm
        6050,   6318,    -- Rainstorm
        6054,   6786,    -- Windstorm
        6049,   8060,    -- Firestorm
        6052,   8580,    -- Hailstorm
        6051,   9100,    -- Thunderstorm
        6056,  10725,    -- Voidstorm
        6055,  11440,    -- Aurorastorm
    }

    player:showText(npc, ID.text.BRAVEOX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

return m

