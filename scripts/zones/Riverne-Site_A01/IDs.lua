-----------------------------------
-- Area: Riverne-Site_A01
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.RIVERNE_SITE_A01] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6390, -- Obtained: <item>.
        GIL_OBTAINED              = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6393, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY   = 6404, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS       = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE             = 7057, -- Tallying conquest results...
        A_GLOWING_MIST            = 7252, -- A glowing mist of ever-changing proportions floats before you...
        PARTY_MEMBERS_HAVE_FALLEN = 7566, -- All party members have fallen in battle. Now leaving the battlefield.
        THE_PARTY_WILL_BE_REMOVED = 7573, -- If all party members' HP are still zero after # minute[/s], the party will be removed from the battlefield.
        SD_VERY_SMALL             = 7595, -- The spatial displacement is very small. If you only had some item that could make it bigger...
        SD_HAS_GROWN              = 7596, -- The spatial displacement has grown.
        SPACE_SEEMS_DISTORTED     = 7597, -- The space around you seems oddly distorted and disrupted.
        MONUMENT                  = 7604, -- Something has been engraved on this stone, but the message is too difficult to make out.
        HOMEPOINT_SET             = 7732, -- Home point set!
    },
    mob =
    {
        HELIODROMOS_PH_OFFSET    = 16900107,
        HELIODROMOS_OFFSET       = 16900110,
        CARMINE_DOBSONFLY_OFFSET = 16900230,
    },
    npc =
    {
        DISPLACEMENT_OFFSET = 16900334,
    },
    AIATAR_PH =
    {
        [16900301] = 16900306,
        [16900302] = 16900306,
        [16900303] = 16900306,
        [16900304] = 16900306,
        [16900305] = 16900306,
    },
}

return zones[xi.zone.RIVERNE_SITE_A01]
