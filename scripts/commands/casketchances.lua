require("scripts/globals/glowing_caskets")
require("scripts/globals/msg")
cmdprops =
{
    -- Any player can use it; no other inputs expected
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local baseCasketSpawnRate = xi.glowingCaskets.baseSpawnChance
    local playerBonusChance = xi.glowingCaskets.getPlayerBonusChance(player)
    local playerFailureBonusChance = xi.glowingCaskets.getPlayerOpenFailureBonus(player)

    local msg = "Glowing Casket Spawn Chances:"
    msg = msg .. string.format("\n- Base: %d", baseCasketSpawnRate)
    msg = msg .. string.format("\n- Unopened: %d", playerBonusChance)
    msg = msg .. string.format("\n- Failure: %d", playerFailureBonusChance)
    msg = msg .. string.format("\n- Total: %d", baseCasketSpawnRate + playerBonusChance + playerFailureBonusChance)

    player:PrintToPlayer(msg, xi.msg.channel.NS_SAY)
end