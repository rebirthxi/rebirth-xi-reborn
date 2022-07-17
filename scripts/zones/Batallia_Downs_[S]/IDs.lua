-----------------------------------
-- Area: Batallia_Downs_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.BATALLIA_DOWNS_S] =
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
        LYCOPODIUM_ENTRANCED    = 7064, -- The lycopodium is entranced by a sparkling light...
        FISHING_MESSAGE_OFFSET  = 7077, -- You can't fish here.
        NO_RESPONSE             = 7699, -- There is no response...
        NOTHING_OUT_OF_ORDINARY = 8156, -- There is nothing out of the ordinary here.
        VOIDWALKER_DESPAWN      = 8263, -- The monster fades before your eyes, a look of disappointment on its face.
        VOIDWALKER_NO_MOB       = 8310, -- The <keyitem> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR  = 8311, -- The <keyitem> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT     = 8312, -- The <keyitem> resonates [feebly/softly/solidly/strongly/very strongly/furiously], sending a radiant beam of light lancing towards a spot roughly <number> [yalm/yalms] [east/southeast/south/southwest/west/northwest/north/northeast] of here.
        VOIDWALKER_SPAWN_MOB    = 8313, -- A monster materializes out of nowhere!
        VOIDWALKER_UPGRADE_KI_1 = 8315, -- The <keyitem> takes on a slightly deeper hue and becomes <keyitem>!
        VOIDWALKER_UPGRADE_KI_2 = 8316, -- The <keyitem> takes on a deeper, richer hue and becomes <keyitem>!
        VOIDWALKER_BREAK_KI     = 8317, -- The <keyitem> shatters into tiny fragments.
        VOIDWALKER_OBTAIN_KI    = 8318, -- Obtained key item: <keyitem>!
        COMMON_SENSE_SURVIVAL   = 9591, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },

    mob =
    {
        BURLIBIX_BRAWNBACK_PH =
        {
            [17121398] = 17121399,
            [17121402] = 17121399,
        },

        LA_VELUE_PH =
        {
            [17121554] = 17121576, -- -314.365 -18.745 -56.016
        },

        HABERGOASS_PH =
        {
            [17121602] = 17121603,
        },

        VOIDWALKER =
        {
            [xi.keyItem.CLEAR_ABYSSITE] =
            {
                17121722,  -- Lacus
                17121721,  -- Thunor
                17121720, -- Beorht
                17121719, -- Pruina
                17121718,  -- Puretos
                17121717,  -- Eorthe
                17121716, -- Deorc
                17121715, -- Aither
            },

            [xi.keyItem.COLORFUL_ABYSSITE] =
            {
                17121714, -- Skuld
                17121713  -- Urd
            },

            [xi.keyItem.YELLOW_ABYSSITE] =
            {
                17121712  -- Verthandi
            },

            [xi.keyItem.BLACK_ABYSSITE] =
            {
                17121711  -- Yilbegan
            }
        }
    },

    npc =
    {
    },
}

return zones[xi.zone.BATALLIA_DOWNS_S]
