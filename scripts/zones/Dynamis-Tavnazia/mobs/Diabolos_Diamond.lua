-----------------------------------
-- Area: Dynamis-Tavnazia
--  Mob: Diabolos Diamond
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.dynamis.megaBossOnDeath(mob, player, isKiller)
    player:addTitle(xi.title.NIGHTMARE_AWAKENER)
end

return entity
