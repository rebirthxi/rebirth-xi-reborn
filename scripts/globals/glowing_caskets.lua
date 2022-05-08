-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/qr_utils")
require("scripts/globals/qr_augments")
-----------------------------------
xi = xi or {}
xi.glowingCaskets = xi.glowingCaskets or {}

xi.glowingCaskets.openChanceMin = 10
xi.glowingCaskets.openChanceMax = 90
xi.glowingCaskets.IsOpenString = "IsOpen"

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
            onTrade = function(player, npc, trade)
                xi.glowingCaskets.onTrade(player, npc, trade)
            end,
            onEventFinish = function(player, csid, option, npc)
                xi.glowingCaskets.onEventFinish(player, csid, option, npc)
            end
        })
        glowingCasket:hideName(true)
        glowingCasket:setNpcFlags(3)
        glowingCasket:setStatus(xi.status.DISAPPEAR)

        table.insert(ID.glowingCaskets, glowingCasket:getID())
    until #ID.glowingCaskets == 15
end

-----------------------------------
--- on Trigger
-----------------------------------
xi.glowingCaskets.onTrigger = function(player, npc)
    local openChance = xi.glowingCaskets.playerOpenChance(player, npc)

    if not xi.glowingCaskets.playerIsOwnerOfCasket(player, npc) then
        player:PrintToPlayer("You cannot tell your chances of opening this chest because you do not own it.", xi.msg.channel.NS_SAY)
        return
    end

    if not xi.glowingCaskets.casketIsOpen(npc) then
        xi.glowingCaskets.sendOpenChanceToPlayer(player, openChance)
    else
        xi.glowingCaskets.sendOpenChestMenu(player)
    end
end

xi.glowingCaskets.playerOpenChance = function(player, casket)
    local openChanceString = xi.glowingCaskets.generatePlayerOpenChanceString(player)
    local playerOpenChance = casket:getLocalVar(openChanceString)

    if playerOpenChance == 0 then
        playerOpenChance = xi.glowingCaskets.rollCasketChance()
        casket:setLocalVar(openChanceString, playerOpenChance)
    end

    return playerOpenChance
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

-----------------------------------
--- onTrade
-----------------------------------

xi.glowingCaskets.onTrade = function(player, npc, trade)
    if not xi.glowingCaskets.playerIsOwnerOfCasket(player, npc) then
        player:PrintToPlayer("You do not have a right to attempt to open this chest.", xi.msg.channel.NS_SAY)
        return
    end

    if xi.glowingCaskets.casketIsOpen(npc) then return; end

    if trade:getSlotCount() ~= 1 then return; end

    if trade:getGil() ~= 100 then return; end

    player:tradeComplete()

    local openChance = xi.glowingCaskets.playerOpenChance(player, npc)

    if openChance > math.random(0, 100) then
        xi.glowingCaskets.successfullyOpenedCasket(player, npc)
    else
        xi.glowingCaskets.unsuccessfullyOpenedCasket(player, npc)
    end
end

xi.glowingCaskets.successfullyOpenedCasket = function(player, casket)
    xi.glowingCaskets.setCasketToOpen(casket)
    player:PrintToPlayer("You have successfully opened the glowing casket!", xi.msg.channel.NS_SAY)

    local augs, augment_srcs =  xi.glowingCaskets.generateAugmentInfo(casket)

    xi.glowingCaskets.setAugmentInfo(casket, augs, augment_srcs)
    xi.glowingCaskets.printAugmentInfoToParty(player, augs)

    local msgToAlliance = string.format("%s successfully opened a glowing casket!", player:getName())
    xi.qr_utils.sendMsgToPlayersAllianceButNotThePlayer(player, msgToAlliance, xi.msg.channel.PARTY)
end

xi.glowingCaskets.generateAugmentInfo = function(casket)
    local augs, augment_srcs = xi.augments.rollLightsAugment(casket:getZone())
    augment_srcs.augment_item_src = xi.augments.ingredients.MID_AUG

    return augs, augment_srcs
end

xi.glowingCaskets.setAugmentInfo = function(casket, augs, augment_srcs)
    casket:setLocalStringVar("Augments", utils.serializeTable(augs))
    casket:setLocalStringVar("AugmentSrcs", utils.serializeTable(augment_srcs))
end

xi.glowingCaskets.getAugmentInfo = function(casket)
    return
        loadstring(casket:getLocalStringVar("Augments"))(),
        loadstring(casket:getLocalStringVar("AugmentSrcs"))()
end

xi.glowingCaskets.printAugmentInfoToParty = function(player, augs)
    local msg = "\n===== Mid Tier Augment ======\n"

    for i, v in pairs(augs) do
        msg = msg .. string.format(" - %s for %d\n", xi.augments.strings[i], v+1)
    end

    xi.qr_utils.sendMsgToPlayerAlliance(player, msg, xi.msg.channel.NS_PARTY)
end

xi.glowingCaskets.unsuccessfullyOpenedCasket = function(player, casket)
    xi.glowingCaskets.despawnCasket(casket)
    player:PrintToPlayer("You have unsuccessfully opened the glownig casket...", xi.msg.channel.NS_SAY)

    local msgToAlliance = string.format("%s failed to open a glowing casket...", player:getName())
    xi.qr_utils.sendMsgToPlayersAllianceButNotThePlayer(player, msgToAlliance, xi.msg.channel.PARTY)
end

xi.glowingCaskets.despawnCasket = function(casket)
    casket:setStatus(xi.status.DISAPPEAR)
end


xi.glowingCaskets.shouldSpawnGlowingChest = function(player, mob)
    local zoneID = player:getZoneID()
    if xi.zone_lights.zones[zoneID] ~= nil then
        local casket = xi.glowingCaskets.getAvailableCasket(mob)

        if casket ~= nil then
            return true, casket
        end
    end

    return false, nil
end

xi.glowingCaskets.spawnCasket = function(player, casket, position)
    -- set the internal data variables
    casket:resetLocalVars()
    xi.glowingCaskets.setCasketToClosed(casket)

    casket:setLocalVar("Owner", player:getLeaderID())

    -- set casket animation
    casket:setAnimation(0)


    -- set casket visual data
    casket:setPos(position.x, position.y, position.z, position.rot)
    casket:setStatus(xi.status.NORMAL)
    casket:entityAnimationPacket("deru")

    -- set despawn timer (in milliseconds)
    casket:timer(180000, function(npc)
        xi.glowingCaskets.despawnCasket(npc)
    end)

    xi.qr_utils.sendMsgToPlayerAlliance(player, "A casket glowing with strange light has been revealed.", xi.msg.channel.NS_SAY)
end

xi.glowingCaskets.casketIsOpen = function(casket)
    return casket:getLocalVar(xi.glowingCaskets.IsOpenString) == 1
end

xi.glowingCaskets.setCasketToClosed = function(casket)
    casket:setAnimationSub(4)
    casket:setLocalVar(xi.glowingCaskets.IsOpenString, 0)
end

xi.glowingCaskets.setCasketToOpen = function(casket)
    casket:setAnimationSub(1)
    casket:setLocalVar(xi.glowingCaskets.IsOpenString, 1)
end

xi.glowingCaskets.playerIsOwnerOfCasket = function(player, casket)
    return xi.glowingCaskets.getCasketOwnerID(casket) == player:getLeaderID()
end

xi.glowingCaskets.setCasketOwnerID = function(casket, ownerID)
    casket:setLocalVar("Owner", ownerID)
end

xi.glowingCaskets.getCasketOwnerID = function(casket)
    return casket:getLocalVar("Owner")
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

xi.glowingCaskets.sendOpenChestMenu = function(player, npc)
    player:startEvent(1000, xi.augments.ingredients.MID_AUG, 0, 0, 0, 0, 0, 0, 0)
end

-----------------------------------
--- onEventFinish
-----------------------------------

xi.glowingCaskets.onEventFinish = function(player, csid, option, npc)
    if option == 65537 then
        if xi.glowingCaskets.giveAugmentItem(player, npc) then
            xi.glowingCaskets.despawnCasket(npc)
        end
    end
end

xi.glowingCaskets.giveAugmentItem = function(player, casket)
    if casket:getStatus() == xi.status.DISAPPEAR then
        return false
    end

    local ID = zones[casket:getZoneID()]
    if player:getFreeSlotsCount() == 0 then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.augments.ingredients.MID_AUG)
        return false
    end

    local augs, augment_srcs = xi.glowingCaskets.getAugmentInfo(casket)
    print(augs)
    local success = player:addItem({id=xi.augments.ingredients.MID_AUG, augments=augs, aug_src=augment_srcs})

    if success then
        player:messageSpecial(ID.text.ITEM_OBTAINED, xi.augments.ingredients.MID_AUG)
    end

    return success
end