-----------------------------------
-- Area: Windurst Waters
--  NPC: Honoi-Gumoi
-- Involved In Quest: Crying Over Onions, Hat in Hand
-- !pos -195 -11 -120 238
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:hasKeyItem(xi.ki.NEW_MODEL_HAT) and
        not utils.mask.getBit(player:getCharVar("QuestHatInHand_var"), 1)
    then
        player:messageSpecial(ID.text.YOU_SHOW_OFF_THE, 0, xi.ki.NEW_MODEL_HAT)
        player:startEvent(59)

    else
        player:startEvent(650)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- "Hat in Hand"
    if csid == 59 then
        player:setCharVar("QuestHatInHand_var", utils.mask.setBit(player:getCharVar("QuestHatInHand_var"), 1, true))
        player:incrementCharVar("QuestHatInHand_count", 1)
    end
end

return entity
