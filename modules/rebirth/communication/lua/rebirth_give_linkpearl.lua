-----------------------------------
-- Gives new players a QuetzRebirthTwo linkpearl
-----------------------------------
require("modules/module_utils")
require("scripts/globals/player")
-----------------------------------
local m = Module:new("rebirth_give_linkpearl")

m:addOverride("xi.player.onGameIn", function(player, firstLogin, zoning)
    if firstLogin then player:addLinkpearl("QuetzRebirthTwo", true) end

    super(player, firstLogin, zoning)
end)

return m