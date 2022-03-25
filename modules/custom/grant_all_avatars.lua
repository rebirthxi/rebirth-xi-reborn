-----------------------------------
-- Grants all Avatars to players
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
-----------------------------------
local m = Module:new("grant_all_avatars")
m:setEnabled(true)

m:addOverride("xi.player.onGameIn", function(player, firstLogin, zoning)
    if not zoning then
        for spell_id = xi.magic.spell.CARBUNCLE, xi.magic.spell.DIABOLOS, 1 do
            player:addSpell(spell_id)
        end
    end

    super(player, firstLogin, zoning)
end)

return m