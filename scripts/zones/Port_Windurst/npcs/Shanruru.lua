-----------------------------------
-- Area: Port Windurst
--  NPC: Shanruru
-- Involved in Quest: Riding on the Clouds
-- !pos -1 -6 187 240
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local OnionRings = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.ONION_RINGS)

    if player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_PROMISE) == QUEST_COMPLETED then
        local Message = math.random(0, 1)

        if Message == 1 then
            player:startEvent(529)
        else
            player:startEvent(541)
        end
    elseif player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CRYING_OVER_ONIONS) == QUEST_ACCEPTED then
        player:startEvent(504)
    elseif OnionRings == QUEST_COMPLETED then
        player:startEvent(446)
    elseif OnionRings == QUEST_ACCEPTED then
        player:startEvent(439)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
