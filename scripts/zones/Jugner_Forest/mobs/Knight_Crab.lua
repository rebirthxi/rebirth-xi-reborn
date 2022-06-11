-----------------------------------
-- Area: Jugner Forest
--  Mob: Knight Crab
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- If respawn and variable is not 0, then it respawned before someone killed all 10 crabs
    local kingArthro = GetMobByID(ID.mob.KING_ARTHRO)

    if kingArthro:getLocalVar("[POP]King_Arthro") > 0 then
        kingArthro:setLocalVar("[POP]King_Arthro", kingArthro:getLocalVar("[POP]King_Arthro")  - 1)
    end

    -- 5 minute rage timer (ffxiah says 5, ffxiclopedia says 5-10, bg doesn't say at all)
    mob:setLocalVar("[rage]timer", 300)
end

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    local kingArthro = GetMobByID(ID.mob.KING_ARTHRO)

    kingArthro:setLocalVar("[POP]King_Arthro", kingArthro:getLocalVar("[POP]King_Arthro") + 1)

    if kingArthro:getLocalVar("[POP]King_Arthro") == 10 then
        kingArthro:setLocalVar("[POP]King_Arthro", 0)
        SpawnMob(ID.mob.KING_ARTHRO) -- Pop King Arthro !
    end
end

return entity
