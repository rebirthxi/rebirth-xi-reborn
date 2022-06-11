-----------------------------------
-- Area: Bastok Mines
--  NPC: Echo Hawk
-- Involved in Quest: The Siren's Tear
-- !pos -0.965 5.999 -15.567 234
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
        not utils.mask.getBit(wildcatBastok, 17)
    then
        player:startEvent(505)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 505 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 17, true))
    end
end

return entity
