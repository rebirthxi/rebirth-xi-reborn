-----------------------------------
-- func: delmodnil
-- desc: Tests passing nil to delMod to see if it crashes linux system
-----------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = ""
}


function onTrigger(player)
    player:delMod(xi.mod.REGEN, nil)
end
