-----------------------------------
-- Area: Bibiki Bay
--   NM: Dalham
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.WATER_ABSORB, 100)
end

entity.onMobFight = function(mob, target)
    -- "Increases swings per attack round as its HP lowers. At 15-20% swings like Charybdis giving the illusion of Hundred Fists."
    local swings = 1 + math.floor((100 - mob:getHPP()) / 18)
    mob:setMobMod(xi.mobMod.MULTI_HIT, swings)
end

entity.onMobDeath = function(mob, player, isKiller)
    if (player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Dalham_KILL") == 0) then
        player:setCharVar("COP_Dalham_KILL", 1)
    end
end

return entity
