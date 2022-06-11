-----------------------------------
-- Area: Apollyon
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.APOLLYON] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6390, -- Obtained: <item>.
        GIL_OBTAINED            = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        TIME_EXCEEDED           = 7062, -- You have exceeded the time limit. Exiting Limbus now.
        CONDITION_FOR_LIMBUS    = 7063, -- You have clearance to enter Limbus, but cannot enter while you or a party member is engaged in battle.
        HUM                     = 7075, -- You hear a faint hum.
        NO_KEY                  = 7080, -- There are several six-sided indentations and a thin slot in the center of the circular dais here.
        WIPE_KICK               = 7355, -- All party members in Limbus have fallen in battle. Exiting now.
        WIPE                    = 7363, -- All party members in Limbus have fallen in battle. Exiting in <number> [minute/minutes].
        CHIP_TRADE              = 7369, -- The light in the <item> has grown dim.
        TIME_EXTENDED           = 7371, -- our time in Limbus has been extended <number> [minute/minutes].
        TIME_LEFT               = 7372, -- ou have <number> [minute/minutes] left in Limbus.
        CONQUEST_BASE           = 7374, -- Tallying conquest results...
        GATE_OPEN               = 7553, -- <space>vortex materializes...
    },
    mob =
    {
        APOLLYON_SW_MOB =
        {
            16932868,
            16932881,
            16932896,
            16932910,
        },
        APOLLYON_NW_MOB =
        {
            16932937,
            16932950,
            16932963,
            16932976,
            16932985,
        },
        APOLLYON_SE_MOB =
        {
            16932992,
            16933006,
            16933020,
            16933032,
        },
        APOLLYON_NE_MOB =
        {
            16933044,
            16933062,
            16933081,
            16933099,
            16933113,
        },
        APOLLYON_CS_MOB =
        {
            16933129,
            16933137,
            16933144,
        },
        PROTO_OMEGA = 16933124,
    },
    npc =
    {
        ENTRANCE_OFFSET = 16933218,
        APOLLYON_NW_PORTAL =
        {
            16933226, -- nw 1>2
            16933227, -- nw 2>3
            16933228, -- nw 3>4
            16933224, -- nw 4>5
        },
        APOLLYON_SW_PORTAL =
        {
            16933230, -- sw 1>2
            16933231, -- sw 2>3
            16933232, -- sw 3>4
        },
        APOLLYON_NE_PORTAL =
        {
            16933235, -- ne 1>2
            16933234, -- ne 2>3
            16933233, -- ne 3>4
            16933237, -- ne 4>5
        },
        APOLLYON_SE_PORTAL =
        {
            16933239, -- se 1>2
            16933238, -- se 2>3
            16933241, -- se 3>4
        },
        APOLLYON_SW_CRATE =
        {
            16932865,
            16932878,
            16932899,
            16932909,
        },
        APOLLYON_NW_CRATE =
        {
            [1] =
            {
                16932934, -- boss
                16932935,
                16932936,
                16932945,
                16932946,
            },
            [2] =
            {
                16932947, -- boss
                16932948,
                16932949,
                16932958,
                16932959,
            },
            [3] =
            {
                16932960, -- boss
                16932961,
                16932962,
                16932971,
                16932972,
            },
            [4] =
            {
                16932973, -- boss
                16932974,
                16932975,
                16932982,
                16932983,
            },
            [5] = 16932984,
        },
        APOLLYON_SE_CRATE =
        {
            16932989,
            16933003,
            16933017,
            16933031,
        },
        APOLLYON_NE_CRATE =
        {
            [1] =
            {
                16933041, -- boss
                16933042,
                16933043,
                16933053,
                16933054,
            },
            [2] =
            {
                16933059, -- boss
                16933060,
                16933061,
                16933074,
                16933075,
            },
            [3] =
            {
                16933076, -- boss
                16933077,
                16933078,
                16933079,
                16933080,
            },
            [4] =
            {
                16933096, -- boss
                16933097,
                16933098,
                16933110,
                16933111,
            },
            [5] = 16933112,
        },
        APOLLYON_CS_CRATE = 16933126,
        APOLLYON_CENTRAL_CRATE = 16933123,
    },
}

return zones[xi.zone.APOLLYON]
