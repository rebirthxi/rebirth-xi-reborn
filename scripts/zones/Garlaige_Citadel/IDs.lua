-----------------------------------
-- Area: Garlaige Citadel (200)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.GARLAIGE_CITADEL] =
{
    text =
    {
        CONQUEST_BASE            = 0,     -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED  = 6543,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6549,  -- Obtained: <item>.
        GIL_OBTAINED             = 6550,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6552,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6563,  -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING      = 6564,  -- You are suddenly overcome with a sense of foreboding...
        FELLOW_MESSAGE_OFFSET    = 6578,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS      = 7160,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY  = 7161,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER             = 7162,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        GEOMAGNETRON_ATTUNED     = 7171,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        DEVICE_NOT_WORKING       = 7241,  -- The device is not working.
        SYS_OVERLOAD             = 7250,  -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE             = 7255,  -- You lost the <item>.
        SPARKLING_LIGHT          = 7267,  -- The ground is sparkling with a strange light.
        A_GATE_OF_STURDY_STEEL   = 7279,  -- A gate of sturdy steel.
        OPEN_WITH_THE_RIGHT_KEY  = 7285,  -- You might be able to open it with the right key.
        BANISHING_GATES          = 7294,  -- The first banishing gate begins to open...
        BANISHING_GATES_CLOSING  = 7297,  -- The first banishing gate starts to close.
        YOU_FIND_NOTHING         = 7301,  -- You find nothing special.
        HOLE_IN_THE_CEILING      = 7302,  -- There is a hole in the ceiling.
        PRESENCE_FROM_CEILING    = 7303,  -- You sense a presence from in the ceiling.
        HEAT_FROM_CEILING        = 7304,  -- You feel a terrible heat from the ceiling.
        THE_PRESENCE_MOVES       = 7308,  -- The presence in the ceiling seems to have moved to the east.
        CHEST_UNLOCKED           = 7334,  -- You unlock the chest!
        ITEMS_ITEMS_LA_LA        = 7461,  -- You can hear a strange voice... Items, items, la la la la la
        GOBLIN_SLIPPED_AWAY      = 7467,  -- The Goblin slipped away when you were not looking...
        YOU_COULD_OPEN_THE_GATE  = 7519,  -- If only you had the %, you could open the banishing gate.
        THE_GATE_OPENS_FOR_YOU   = 7520,  -- By the power of your %, the gate opens for you.
        COMBINE_INTO_A_CHUNK     = 7522,  -- You combine the % you have collected into a single chunk.
        PLAYER_OBTAINS_ITEM      = 7527,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7528,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7529,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 7530,  -- You already possess that temporary item.
        NO_COMBINATION           = 7535,  -- You were unable to enter a combination.
        REGIME_REGISTERED        = 9613,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 11564, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        HAZMAT_PH =
        {
            [17596515] = 17596520,
        },
        HOVERING_HOTPOT_PH =
        {
            [17596623] = 17596628, -- 182.157 -0.012 29.941
            [17596625] = 17596628, -- 188.229 -0.018 20.151
        },
        OLD_TWO_WINGS       = 17596506,
        SKEWER_SAM          = 17596507,
        CHANDELIER          = 17596533,
        GUARDIAN_STATUE     = 17596643,
        SERKET              = 17596720,
        MIMIC               = 17596728,
        APPARATUS_ELEMENTAL = 17596729,
    },
    npc =
    {
        CASKET_BASE           = 17596738,
        BANISHING_GATE_OFFSET = 17596761,
        TREASURE_CHEST        = 17596812,
        TREASURE_COFFER       = 17596813,
        CHANDELIER_QM         = 17596830,
    },
}

return zones[xi.zone.GARLAIGE_CITADEL]
