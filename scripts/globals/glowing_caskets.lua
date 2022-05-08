-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/qr_utils")
-----------------------------------
xi = xi or {}
xi.glowingCaskets = xi.glowingCaskets or {}

xi.glowingCaskets.openChanceMin = 10
xi.glowingCaskets.openChanceMax = 90

xi.glowingCaskets.insertGlowingCaskets = function(zone)
    local zoneId = zone:getID()
    local ID = zones[zoneId]

    ID.glowingCaskets = ID.glowingCaskets or {}

    repeat
        local glowingCasket = zone:insertDynamicEntity({
            objtype = xi.objType.NPC,
            name = "Glowing Casket",
            look = 1932,
            x = 0.0,
            y = 0.0,
            z = 0.0,
            rotation = 0,
            onTrigger = function(player, npc)
                xi.glowingCaskets.onTrigger(player, npc)
            end,
            onEventFinish = function(player, csid, option, npc)
                print(string.format("csid: %d option: %d", csid, option))
            end
        })
        glowingCasket:hideName(true)
        glowingCasket:setNpcFlags(3)
        glowingCasket:setStatus(xi.status.DISAPPEAR)

        table.insert(ID.glowingCaskets, glowingCasket:getID())
    until #ID.glowingCaskets == 15
end

xi.glowingCaskets.onTrigger = function(player, npc)
    local openChanceString = xi.glowingCaskets.generatePlayerOpenChanceString(player)
    local playerOpenChance = npc:getLocalVar(openChanceString)

    if playerOpenChance == 0 then
        playerOpenChance = xi.glowingCaskets.rollCasketChance()
        npc:setLocalVar(openChanceString, playerOpenChance)
    end
    xi.glowingCaskets.sendOpenChanceToPlayer(player, playerOpenChance)
end

xi.glowingCaskets.generatePlayerOpenChanceString = function(player)
    return string.format("OpenChance[%s]", player:getName())
end

xi.glowingCaskets.rollCasketChance = function()
    return math.random(xi.glowingCaskets.openChanceMin, xi.glowingCaskets.openChanceMax)
end

xi.glowingCaskets.sendOpenChanceToPlayer = function(player, chance)
    player:PrintToPlayer(
        string.format(
            "You are able to estimate that you have about a %d%s chance to open the casket.",
            chance, "%"
        ),
        xi.msg.channel.NS_SAY
    )
end

xi.glowingCaskets.shouldSpawnGlowingChest = function(player, mob)
    local casket = xi.glowingCaskets.getAvailableCasket(mob)

    if casket ~= nil then
        return true, casket
    end

    return false, nil
end

xi.glowingCaskets.spawnCasket = function(player, casket, position)
    -- set the internal data variables
    casket:resetLocalVars()

    -- set casket animation
    casket:setAnimation(0)
    casket:setAnimationSub(4)


    -- set casket visual data
    casket:setPos(position.x, position.y, position.z, position.rot)
    casket:setStatus(xi.status.NORMAL)
    casket:entityAnimationPacket("deru")

    -- set despawn timer (in milliseconds)
    casket:timer(180000, function(npc)
        npc:setStatus(xi.status.DISAPPEAR)
    end)

    xi.qr_utils.sendMsgToPlayerAlliance(player, "A casket glowing with strange light has been revealed.", xi.msg.channel.NS_SAY)
end

xi.glowingCaskets.getAvailableCasket = function(mob)
    local ID = zones[mob:getZoneID()]

    for _, casketID in ipairs(ID.glowingCaskets) do
        local possibleCasket = GetNPCByID(casketID)

        if possibleCasket:getStatus() == xi.status.DISAPPEAR then
            return possibleCasket
        end
    end

    return nil
end

xi.glowingCaskets.openCasket = function(player, casket)
    casket:setAnimationSub(1)

    -- Send the message to the player
    player:PrintToPlayer("You open the glowing casket!", xi.msg.channel.NS_SAY)

    -- Send the message to everyone
    local msg = string.format("%s has decided to open the glowing casket!", player:getName())
    xi.qr_utils.sendMsgToPlayersAllianceButNotThePlayer(player, msg, xi.msg.channel.NS_SAY)
end

xi.glowingCaskets.sendOpenChestMenu = function(player, npc)
    player:startEvent(1000, 13450, 0, 0, 0, 0, 0, 0, 0)
end

--xi.glowingCaskets.getCasketID = function(casket)
--
--end