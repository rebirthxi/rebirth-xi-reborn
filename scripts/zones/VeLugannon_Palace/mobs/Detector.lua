-----------------------------------
-- Area: VeLugannon Palace
--  Mob: Detector
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar("petCount", 1)
end

local getMobToSpawn = function(detector)
    local ID = require("scripts/zones/VeLugannon_Palace/IDs")
    local detectorID = detector:getID()
    local canSpawnSteamCleaner = GetServerVariable("[POP]SteamCleaner") < os.time() and utils.contains(detectorID, ID.mob.STEAM_CLEANER_DETECTORS)
    local steamCleanerSpawnChance = 10 -- percent
    local steamCleaner = GetMobByID(ID.mob.STEAM_CLEANER)

    if steamCleaner:isSpawned() then
        -- this check is needed to prevent the detector from spawning BOTH steam cleaner and a caretaker
        -- by essentially "re-returning" steam cleaner, the subsequent logic will know that he's already spawned as well
        -- and won't try to respawn him
        -- This silly check is basically needed because we fall back on a "my id + 1" convention instead of actually
        -- doing some sort of "this detector owned/spawned this caretaker and while he is alive, I shouldn't summon
        -- something else".
        if detector:getLocalVar("SpawnedSC") == 1 then
            return steamCleaner
        end
    elseif canSpawnSteamCleaner and math.random(100) < steamCleanerSpawnChance then
        detector:setLocalVar("SpawnedSC", 1)
        return steamCleaner
    end

    return GetMobByID(detectorID + 1)
end

entity.onMobFight = function(mob, target)
    local mobToSpawn = getMobToSpawn(mob)
    local petCount = mob:getLocalVar("petCount")

    -- Summons a mob (Caretaker or Steam Cleaner) every 15 seconds.
    -- TODO: Casting animation for before summons. When he spawns them isn't exactly retail accurate.
    --       Should be ~10s to start cast, and another ~5 to finish.
    -- Detectors can also still spawn the mobToSpawns while sleeping, moving, etc.
    -- Maximum number of pets Detector can spawn is 5

    if petCount <= 5 and mob:getBattleTime() % 15 < 3 and mob:getBattleTime() > 3 and not mobToSpawn:isSpawned() then
        mobToSpawn:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1)
        mobToSpawn:spawn()
        mobToSpawn:updateEnmity(target)
        mob:setLocalVar("petCount", petCount + 1)
    end

    -- make sure pet has a target
    if mobToSpawn:getCurrentAction() == xi.act.ROAMING then
        mobToSpawn:updateEnmity(target)
    end
end

entity.onMobDisengage = function(mob)
    local caretakerId = mob:getID() + 1

    mob:resetLocalVars()

    if GetMobByID(caretakerId):isSpawned() then
        DespawnMob(caretakerId)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 743, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    local caretakerId = mob:getID() + 1

    mob:resetLocalVars()

    if GetMobByID(caretakerId):isSpawned() then
        DespawnMob(caretakerId)
    end
end

return entity
