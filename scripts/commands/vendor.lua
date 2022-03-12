---------------------------------------------------------------------------------------------------
-- func: vendor
-- desc: opens the Outpost shop menu anywhere in the world
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop")

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local zone = player:getZone();

    if player:getGMLevel() > 0 or player:hasTeleport(player:getNation(), zone:getRegionID() + 5) then
        xi.shop.outpost(player)
    else
        player:PrintToPlayer("[Vendor Command] You do not meet the requirements to use this command.", 0xF);
    end
end