-----------------------------------
-- Area: Desuetia_Empyreal_Paradox
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.DESUETIA_EMPYREAL_PARADOX] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6390, -- Obtained: <item>.
        GIL_OBTAINED              = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6393, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED            = 6399, -- You obtain <number> <item>!
        CARRIED_OVER_POINTS       = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        PARTY_MEMBERS_HAVE_FALLEN = 7662, -- All party members have fallen in battle. Now leaving the battlefield.
        THE_PARTY_WILL_BE_REMOVED = 7669, -- If all party members' HP are still zero after # minute[/s], the party will be removed from the battlefield.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[xi.zone.DESUETIA_EMPYREAL_PARADOX]
