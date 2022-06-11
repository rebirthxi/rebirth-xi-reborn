-----------------------------------
-- Area: Bastok Mines
--  NPC: Griselda
-- Standard Merchant NPC
-- !pos -25.749 -0.044 52.360 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/quests")
require("scripts/globals/shop")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wildcatBastok = player:getCharVar("WildcatBastok")

    if
        player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatBastok, 15)
    then
        player:startEvent(507)
    else
        local stock =
        {
            4442, 360, 1, -- Pineapple Juice
            4391,  21, 2, -- Bretzel
            4490, 432, 2, -- Pickled Herring
            4424, 990, 2, -- Melon Juice
            4499,  90, 3, -- Iron Bread
            4376, 108, 3, -- Meat Jerky
            4509,  10, 3, -- Distilled Water
        }

        player:showText(npc, ID.text.GRISELDA_SHOP_DIALOG)
        xi.shop.nation(player, stock, xi.nation.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 507 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 15, true))
    end
end

return entity
