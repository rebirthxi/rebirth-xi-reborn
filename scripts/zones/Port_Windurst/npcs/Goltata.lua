-----------------------------------
-- Area: Port Windurst
--  NPC: Goltata
--  Involved in Quests: Wonder Wands
-- Working 100%
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wonderWands = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.WONDER_WANDS)

    if wonderWands == QUEST_ACCEPTED then
        player:startEvent(257, 0, 0, 17091)
    elseif wonderWands == QUEST_COMPLETED then
        player:startEvent(269)
    else
        player:startEvent(232)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
