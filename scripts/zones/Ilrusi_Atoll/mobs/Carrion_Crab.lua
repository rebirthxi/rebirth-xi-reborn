-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Carrion Crab
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    local instance = mob:getInstance()
    local crabMob  = GetMobByID(ID.mob.UNDEAD_CRAB, instance)
    local randVal  = math.random(1, 5)

    if randVal == 1 and crabMob:getLocalVar("CrabSpawned") == 0 then
        SpawnMob(ID.mob.UNDEAD_CRAB, instance)
        crabMob:setLocalVar("CrabSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
