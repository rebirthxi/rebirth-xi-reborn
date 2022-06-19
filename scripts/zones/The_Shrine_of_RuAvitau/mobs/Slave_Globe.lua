-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Slave Globe
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    local mg = GetMobByID(ID.mob.MOTHER_GLOBE)

    if mg:getLocalVar("nextSlaveSpawnTime") == 0 then
        mg:setLocalVar("nextSlaveSpawnTime", os.time() + 30)
    end
end

return entity
