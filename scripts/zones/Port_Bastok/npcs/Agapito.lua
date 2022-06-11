-----------------------------------
-- Area: Port Bastok
--  NPC: Agapito
-- Start & Finishes Quest: The Stars of Ifrit
-- !pos -72.093 -3.097 9.309 236
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local theStarsOfIfrit = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_STARS_OF_IFRIT)

    if (player:getFameLevel(xi.quest.fame_area.BASTOK) >= 3 and theStarsOfIfrit == QUEST_AVAILABLE and player:hasKeyItem(xi.ki.AIRSHIP_PASS) == true) then
        player:startEvent(180)
    elseif (theStarsOfIfrit == QUEST_ACCEPTED and player:hasKeyItem(xi.ki.CARRIER_PIGEON_LETTER) == true) then
        player:startEvent(181)
    else
        player:startEvent(17)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 180) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_STARS_OF_IFRIT)
    elseif (csid == 181) then
        player:addGil(xi.settings.GIL_RATE * 2100)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.GIL_RATE * 2100)
        player:addFame(xi.quest.fame_area.BASTOK, 100)
        player:addTitle(xi.title.STAR_OF_IFRIT)
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_STARS_OF_IFRIT)
    end
end

return entity
