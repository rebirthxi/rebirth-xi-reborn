-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Runic Portal
-- Mamool Ja Teleporter Back to Aht Urhgan Whitegate
-- !pos -211 -11 -818 52
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
require("scripts/globals/besieged")
require('scripts/globals/keyitems')
require("scripts/globals/missions")
require("scripts/globals/teleports")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.TOAU) >= xi.mission.id.toau.IMMORTAL_SENTRIES and not player:hasKeyItem(xi.ki.SUPPLIES_PACKAGE) then
        if xi.besieged.hasRunicPortal(player, xi.teleport.runic_portal.MAMOOL) then
            player:startEvent(109)
        else
            player:startEvent(111)
        end
    else
        player:messageSpecial(ID.text.RESPONSE)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if option == 1 then
        if csid == 111 then
            xi.besieged.addRunicPortal(player, xi.teleport.runic_portal.MAMOOL)
        end
        xi.teleport.toChamberOfPassage(player)
    end
end

return entity
