-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Carrion Toad
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    local instance = mob:getInstance()
    local toadMob  = GetMobByID(ID.mob.UNDEAD_TOAD, instance)
    local randVal  = math.random(1, 5)

    if randVal == 1 and toadMob:getLocalVar("ToadSpawned") == 0 then
        SpawnMob(ID.mob.UNDEAD_TOAD, instance)
        toadMob:setLocalVar("ToadSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
