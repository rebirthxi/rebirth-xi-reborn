---------------------------------------------------------------------------------------------------
-- func: rolllights
-- desc: Updates all the value zone lights
---------------------------------------------------------------------------------------------------

require("scripts/globals/zone_lights")

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    xi.zone_lights.updateZoneLights()
    player:PrintToPlayer("Rolling the Zone Lights!")
end