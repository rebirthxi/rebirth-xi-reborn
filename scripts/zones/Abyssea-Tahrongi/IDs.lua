-----------------------------------
-- Area: Abyssea-Tahrongi
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.ABYSSEA_TAHRONGI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6390, -- Obtained: <item>.
        GIL_OBTAINED                = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6393, -- Obtained key item: <keyitem>.
        CRUOR_TOTAL                 = 6988, -- Obtained <number> cruor. (Total: <number>)
        CARRIED_OVER_POINTS         = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY     = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        LIGHTS_MESSAGE_1            = 7322, -- Visitant Light Intensity Pearlescent: <number> / Ebon: <number> Golden: <number> / Silvery: <number>
        LIGHTS_MESSAGE_2            = 7323, -- Azure: <number> / Ruby: <number> / Amber: <number>
        STAGGERED                   = 7324, -- <name>'s attack staggers the fiend!
        YELLOW_STAGGER              = 7325, -- The fiend is unable to cast magic.
        BLUE_STAGGER                = 7326, -- The fiend is unable to use special attacks.
        RED_STAGGER                 = 7327, -- The fiend is frozen in its tracks.
        YELLOW_WEAKNESS             = 7328, -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental magic!
        BLUE_WEAKNESS               = 7329, -- The fiend appears vulnerable to [/hand-to-hand/dagger/sword/great sword/axe/great axe/scythe/polearm/katana/great katana/club/staff/archery/marksmanship] weapon skills!
        RED_WEAKNESS                = 7330, -- The fiend appears vulnerable to [/fire/ice/wind/earth/lightning/water/light/darkness] elemental weapon skills!
        ABYSSEA_TIME_OFFSET         = 7331, -- Your visitant status will wear off in <number> [second/minute].
        RETURNING_TO_SEARING_IN     = 7340, -- Returning to the Searing Ward in <number> [second/seconds].
        NO_VISITANT_WARD            = 7341, -- You do not have visitant status. Returning to the Searing Ward in <number> [second/seconds].
        RETURNING_TO_WARD           = 7343, -- Returning to the Searing Ward now.
        NO_VISITANT_STATUS          = 7400, -- You do not have visitant status. Please proceed to the nearest Conflux Surveyor to have it granted.
        MONSTER_CONCEALED_CHEST     = 7483, -- The monster was concealing a treasure chest!
        OBTAINS_TEMP_ITEM           = 7493, -- <name> obtains the temporary item: <item>!
        OBTAINS_ITEM                = 7494, -- <name> obtains the item: <item>!
        OBTAINS_KEYITEM             = 7495, -- <name> obtains the key item: <item>!
        ADD_SPOILS_TO_TREASURE      = 7496, -- <name> transferred the contents of the pyxis to the cache of lottable spoils.
        TEMP_ITEM_DISAPPEARED       = 7499, -- That temporary item had already disappeared.
        KEYITEM_DISAPPEARED         = 7500, -- That key item had already disappeared.
        ITEM_DISAPPEARED            = 7501, -- That item had already disappeared.
        CHEST_DESPAWNED             = 7502, -- The treasure chest had already disappeared.
        CRUOR_OBTAINED              = 7503, -- <name> obtained <number> cruor.
        OBTAINS_SEVERAL_TEMPS       = 7504, -- <name> obtains several temporary items!
        BODY_EMITS_OFFSET           = 7505, -- <name>'s body emits [a faint/a mild/a strong] pearlescent light!
        CANNOT_OPEN_CHEST           = 7512, -- You cannot open that treasure chest.
        PLAYER_HAS_CLAIM_OF_CHEST   = 7513, -- <name> has claim over that treasure chest.
        PARTY_NOT_OWN_CHEST         = 7514, -- Your party does not have claim over that treasure chest.
        CHEST_DISAPPEARED           = 7517, -- The treasure chest has disappeared.
        RANDOM_SUCCESS_FAIL_GUESS   = 7539, -- The randomly generated number was <number>! <name> guessed [successfully/unsuccessfully]!
        AIR_PRESSURE_CHANGE         = 7543, -- <name> [reduced/increased] the air pressure by <number> units. Current air pressure: <number>[/ (minimum)/ (maximum)]
        INPUT_SUCCESS_FAIL_GUESS    = 7548, -- <name> inputs the number <number>[, but nothing happens./, successfully unlocking the chest!]
        GREATER_OR_LESS_THAN        = 7549, -- You have a hunch that the lock's combination is [greater/less] than <number>.
        HUNCH_SECOND_FIRST_EVEN_ODD = 7550, -- You have a hunch that the [second/first] digit is [even/odd].
        HUNCH_SECOND_FIRST_IS       = 7551, -- You have a hunch that the [second/first] digit is <number>.
        HUNCH_SECOND_FIRST_IS_OR    = 7552, -- You have a hunch that the [second/first] digit is <number>, <number>, or <number>.
        HUNCH_ONE_DIGIT_IS          = 7553, -- You have a hunch that one of the digits is <number>.
        HUNCH_SUM_EQUALS            = 7554, -- You have a hunch that the sum of the two digits is <number>.
        PLAYER_OPENED_LOCK          = 7555, -- <name> succeeded in opening the lock!
        PLAYER_FAILED_LOCK          = 7556, -- <name> failed to open the lock.
        TRADE_KEY_OPEN              = 7557, -- <name> uses <item> and opens the lock!
        BOUNDLESS_RAGE              = 7580, -- You sense an aura of boundless rage...
        INFO_KI                     = 7581, -- Your keen senses tell you that something may happen if only you had [this item/these items].
        USE_KI                      = 7584, -- Use the [key item/key items]? Yes. No.
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
            --  [16961954] = { 'qm1',           {2915},                                                                                                                     {}, 16961917}, -- Halimede
            --  [16961955] = { 'qm2',           {2916},                                                                                                                     {}, 16961918}, -- Vetehinen
            --  [16961956] = { 'qm3', {2917, 2945, 2946},                                                                                                                     {}, 16961919}, -- Ophanim
            --  [16961957] = { 'qm4',           {2918},                                                                                                                     {}, 16961920}, -- Cannered Noz
            --  [16961958] = { 'qm5',      {2919, 2947},                                                                                                                     {}, 16961921}, -- Treble Noctules
            --  [16961959] = { 'qm6',           {2920},                                                                                                                     {}, 16961922}, -- Gancanagh
            --  [16961960] = { 'qm7',      {2921, 2948},                                                                                                                     {}, 16961923}, -- Hedetet
            --  [16961961] = { 'qm8',           {2922},                                                                                                                     {}, 16961924}, -- Abas
            --  [16961962] = { 'qm9',      {2923, 2949},                                                                                                                     {}, 16961925}, -- Alectryon
            --  [16961963] = {'qm10',           {2924},                                                                                                                     {}, 16961926}, -- Tefnet
            --  [16961964] = {'qm11',      {2925, 2950},                                                                                                                     {}, 16961927}, -- Muscaliet
            --  [16961965] = {'qm12',           {2926},                                                                                                                     {}, 16961928}, -- Lachrymater
            --  [16961966] = {'qm13',               {},         {xi.ki.VEINOUS_HECTEYES_EYELID, xi.ki.TORN_BAT_WING, xi.ki.GORY_SCORPION_CLAW, xi.ki.MOSSY_ADAMANTOISE_SHELL}, 16961929}, -- Chloris
            --  [16961967] = {'qm14',               {}, {xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.SODDEN_SANDWORM_HUSK, xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.STICKY_GNAT_WING}, 16961930}, -- Glavoid
            --  [16961968] = {'qm15',               {},                                                     {xi.ki.OVERGROWN_MANDRAGORA_FLOWER, xi.ki.CHIPPED_SANDWORM_TOOTH}, 16961931}, -- Lacovie
            --  [16961969] = {'qm16',               {},         {xi.ki.VEINOUS_HECTEYES_EYELID, xi.ki.TORN_BAT_WING, xi.ki.GORY_SCORPION_CLAW, xi.ki.MOSSY_ADAMANTOISE_SHELL}, 16961946}, -- Chloris
            --  [16961970] = {'qm17',               {}, {xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.SODDEN_SANDWORM_HUSK, xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.STICKY_GNAT_WING}, 16961947}, -- Glavoid
            --  [16961971] = {'qm18',               {},                                                     {xi.ki.OVERGROWN_MANDRAGORA_FLOWER, xi.ki.CHIPPED_SANDWORM_TOOTH}, 16961948}, -- Lacovie
            --  [16961972] = {'qm19',               {},         {xi.ki.VEINOUS_HECTEYES_EYELID, xi.ki.TORN_BAT_WING, xi.ki.GORY_SCORPION_CLAW, xi.ki.MOSSY_ADAMANTOISE_SHELL}, 16961949}, -- Chloris
            --  [16961973] = {'qm20',               {}, {xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.SODDEN_SANDWORM_HUSK, xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.STICKY_GNAT_WING}, 16961950}, -- Glavoid
            --  [16961974] = {'qm21',               {},                                                     {xi.ki.OVERGROWN_MANDRAGORA_FLOWER, xi.ki.CHIPPED_SANDWORM_TOOTH}, 16961951}, -- Lacovie
        },
        STURDY_PYXIS_BASE = 16961991,
    },
}

return zones[xi.zone.ABYSSEA_TAHRONGI]
