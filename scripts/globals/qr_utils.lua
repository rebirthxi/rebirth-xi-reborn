xi = xi or {}
xi.qr_utils = xi.qr_utils or {}

xi.qr_utils.ffxiRotConversionFactor = 360.0 / 255.0

xi.qr_utils.ffxiRotToDegrees = function(ffxiRot)
    return xi.qr_utils.ffxiRotConversionFactor * ffxiRot
end

xi.qr_utils.lateralTranslateWithOriginRotation = function(origin, translation)
    local degrees = xi.qr_utils.ffxiRotToDegrees(origin.rot)
    local rads = math.rad(degrees)
    local new_coords = {}

    new_coords.x = origin.x + ((math.cos(rads) * translation.x) + (math.sin(rads) * translation.z))
    new_coords.z = origin.z + ((math.cos(rads) * translation.z) - (math.sin(rads) * translation.x))
    new_coords.y = origin.y
    new_coords.rot = origin.rot

    return new_coords
end

xi.qr_utils.sendMsgToPlayerAlliance = function(player, msg, channel)
    local alliance = player:getAlliance()
    for _, member in pairs(alliance) do
        member:PrintToPlayer(msg, channel)

    end
end

xi.qr_utils.sendMsgToPlayersAllianceButNotThePlayer = function(player, msg, channel)
    local playerId = player:getID()
    local party = player:getAlliance()
    for _, member in pairs(party) do
        if member:getID() ~= playerId then
            member:PrintToPlayer(msg, channel)
        end
    end
end