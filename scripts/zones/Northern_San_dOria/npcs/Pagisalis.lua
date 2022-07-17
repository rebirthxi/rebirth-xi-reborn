-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pagisalis
-- Involved In Quest: Enveloped in Darkness
-- !zone 231
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/shop")
require("scripts/globals/quests")
local ID = require("scripts/zones/Northern_San_dOria/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.UNDYING_FLAMES) == QUEST_ACCEPTED then
        if trade:hasItemQty(913, 2) and trade:getItemCount() == 2 then -- Trade Lump of Beeswax
            player:startEvent(563)
        end
    end

    if player:hasKeyItem(xi.ki.OLD_POCKET_WATCH) and player:hasKeyItem(xi.ki.OLD_BOOTS) == false then
        if trade:hasItemQty(828, 1) and trade:getItemCount() == 1 then -- Trade Velvet Cloth
            player:startEvent(37)
        end
    end

end

entity.onTrigger = function(player, npc)

    local sanFame = player:getFameLevel(xi.quest.fame_area.SANDORIA)
    local undyingFlames = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.UNDYING_FLAMES)
    if player:hasKeyItem(xi.ki.OLD_POCKET_WATCH) then
        player:startEvent(48)
    elseif player:hasKeyItem(xi.ki.OLD_BOOTS) then
        player:startEvent(58)
    elseif sanFame >= 2 and undyingFlames == QUEST_AVAILABLE then
        player:startEvent(562)
    elseif undyingFlames == QUEST_ACCEPTED then
        player:startEvent(565)
    elseif undyingFlames == QUEST_COMPLETED then
        player:startEvent(566)
    else
        player:startEvent(564)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid == 562 and option == 0 then
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.UNDYING_FLAMES)
    elseif csid == 563 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 13211) -- Friars Rope
        else
            player:tradeComplete()
            player:addTitle(xi.title.FAITH_LIKE_A_CANDLE)
            player:addItem(13211)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13211) -- Friars Rope
            player:addFame(xi.quest.fame_area.SANDORIA, 30)
            player:completeQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.UNDYING_FLAMES)
        end
    elseif csid == 37 then
        player:tradeComplete()
        player:delKeyItem(xi.ki.OLD_POCKET_WATCH)
        player:addKeyItem(xi.ki.OLD_BOOTS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.OLD_BOOTS)
    end

end

return entity
