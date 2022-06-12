-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Mother Globe
-- TODO: Looked like pets had an additional effect: stun with an unknown proc rate
-- TODO: "Links with Slave Globes, and Slave Globes link with Defenders. Defenders do not link with Slave Globes or Mother Globe."
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addStatusEffectEx(xi.effect.SHOCK_SPIKES, 0, 60, 0, 0) -- ~60 damage
    -- TODO: Effect can be stolen, giving a THF (Aura Steal) or BLU (Voracious Trunk) a 60 minute shock spikes effect (unknown potency).
    -- If effect is stolen, he will recast it instantly.
end

entity.onMobFight = function(mob, target)
    -- Keep pets linked
    for _, slaveGlobeID in ipairs(ID.mob.SLAVE_GLOBES) do
        local pet = GetMobByID(slaveGlobeID)
        if pet:getCurrentAction() == xi.act.ROAMING then
            pet:updateEnmity(target)
        end
    end

    -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
    -- TODO: Should have a SMN casting effect for ~3-5 seconds while calling.
    if mob:getBattleTime() % 30 == 0 and mob:getBattleTime() > 3 then
        for i = motherGlobe + 1, motherGlobe + 6 do
            local pet = GetMobByID(i)
            if not pet:isSpawned() then
                pet:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1)
                pet:spawn()
                pet:updateEnmity(target)
                return
            end
        end
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- TODO: Additional Effect for ~100 damage (theme suggests enthunder)
    -- Unknown if this can be stolen/dispelled like spikes.  Isn't mentioned, probably not.
end

entity.onMobDeath = function(mob, player, isKiller)
    mob:setRespawnTime(math.random(10800, 21600)) -- respawn 3-6 hrs

    for _, slaveGlobeID in ipairs(ID.mob.SLAVE_GLOBES) do
        local pet = GetMobByID(slaveGlobeID)
        if pet:isSpawned() then
            DespawnMob(slaveGlobeID)
        end
    end
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(10800, 21600)) -- 3 to 6 hours
end

return entity
