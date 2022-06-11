-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Cavernous Maw
-- !pos 368.980, -0.443, -119.874 103
-- Teleports Players to Abyssea Misareaux
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs")
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/abyssea")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (xi.settings.ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30) then
        local hasStone = xi.abyssea.getHeldTraverserStones(player)

        if (hasStone >= 1 and player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DAWN_OF_DEATH) == QUEST_ACCEPTED
        and player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.A_DELECTABLE_DEMON) == QUEST_AVAILABLE) then
            player:startEvent(56)
        else
            player:startEvent(55, 0, 1) -- No param = no entry.
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 56) then
        player:addQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.A_DELECTABLE_DEMON)
    elseif (csid == 57) then
        -- Killed Cirein-croin
    elseif (csid == 55 and option == 1) then
        player:setPos(670, -15, 318, 119, 216)
    end
end

return entity
