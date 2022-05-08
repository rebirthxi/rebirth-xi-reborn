-----------------------------------
-- Global Casket Script for QR
-----------------------------------
require("scripts/globals/caskets")
require("scripts/globals/glowing_caskets")
-----------------------------------

xi = xi or {}
xi.caskets = xi.caskets or {}

xi.caskets.generalSpawnCasket = function(player, mob, x, y, z, r)
    local spawnNormalCasket = xi.caskets.dropChance(player)
    local spawnGlowingCasket, glowingCasket = xi.glowingCaskets.shouldSpawnGlowingChest(player, mob)

    if spawnNormalCasket then
        local chestId    = xi.caskets.getCasketID(mob)
        local npc        = GetNPCByID(chestId)
        local chestOwner = player:getLeaderID()

        if chestId == 0 then
            return
        end

        xi.caskets.setCasketData(player, x, y, z, r, npc, chestOwner, mob:getMainLvl())
    end

    if spawnGlowingCasket then
        local position = {x=x, y=y, z=z, rot=r}
        if spawnNormalCasket then
            position = xi.qr_utils.lateralTranslateWithOriginRotation(position, {x=0, y=0, z=1, rot=0})
        end
        xi.glowingCaskets.spawnCasket(player, glowingCasket, position)
    end
end
