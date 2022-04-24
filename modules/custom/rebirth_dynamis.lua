-----------------------------------
-- Module implements QR Dynamis
-- * Module requires the appropriate SQL changes be made
-----------------------------------
require("modules/module_utils")
require("scripts/globals/qr_dynamis/helpers")
require("scripts/globals/qr_dynamis/data")
-----------------------------------
local m = Module:new("rebirth_dynamis")
m:setEnabled(true)

local noop_fun = function() return;  end

local function patch_noop(override_path)
    local override_string = override_path

    m:addOverride(override_path, noop_fun)
end

---
--- STAGE ONE
---
--- Make stones pick their eye color
---

for _, stone in ipairs(xi.qr_dynamis.stones) do
    m:addOverride(stone.luaPath .. ".onMobSpawn", function(mob)
        xi.qr_dynamis.pickEyes(mob)
    end)
end

---
--- STAGE TWO
---
--- Remove the zoning stuff
---

for _, zone in ipairs(xi.qr_dynamis.zones) do
    patch_noop(zone .. ".onInitialize")
    patch_noop(zone .. ".onZoneIn")
end

---
--- STAGE TWO
---
--- Stones need to spawn mobs when aggro'd
---

-- Function captures the mobList as an upvalue and then returns the lambda with it wrapped
-- This just prevents a bit of copy and paste glory.
local function spawnGroup(mobList)
    return function(mob, target)
        xi.qr_dynamis.spawnGroup(mob, mobList, target)
    end
end

local function deathSpawn(mobList)
    return function(mob, player, isKiller)
        xi.qr_dynamis.deathSpawnGroup(mob, mobList, player, isKiller)
    end
end

for _, stone in ipairs(xi.qr_dynamis.stones) do
    if stone.spawnList ~= nil then
        m:addOverride(stone.luaPath .. ".onMobEngaged", spawnGroup(stone.spawnList))
        m:addOverride(stone.luaPath .. ".onMobDeath", deathSpawn(stone.spawnList))
    end
end

m:addOverride("xi.zones.Dynamis-Xarcabard.mobs.Vanguard_Eye.onMobEngaged", spawnGroup(xi.qr_dynamis.xarcabardList))
m:addOverride("xi.zones.Dynamis-Xarcabard.mobs.Vanguard_Eye.onMobDeath", deathSpawn(xi.qr_dynamis.xarcabardList))

---
--- STAGE FOUR
---
--- Handle the Trail Markings (entry points)!
---

for _, entry in ipairs(xi.qr_dynamis.entryNpcs) do
    local luaPath = entry.luaPath .. ".onTrigger"
    if entry.enabled then
        m:addOverride(luaPath, function(player, npc)
            xi.qr_dynamis.entryNpcOnTrigger(player, npc)
        end)
    else
        m:addOverride(luaPath, function(player, npc)
            xi.qr_dynamis.denyEntrance(player, npc)
        end)
    end
end

for _, entry in ipairs(xi.qr_dynamis.entryNpcs) do
    local luaPath = entry.luaPath .. ".onEventFinish"

    if entry.enabled then
        m:addOverride(luaPath, function(player, npc, option)
            xi.qr_dynamis.entryNpcOnEventFinish(player, npc, option)
        end)
    else
        patch_noop(luaPath)
    end
end

return m
