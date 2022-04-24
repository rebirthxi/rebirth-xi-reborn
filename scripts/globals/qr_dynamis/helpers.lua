-----------------------------------
--- Helper functions for QR Dynamis
-----------------------------------
require("scripts/globals/qr_dynamis/data")
require("scripts/globals/status")
-----------------------------------
xi.qr_dynamis = xi.qr_dynamis or {}

xi.qr_dynamis.pickEyes = function(mob)
    local eye_roll = math.random(1,150)
    if eye_roll >= 1 and eye_roll <= 25 then
        mob:setAnimationSub(xi.qr_dynamis.eye.BLUE)
    elseif eye_roll >= 26 and eye_roll <= 50 then
        mob:setAnimationSub(xi.qr_dynamis.eye.GREEN)
    elseif eye_roll >= 51 and eye_roll <= 75 then
        mob:setAnimationSub(xi.qr_dynamis.eye.RED)
    end
end

xi.qr_dynamis.SPAWNED_MOBS = "SPAWNSMOBS"

xi.qr_dynamis.spawnGroup = function(mob, spawnList, killer)
    local superLinkId = mob:getTargID();
    local X = mob:getXPos();
    local Y = mob:getYPos();
    local Z = mob:getZPos();
    local aggroChar = killer or mob:getTarget()
    local numToSpawn = math.random(2, 5)
    local lenMobList = #spawnList

    -- Ensure my members superlink with me
    mob:setMobMod(xi.mobMod.SUPERLINK, superLinkId);

    if (mob:getLocalVar(xi.qr_dynamis.SPAWNED_MOBS) == 0) then
        mob:setLocalVar(xi.qr_dynamis.SPAWNED_MOBS, 1);
        for i = 1, numToSpawn, 1 do
            local safety = 1
            local mobToSpawn
            repeat
                local mobToSpawnID = spawnList[math.random(1, lenMobList)]
                mobToSpawn = GetMobByID(mobToSpawnID)
                safety = safety + 1
            until mobToSpawn:isDead() or safety == 20

            if safety ~= 20 then
                xi.qr_dynamis.spawnMob(mobToSpawn, superLinkId, X, Y, Z, aggroChar)
            end
        end
    end
end

xi.qr_dynamis.spawnMob = function(mob, superLinkId, x, y, z, target)
    local theta = math.random() * 2 * math.pi -- for spawning randomly around the stone
    -- Spawn Mob
    mob:setSpawn(
        x + (2 * math.cos(theta)),
        y,
        z + 2 * math.sin(theta)
    )
    mob:spawn()
    mob:setMobMod(xi.mobMod.SUPERLINK, superLinkId)
    mob:updateEnmity(target)
    local mJob = mob:getMainJob()

    -- Spawn Pet for BST, and SMN
    if (mJob == xi.job.BST or mJob == xi.job.SMN) then
        local pet = mob:getPet()

        if pet then
            if pet:isDead() then
                local petId = nil
                -- randomize pet for SMN
                if (mJob == xi.job.SMN) then
                    petId = math.random(xi.pet.id.CARBUNCLE, xi.pet.id.RAMUH)

                    -- switch pet to Ramuh if pet is Fenrir
                    if (petId == xi.pet.id.FENRIR) then
                        petId = xi.pet.id.RAMUH
                    end
                end

                mob:spawnPet(petId)
                pet:setMobMod(xi.mobMod.SUPERLINK, superLinkId)
            end
        end
    end
end

xi.qr_dynamis.deathSpawnGroup = function(mob, mobList, player, isKiller)
    xi.qr_dynamis.onStoneDeath(mob, player)
    if mob:getLocalVar(xi.qr_dynamis.SPAWNED_MOBS) == 0 then
        if isKiller then
            xi.qr_dynamis.spawnGroup(mob, mobList, player);
        end
    end
end

xi.qr_dynamis.onStoneDeath = function(mob, player)
    local state = mob:getAnimationSub()

    if state == xi.qr_dynamis.eye.BLUE then
        player:messageBasic(xi.msg.basic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
    elseif state == xi.qr_dynamis.eye.GREEN then
        player:messageBasic(xi.msg.basic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    elseif state == xi.qr_dynamis.eye.RED then
        player:messageBasic(xi.msg.basic.TP_INCREASE,(3000 - player:getTP()))
        player:setTP(3000)
    end
end

xi.qr_dynamis.entryNpcOnTrigger = function(player, npc)
    local zoneId = player:getZoneID()
    local info = xi.qr_dynamis.entryInfo[zoneId]
    local ID = zones[zoneId]

    -- shrouded sand cutscene
    if info.csVial and player:getRank(player:getNation()) > 5 and not player:hasKeyItem(xi.keyItem.VIAL_OF_SHROUDED_SAND) then
        player:startEvent(info.csVial)
        -- dynamis entry
    elseif player:getRank(player:getNation()) > 5 and player:hasKeyItem(xi.keyItem.VIAL_OF_SHROUDED_SAND) then
        if player:getMainLvl() < 65 then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL, 65)
        else
            player:messageSpecial(ID.text.DYNA_NPC_DEFAULT_MESSAGE)
            player:setPos(unpack(info.enterPos))
        end
    end
end

xi.qr_dynamis.denyEntrance = function(player, npc)
    player:PrintToPlayer("This is not ready for use... yet!")
    return
end

xi.qr_dynamis.entryNpcOnEventFinish = function(player, csid, option)
    local info = xi.qr_dynamis.entryInfo[player:getZoneID()]

    -- shrouded sand cutscene
    if info.csVial and csid == info.csVial then
        npcUtil.giveKeyItem(player, xi.ki.VIAL_OF_SHROUDED_SAND)
    end
end
