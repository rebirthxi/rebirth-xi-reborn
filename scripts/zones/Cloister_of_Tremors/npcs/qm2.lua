-----------------------------------
-- Area: Cloister of Tremors
--  NPC: qm2 (???)
-- Involved in Quest: Open Sesame
-- Notes: Used to obtain a Tremor Stone
-- !pos -545.184, 1.855, -495.693 209
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Cloister_of_Tremors/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local tremorStoneID = 2796

    -- Give Player a Tremorstone if they don't have one
    if (player:hasItem(tremorStoneID) == false) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, tremorStoneID)
        else
            player:addItem(tremorStoneID)
            player:messageSpecial(ID.text.ITEM_OBTAINED, tremorStoneID)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
