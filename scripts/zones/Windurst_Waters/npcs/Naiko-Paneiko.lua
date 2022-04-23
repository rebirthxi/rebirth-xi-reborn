-----------------------------------
-- Area: Windurst Waters
--  NPC: Naiko-Paneiko
-- Involved In Quest: Making Headlines, Riding on the Clouds
-- !pos -246 -5 -308 238
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local makingHeadlines = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.MAKING_HEADLINES)

    if makingHeadlines == QUEST_AVAILABLE then
        player:startEvent(665)
    elseif makingHeadlines == QUEST_ACCEPTED then
        -- bitmask of progress: 0 = Kyume-Romeh, 1 = Yuyuju, 2 = Hiwom-Gomoi, 3 = Umumu, 4 = Mahogany Door
        local prog = player:getCharVar("QuestMakingHeadlines_var")

        if not utils.mask.isFull(prog, 4) then
            if math.random(1, 2) == 1 then
                player:startEvent(666) -- Quest Reminder 1
            else
                player:startEvent(671) -- Quest Reminder 2
            end
        elseif not utils.mask.getBit(prog, 4) then
            player:startEvent(673) -- Advises to validate story
        else
            if math.random(1, 2) == 1 then
                player:startEvent(674) -- Quest finish 1
            else
                player:startEvent(670) -- Quest finish 2
            end
        end
    else
        player:startEvent(663) -- Standard conversation
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 665 then
        player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.MAKING_HEADLINES)
    elseif csid == 670 or csid == 674 then
        npcUtil.completeQuest(player, xi.quest.log_id.WINDURST, xi.quest.id.windurst.MAKING_HEADLINES, {
            title = xi.title.EDITORS_HATCHET_MAN,
            gil = 560,
            var = "QuestMakingHeadlines_var",
        })
        player:delKeyItem(xi.ki.WINDURST_WOODS_SCOOP)
        player:delKeyItem(xi.ki.WINDURST_WALLS_SCOOP)
        player:delKeyItem(xi.ki.WINDURST_WATERS_SCOOP)
        player:delKeyItem(xi.ki.PORT_WINDURST_SCOOP)
    end
end

return entity
