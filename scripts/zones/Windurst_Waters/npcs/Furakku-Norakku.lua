-----------------------------------
-- Area: Windurst Waters
--  NPC: Furakku-Norakku
-- Involved in Quests: Early Bird Catches the Bookworm, Chasing Tales, Class Reunion
-- !pos -19 -5 101 238
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local classReunion = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION)
    local classReunionProgress = player:getCharVar("ClassReunionProgress")
    local talk2 = player:getCharVar("ClassReunion_TalkedToFurakku")

    -- Class Reunion
    if classReunion == 1 and classReunionProgress >= 3 and talk2 ~= 1 then
        player:startEvent(816) -- he tells you about Uran-Mafran
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 816 then
        player:setCharVar("ClassReunion_TalkedToFurakku", 1)
    end
end

return entity
