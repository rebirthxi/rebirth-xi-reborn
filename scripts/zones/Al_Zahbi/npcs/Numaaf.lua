-----------------------------------
-- Area: Al Zahbi
--  NPC: Numaaf
-- Type: Cooking Normal/Adv. Image Support
-- !pos 54.966 -7 8.328 48
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Al_Zahbi/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local guildMember = xi.crafting.isGuildMember(player, 4)

    if guildMember == 1 then
        if trade:hasItemQty(2184, 1) and trade:getItemCount() == 1 then
            if player:hasStatusEffect(xi.effect.COOKING_IMAGERY) == false then
                player:tradeComplete()
                player:startEvent(223, 8, 0, 0, 0, 188, 0, 8, 0)
            else
                npc:showText(npc, ID.text.IMAGE_SUPPORT_ACTIVE)
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    local guildMember = xi.crafting.isGuildMember(player, 4)
    local skillLevel = player:getSkillLevel(xi.skill.COOKING)

    if guildMember == 1 then
        if player:hasStatusEffect(xi.effect.COOKING_IMAGERY) == false then
            player:startEvent(222, 8, skillLevel, 0, 511, 188, 0, 8, 2184)
        else
            player:startEvent(222, 8, skillLevel, 0, 511, 188, 7121, 8, 2184)
        end
    else
        player:startEvent(222, 0, 0, 0, 0, 0, 0, 8, 0) -- Standard Dialogue
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 222 and option == 1 then
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 8, 1)
        player:addStatusEffect(xi.effect.COOKING_IMAGERY, 1, 0, 120)
    elseif csid == 223 then
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 8, 0)
        player:addStatusEffect(xi.effect.COOKING_IMAGERY, 3, 0, 480)
    end
end

return entity
