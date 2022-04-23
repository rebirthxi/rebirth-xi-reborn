-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Melleupaux
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        16450, 2030, -- Dagger
        16566, 9216, -- Longsword
        17335,    4, -- Rusty Bolt
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            16450,  2030,  -- Dagger
            16566,  9216,  -- Longsword
            17335,     4,  -- Rusty Bolt
            18375, 37296,  -- Falx
            18214, 20762,  -- Voulge
        }
    end

    player:showText(npc, ID.text.MELLEUPAUX_SHOP_DIALOG) -- 10910 without ch4 complete, may change
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
