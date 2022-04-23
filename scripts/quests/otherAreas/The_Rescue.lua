-----------------------------------
-- The Rescue
-----------------------------------
-- Log ID: 4, Quest ID: 23
-- Thunder Hawk : !pos -58 -10 6 248
-- Jail Door    : !pos 56 0.1 -23 147
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------
local beadeauxID = require("scripts/zones/Beadeaux/IDs")
-----------------------------------

local quest = Quest:new(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.THE_RESCUE)

quest.reward =
{
    exp      = 2000,
    gil      = 5000,
    fameArea = xi.quest.fame_area.SELBINA_RABAO,
    keyItem  = xi.ki.MAP_OF_THE_RANGUEMONT_PASS,
    title    = xi.title.HONORARY_CITIZEN_OF_SELBINA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            -- TODO: Fame requirement needs verification
            return status == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.SELBINA_RABAO) >= 1
        end,

        [xi.zone.SELBINA] =
        {
            ['Thunder_Hawk'] = quest:progressEvent(80),

            onEventFinish =
            {
                [80] = function(player, csid, option, npc)
                    if option == 70 then
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

        [xi.zone.SELBINA] =
        {
            ['Thunder_Hawk'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.TRADERS_SACK) then
                        return mission:progressEvent(81)
                    else
                        return mission:event(83)
                    end
                end,
            },

            onEventFinish =
            {
                [81] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.TRADERS_SACK)
                    end
                end,
            },
        },

        [xi.zone.BEADEAUX] =
        {
            ['_43b'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        not player:hasKeyItem(xi.ki.TRADERS_SACK) and
                        npcUtil.tradeHasExactly(trade, xi.items.QUADAV_CHARM)
                    then
                        return quest:progressEvent(1000)
                    end
                end,

                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.TRADERS_SACK) then
                        return quest:messageSpecial(beadeauxID.text.LOCKED_DOOR_QUADAV_HAS_KEY)
                    end
                end,
            },

            onEventFinish =
            {
                [1000] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.TRADERS_SACK)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.SELBINA] =
        {
            ['Thunder_Hawk'] = quest:event(82):replaceDefault(),
        },
    },
}

return quest
