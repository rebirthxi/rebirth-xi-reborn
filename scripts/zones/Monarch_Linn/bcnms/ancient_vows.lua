-----------------------------------
-- Area: Monarch Linn
-- Name: Ancient Vows
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getCurrentMission(COP) ~= xi.mission.id.cop.ANCIENT_VOWS or
                      xi.mission.getVar(player, xi.mission.log_id.COP, xi.mission.id.cop.ANCIENT_VOWS, 'Status') ~= 2) and 1 or 0

        if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.ANCIENT_VOWS then
            player:setLocalVar("battlefieldWin", battlefield:getID())
        end

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        player:addExp(1000)
        player:addTitle(xi.title.TAVNAZIAN_TRAVELER)
    end
end

return battlefield_object
