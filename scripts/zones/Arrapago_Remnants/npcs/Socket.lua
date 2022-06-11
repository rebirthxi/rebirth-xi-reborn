-----------------------------------
-- Area: Arrapago Remnants
--  NPC: Socket
-- Trade Slavage Cells to pop Wahzil
-- Wahzil drops 2x the Cells traded
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local instance      = npc:getInstance()
    local mob           = GetMobByID(ID.mob[2][3].wahzil, instance)
    local tradeCount    = trade:getItemCount()
    local incusCell     = 5365 -- TODO: Add these to items.lua
    local spissatusCell = 5384

    for i = incusCell, spissatusCell do
        if tradeCount <= 5 and trade:hasItemQty(i, tradeCount) then
            SpawnMob(ID.mob[2][3].wahzil, instance):updateClaim(player)
            player:tradeComplete()
            mob:setLocalVar("Cell", i)
            mob:setLocalVar("Qnt", tradeCount)
        end
    end
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
