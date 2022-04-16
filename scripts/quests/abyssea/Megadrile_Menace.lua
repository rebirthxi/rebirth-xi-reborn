-----------------------------------
-- Megadrile Menace
-----------------------------------
-- !addquest 8 165
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/abyssea')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
-----------------------------------
local tahrongiID = require('scripts/zones/Tahrongi_Canyon/IDs')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.MEGADRILE_MENACE)

quest.reward = { }

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                xi.abyssea.getHeldTraverserStones(player) >= 1 and
                player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DAWN_OF_DEATH) >= QUEST_ACCEPTED
        end,

        [xi.zone.LA_THEINE_PLATEAU] =
        {
            ['Cavernous_Maw'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(38)
                end,
            },

            onEventFinish =
            {
                [38] = function(player, csid, option, npc)
                    quest:begin(player)
                    player:addCurrency('cruor', 50)
                    player:messageSpecial(tahrongiID.text.CRUOR_OBTAINED, 50, player:getCurrency('cruor'))
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and player:hasTitle(xi.title.GLAVOID_STAMPEDER)
        end,

        [xi.zone.LA_THEINE_PLATEAU] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    return 39
                end,
            },

            onEventUpdate =
            {
                [39] = function(player, csid, option)
                    if option == 1 then
                        player:updateEvent(xi.abyssea.getZoneKIReward(player))
                    end
                end,
            },

            onEventFinish =
            {
                [39] = function(player, csid, option, npc)
                    -- NOTE: Give the key item prior to completing the quest so that we reward the correct
                    -- KI!  If we complete first, it'll adjust the total completed count, and be off by one!
                    npcUtil.giveKeyItem(player, xi.abyssea.getZoneKIReward(player))
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
