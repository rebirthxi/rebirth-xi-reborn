-----------------------------------
-- Grant various boons upon leveling up
-- * AF Key Item
-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/globals/player")
-----------------------------------

local m = Module:new("rebirth_leveling_incentives")

m:addOverride("xi.player.onPlayerLevelUp", function(player)
    -- check AF
    for _, job in pairs(xi.job) do
        local lvl = player:getJobLevel(job)
        if player:getCharVar(string.format("LIAF%d", job)) == 0 and lvl >= 50 then
            player:setCharVar(string.format("LIAF%d", job), 1);
            player:PrintToPlayer("Congratulations, you have been awarded your AF, go to a storage NPC to retrieve it.", 0xE);
            if job >= xi.job.BLU then
                if job == xi.job.BLU then player:addKeyItem(xi.keyItem.MAGUS_ATTIRE_CLAIM_SLIP) end
                if job == xi.job.COR then player:addKeyItem(xi.keyItem.CORSAIRS_ATTIRE_CLAIM_SLIP) end
                if job == xi.job.PUP then player:addKeyItem(xi.keyItem.PUPPETRY_ATTIRE_CLAIM_SLIP) end
                if job == xi.job.DNC then
                    player:addKeyItem(1967);
                    player:addKeyItem(1968);
                end
                if job == xi.job.SCH then player:addKeyItem(xi.keyItem.SCHOLARS_ATTIRE_CLAIM_SLIP) end
            else
                player:addKeyItem(job + 653);
            end
        end
    end

    -- give basic gil reward
    player:addGil(1000)

    super(player)
end)

return m