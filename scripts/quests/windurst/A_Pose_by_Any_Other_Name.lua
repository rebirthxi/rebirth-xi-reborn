-----------------------------------
-- A Pose By Any Other Name
-- Angelica !pos -64 -9.25 -9 238
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/quests')
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/titles')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME)

local poseItems =
{
    [xi.job.WAR] = xi.items.BRONZE_HARNESS,
    [xi.job.MNK] = xi.items.ROBE,
    [xi.job.WHM] = xi.items.TUNIC,
    [xi.job.BLM] = xi.items.TUNIC,
    [xi.job.RDM] = xi.items.TUNIC,
    [xi.job.THF] = xi.items.LEATHER_VEST,
    [xi.job.PLD] = xi.items.BRONZE_HARNESS,
    [xi.job.DRK] = xi.items.BRONZE_HARNESS,
    [xi.job.BST] = xi.items.LEATHER_VEST,
    [xi.job.BRD] = xi.items.ROBE,
    [xi.job.RNG] = xi.items.LEATHER_VEST,
    [xi.job.SAM] = xi.items.KENPOGI,
    [xi.job.NIN] = xi.items.KENPOGI,
    [xi.job.DRG] = xi.items.BRONZE_HARNESS,
    [xi.job.SMN] = xi.items.TUNIC,
    [xi.job.BLU] = xi.items.ROBE,
    [xi.job.COR] = xi.items.BRONZE_HARNESS,
    [xi.job.PUP] = xi.items.TUNIC,
    [xi.job.DNC] = xi.items.LEATHER_VEST,
    [xi.job.SCH] = xi.items.TUNIC,
    [xi.job.GEO] = xi.items.TUNIC,
    [xi.job.RUN] = xi.items.BRONZE_HARNESS,
}

quest.reward =
{
    fame = 75,
    fameArea = xi.quest.fame_area.WINDURST,
    item = xi.items.COPY_OF_ANCIENT_BLOOD,
    title = xi.title.SUPER_MODEL,
    keyItem = xi.ki.ANGELICAS_AUTOGRAPH,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and player:needToZone() == false
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local desiredBody = poseItems[player:getMainJob()]
                    local currentBody = player:getEquipID(xi.slot.BODY)
                    if currentBody ~= desiredBody then
                        if quest:getVar(player, 'Prog') == 1 then
                            return quest:progressEvent(90)
                        else
                            return quest:progressEvent(87)
                        end
                    else
                        -- default dialogs
                        local rand = math.random(1, 3)
                        if rand == 1 then
                            player:startEvent(86)
                        elseif rand == 2 then
                            player:startEvent(88)
                        else
                            player:startEvent(89)
                        end
                    end
                end
            },

            onEventFinish =
            {
                [87] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
                [90] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        quest:setVar(player, 'Prog', 0)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and vars.Prog == 0
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local requestedBody = poseItems[player:getMainJob()]

                    quest:setVar(player, 'Stage', os.time() + 300)
                    quest:setVar(player, 'Prog', requestedBody)

                    return quest:progressEvent(92, 0, 0, 0, requestedBody)
                end,
            },
        },
    },

    -- Section: Finish quest
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and vars.Prog ~= 0
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local requestedBody = quest:getVar(player, 'Prog')
                    if quest:getVar(player, 'Stage') >= os.time() then -- Under time. Quest completed.
                        if player:getEquipID(xi.slot.BODY) == requestedBody then
                            return quest:progressEvent(96)
                        else
                            return quest:progressEvent(93, 0, 0, 0, requestedBody)
                        end
                    else -- Over time. Quest failed.
                        return quest:progressEvent(102)
                    end
                end,
            },

            onEventFinish =
            {
                [96] = function(player, csid, option, npc) -- Quest completed
                    quest:complete(player)
                end,
                [102] = function(player, csid, option, npc) -- Quest failed.
                    player:delQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME)
                    quest:setVar(player, 'Prog', 0) -- TODO: Confirm that initial CS has to be repeated aswell upon quest failure. If not, set var to 1 here.
                    quest:setVar(player, 'Stage', 0)
                    player:addTitle(xi.title.LOWER_THAN_THE_LOWEST_TUNNEL_WORM)
                    player:needToZone(true)
                end,
            },
        },
    },

    -- Section: Quest Completed
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(101):replaceDefault()
                end,
            },
        },
    },
}

return quest
