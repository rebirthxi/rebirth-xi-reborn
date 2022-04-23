-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Gate of the Gods
-- !pos -20 0.1 -283 34
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 3 then
        player:startEvent(1)
    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.APOCALYPSE_NIGH) == QUEST_ACCEPTED and
        player:getCharVar('ApocalypseNigh') == 2 then
        player:startEvent(4)
    else
        player:startEvent(52)
    end
    return 1
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 52 and option == 1) then
        player:setPos(-419.995, 0, 248.483, 191, 35); -- To The Garden of RuHmet
    elseif csid == 4 then
        player:setCharVar('ApocalypseNigh', 3)
        player:setPos(-419.995, 0, 248.483, 191, 35)
    elseif csid == 1 then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 14672)
        else
            if (player:addItem(14672)) then
                player:setCharVar("PromathiaStatus", 0)
                player:completeMission(xi.mission.log_id.COP, xi.mission.id.cop.GARDEN_OF_ANTIQUITY)
                player:addMission(xi.mission.log_id.COP, xi.mission.id.cop.A_FATE_DECIDED)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 14672)
            end
        end
    end
end

return entity
