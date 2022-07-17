-----------------------------------
-- Area: Davoi
--  Mob: Barakbok
-- Involved in Quest: The Doorman
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:incrementCharVar("theDoormanKilledNM", 1)
    end
end

return entity
