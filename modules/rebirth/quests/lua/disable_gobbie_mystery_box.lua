-----------------------------------
-- Disables the Gobbie Mystery Box
-----------------------------------
require("modules/module_utils")
require("scripts/globals/gobbiemysterybox")
-----------------------------------
local m = Module:new("disable_gobbie_mystery_box")

m:addOverride("xi.mystery.onTrigger", function(player, npc, events)
    player:PrintToPlayer("Gobbie Mystery Box is disabled.")
    return
end)

m:addOverride("xi.mystery.onTrade", function(player, npc, trade, events)
    player:PrintToPlayer("Gobbie Mystery Box is disabled.")
    return
end)

return m

