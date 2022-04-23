-----------------------------------
-- Crest of Davoi
-----------------------------------
-- Log ID: 3, Quest ID: 0
-- Baudin : !pos -75 0 80 244
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.CREST_OF_DAVOI)

quest.reward =
{
    fame = 30,
    fameArea = xi.quest.fame_area.JEUNO,
    keyItem = xi.ki.CREST_OF_DAVOI,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:hasKeyItem(xi.ki.SILVER_BELL)
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Baudin'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(174)
                end,
            },

            onEventFinish =
            {
                [174] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Baudin'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.items.SLICE_OF_COEURL_MEAT) then
                        return quest:progressEvent(171)
                    end
                end,

                onTrigger = quest:progressEvent(175),
            },

            onEventFinish =
            {
                [171] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:setCharVar("saveMySisterVar", 1)
                    end
                end,
            },
        },
    }
}

return quest
