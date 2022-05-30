-----------------------------------
-- Area: Grauberg [S]
--  NPC: Indescript Markings
-- Type: Quest
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local gownQuestProgress = player:getCharVar("AF_SCH_BODY")

    player:delStatusEffect(xi.effect.SNEAK)

    -- SCH AF Quest - Boots
    if (gownQuestProgress > 0 and gownQuestProgress < 3 and not player:hasKeyItem(xi.ki.SAMPLE_OF_GRAUBERG_CHERT)) then
        npcUtil.giveKeyItem(player, xi.ki.SAMPLE_OF_GRAUBERG_CHERT)
        player:setCharVar("AF_SCH_BODY", gownQuestProgress + 1)

        -- Move the markings around
        local positions =
        {
            [1] = {-517, -167, 209},
            [2] = {-492, -168, 190},
            [3] = {-464, -166, 241},
            [4] = {-442, -156, 182},
            [5] = {-433, -151, 162},
            [6] = {-416, -143, 146},
            [7] = {-535, -167, 227},
            [8] = {-513, -170, 255}
        }

        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions)

        npc:setPos(newPosition.x, newPosition.y, newPosition.z)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
