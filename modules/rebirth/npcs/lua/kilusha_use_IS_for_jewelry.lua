-----------------------------------
-- Kilushu will hawk her wears for Imperial Standings input of Ampoules
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/Nashmau/IDs")
-----------------------------------
local m = Module:new("dohdjuma_stock")

m:addOverride("xi.zones.Nashmau.npcs.Kilusha.onTrigger", function(player, npc)
    player:startEvent(24, 0, 0, 0, 0, 0, 0, 0, player:getCurrency("imperial_standing"))
end)

m:addOverride("xi.zones.Nashmau.npcs.Kilusha.onEventFinish", function(player, csid, option)
    if csid == 24 then
        local ampoule_items = {
            [1]  = {id=17857, cost=15000}, -- Animator + 1
            [2]  = {id=16228, cost=15000}, -- Aslan Cape
            [3]  = {id=16229, cost=15000}, -- Gleeman's Cape
            [4]  = {id=16267, cost=15000}, -- Ritter Gorget
            [5]  = {id=16268, cost=15000}, -- Kubira Bead Necklace
            [6]  = {id=16269, cost=15000}, -- Morgana's Chooker
            [7]  = {id=15911, cost=15000}, -- Buccaneer's Belt
            [8]  = {id=15799, cost=15000}, -- Iota Ring
            [9]  = {id=15800, cost=15000}, -- Omega Ring
            [10] = {id=15990, cost=15000}, -- Delta Earring
            [11] = {id=2465,  cost=5000},  -- Rubber Cap
            [12] = {id=2466,  cost=5000},  -- Rubber Harness
            [13] = {id=2467,  cost=5000},  -- Rubber Gloves
            [14] = {id=2468,  cost=5000},  -- Rubber Chausses
            [15] = {id=2469,  cost=5000},  -- Rubber Soles
            [16] = {id=2470,  cost=5000},  -- Nethereye chain
            [17] = {id=2471,  cost=5000},  -- Netherfield chain
            [18] = {id=2472,  cost=5000},  -- Netherspirit chain
            [19] = {id=2473,  cost=5000},  -- Nethercant Chain
            [20] = {id=2474,  cost=5000},  -- Netherpact Chain
        }

        if ampoule_items[option] and player:getCurrency("imperial_standing") >= ampoule_items[option].cost then
            if npcUtil.giveItem(player, ampoule_items[option].id) then
                player:delCurrency("imperial_standing", ampoule_items[option].cost)
            end
        end
    end
end)

return m
