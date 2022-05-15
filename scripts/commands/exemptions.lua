require("scripts/globals/qr_augments")

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local exemptions = xi.augments.acquirePlayerExemptList(player)
    local output = "Items Exempted\n"

    for itemId, _ in pairs(exemptions) do
        output = output .. " - itemId: " .. itemId .. "\n"
    end

    player:PrintToPlayer(output, 13)
end
