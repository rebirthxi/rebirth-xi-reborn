-----------------------------------
-- Area: Dynamis - Qufim
--  Mob: Antaeus
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.dynamis.megaBossOnDeath(mob, player, isKiller)
end

return entity
