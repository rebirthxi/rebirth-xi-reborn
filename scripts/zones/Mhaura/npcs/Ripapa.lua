-----------------------------------
-- Area: Mhaura
--  NPC: Ripapa
-- Starts and Finishes Quest: Trial by Lightning
-- !pos 29 -15 55 249
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/shop")
require("scripts/globals/quests")
local ID = require("scripts/zones/Mhaura/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local trialByLightning = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
    local whisperOfStorms = player:hasKeyItem(xi.ki.WHISPER_OF_STORMS)
    local carbuncleDebacle = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CARBUNCLE_DEBACLE)
    local carbuncleDebacleProgress = player:getCharVar("CarbuncleDebacleProgress")

    -----------------------------------
    -- Carbunlce Debacle
    if (carbuncleDebacle == QUEST_ACCEPTED and carbuncleDebacleProgress == 2) then
        player:startEvent(10022) -- get the lighning pendulum lets go to Cloister of Storms
    elseif (carbuncleDebacle == QUEST_ACCEPTED and carbuncleDebacleProgress == 3 and player:hasItem(1172) == false) then
        player:startEvent(10023, 0, 1172, 0, 0, 0, 0, 0, 0) -- "lost the pendulum?"
    -----------------------------------
    -- Trial by Lightning
    elseif ((trialByLightning == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.WINDURST) >= 6) or (trialByLightning == QUEST_COMPLETED and os.time() > player:getCharVar("TrialByLightning_date"))) then
        player:startEvent(10016, 0, xi.ki.TUNING_FORK_OF_LIGHTNING) -- Start and restart quest "Trial by Lightning"
    elseif (trialByLightning == QUEST_ACCEPTED and player:hasKeyItem(xi.ki.TUNING_FORK_OF_LIGHTNING) == false and whisperOfStorms == false) then
        player:startEvent(10024, 0, xi.ki.TUNING_FORK_OF_LIGHTNING) -- Defeat against Ramuh : Need new Fork
    elseif (trialByLightning == QUEST_ACCEPTED and whisperOfStorms == false) then
        player:startEvent(10017, 0, xi.ki.TUNING_FORK_OF_LIGHTNING, 5)
    elseif (trialByLightning == QUEST_ACCEPTED and whisperOfStorms) then
        local numitem = 0

        if (player:hasItem(17531)) then numitem = numitem + 1; end  -- Ramuh's Staff
        if (player:hasItem(13245)) then numitem = numitem + 2; end  -- Lightning Belt
        if (player:hasItem(13564)) then numitem = numitem + 4; end  -- Lightning Ring
        if (player:hasItem(1206)) then numitem = numitem + 8; end   -- Elder Branch
        if (player:hasSpell(303)) then numitem = numitem + 32; end  -- Ability to summon Ramuh

        player:startEvent(10019, 0, xi.ki.TUNING_FORK_OF_LIGHTNING, 5, 0, numitem)
    else
        player:startEvent(10020) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 10016 and option == 1) then
        if (player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING) == QUEST_COMPLETED) then
            player:delQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
        end
        player:addQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
        player:setCharVar("TrialByLightning_date", 0)
        player:addKeyItem(xi.ki.TUNING_FORK_OF_LIGHTNING)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TUNING_FORK_OF_LIGHTNING)
    elseif (csid == 10024) then
        player:addKeyItem(xi.ki.TUNING_FORK_OF_LIGHTNING)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TUNING_FORK_OF_LIGHTNING)
    elseif (csid == 10019) then
        local item = 0
        if (option == 1) then item = 17531         -- Ramuh's Staff
        elseif (option == 2) then item = 13245  -- Lightning Belt
        elseif (option == 3) then item = 13564  -- Lightning Ring
        elseif (option == 4) then item = 1206     -- Elder Branch
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
        else
            if (option == 5) then
                player:addGil(xi.settings.main.GIL_RATE * 10000)
                player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * 10000) -- Gil
            elseif (option == 6) then
                player:addSpell(303) -- Ramuh Spell
                player:messageSpecial(ID.text.RAMUH_UNLOCKED, 0, 0, 5)
            else
                player:addItem(item)
                player:messageSpecial(ID.text.ITEM_OBTAINED, item) -- Item
            end
            player:addTitle(xi.title.HEIR_OF_THE_GREAT_LIGHTNING)
            player:delKeyItem(xi.ki.WHISPER_OF_STORMS) --Whisper of Storms, as a trade for the above rewards
            player:setCharVar("TrialByLightning_date", getMidnight())
            player:addFame(xi.quest.fame_area.WINDURST, 30)
            player:completeQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
        end
    elseif (csid == 10022 or csid == 10023) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1172)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1172)
            player:setCharVar("CarbuncleDebacleProgress", 3)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1172)
        end
    end
end

return entity
