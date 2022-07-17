-----------------------------------
-- Area: Jugner Forest
--   NM: Meteormauler Zhagtegg
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Jugner_Forest/IDs")
-----------------------------------
local entity = {}

-- TODO: Implement better pathing systems for guards to follow master

entity.onMobSpawn = function(mob)
    -- Takes half damage from all attacks
    mob:addMod(xi.mod.DMG,-5000)

    -- May spawn in a party with two other Orcs
    if math.random(1,2) == 1 then
        GetMobByID(ID.mob.METEORMAULER + 1):setSpawn(mob:getXPos()+2, mob:getYPos(), mob:getZPos())
        GetMobByID(ID.mob.METEORMAULER + 2):setSpawn(mob:getXPos()+4, mob:getYPos(), mob:getZPos())
        SpawnMob(ID.mob.METEORMAULER + 1)
        SpawnMob(ID.mob.METEORMAULER + 2)
    end
end

entity.onMobEngaged = function(mob, target)
    local mobId = mob:getID()
    for i = 1, 2 do
        local guardID = GetMobByID(mobId+i)
        guardID:updateEnmity(target)
    end
end

entity.onMobRoam = function(mob)
    local mobId = mob:getID()
    for i = 1, 2 do
        local guard = GetMobByID(mobId + i)
        if guard:isSpawned() and guard:getID() == mobId + 1 then
            guard:pathTo(mob:getXPos() + 1, mob:getYPos() + 3, mob:getZPos() + 0.15)
        elseif guard:isSpawned() and guard:getID() == mobId + 2 then
            guard:pathTo(mob:getXPos() + 3, mob:getYPos() + 5, mob:getZPos() + 0.15)
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(75600 + math.random(0, 600)) -- 21 hours, 10 minute window
    DespawnMob(ID.mob.METEORMAULER + 1)
    DespawnMob(ID.mob.METEORMAULER + 2)
end

return entity
