-----------------------------------
-- func: daily
-- desc: Returns the number of Daily BCs a player has
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    player:PrintToPlayer(string.format("You have %d daily beastmen seals remaining.", player:getCharVar("DailyBCs")), 0xE)
end

