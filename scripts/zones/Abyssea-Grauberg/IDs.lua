-----------------------------------
-- Area: Abyssea-Grauberg
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.ABYSSEA_GRAUBERG] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6384,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6390,  -- Obtained: <item>.
        GIL_OBTAINED                = 6391,  -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6393,  -- Obtained key item: <keyitem>.
        CRUOR_TOTAL                 = 6988,  -- Obtained <number> cruor. (Total: <number>)
        PLAYER_GAINED_EXPERIENCE    = 6999,  -- <name> gained <number> [points of experience/limit points].
        CARRIED_OVER_POINTS         = 7001,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY     = 7002,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                = 7003,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        LIGHTS_MESSAGE_1            = 7322,  -- Visitant Light Intensity Pearlescent: <number> / Ebon: <number> Golden: <number> / Silvery: <number>
        LIGHTS_MESSAGE_2            = 7323,  -- Azure: <number> / Ruby: <number> / Amber: <number>
        STAGGERED                   = 7324,  -- <name>'s attack staggers the fiend!
        YELLOW_STAGGER              = 7325,  -- The fiend is unable to cast magic.
        BLUE_STAGGER                = 7326,  -- The fiend is unable to use special attacks.
        RED_STAGGER                 = 7327,  -- The fiend is frozen in its tracks.
        YELLOW_WEAKNESS             = 7328,  -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental magic!
        BLUE_WEAKNESS               = 7329,  -- The fiend appears vulnerable to [/hand-to-hand/dagger/sword/great sword/axe/great axe/scythe/polearm/katana/great katana/club/staff/archery/marksmanship] weapon skills!
        RED_WEAKNESS                = 7330,  -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental weapon skills!
        ABYSSEA_TIME_OFFSET         = 7331,  -- Your visitant status will wear off in <number> [second/minute].
        RETURNING_TO_SEARING_IN     = 7340,  -- Returning to the Searing Ward in <number> [second/seconds].
        NO_VISITANT_WARD            = 7341,  -- You do not have visitant status. Returning to the Searing Ward in <number> [second/seconds].
        RETURNING_TO_WARD           = 7343,  -- Returning to the Searing Ward now.
        NO_VISITANT_STATUS          = 7400,  -- You do not have visitant status. Please proceed to the nearest Conflux Surveyor to have it granted.
        MONSTER_CONCEALED_CHEST     = 7483,  -- The monster was concealing a treasure chest!
        OBTAINS_TEMP_ITEM           = 7493,  -- <name> obtains the temporary item: <item>!
        OBTAINS_ITEM                = 7494,  -- <name> obtains the item: <item>!
        OBTAINS_KEYITEM             = 7495,  -- <name> obtains the key item: <item>!
        ADD_SPOILS_TO_TREASURE      = 7496,  -- <name> transferred the contents of the pyxis to the cache of lottable spoils.
        TEMP_ITEM_DISAPPEARED       = 7499,  -- That temporary item had already disappeared.
        KEYITEM_DISAPPEARED         = 7500,  -- That key item had already disappeared.
        ITEM_DISAPPEARED            = 7501,  -- That item had already disappeared.
        CHEST_DESPAWNED             = 7502,  -- The treasure chest had already disappeared.
        CRUOR_OBTAINED              = 7503,  -- <name> obtained <number> cruor.
        OBTAINS_SEVERAL_TEMPS       = 7504,  -- <name> obtains several temporary items!
        BODY_EMITS_OFFSET           = 7505,  -- <name>'s body emits [a faint/a mild/a strong] pearlescent light!
        CANNOT_OPEN_CHEST           = 7512,  -- You cannot open that treasure chest.
        PLAYER_HAS_CLAIM_OF_CHEST   = 7513,  -- <name> has claim over that treasure chest.
        PARTY_NOT_OWN_CHEST         = 7514,  -- Your party does not have claim over that treasure chest.
        CHEST_DISAPPEARED           = 7517,  -- The treasure chest has disappeared.
        RANDOM_SUCCESS_FAIL_GUESS   = 7539,  -- The randomly generated number was <number>! <name> guessed [successfully/unsuccessfully]!
        AIR_PRESSURE_CHANGE         = 7543,  -- <name> [reduced/increased] the air pressure by <number> units. Current air pressure: <number>[/ (minimum)/ (maximum)]
        INPUT_SUCCESS_FAIL_GUESS    = 7548,  -- <name> inputs the number <number>[, but nothing happens./, successfully unlocking the chest!]
        GREATER_OR_LESS_THAN        = 7549,  -- You have a hunch that the lock's combination is [greater/less] than <number>.
        HUNCH_SECOND_FIRST_EVEN_ODD = 7550,  -- You have a hunch that the [second/first] digit is [even/odd].
        HUNCH_SECOND_FIRST_IS       = 7551,  -- You have a hunch that the [second/first] digit is <number>.
        HUNCH_SECOND_FIRST_IS_OR    = 7552,  -- You have a hunch that the [second/first] digit is <number>, <number>, or <number>.
        HUNCH_ONE_DIGIT_IS          = 7553,  -- You have a hunch that one of the digits is <number>.
        HUNCH_SUM_EQUALS            = 7554,  -- You have a hunch that the sum of the two digits is <number>.
        PLAYER_OPENED_LOCK          = 7555,  -- <name> succeeded in opening the lock!
        PLAYER_FAILED_LOCK          = 7556,  -- <name> failed to open the lock.
        TRADE_KEY_OPEN              = 7557,  -- <name> uses <item> and opens the lock!
        BOUNDLESS_RAGE              = 7580,  -- You sense an aura of boundless rage...
        INFO_KI                     = 7581,  -- Your keen senses tell you that something may happen if only you had [this item/these items].
        USE_KI                      = 7584,  -- Use the [key item/key items]? Yes. No.
        OBTAINS_DOMINION_NOTES      = 7873,  -- <name> obtains <number> Dominion note[/s] (Total: <number>).
        DOMINION_SIGNED_ON          = 10409, -- You have signed on for Dominion Ops!
        CANCELED_OBJECTIVE          = 10410, -- You have canceled your objective.
    },
    mob =
    {
    },
    npc =
    {
        QM_POPS =
        {
            -- TODO: the first item, e.g. 'qm1', is unused and will be meaningless once I (Wren) finish entity-QC on all Abyssea zones.
            -- When that is done, I will rewrite Abyssea global and adjust and neaten this table
            --  [17818081] = { 'qm1',      {3260, 3266},                                                              {}, 17818041}, -- Ironclad Sunderer
            --  [17818082] = { 'qm2', {3261, 3262, 3268},                                                              {}, 17818042}, -- Ningishzida
            --  [17818083] = { 'qm3',      {3263, 3272},                                                              {}, 17818043}, -- Teugghia
            --  [17818084] = { 'qm4',      {3264, 3274},                                                              {}, 17818044}, -- Bomblix Flamefinger
            --  [17818085] = { 'qm5',           {3265},                                                              {}, 17818045}, -- Teekesselchen
            --  [17818086] = { 'qm6',           {3267},                                                              {}, 17818046}, -- Minaruja
            --  [17818087] = { 'qm7',           {3269},                                                              {}, 17818047}, -- Xibalba
            --  [17818088] = { 'qm8',           {3270},                                                              {}, 17818048}, -- Ika-Roa
            --  [17818089] = { 'qm9',           {3271},                                                              {}, 17818049}, -- Lorelei
            --  [17818090] = {'qm10',           {3273},                                                              {}, 17818050}, -- Burstrox Powderpate
            --  [17818091] = {'qm11',               {}, {xi.ki.WARPED_CHARIOT_PLATE, xi.ki.SHATTERED_IRON_GIANT_CHAIN}, 17818051}, -- Raja
            --  [17818092] = {'qm12',               {},                                    {xi.ki.VENOMOUS_HYDRA_FANG}, 17818052}, -- Alfard
            --  [17818093] = {'qm13',               {},                                      {xi.ki.VACANT_BUGARD_EYE}, 17818053}, -- Azdaja
            --  [17818094] = {'qm14',               {},                              {xi.ki.VARIEGATED_URAGNITE_SHELL}, 17818054}, -- Amphitrite
            --  [17818095] = {'qm15',               {}, {xi.ki.WARPED_CHARIOT_PLATE, xi.ki.SHATTERED_IRON_GIANT_CHAIN}, 17818055}, -- Raja
            --  [17818096] = {'qm16',               {},                                    {xi.ki.VENOMOUS_HYDRA_FANG}, 17818056}, -- Alfard
            --  [17818097] = {'qm17',               {},                                      {xi.ki.VACANT_BUGARD_EYE}, 17818057}, -- Azdaja
            --  [17818098] = {'qm18',               {},                              {xi.ki.VARIEGATED_URAGNITE_SHELL}, 17818058}, -- Amphitrite
            --  [17818099] = {'qm19',               {}, {xi.ki.WARPED_CHARIOT_PLATE, xi.ki.SHATTERED_IRON_GIANT_CHAIN}, 17818059}, -- Raja
            --  [17818100] = {'qm20',               {},                                    {xi.ki.VENOMOUS_HYDRA_FANG}, 17818060}, -- Alfard
            --  [17818101] = {'qm21',               {},                                      {xi.ki.VACANT_BUGARD_EYE}, 17818061}, -- Azdaja
            --  [17818102] = {'qm22',               {},                              {xi.ki.VARIEGATED_URAGNITE_SHELL}, 17818062}, -- Amphitrite
        },
        HARVESTING =
        {
            17818220,
            17818221,
            17818222,
            17818223,
            17818224,
            17818225,
        },
        STURDY_PYXIS_BASE = 17818119,
    },
}

return zones[xi.zone.ABYSSEA_GRAUBERG]
