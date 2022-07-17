-----------------------------------
--
-- Zone: The_Shrine_of_RuAvitau (178)
--
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    -- MAP 1 ------------------------
    zone:registerRegion(1, -21, 29, -61, -16, 31, -57)     --> F (H-10)
    zone:registerRegion(2, 16, 29, 57, 21, 31, 61)         --> E (H-7)
    -- MAP 3 ------------------------
    zone:registerRegion(3, -89, -19, 83, -83, -15, 89)     --> L (F-5)
    zone:registerRegion(3, -143, -19, -22, -137, -15, -16) --> L (D-8)
    zone:registerRegion(4, -143, -19, 55, -137, -15, 62)     --> G (D-6)
    zone:registerRegion(4, 83, -19, -89, 89, -15, -83)     --> G (J-10)
    zone:registerRegion(5, -89, -19, -89, -83, -15, -83)     --> J (F-10)
    zone:registerRegion(6, 137, -19, -22, 143, -15, -16)     --> H (L-8)
    zone:registerRegion(7, 136, -19, 56, 142, -15, 62)     --> I (L-6)
    zone:registerRegion(8, 83, -19, 83, 89, -15, 89)         --> K (J-5)
    -- MAP 4 ------------------------
    zone:registerRegion(9, 723, 96, 723, 729, 100, 729)    --> L'(F-5)
    zone:registerRegion(10, 870, 96, 723, 876, 100, 729)     --> O (J-5)
    zone:registerRegion(6, 870, 96, 470, 876, 100, 476)     --> H (J-11)
    zone:registerRegion(11, 723, 96, 470, 729, 100, 476)     --> N (F-11)
    -- MAP 5 ------------------------
    zone:registerRegion(12, 817, -3, 57, 823, 1, 63)        --> D (I-7)
    zone:registerRegion(13, 736, -3, 16, 742, 1, 22)         --> P (F-8)
    zone:registerRegion(14, 857, -3, -23, 863, 1, -17)     --> M (J-9)
    zone:registerRegion(15, 776, -3, -63, 782, 1, -57)     --> C (G-10)
    -- MAP 6 ------------------------
    zone:registerRegion(2, 777, -103, -503, 783, -99, -497) --> E (G-6)
    zone:registerRegion(1, 816, -103, -503, 822, -99, -497) --> F (I-6)

end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    local xPos = player:getXPos()
    local yPos = player:getYPos()
    local zPos = player:getZPos()

    if (xPos == 0) and (yPos == 0) and (zPos == 0) then
        player:setPos(-3.38, 46.326, 60, 122)
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:startOptionalCutscene(17) --> F
        end,
        [2] = function (x)
            player:startOptionalCutscene(16) --> E
        end,
        [3] = function (x)
            player:startOptionalCutscene(5) --> L --> Kirin !
        end,
        [4] = function (x)
            player:startOptionalCutscene(4) --> G
        end,
        [5] = function (x)
            player:startOptionalCutscene(1) --> J
        end,
        [6] = function (x)
            player:startOptionalCutscene(3) --> H
        end,
        [7] = function (x)
            player:startOptionalCutscene(7) --> I
        end,
        [8] = function (x)
            player:startOptionalCutscene(6) --> K
        end,
        [9] = function (x)
            player:startOptionalCutscene(10) --> L'
        end,
        [10] = function (x)
            player:startOptionalCutscene(11)
        end,
        [11] = function (x)
            player:startOptionalCutscene(8)
        end,
        [12] = function (x)
            player:startOptionalCutscene(15) --> D
        end,
        [13] = function (x)
            player:startOptionalCutscene(14) --> P
        end,
        [14] = function (x)
            player:startOptionalCutscene(13) --> M
        end,
        [15] = function (x)
            player:startOptionalCutscene(12) --> C
        end,

        default = function (x)
        end,
    }

end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
