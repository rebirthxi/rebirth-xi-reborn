-----------------------------------
-- Area: Western Adoulin
--  NPC: Oka Qhantari
-- Type: Standard NPC and Quest NPC
--  Involved With Quest: 'Order Up'
-- !pos -30 3 -6 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local orderUp = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.ORDER_UP)
    local orderOkaQhantari = utils.mask.getBit(player:getCharVar("Order_Up_NPCs"), 9)

    if orderUp == QUEST_ACCEPTED and not orderOkaQhantari then
        -- Progresses Quest: 'Order Up'
        player:startEvent(71)
    else
        -- Standard Dialogue
        player:startEvent(511)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 71 then
        -- Progresses Quest: 'Order Up'
        player:setCharVar("Order_Up_NPCs", utils.mask.setBit(player:getCharVar("Order_Up_NPCs"), 9, true))
    end
end

return entity
