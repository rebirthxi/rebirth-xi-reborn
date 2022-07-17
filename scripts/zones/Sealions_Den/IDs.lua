-----------------------------------
-- Area: Sealions_Den
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.SEALIONS_DEN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED           = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                     = 6390, -- Obtained: <item>.
        GIL_OBTAINED                      = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED                  = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS               = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY           = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                      = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        IRON_GATE_LOCKED                  = 7094, -- A solid iron gate. It is tightly locked...
        PARTY_MEMBERS_HAVE_FALLEN         = 7407, -- All party members have fallen in battle. Now leaving the battlefield.
        THE_PARTY_WILL_BE_REMOVED         = 7414, -- If all party members' HP are still zero after # minute[/s], the party will be removed from the battlefield.
        CONQUEST_BASE                     = 7428, -- Tallying conquest results...
        TENZEN_MSG_OFFSET                 = 7919, -- Offset for BCNM messages during A Warriors Path (Starts: You will fall to my blade!)
        MAKKI_CHEBUKKI_OFFSET             = 7923, -- Offset for BCNM messages during A Warriors Path (Starts: Samurai Sky Pirate Power!)
        KUKKI_CHEBUKKI_OFFSET             = 7928, -- Offset for BCNM messages during A Warriors Path (Starts: What? Nooo!)
        CHERUKIKI_OFFSET                  = 7934, -- Offset for BCNM messages during A Warriors Path (Starts: We're doomed!)
    },
    mob =
    {
        ONE_TO_BE_FEARED_OFFSET = 16908289,
        OMEGA_OFFSET = 16908294,
        WARRIORS_PATH_OFFSET    = 16908310,
    },
    npc =
    {
        AIRSHIP_DOOR_OFFSET = 16908420,
    },
    aWarriorsPath =
    {
        TENZEN_ID         = 16908310,
        MAKKI_SHAKKI_ID   = 16908311,
        KUKKI_CHEBUKKI_ID = 16908312,
        CHERUKKI_ID       = 16908313,
    },
}

return zones[xi.zone.SEALIONS_DEN]
