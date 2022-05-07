-----------------------------------
-- func: scorenpc
-- desc: Returns all data about the NPC
-----------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!scorenpc {npcID} <animationID>")
end

function onTrigger(player, arg1, arg2)
    local targ
    local animationId

    if (arg2 == nil) then
        -- player did not provide npcId.  Shift arguments by one.
        targ = player:getCursorTarget()
        animationId = arg1
    else
        -- player provided npcId and animationId.
        targ = GetNPCByID(tonumber(arg1))
        animationId = arg2
    end

    -- validate target
    if (targ == nil) then
        error(player, "You must either enter a valid npcID or target an NPC.")
        return
    end
    if (not targ:isNPC()) then
        error(player, "Targeted entity is not an NPC.")
        return
    end

    local score = targ:getNpcScore()

    player:PrintToPlayer(string.format("Name: %s", score["Name"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("NamePrefix: %s", score["NamePrefix"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("ID: %d", score["ID"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Targ ID: %d", score["TargID"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Flags: %d", score["Flags"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Widescan: %d", score["Widescan"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Triggerable: %s", tostring(score["Triggerable"])), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Status: %d", score["Status"]), xi.msg.channel.NS_SAY)
    --player:PrintToPlayer(string.format("Look: %d", score["Look"]), xi.msg.channel.NS_SAY)
    --player:PrintToPlayer(string.format("MainLook: %d", score["MainLook"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Animation: %d", score["Animation"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("AnimationSub: %d", score["AnimationSub"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Namevis: %d", score["Namevis"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Allegiance: %d", score["Allegiance"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("UpdateMask: %d", score["UpdateMask"]), xi.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("IsRenamed: %d", score["IsRenamed"]), xi.msg.channel.NS_SAY)

    -- Widescan
    -- Triggerable
    -- Status
    -- Name
    -- Look
    -- MainLook
    -- Loc
    -- Animation
    -- Animation Sub
    -- Speed
    -- Speed Sub
    -- Namevis
    -- Allegiance
    -- Updatemask
    -- isRenamed
end
