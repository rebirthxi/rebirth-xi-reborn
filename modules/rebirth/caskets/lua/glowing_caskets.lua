-----------------------------------
-- Adds regional augment items
-- * Increases regional item rate to 33%
-- * Adds Augmented items from level 75 items in Abyssea chests
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/caskets")
require("scripts/globals/qr_caskets")
-----------------------------------
local m = Module:new("glowing_caskets")

local zones = {
    "Eastern_Altepa_Desert",
    "Western_Altepa_Desert",
    "Beaucedine_Glacier",
    "Behemoths_Dominion",
    "Bostaunieux_Oubliette",
    "The_Boyahda_Tree",
    "Den_of_Rancor",
    "The_Eldieme_Necropolis",
    "FeiYin",
    "Gustav_Tunnel",
    "Ifrits_Cauldron",
    "Kuftal_Tunnel",
    "Labyrinth_of_Onzozo",
    "RoMaeve",
    "Quicksand_Caves",
    "RuAun_Gardens",
    "Sea_Serpent_Grotto",
    "The_Shrine_of_RuAvitau",
    "Temple_of_Uggalepih",
    "VeLugannon_Palace",
}

for _, zoneName in ipairs(zones) do
    local functionName = string.format("xi.zones.%s.Zone.onInitialize", zoneName)

    m:addOverride(functionName, function(zone)
        xi.glowingCaskets.insertGlowingCaskets(zone)
        super(zone)
    end)
end


return m