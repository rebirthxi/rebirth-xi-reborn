-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Authere
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos 33 1 -31 230
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wildcatSandy = player:getCharVar("WildcatSandy")

    if (player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(wildcatSandy, 1)) then
        player:startEvent(809)
    elseif (player:getCharVar("BrothersCS") == 1) then
        player:startEvent(597)  -- brothers cs
    else
        player:startEvent(605)  -- when i grow up im gonna fight like trion
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 809) then
        player:setCharVar("WildcatSandy", utils.mask.setBit(player:getCharVar("WildcatSandy"), 1, true))
    elseif (csid == 597) then
        player:setCharVar("BrothersCS", 0)
    end
end

------- for later use
-- player:startEvent(598)  -- did nothing no cs or speech

return entity
