-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: qm4 "???"
-- Involved in Quests: Steamed Rams
-- !pos 541.425 -49.83 178.563
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getQuestStatus(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.STEAMED_RAMS) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(xi.ki.PIECE_OF_SHATTERED_LUMBER)) then
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        else
            player:startEvent(2)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2) then
        player:addKeyItem(xi.ki.PIECE_OF_SHATTERED_LUMBER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PIECE_OF_SHATTERED_LUMBER)
    end
end

return entity
