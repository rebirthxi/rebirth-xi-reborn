-----------------------------------
-- func: ah
-- desc: opens the Auction House menu anywhere in the world
-----------------------------------
require("scripts/globals/zone")

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()

    if player:getGMLevel() > 0 then
        player:sendMenu(3)
    elseif zone:getType() == xi.zoneType.CITY then
        player:sendMenu(3)
    elseif player:hasTeleport(player:getNation(), zone:getRegionID() + 5) then
        player:sendMenu(3)
    else
        player:PrintToPlayer("[AH Command] You do not meet the requirements to use this command.", 0xF)
    end
end
