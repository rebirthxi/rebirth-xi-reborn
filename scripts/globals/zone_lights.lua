require("scripts/globals/zone")

xi = xi or {}
xi.zone_lights = xi.zone_lights or {}

xi.zone_lights.lights = {
    NO_LIGHTS    = 0,
    BRIGHT_RED   = 1,
    DIM_RED      = 2,
    BRIGHT_BLUE  = 3,
    DIM_BLUE     = 4,
    BRIGHT_GOLD  = 5,
    DIM_GOLD     = 6,
    BRIGHT_GREEN = 7,
    DIM_GREEN    = 8
}

xi.zone_lights.light_strings = {
    "Bright Red",
    "Dim Red",
    "Bright Blue",
    "Dim Blue",
    "Bright Gold",
    "Dim Gold",
    "Bright Green",
    "Dim Green",
}

xi.zone_lights.zones = {
    [xi.zone.EASTERN_ALTEPA_DESERT]  = {1, .5},
    [xi.zone.WESTERN_ALTEPA_DESERT]  = {1, .66, .33},
    [xi.zone.BEAUCEDINE_GLACIER]     = {1, .5},
    [xi.zone.BEHEMOTHS_DOMINION]     = {1, .66, .33},
    [xi.zone.BOSTAUNIEUX_OUBLIETTE]  = {1, .66, .33},
    [xi.zone.THE_BOYAHDA_TREE]       = {1, .7, .3, .15},
    [xi.zone.DEN_OF_RANCOR]          = {1, .7, .3, .15},
    [xi.zone.THE_ELDIEME_NECROPOLIS] = {1, .66, .33},
    [xi.zone.FEIYIN]                 = {1, .66, .33},
    [xi.zone.GUSTAV_TUNNEL]          = {1, .66, .33},
    [xi.zone.IFRITS_CAULDRON]        = {1, .7, .3, .15},
    [xi.zone.KUFTAL_TUNNEL]          = {1, .7, .3, .15},
    [xi.zone.LABYRINTH_OF_ONZOZO]    = {1, .7, .3, .15},
    [xi.zone.ROMAEVE]                = {1, .7, .3, .15},
    [xi.zone.QUICKSAND_CAVES]        = {1, .66, .33},
    [xi.zone.RUAUN_GARDENS]          = {1, .65, .35, .05},
    [xi.zone.SEA_SERPENT_GROTTO]     = {1, .55, .33},
    [xi.zone.THE_SHRINE_OF_RUAVITAU] = {1, .65, .35, .05},
    [xi.zone.TEMPLE_OF_UGGALEPIH]    = {1, .66, .33},
    [xi.zone.VELUGANNON_PALACE]      = {1, .64, .35, .05},
}

xi.zone_lights.zones_strings = {
    [xi.zone.EASTERN_ALTEPA_DESERT]  = "Eastern Altepa Desert",
    [xi.zone.WESTERN_ALTEPA_DESERT]  = "Western Altepa Desert",
    [xi.zone.BEAUCEDINE_GLACIER]     = "Beaucedine Glacier",
    [xi.zone.BEHEMOTHS_DOMINION]     = "Behemoth's Dominion",
    [xi.zone.BOSTAUNIEUX_OUBLIETTE]  = "Bostaunieux Oubliette",
    [xi.zone.THE_BOYAHDA_TREE]       = "The Boyahda Tree",
    [xi.zone.DEN_OF_RANCOR]          = "Den of Rancor",
    [xi.zone.THE_ELDIEME_NECROPOLIS] = "The Eldieme Necropolis",
    [xi.zone.FEIYIN]                 = "Fei'yin",
    [xi.zone.GUSTAV_TUNNEL]          = "Gustav Tunnel",
    [xi.zone.IFRITS_CAULDRON]        = "Ifrit's Cauldron",
    [xi.zone.KUFTAL_TUNNEL]          = "Kuftal Tunnel",
    [xi.zone.LABYRINTH_OF_ONZOZO]    = "Labyrinth of Onzozo",
    [xi.zone.ROMAEVE]                = "Ro'Maeve",
    [xi.zone.QUICKSAND_CAVES]        = "Quicksand Caves",
    [xi.zone.RUAUN_GARDENS]          = "Ru'Aun Gardens",
    [xi.zone.SEA_SERPENT_GROTTO]     = "Sea Serpent Grotto",
    [xi.zone.THE_SHRINE_OF_RUAVITAU] = "The Shrine of Ru'Avita",
    [xi.zone.TEMPLE_OF_UGGALEPIH]    = "Temple of Uggalepih",
    [xi.zone.VELUGANNON_PALACE]      = "Ve'Lugannon Palace",
}

xi.zone_lights.updateZoneLights = function()
    for zoneID, lightChances in pairs(xi.zone_lights.zones) do
        xi.zone_lights.updateLightsForZone(zoneID, lightChances)
    end
end

xi.zone_lights.updateLightsForZone = function(zoneID, lightChances)
    local light_one, light_two, light_three, light_four = xi.zone_lights.rollLights(zoneID, lightChances)
    local zone = GetZone(zoneID)

    zone:setLights(light_one, light_two, light_three, light_four)
end

xi.zone_lights.rollLights = function(zoneID, lightChances)
    if zoneID == xi.zone.RUAUN_GARDENS or zoneID == xi.zone.THE_SHRINE_OF_RUAVITAU or zoneID == xi.zone.VELUGANNON_PALACE then
        return xi.zone_lights.skyZones()
    else
        return xi.zone_lights.regularZones(lightChances)
    end
end

xi.zone_lights.skyZones = function()
    return
        xi.zone_lights.lights.DIM_RED,
        xi.zone_lights.lights.DIM_BLUE,
        xi.zone_lights.lights.DIM_GOLD,
        xi.zone_lights.lights.DIM_GREEN
end

xi.zone_lights.regularZones = function(lightChances)
    -- Build the Initial Light Pool
    local lights = {
        xi.zone_lights.lights.BRIGHT_RED, xi.zone_lights.lights.BRIGHT_BLUE,
        xi.zone_lights.lights.BRIGHT_GOLD, xi.zone_lights.lights.BRIGHT_GREEN,
    }

    -- Roll Light One (Guaranteed Bright)
    local roll = math.random(1, 4)
    local light_one = lights[roll]
    table.remove(lights, roll)

    -- Add in Dims now
    local dims = {}
    for i = 1, #lights, 1 do
        table.insert(dims, lights[i]+1)
    end

    for _, dim in ipairs(dims) do
        table.insert(lights, dim)
    end

    -- Roll Light Two
    roll = math.random(1, #lights)
    local light_two = lights[roll]
    table.remove(lights, roll)

    if light_two % 2 == 0 then
        -- Evens are Dim so remove the Bright which is ( Value of Dim - 1 )
        table.remove(lights, xi.zone_lights.findLight(lights, light_two-1))
    else
        -- Odds are Bright so remove the Dim which is ( Value of Dim + 1 )
        table.remove(lights, xi.zone_lights.findLight(lights, light_two+1))
    end

    -- Add No Lights
    table.insert(lights, xi.zone_lights.lights.NO_LIGHTS)
    table.insert(lights, xi.zone_lights.lights.NO_LIGHTS)
    table.insert(lights, xi.zone_lights.lights.NO_LIGHTS)
    table.insert(lights, xi.zone_lights.lights.NO_LIGHTS)

    -- Set this now incase of failure
    local light_four  = xi.zone_lights.lights.NO_LIGHTS
    local light_three = xi.zone_lights.lights.NO_LIGHTS

    if #lightChances > 2 then
        -- Remove Brights
        local len = #lights
        for i = 1, len, 1 do
            for index, value in pairs(lights) do
                if value % 2 ~= 0 then
                    table.remove(lights, index)
                    break
                end
            end
        end

        -- Roll Light Three
        roll = math.random(1, #lights)
        light_three = lights[roll]

        -- If it wasn't NO_LIGHTS, work on #4
        if light_three ~= xi.zone_lights.lights.NO_LIGHTS and #lightChances == 4 then
            -- Remove our third light if it was
            table.remove(lights, roll)

            -- Remove a single NO_LIGHTS
            for index, value in pairs(lights) do
                if value == xi.zone_lights.lights.NO_LIGHTS then
                    table.remove(lights, index)
                    break
                end
            end

            -- Roll Light Four
            light_four = lights[math.random(1, #lights)]
        end
    end

    return light_one, light_two, light_three, light_four
end

xi.zone_lights.findLight = function(lights, light)
    for index, value in ipairs(lights) do
        if value == light then
            return index
        end
    end
end