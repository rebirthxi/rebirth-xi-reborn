-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: qm3 "???"
-- Involved in Quests: Steamed Rams
-- !pos 312.821 -30.495 -67.15
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/campaign")
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getQuestStatus(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.STEAMED_RAMS) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(xi.ki.CHARRED_PROPELLER)) then
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        else
            player:startEvent(1)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 1) then
        player:addKeyItem(xi.ki.CHARRED_PROPELLER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.CHARRED_PROPELLER)
    end
end

return entity
