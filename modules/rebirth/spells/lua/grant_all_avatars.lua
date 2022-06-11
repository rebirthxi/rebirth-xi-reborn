-----------------------------------
-- Grants all Avatars to players
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/globals/player")
-----------------------------------
local m = Module:new("grant_all_avatars")

m:addOverride("xi.player.onGameIn", function(player, firstLogin, zoning)
    if not zoning then
        for spell_id = xi.magic.spell.CARBUNCLE, xi.magic.spell.DIABOLOS, 1 do
            player:addSpell(spell_id)
        end
    end

    super(player, firstLogin, zoning)
end)

return m