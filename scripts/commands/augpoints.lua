require("scripts/globals/qr_augments")

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    player:PrintToPlayer(string.format("You have %d augment points.", xi.augments.getAugPoints(player)), 13)
end
