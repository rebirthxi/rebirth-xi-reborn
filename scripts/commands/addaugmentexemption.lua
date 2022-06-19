-----------------------------------
-- func: addaugmentexemption
-- desc: Adds an augment exemption to a player for a given item ID
-----------------------------------
require("scripts/globals/qr_augments")
-----------------------------------

cmdprops =
{
    permission = 2,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addaugmentexemption {player} {itemID}")
end

function onTrigger(gm, playerName, itemId)
    if not playerName then
        error(gm, "No player name given.");
        return
    end

    local player = GetPlayerByName(playerName)
    if not player then
        error(gm, "Player with name: " .. playerName .. " cannot be found.")
        return
    end

    if not itemId then
        error(gm, "You need to input an item id.")
        return
    end

    xi.augments.addItemToPlayerExemptList(player, itemId)

    player:PrintToPlayer(string.format("You have been granted an augment exemption for itemID %d", itemId))
    gm:PrintToPlayer(string.format("You grant an augment exemption to %s for itemID %d", player:getName(), itemId))
end
