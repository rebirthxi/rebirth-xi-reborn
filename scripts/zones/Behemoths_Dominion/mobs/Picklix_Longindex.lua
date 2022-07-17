-----------------------------------
-- Area: Behemoth's Dominion
--   NM: Picklix Longindex
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:incrementCharVar("theTalekeepersGiftKilledNM", 1)
    end
end

return entity
