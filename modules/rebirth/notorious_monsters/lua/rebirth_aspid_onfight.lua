-----------------------------------
-- Module makes Aspid have retail-like behaviour
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
local m = Module:new("rebirth_aspid_onMobFight")

local aspid_states = {
    FIRST_SPAWNED = 6,
    IN_SHELL = 1,
    OUT_SHELL = 2,
}

local enterShell = function(mob, HPP)
    mob:setAnimationSub(aspid_states.IN_SHELL)
    mob:setLocalVar("inHPP", HPP)
    mob:SetAutoAttackEnabled(false)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:addMod(xi.mod.DEF, 150)
    mob:addMod(xi.mod.REGEN, 200)
end

local exitShell = function(mob, HPP)
    mob:setAnimationSub(aspid_states.OUT_SHELL)
    mob:setLocalVar("outHPP", HPP)
    mob:SetAutoAttackEnabled(true)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    mob:delMod(xi.mod.DEF, 150)
    mob:delMod(xi.mod.REGEN, 200)
end

local shouldEnterShell = function(mob, HPP)
    local outHPP = mob:getLocalVar("outHPP")
    local HPP_diff = outHPP - HPP

    return HPP_diff > 2
end

local shouldExitShell = function(mob, HPP)
    local inHPP = mob:getLocalVar("inHPP")
    local HPP_diff = inHPP - HPP

    return HPP == 100 or HPP_diff > 20
end

m:addOverride("xi.zones.Valley_of_Sorrows.mobs.Aspidochelone.onMobFight", function(mob, target)
    local HPP = mob:getHPP()
    local state = mob:getAnimationSub()

    if state == aspid_states.FIRST_SPAWNED and HPP < 98 then
        enterShell(mob, HPP)
    elseif state == aspid_states.OUT_SHELL and shouldEnterShell(mob, HPP) then
        enterShell(mob, HPP)
    elseif state == aspid_states.IN_SHELL and shouldExitShell(mob, HPP) then
        exitShell(mob, HPP)
    end
end)

return m
