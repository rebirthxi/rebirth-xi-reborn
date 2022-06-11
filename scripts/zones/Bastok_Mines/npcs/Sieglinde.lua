-----------------------------------
-- Area: Bastok Mines
--  NPC: Sieglinde
-- Alchemy Synthesis Image Support
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/crafting")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local guildMember = xi.crafting.isGuildMember(player, 1)
    local skillCap    = xi.crafting.getCraftSkillCap(player, xi.skill.SMITHING)
    local skillLevel  = player:getSkillLevel(xi.skill.SMITHING)

    if guildMember == 1 then
        if (player:hasStatusEffect(xi.effect.ALCHEMY_IMAGERY) == false) then
            player:startEvent(124, skillCap, skillLevel, 2, 201, player:getGil(), 0, 4095, 0)
        else
            player:startEvent(124, skillCap, skillLevel, 2, 201, player:getGil(), 7009, 4095, 0)
        end
    else
        player:startEvent(124)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 124 and option == 1 then
        player:messageSpecial(ID.text.ALCHEMY_SUPPORT, 0, 7, 2)
        player:addStatusEffect(xi.effect.ALCHEMY_IMAGERY, 1, 0, 120)
    end
end

return entity
