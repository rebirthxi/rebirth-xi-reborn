-----------------------------------
-- Area: Appolyon
-- Name:
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
-----------------------------------
local battlefield_object = {}

-- After registering the BCNM via bcnmRegister(bcnmid)
battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        -- local name, clearTime, partySize = battlefield:getRecord()
        -- player:setPos(0, 0, 0, 0, 0x00)
    end
    if leavecode == xi.battlefield.leaveCode.LOST then
        -- SetServerVariable("[]UniqueID", 0)
    end
end

return battlefield_object
