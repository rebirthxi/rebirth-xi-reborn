-----------------------------------
-- Area: Dynamis-Windurst
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/dynamis")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.DYNAMIS_WINDURST] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6390, -- Obtained: <item>.
        GIL_OBTAINED            = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6393, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6404, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS     = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE           = 7163, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7322, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7323, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7324, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7325, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7327, -- The sands of the hourglass have emptied...
        OMINOUS_PRESENCE        = 7339, -- You feel an ominous presence, as if something might happen if you possessed <item>.
    },
    mob =
    {
        TIME_EXTENSION =
        {
            {minutes = 10, ki = xi.ki.CRIMSON_GRANULES_OF_TIME,   mob = 17543258},
            {minutes = 10, ki = xi.ki.AZURE_GRANULES_OF_TIME,     mob = 17543342},
            {minutes = 10, ki = xi.ki.AMBER_GRANULES_OF_TIME,     mob = 17543372},
            {minutes = 15, ki = xi.ki.ALABASTER_GRANULES_OF_TIME, mob = 17543446},
            {minutes = 15, ki = xi.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = 17543259},
        },
        REFILL_STATUE =
        {
            {
                {mob = 17543268, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543269, eye = xi.dynamis.eye.BLUE },
            },
            {
                {mob = 17543305, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543306, eye = xi.dynamis.eye.GREEN},
            },
            {
                {mob = 17543353, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543354, eye = xi.dynamis.eye.BLUE },
            },
            {
                {mob = 17543362, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543363, eye = xi.dynamis.eye.GREEN},
            },
            {
                {mob = 17543392, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543393, eye = xi.dynamis.eye.GREEN},
            },
            {
                {mob = 17543409, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543410, eye = xi.dynamis.eye.BLUE },
            },
            {
                {mob = 17543419, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543420, eye = xi.dynamis.eye.BLUE },
                {mob = 17543421, eye = xi.dynamis.eye.GREEN},
            },
            {
                {mob = 17543461, eye = xi.dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17543462, eye = xi.dynamis.eye.BLUE },
                {mob = 17543463, eye = xi.dynamis.eye.GREEN},
            },
        },
    },
    npc =
    {
        QM =
        {
            [17543479] =
            {
                param = {3355, 3414, 3415, 3416, 3417, 3418},
                trade =
                {
                    {item = 3355,                           mob = 17543169}, -- Tzee Xicu Idol
                    {item = {3414, 3415, 3416, 3417, 3418}, mob = 17543469}, -- Arch Tzee Xicu Idol
                }
            },
            [17543480] = {trade = {{item = 3388, mob = 17543464}}}, -- Xuu Bhoqa the Enigma
            [17543481] = {trade = {{item = 3389, mob = 17543466}}}, -- Fuu Tzapo the Blessed
            [17543482] = {trade = {{item = 3390, mob = 17543467}}}, -- Naa Yixo the Stillrage
            [17543483] = {trade = {{item = 3391, mob = 17543468}}}, -- Tee Zaksa the Ceaseless
        },
    },
}

return zones[xi.zone.DYNAMIS_WINDURST]
