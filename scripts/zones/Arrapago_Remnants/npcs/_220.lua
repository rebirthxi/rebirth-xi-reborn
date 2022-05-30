local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, door)
    if (csid == 300 and option == 1) then
        door:setAnimation(8)
        local instance = door:getInstance()
        -- spawn mobs, etc
        for i, v in pairs(ID.npc[1][2]) do
            local npc = GetNPCByID(v, instance)
            npc:setStatus(xi.status.NORMAL)
        end
        for id = ID.mob[1][2].mobs_start, ID.mob[1][2].mobs_end do
            SpawnMob(id, instance)
        end
        door:setUntargetable(true)
    end
end

return entity
