-----------------------------------
-- Grauberg - Dominion Op #03
-----------------------------------
-- !addquest 8 117
-- Dominion Sergeant (Wolfgang's Camp)
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/abyssea/dominion')
require('scripts/globals/quests')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_03_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_GRAUBERG] =
        {
            ['Stygian_Djinn'] =
            {
                onMobDeath = function(mob, player, isKiller, noKiller)
                    xi.abyssea.dominionOnMobDeath(mob, player, 590)
                end,
            },
        },
    },
}

return quest
