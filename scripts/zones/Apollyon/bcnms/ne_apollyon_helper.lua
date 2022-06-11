-----------------------------------
-- Global file for Apollyon NE
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/limbus")
require("scripts/globals/utils")
-----------------------------------
xi = xi or {}
xi.apollyon_ne = xi.apollyon_ne or {}

-----------------------------------
-- Floor 1
-----------------------------------
-- Mobs in floor: Goobbue Harvester x1, Barometz x6, Borametz x6

-- Variable Pattern:
-- 1: Goobue; 2: Barometz; 3: Borometz

xi.apollyon_ne.handleMobDeathFloorOne = function(mob, player, isKiller, noKiller)
    local mobId = mob:getID()

    if
        mobId == ID.mob.APOLLYON_NE_MOB[1] or
        mobId == ID.mob.APOLLYON_NE_MOB[1] + 11 or
        mobId == ID.mob.APOLLYON_NE_MOB[1] + 12
    then
        if isKiller or noKiller then
            local battlefield   = mob:getBattlefield()
            local floorOneKey   = battlefield:getLocalVar("randomF1key")
            local floorOneChest = battlefield:getLocalVar("randomF1chest")

            -- Handle Teleporter
            if
                (floorOneKey == 1 and mobId == ID.mob.APOLLYON_NE_MOB[1]) or      -- Goobbue is Key
                (floorOneKey == 2 and mobId == ID.mob.APOLLYON_NE_MOB[1] + 11) or -- Barometz is Key
                (floorOneKey == 3 and mobId == ID.mob.APOLLYON_NE_MOB[1] + 12)    -- Borametz is Key
            then
                xi.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[1])

                -- Prepare Floor 2
                local floorTwoKey, floorTwoChest = unpack(utils.uniqueRandomTable(0, 3, 2))

                battlefield:setLocalVar("randomF2key", ID.mob.APOLLYON_NE_MOB[2] + floorTwoKey)
                battlefield:setLocalVar("randomF2chest", ID.mob.APOLLYON_NE_MOB[2] + floorTwoChest)

            -- Handle Treasure Crate
            elseif
                (floorOneChest == 1 and mobId == ID.mob.APOLLYON_NE_MOB[1]) or      -- Goobbue has Crate
                (floorOneChest == 2 and mobId == ID.mob.APOLLYON_NE_MOB[1] + 11) or -- Barometz has Crate
                (floorOneChest == 3 and mobId == ID.mob.APOLLYON_NE_MOB[1] + 12)    -- Borametz has Crate
            then
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                GetNPCByID(ID.npc.APOLLYON_NE_CRATE[1][1]):setPos(mobX, mobY, mobZ)
                GetNPCByID(ID.npc.APOLLYON_NE_CRATE[1][1]):setStatus(xi.status.NORMAL)
            end
        end
    end
end

-----------------------------------
-- Floor 2
-----------------------------------
-- Mobs in floor: Thiazi x2, Bialozar x2, Cornu x4, Sirin x4

xi.apollyon_ne.handleMobDeathFloorTwo = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobId         = mob:getID()
        local battlefield   = mob:getBattlefield()
        local players       = battlefield:getPlayers()
        local floorTwoKey   = battlefield:getLocalVar("randomF2key")
        local floorTwoChest = battlefield:getLocalVar("randomF2chest")

        -- Handle Teleporter
        if mobId == floorTwoKey then
            xi.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[2])

            -- Prepare Floor 3
            if #players <= 6 then
                battlefield:setLocalVar("randomF3key", ID.mob.APOLLYON_NE_MOB[3])
                battlefield:setLocalVar("randomF3chest", ID.mob.APOLLYON_NE_MOB[3] + math.random(1, 4))
            elseif #players > 6 and #players <= 12 then
                for i = 5, 9 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3] + i):spawn()
                end

                battlefield:setLocalVar("randomF3key", ID.mob.APOLLYON_NE_MOB[3] + (math.random(0, 1) * 5))
                battlefield:setLocalVar("randomF3chest", ID.mob.APOLLYON_NE_MOB[3] + math.random(1, 4) + (math.random(0 ,1) * 5))
            elseif #players > 12 then
                for i = 5, 14 do
                    GetMobByID(ID.mob.APOLLYON_NE_MOB[3] + i):spawn()
                end

                battlefield:setLocalVar("randomF3key", ID.mob.APOLLYON_NE_MOB[3] + (math.random(0, 2) * 5))
                battlefield:setLocalVar("randomF3chest", ID.mob.APOLLYON_NE_MOB[3] + math.random(1, 4) + (math.random(0, 2) * 5))
            end

        -- Handle treasure Crate
        elseif mobId == floorTwoChest then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[2][1]):setStatus(xi.status.NORMAL)
        end
    end
end

-----------------------------------
-- Floor 3
-----------------------------------
-- Mobs in floor: Apollyon Sweeper x(1, 2 or 3), Aollyon Cleaner x(4, 8 or 12)

xi.apollyon_ne.handleMobDeathFloorThree = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobId           = mob:getID()
        local battlefield     = mob:getBattlefield()
        local floorThreeKey   = battlefield:getLocalVar("randomF3key")
        local floorThreeChest = battlefield:getLocalVar("randomF3chest")

        -- Handle Teleporter
        if floorThreeKey == mobId then
            xi.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[3])

            -- Prepare Floor 4
            battlefield:setLocalVar("randomF4key", ID.mob.APOLLYON_NE_MOB[4] + math.random(0, 2))

        -- Handle treasure Crate
        elseif floorThreeChest == mobId then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[3][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[3][1]):setStatus(xi.status.NORMAL)
        end
    end
end

-----------------------------------
-- Floor 4
-----------------------------------
-- Mobs in floor: Hyperion x1, Okeanos x1, Cronos x1, Kerkopes x8

xi.apollyon_ne.handleMobDeathFloorFour = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobId        = mob:getID()
        local battlefield  = mob:getBattlefield()
        local floorFourKey = battlefield:getLocalVar("randomF4key")

        -- Handle Teleporter
        if floorFourKey == mobId then
            xi.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[4])

        -- Handle treasure Crate
        elseif mobId == ID.mob.APOLLYON_NE_MOB[4] + 3 then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[4][1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[4][1]):setStatus(xi.status.NORMAL)
        end
    end
end

-----------------------------------
-- Floor 5
-----------------------------------
-- Mobs in floor: Criosphinx x1, Hieracosphinx x1, Troglodyte Dhalmel x8

xi.apollyon_ne.handleMobDeathFloorFive = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local allDead = true

        for i = 2, 9 do
            if GetMobByID(ID.mob.APOLLYON_NE_MOB[5] + i):isAlive() then
                allDead = false

                break
            end
        end

        if allDead then
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[5]):setStatus(xi.status.NORMAL)
        end
    end
end
