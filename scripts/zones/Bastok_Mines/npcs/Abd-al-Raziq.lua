-----------------------------------
-- Area: Bastok Mines
--  NPC: Abd-al-Raziq
-- Type: Alchemy Guild Master
-- !pos 126.768 1.017 -0.234 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/crafting")
require("scripts/globals/missions")
require("scripts/globals/roe")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local signed  = trade:getItem():getSignature() == player:getName() and 1 or 0
    local newRank = xi.crafting.tradeTestItem(player, npc, trade, xi.skill.ALCHEMY)

    if
        newRank > 9 and
        player:getCharVar("AlchemyExpertQuest") == 1 and
        player:hasKeyItem(xi.keyItem.WAY_OF_THE_ALCHEMIST)
    then
        if signed ~=0 then
            player:setSkillRank(xi.skill.ALCHEMY, newRank)
            player:startEvent(121, 0, 0, 0, 0, newRank, 1)
            player:setCharVar("AlchemyExpertQuest",0)
            player:setLocalVar("AlchemyTraded",1)
        else
            player:startEvent(121, 0, 0, 0, 0, newRank, 0)
        end

    elseif newRank ~= 0 and newRank <=9 then
        player:setSkillRank(xi.skill.ALCHEMY, newRank)
        player:startEvent(121, 0, 0, 0, 0, newRank)
        player:setLocalVar("AlchemyTraded",1)
    end
end

entity.onTrigger = function(player, npc)
    local craftSkill        = player:getSkillLevel(xi.skill.ALCHEMY)
    local testItem          = xi.crafting.getTestItem(player, npc, xi.skill.ALCHEMY)
    local guildMember       = xi.crafting.isGuildMember(player, 1)
    local rankCap           = xi.crafting.getCraftSkillCap(player, xi.skill.ALCHEMY)
    local expertQuestStatus = 0
    local rank              = player:getSkillRank(xi.skill.ALCHEMY)
    local realSkill         = (craftSkill - rank) / 32
    local canRankUp         = rankCap - realSkill -- used to make sure rank up isn't overridden by ASA mission

    if guildMember == 1 then
        guildMember = 150995375
    end

    if xi.crafting.unionRepresentativeTriggerRenounceCheck(player, 120, realSkill, rankCap, 184549887) then
        return
    end

    if player:getCharVar("AlchemyExpertQuest") == 1 then
        if player:hasKeyItem(xi.keyItem.WAY_OF_THE_ALCHEMIST) then
            expertQuestStatus = 550
        else
            expertQuestStatus = 600
        end
    end

    if
        player:getCurrentMission(xi.mission.log_id.ASA) == xi.mission.id.asa.THAT_WHICH_CURDLES_BLOOD and
        guildMember == 150995375 and
        canRankUp >= 3
    then
        local item      = 0
        local asaStatus = player:getCharVar("ASA_Status")

        -- TODO: Other Enfeebling Kits
        if asaStatus == 0 then
            item = 2779
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus)
        end

        -- The Parameters are Item IDs for the Recipe
        player:startEvent(590, item, 2774, 929, 4103, 2777, 4103)

    elseif expertQuestStatus == 550 then
        --[[
        Feeding the proper parameter currently hangs the client in cutscene. This may
        possibly be due to an unimplemented packet or function (display recipe?) Work
        around to present dialog to player to let them know the trade is ready to be
        received by triggering with lower rank up parameters.
        --]]
        player:showText(npc, 7237)
        player:showText(npc, 7239)
        player:startEvent(120, testItem, realSkill, 44, guildMember, 0, 0, 0, 0)

    else
        player:startEvent(120, testItem, realSkill, rankCap, guildMember, expertQuestStatus, 0, 0, 0)
    end
end

entity.onEventUpdate = function(player, csid, option)
    if
        csid == 120 and
        option >= xi.skill.WOODWORKING and
        option <= xi.skill.COOKING
    then
        xi.crafting.unionRepresentativeEventUpdateRenounce(player, option)
    end
end

entity.onEventFinish = function(player, csid, option)
    local guildMember = xi.crafting.isGuildMember(player, 1)

    if csid == 120 and option == 2 then
        if guildMember == 1 then
            player:setCharVar("AlchemyExpertQuest",1)
        end
    elseif csid == 120 and option == 1 then
        local crystal = 4101 -- water crystal

        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, crystal)
        else
            player:addItem(crystal)
            player:messageSpecial(ID.text.ITEM_OBTAINED, crystal)
            xi.crafting.signupGuild(player, xi.crafting.guild.alchemy)
        end
    else
        if player:getLocalVar("AlchemyTraded") == 1 then
            player:tradeComplete()
            player:setLocalVar("AlchemyTraded",0)
        end
    end

    if player:hasEminenceRecord(106) then
        xi.roe.onRecordTrigger(player, 106)
    end
end

return entity
