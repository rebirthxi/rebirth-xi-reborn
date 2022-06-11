-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nogelle
-- Starts Lufet's Lake Salt
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LUFET_S_LAKE_SALT) == QUEST_ACCEPTED then
        local count = trade:getItemCount()
        local lufetSalt = trade:hasItemQty(1019, 3)

        if lufetSalt == true and count == 3 then
            player:tradeComplete()
            player:addFame(xi.quest.fame_area.SANDORIA, 30)
            player:addGil(xi.settings.GIL_RATE*600)
            player:addTitle(xi.title.BEAN_CUISINE_SALTER)
            player:completeQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LUFET_S_LAKE_SALT)
            player:startEvent(11)
        end
    end
end

entity.onTrigger = function(player, npc)
    local lufetsLakeSalt = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LUFET_S_LAKE_SALT)

    if lufetsLakeSalt == 0 then
        player:startEvent(12)
    elseif lufetsLakeSalt == 1 then
        player:startEvent(10)
    elseif lufetsLakeSalt == 2 then
        player:startEvent(522)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 12 and option == 1 then
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LUFET_S_LAKE_SALT)
    elseif csid == 11 then
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.GIL_RATE*600)
    end
end

return entity
