-----------------------------------
-- Sand Pit
-- Single target bind
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.BIND
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 30))

    -- Different mechanics based on the antlion using it
    local poolID = mob:getPool()

    if (poolID == 1318) then -- if the pool ID == Feeler Antlion ID
        local npcX = mob:getXPos()
        local npcY = mob:getYPos()
        local npcZ = mob:getZPos()
        local spawnId = 0

        -- Spawn an Executioner Antlion. There are only 5 in the database.
        if (not GetMobByID(mob:getID()+1):isSpawned()) then -- if not spawned, set variable to spawn later.
            spawnId = mob:getID()+1
        elseif (not GetMobByID(mob:getID()+2):isSpawned()) then
            spawnId = mob:getID()+2
        elseif (not GetMobByID(mob:getID()+3):isSpawned()) then
            spawnId = mob:getID()+3
        elseif (not GetMobByID(mob:getID()+4):isSpawned()) then
            spawnId = mob:getID()+4
        elseif (not GetMobByID(mob:getID()+5):isSpawned()) then
            spawnId = mob:getID()+5
        else
            spawnId = 0 -- If they are all up, then don't spawn any more.
        end

        if (spawnId > 0) then
            local executioner = GetMobByID(spawnId)
            executioner:setSpawn(npcX-1, npcY-2, npcZ-1) -- Set its spawn location.
            SpawnMob(spawnId):updateEnmity(target)
        end
    elseif (poolID == 4046) then
        -- Tuchulcha (Sheep in Antlion's Clothing)
        -- Resets all enmity
        local allies = mob:getBattlefield():getAllies()
        for _, enmAlly in pairs(allies) do
            mob:resetEnmity(enmAlly)
        end
        -- Removes all enfeebling effects
        mob:delStatusEffectsByFlag(xi.effectFlag.ERASABLE)
    end

    return typeEffect
end

return mobskill_object
