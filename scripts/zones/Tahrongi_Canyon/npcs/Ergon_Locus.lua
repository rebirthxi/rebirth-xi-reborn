-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Ergon Locus ???
-- Involved in quest Dances with Luopans
-- pos 90.846 40.448 339.803
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- DANCES WITH LUOPANS
    if player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_ACCEPTED and player:getNation() == xi.nation.WINDURST then
        if not player:hasKeyItem(xi.ki.FISTFUL_OF_HOMELAND_SOIL) and not player:hasKeyItem(xi.ki.LUOPAN) then
            npcUtil.giveKeyItem(player, xi.ki.FISTFUL_OF_HOMELAND_SOIL)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
