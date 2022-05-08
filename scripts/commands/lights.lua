require("scripts/globals/zone_lights")

cmdprops =
{
    -- Any player can use it; no other inputs expected
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    for zoneID, _ in pairs(xi.zone_lights.zones) do
        local zone = GetZone(zoneID)
        local lights = {zone:getLights()}

        if lights[3] == xi.zone_lights.lights.NO_LIGHTS then
            player:PrintToPlayer(string.format("%-22s has '%s' and '%s' lights.",
                    xi.zone_lights.zones_strings[zoneID],
                    xi.zone_lights.light_strings[lights[1]],
                    xi.zone_lights.light_strings[lights[2]]), 0xF)
        elseif lights[4] == xi.zone_lights.lights.NO_LIGHTS then
            player:PrintToPlayer(string.format("%-22s has '%s', '%s', and '%s' lights",
                    xi.zone_lights.zones_strings[zoneID],
                    xi.zone_lights.light_strings[lights[1]],
                    xi.zone_lights.light_strings[lights[2]],
                    xi.zone_lights.light_strings[lights[3]]), 0xF)
        else
            player:PrintToPlayer(string.format("%-22s has '%s', '%s', '%s', and '%s' lights",
                    xi.zone_lights.zones_strings[zoneID],
                    xi.zone_lights.light_strings[lights[1]],
                    xi.zone_lights.light_strings[lights[2]],
                    xi.zone_lights.light_strings[lights[3]],
                    xi.zone_lights.light_strings[lights[4]]), 0xF)
        end
    end
end