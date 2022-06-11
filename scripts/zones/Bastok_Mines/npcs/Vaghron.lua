-----------------------------------
-- Area: Bastok Mines
--  NPC: Vaghron
-- Type: Adventurer's Assistant
-- !pos -39.162 -1 -92.147 234
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wildcatBastok = player:getCharVar("WildcatBastok")

    if
        player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatBastok, 19)
    then
        player:startEvent(503)
    else
        player:startEvent(118)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 503 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 19, true))
    end
end

return entity
