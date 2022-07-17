-----------------------------------
-- Area: East Ronfaure
--  NPC: Andelain
-- Type: Standard NPC
-- !pos 664.231 -12.849 -539.413 101
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local sermonQuest = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THE_VICASQUE_S_SERMON)

    if (sermonQuest == QUEST_ACCEPTED) then
        local count = trade:getItemCount()
        local bluePeas = trade:getItemQty(618)
        if (bluePeas == 1 and count == 1 and player:getCharVar("sermonQuestVar") == 0) then
            player:tradeComplete()
            player:showText(npc, 7349)
            player:startEvent(19)
            player:setCharVar("sermonQuestVar", 1)
        elseif (bluePeas > 1 and count == bluePeas) then
            player:showText(npc, 7352)
            player:startEvent(19)
        elseif (bluePeas == 1 and count == 1) then
            player:showText(npc, 7352, 618)
            player:startEvent(19)
        else
            player:showText(npc, 7350)
            player:showText(npc, 7351)
            player:startEvent(19)
        end
    else
        player:showText(npc, 7350)
        player:showText(npc, 7351)
        player:startEvent(19)
    end
end

entity.onTrigger = function(player, npc)
    player:showText(npc, 7347)
    player:showText(npc, 7348, 618)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
