-----------------------------------
-- Area: Pso'Xja
--  NPC: Stone Gate
-----------------------------------
require("scripts/globals/missions")
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getCurrentMission(COP) == xi.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus")==3) then
        player:startEvent(106) -- Start Floor 1, 3
    elseif (player:getCurrentMission(COP) == xi.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus")==5) then
        player:startEvent(109) -- Start Floor 1, 3 or 4
    elseif (player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DESIRES_OF_EMPTINESS) or (player:getCurrentMission(COP) == xi.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus")>=7)) then
        player:startEvent(112) -- Start Floor 1, 3, 4, or 5
    elseif (player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_ENDURING_TUMULT_OF_WAR) or player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_LAST_VERSE)) then
        player:startEvent(50) -- Start Floor 1
    else
        player:messageSpecial(ID.text.DOOR_LOCKED)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 50 and option == 1) then
        player:setPos(-14.744, 0.036, -119.736, 1, 22) -- To Floor 1 {R}
    elseif (csid == 106) then
        if (option == 1) then
            player:setPos(-14.744, 0.036, -119.736, 1, 22) -- To Floor 1 {R}
        elseif (option == 2) then
            player:setPos(183.546, 0, -59.906, 0, 22) -- To Floor 3 (Propagator) {R}
        end
    elseif (csid == 109) then
        if (option == 1) then
            player:setPos(-14.744, 0.036, -119.736, 1, 22) -- To Floor 1 {R}
        elseif (option == 2) then --floor 3
            player:setPos(183.546, 0, -59.906, 0, 22) -- To Floor 3 (Propagator) {R}
        elseif (option == 3) then
            player:setPos(415.757, 0, 139.977, 128, 22) -- To Floor 4 (Solicitor) {R}
        end
    elseif (csid == 112) then
        if (option == 1) then
            player:setPos(-14.744, 0.036, -119.736, 1, 22) -- To Floor 1 {R}
        elseif (option == 2) then --floor 3
            player:setPos(183.546, 0, -59.906, 0, 22) -- To Floor 3 (Propagator) {R}
        elseif (option == 3) then
            player:setPos(415.757, 0, 139.977, 128, 22) -- To Floor 4 (Solicitor) {R}
        elseif (option == 4) then
            player:setPos(-336.001, 0, 139.815, 0, 22) -- To Floor 5 (Ponderer) {R}
        end
    end
end

return entity
