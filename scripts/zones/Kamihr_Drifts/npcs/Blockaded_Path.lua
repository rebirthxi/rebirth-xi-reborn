-----------------------------------
-- Area: Kamihr Drifts
--  NPC: Blockaded Path
-- !pos -222.779 40.597 -410.526 267
-----------------------------------
require('scripts/globals/missions')
-----------------------------------
local kamihrID = require('scripts/zones/Kamihr_Drifts/IDs')
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    -- TODO: Move messageSpecial to default action, and Leafallia access to mission scripts
    if player:getCurrentMission(xi.mission.log_id.SOA >= xi.mission.id.soa.A_SHROUDED_CANOPY) then
        player:startEvent(57, 267, utils.MAX_UINT32 - 703, 579, 89, 207, 1998, 0)
    else
        player:messageSpecial(kamihrID.text.SNOW_DUSTED_CRAG_BLOCKS)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 57 and option == 1 then
        player:setPos(16.725, 0.493, -19.652, 131, xi.zone.LEAFALLIA)
    end
end

return entity
