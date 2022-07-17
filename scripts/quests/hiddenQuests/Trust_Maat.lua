-----------------------------------
-- Trust: Maat
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/magic')
require('scripts/globals/trust')
require('scripts/globals/quests')
require('scripts/globals/npc_util')
require('scripts/globals/interaction/hidden_quest')
-----------------------------------
local ruludeID = require('scripts/zones/RuLude_Gardens/IDs')
-----------------------------------

local quest = HiddenQuest:new("TrustMaat")

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return xi.trust.hasPermit(player) and
                not player:hasSpell(xi.magic.spell.MAAT)
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if utils.mask.countBits(player:getCharVar("maatsCap"), 16) >= 6 then
                        return quest:event(10241)
                    else
                        return quest:event(10242)
                    end
                end,
            },

            onEventFinish =
            {
                [10241] = function(player, csid, option, npc)
                    if option == 2 and quest:complete(player) then
                        player:addSpell(xi.magic.spell.MAAT, true, true)
                        player:messageSpecial(ruludeID.text.YOU_LEARNED_TRUST, 0, xi.magic.spell.MAAT)
                    end
                end,
            },
        },
    },
}

return quest
