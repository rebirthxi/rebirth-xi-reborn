-----------------------------------
-- Area: Kamihr_Drifts
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.KAMIHR_DRIFTS] =
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
        BAYLD_OBTAINED          = 7008, -- You have obtained <number> bayld!
        YOU_HAVE_LEARNED        = 7015, -- You have learned <keyitem>!
        EXPENDED_KINETIC_UNITS  = 7705, -- You have expended <number> kinetic unit[/s] and will be transported to another locale.
        INSUFFICIENT_UNITS      = 7706, -- Your stock of kinetic units is insufficient.
        HOMEPOINT_SET           = 7963, -- Home point set!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[xi.zone.KAMIHR_DRIFTS]
