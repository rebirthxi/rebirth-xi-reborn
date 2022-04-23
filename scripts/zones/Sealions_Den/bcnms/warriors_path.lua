-----------------------------------
-- Area: Sealion's Den
-- Name: The Warrior's Path
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
        local arg8 = (player:getCurrentMission(xi.mission.log_id.COP) ~= xi.mission.id.cop.THE_WARRIOR_S_PATH) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.THE_WARRIOR_S_PATH then
            player:completeMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_WARRIOR_S_PATH)
            player:addMission(xi.mission.log_id.COP, xi.mission.id.cop.GARDEN_OF_ANTIQUITY)
            player:setCharVar("PromathiaStatus", 0)
        end
        player:addExp(1000)
        player:addTitle(xi.title.THE_CHEBUKKIS_WORST_NIGHTMARE)
        player:setPos(-25, -1, -620, 208, 33) -- Al'Taieu
    end
end

return battlefield_object
