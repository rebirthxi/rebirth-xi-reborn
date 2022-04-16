xi = xi or {}
xi.spells = xi.spells or {}
xi.spells.parameters = xi.spells.parameters or {}
-----------------------------------

-- Table with spell parameters. Data taken from JP-Wiki and BG wiki when not available. Preference in that precise orther when a missmatch happens.
-- Single target "Spirit Magic"
-- Tier 1 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/3655.html
-- Tier 2 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/3657.html
-- Tier 3 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/3659.html
-- Tier 4 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/2229.html
-- Tier 5 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/3663.html
-- Tier 6 spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/32808.html

xi.spells.parameters.damage =
{
-- Single target black magic spells:
-- Structure:           [spellId] = {  Stat used, vNPC, mNPC,  vPC,   I,   M0,  M50,  M100, M200, M300, M400, M500 },
    [xi.magic.spell.AERO        ] = { xi.mod.INT,   25,    1,   40,  35,  1.6,    1,     0,    0,    0,    0,    0 },
    [xi.magic.spell.AERO_II     ] = { xi.mod.INT,  113,    1,  140, 133,  2.6,  1.8,     1,    0,    0,    0,    0 },
    [xi.magic.spell.AERO_III    ] = { xi.mod.INT,  265,  1.5,  260, 295,  3.4,  2.8,   1.9,    1,    0,    0,    0 },
    [xi.magic.spell.AERO_IV     ] = { xi.mod.INT,  440,    2,  480, 472,  4.4,  3.8,   2.9, 1.98,    1,    0,    0 },
    [xi.magic.spell.AERO_V      ] = { xi.mod.INT,  738,  2.3,  750, 550,  5.2,  4.5,   3.9, 2.98, 1.98,    1,    0 }, -- I value unknown. Guesstimate used.
    [xi.magic.spell.AERO_VI     ] = { xi.mod.INT, 1070,  2,5, 1070, 600,    6,  5.8,   4.8,  3.8,  2.9, 1.98,    1 }, -- I value unknown. Guesstimate used.
    [xi.magic.spell.TORNADO     ] = { xi.mod.INT,  552,    2,  700, 577,    2,    2,     2,    2,    2,    2,    2 },
    [xi.magic.spell.TORNADO_II  ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,     2,    2,    2,    2,    2 },
    [xi.magic.spell.BLIZZARD    ] = { xi.mod.INT,   46,    1,   70,  60,  1.2,    1,    0,     0,    0,    0,    0 },
    [xi.magic.spell.BLIZZARD_II ] = { xi.mod.INT,  155,    1,  180, 178,  2.2,  1.6,    1,     0,    0,    0,    0 },
    [xi.magic.spell.BLIZZARD_III] = { xi.mod.INT,  320,  1.5,  320, 345,  2.8,  2.6,  1.8,     1,    0,    0,    0 },
    [xi.magic.spell.BLIZZARD_IV ] = { xi.mod.INT,  506,    2,  560, 541,  3.9,  3.6,  2.8,  1.96,    1,    0,    0 },
    [xi.magic.spell.BLIZZARD_V  ] = { xi.mod.INT,  829,  2.3,  850, 600,  4.4,    4,  3.8,  2.96, 1.96,    1,    0 }, -- I value unknown. Guesstimate used.
    [xi.magic.spell.BLIZZARD_VI ] = { xi.mod.INT, 1190,  2.5, 1190, 650,    5,  5.6,  4.6,   3.6,  2.8, 1.96,    1 }, -- I value unknown. Guesstimate used.
    [xi.magic.spell.FREEZE      ] = { xi.mod.INT,  552,    2,  700, 552,    2,    2,     2,    2,    2,    2,    2 },
    [xi.magic.spell.FREEZE_II   ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,     2,    2,    2,    2,    2 },
    [xi.magic.spell.FIRE        ] = { xi.mod.INT,   35,    1,   55,  46,  1.4,    1,    0,     0,    0,    0,    0 },
    [xi.magic.spell.FIRE_II     ] = { xi.mod.INT,  133,    1,  160, 155,  2.4,  1.7,    1,     0,    0,    0,    0 },
    [xi.magic.spell.FIRE_III    ] = { xi.mod.INT,  295,  1.5,  290, 320,  3.1,  2.7, 1.85,     1,    0,    0,    0 },
    [xi.magic.spell.FIRE_IV     ] = { xi.mod.INT,  472,    2,  520, 506,  4.2,  3.7, 2.85,  1.97,    1,    0,    0 },
    [xi.magic.spell.FIRE_V      ] = { xi.mod.INT,  785,  2.3,  800, 550,  4.8, 4.24, 3.85,  2.97, 1.97,    1,    0 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.FIRE_VI     ] = { xi.mod.INT, 1130,  2.5, 1130, 600,  5.5,  5.7,  4.7,   3.7, 2.85, 1.97,    1 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.FLARE       ] = { xi.mod.INT,  552,    2,  700, 684,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.FLARE_II    ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.STONE       ] = { xi.mod.INT,   10,    1,   10,  16,    2,    1,    0,     0,    0,    0,    0 },
    [xi.magic.spell.STONE_II    ] = { xi.mod.INT,   78,    1,  100,  95,    3,    2,    1,     0,    0,    0,    0 },
    [xi.magic.spell.STONE_III   ] = { xi.mod.INT,  210,  1.5,  200, 236,    4,    3,    2,     1,    0,    0,    0 },
    [xi.magic.spell.STONE_IV    ] = { xi.mod.INT,  381,    2,  400, 410,    5,    4,    3,     2,    1,    0,    0 },
    [xi.magic.spell.STONE_V     ] = { xi.mod.INT,  626,  2.3,  650, 500,    6,    5,    4,     3,    2,    1,    0 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.STONE_VI    ] = { xi.mod.INT,  950,  2.5,  950, 550,    7,    6,    5,     4,    3,    2,    1 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.QUAKE       ] = { xi.mod.INT,  552,    2,  700, 603,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.QUAKE_II    ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.THUNDER     ] = { xi.mod.INT,   60,    1,   85,  78,    1,    1,    0,     0,    0,    0,    0 },
    [xi.magic.spell.THUNDER_II  ] = { xi.mod.INT,  178,    1,  200, 210,    2,  1.5,    1,     0,    0,    0,    0 },
    [xi.magic.spell.THUNDER_III ] = { xi.mod.INT,  345,  1.5,  350, 381,  2.5,  2.5, 1.75,     1,    0,    0,    0 },
    [xi.magic.spell.THUNDER_IV  ] = { xi.mod.INT,  541,    2,  600, 626,  3.6,  3.5, 2.75,  1.95,    1,    0,    0 },
    [xi.magic.spell.THUNDER_V   ] = { xi.mod.INT,  874,  2.3,  900, 700,    4, 3.74, 3.75,  2.95, 1.95,    1,    0 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.THUNDER_VI  ] = { xi.mod.INT, 1250,  2.5, 1250, 750,  4.5,  5.5,  4.5,   3.5, 2.75, 1.95,    1 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.BURST       ] = { xi.mod.INT,  552,    2,  700, 630,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.BURST_II    ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.WATER       ] = { xi.mod.INT,   16,    1,   25,  25,  1.8,    1,    0,     0,    0,    0,    0 },
    [xi.magic.spell.WATER_II    ] = { xi.mod.INT,   95,    1,  120, 113,  2.8,  1.9,    1,     0,    0,    0,    0 },
    [xi.magic.spell.WATER_III   ] = { xi.mod.INT,  236,  1.5,  230, 265,  3.7,  2.9, 1.95,     1,    0,    0,    0 },
    [xi.magic.spell.WATER_IV    ] = { xi.mod.INT,  410,    2,  440, 440,  4.7,  3.9, 2.95,  1.99,    1,    0,    0 },
    [xi.magic.spell.WATER_V     ] = { xi.mod.INT,  680,  2.3,  700, 500,  5.6, 4.74, 3.95,  2.99, 1.99,    1,    0 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.WATER_VI    ] = { xi.mod.INT, 1010,  1.5, 1010, 550,  6.5,  5.9,  4.9,   3.9, 2.95, 1.99,    1 }, -- I value Unknown. Guesstimate used.
    [xi.magic.spell.FLOOD       ] = { xi.mod.INT,  552,    2,  700, 657,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.FLOOD_II    ] = { xi.mod.INT,  710,    2,  800, 780,    2,    2,    2,     2,    2,    2,    2 },
    [xi.magic.spell.COMET       ] = { xi.mod.INT,  964,  2.3, 1000, 850,    4, 3.75,  3.5,     3,    2,    1,    1 }, -- I value unknown. Guesstimate used.

-- Multiple target spells:
-- Structure:           [spellId] = {  Stat used, vNPC, mNPC,  vPC,   I,   M0,  M50,  M100, M200, M300, M400, M500 },
    [xi.magic.spell.AEROGA      ] = { xi.mod.INT,   93,    1,  100, 120,  2.6,  1.8,     1,    0,    0,    0,    0 },
    [xi.magic.spell.AEROGA_II   ] = { xi.mod.INT,  266,    1,  310, 312,  3.4,  2.8,   1.9,    1,    0,    0,    0 },
    [xi.magic.spell.AEROGA_III  ] = { xi.mod.INT,  527,  1.5,  580, 642,  4.4,  3.8,   2.9, 1.98,    1,    0,    0 },
    [xi.magic.spell.AEROGA_IV   ] = { xi.mod.INT,  738,    2,    0, 700,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Aero V.
    [xi.magic.spell.AEROGA_V    ] = { xi.mod.INT, 1070,  2.3,    0, 750,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Aero VI.
    [xi.magic.spell.AERA        ] = { xi.mod.INT,  210,    1,  210, 250,  2.6,  1.8,     1,    0,    0,    0,    0 },
    [xi.magic.spell.AERA_II     ] = { xi.mod.INT,  430,    1,  430, 600,  3.4,  2.8,   1.9,    1,    0,    0,    0 },
    [xi.magic.spell.AERA_III    ] = { xi.mod.INT,  710,  1.5,  710, 700,  4.4,  3.8,   2.9, 1.98,    1,    0,    0 }, -- No info found. Since Aera I and II N Values coincided with Aeroga 1 and II, used Values of Aeroga III.
    [xi.magic.spell.AEROJA      ] = { xi.mod.INT,  844,  2.3,  850, 800,  5.2,  4.5,   3.9,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.
    [xi.magic.spell.BLIZZAGA    ] = { xi.mod.INT,  145,    1,  160, 172,  2.2,  1.6,     1,    0,    0,    0,    0 },
    [xi.magic.spell.BLIZZAGA_II ] = { xi.mod.INT,  350,    1,  370, 392,  2.8,  2.6,   1.8,    1,    0,    0,    0 },
    [xi.magic.spell.BLIZZAGA_III] = { xi.mod.INT,  642,  1.5,  660, 697,  3.9,  3.6,   2.8, 1.96,    1,    0,    0 },
    [xi.magic.spell.BLIZZAGA_IV ] = { xi.mod.INT,  829,    2,    0, 800,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Blizzard V.
    [xi.magic.spell.BLIZZAGA_V  ] = { xi.mod.INT, 1190,  2.3,    0, 950,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Blizzard VI.
    [xi.magic.spell.BLIZZARA    ] = { xi.mod.INT,  270,    1,  270, 300,  2.2,  1.6,     1,    0,    0,    0,    0 },
    [xi.magic.spell.BLIZZARA_II ] = { xi.mod.INT,  510,    1,  510, 550,  2.8,  2.6,   1.8,    1,    0,    0,    0 },
    [xi.magic.spell.BLIZZARA_III] = { xi.mod.INT,  830,  1.5,  830, 850,  3.9,  3.6,   2.8, 1.96,    1,    0,    0 }, -- No info found. Since Blizzara I and II N Values coincided with Blizzaga 1 and II, used Values of Blizzaga III.
    [xi.magic.spell.BLIZZAJA    ] = { xi.mod.INT,  953,  2.3,  950, 950,  4.4,    4,   3.8,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.
    [xi.magic.spell.FIRAGA      ] = { xi.mod.INT,  120,    1,  120, 145,  2.4,  1.7,     1,    0,    0,    0,    0 },
    [xi.magic.spell.FIRAGA_II   ] = { xi.mod.INT,  312,    1,  340, 350,  3.1,  2.7,  1.85,    1,    0,    0,    0 },
    [xi.magic.spell.FIRAGA_III  ] = { xi.mod.INT,  589,  1.5,  620, 642,  4.2,  3.7,  2.85, 1.97,    1,    0,    0 },
    [xi.magic.spell.FIRAGA_IV   ] = { xi.mod.INT,  785,    2,    0, 700,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Fire V.
    [xi.magic.spell.FIRAGA_V    ] = { xi.mod.INT, 1130,  2.3,    0, 800,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Fire VI.
    [xi.magic.spell.FIRA        ] = { xi.mod.INT,  240,    1,  240, 250,  2.4,  1.7,     1,    0,    0,    0,    0 },
    [xi.magic.spell.FIRA_II     ] = { xi.mod.INT,  470,    1,  470, 500,  3.1,  2.7,  1.85,    1,    0,    0,    0 },
    [xi.magic.spell.FIRA_III    ] = { xi.mod.INT,  760,  1.5,  760, 800,  4.2,  3.7,  2.85, 1.97,    1,    0,    0 }, -- No info found. Since Fira I and II N Values coincided with Firaga 1 and II, used Values of Firaga III.
    [xi.magic.spell.FIRAJA      ] = { xi.mod.INT,  902,  2.3,  900, 950,  4.8, 4.25,  3.85,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.
    [xi.magic.spell.STONEGA     ] = { xi.mod.INT,   56,    1,   60,  74,    3,    2,     1,    0,    0,    0,    0 },
    [xi.magic.spell.STONEGA_II  ] = { xi.mod.INT,  201,    1,  250, 232,    4,    3,     2,    1,    0,    0,    0 },
    [xi.magic.spell.STONEGA_III ] = { xi.mod.INT,  434,  1.5,  500, 480,    5,    4,     3,    2,    1,    0,    0 },
    [xi.magic.spell.STONEGA_IV  ] = { xi.mod.INT,  626,    2,    0, 650,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Stone V.
    [xi.magic.spell.STONEGA_V   ] = { xi.mod.INT,  950,  2.3,    0, 950,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Stone VI.
    [xi.magic.spell.STONERA     ] = { xi.mod.INT,  150,    1,  150, 150,    3,    2,     1,    0,    0,    0,    0 },
    [xi.magic.spell.STONERA_II  ] = { xi.mod.INT,  350,    1,  350, 350,    4,    3,     2,    1,    0,    0,    0 },
    [xi.magic.spell.STONERA_III ] = { xi.mod.INT,  650,  1.5,  650, 650,    5,    4,     3,    2,    1,    0,    0 }, -- No info found. Since Stonera I and II N Values coincided with Stonega 1 and II, used Values of Stonega III.
    [xi.magic.spell.STONEJA     ] = { xi.mod.INT,  719,  2.3,  750, 750,    6,    5,     4,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.
    [xi.magic.spell.THUNDAGA    ] = { xi.mod.INT,  172,    1,  200, 201,    2,  1.5,     1,    0,    0,    0,    0 },
    [xi.magic.spell.THUNDAGA_II ] = { xi.mod.INT,  392,    1,  400, 434,  2.5,  2.5,  1.75,    1,    0,    0,    0 },
    [xi.magic.spell.THUNDAGA_III] = { xi.mod.INT,  697,  1.5,  700, 719,  3.6,  3.5,  2.75, 1.95,    1,    0,    0 },
    [xi.magic.spell.THUNDAGA_IV ] = { xi.mod.INT,  874,    2,    0, 900,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Thunder V.
    [xi.magic.spell.THUNDAGA_V  ] = { xi.mod.INT, 1250,  2.3,    0, 999,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Thunder VI.
    [xi.magic.spell.THUNDARA    ] = { xi.mod.INT,  300,    1,  300, 300,    2,  1.5,     1,    0,    0,    0,    0 },
    [xi.magic.spell.THUNDARA_II ] = { xi.mod.INT,  550,    1,  550, 550,  2.5,  2.5,  1.75,    1,    0,    0,    0 },
    [xi.magic.spell.THUNDARA_III] = { xi.mod.INT,  900,  1.5,  900, 900,  3.6,  3.5,  2.75, 1.95,    1,    0,    0 }, -- No info found. Since Thundara I and II N Values coincided with Thundaga 1 and II, used Values of Thundaga III.
    [xi.magic.spell.THUNDAJA    ] = { xi.mod.INT, 1005,  2.3, 1000, 999,    4, 3.75,  3.75,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.
    [xi.magic.spell.WATERGA     ] = { xi.mod.INT,   74,    1,   80,  96,  2.8,  1.9,     1,    0,    0,    0,    0 },
    [xi.magic.spell.WATERGA_II  ] = { xi.mod.INT,  232,    1,  280, 266,  3.7,  2.9,  1.95,    1,    0,    0,    0 },
    [xi.magic.spell.WATERGA_III ] = { xi.mod.INT,  480,  1.5,  540, 527,  4.7,  3.9,  2.95, 1.99,    1,    0,    0 },
    [xi.magic.spell.WATERGA_IV  ] = { xi.mod.INT,  680,    2,    0, 700,    1,    1,     1,    1,    1,    1,    0 }, -- Enemy only. No data found. Values taken from Water V.
    [xi.magic.spell.WATERGA_V   ] = { xi.mod.INT, 1010,  2.3,    0, 900,    1,    1,     1,    1,    1,    1,    1 }, -- Enemy only. No data found. Values taken from Water VI.
    [xi.magic.spell.WATERA      ] = { xi.mod.INT,  180,    1,  180, 200,  2.8,  1.9,     1,    0,    0,    0,    0 },
    [xi.magic.spell.WATERA_II   ] = { xi.mod.INT,  390,    1,  390, 400,  3.7,  2.9,  1.95,    1,    0,    0,    0 },
    [xi.magic.spell.WATERA_III  ] = { xi.mod.INT,  660,  1.5,  660, 700,  4.7,  3.9,  2.95, 1.99,    1,    0,    0 }, -- No info found. Since Watera I and II N Values coincided with Waterga 1 and II, used Values of Waterga III.
    [xi.magic.spell.WATERJA     ] = { xi.mod.INT,  782,  2.3,  800, 900,  5.6, 4.75,  3.95,    3,    2,    1,    0 }, -- Some values not found. Used guesstimates for M200 and M300.

-- Ninjutsu spells:
-- Structure:           [spellId] = {  Stat used, vNPC,    M,  vPC,   I }, -- Inflexion point unknown and not used ATM. Set to 100, 250 and 400, for now.
    [xi.magic.spell.DOTON_ICHI  ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.DOTON_NI    ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.DOTON_SAN   ] = { xi.mod.INT,  134,  1.5,  134, 400 },
    [xi.magic.spell.HUTON_ICHI  ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.HUTON_NI    ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.HUTON_SAN   ] = { xi.mod.INT,  134,  1.5,  134, 400 },
    [xi.magic.spell.HYOTON_ICHI ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.HYOTON_NI   ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.HYOTON_SAN  ] = { xi.mod.INT,  134,  1.5,  134, 400 },
    [xi.magic.spell.KATON_ICHI  ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.KATON_NI    ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.KATON_SAN   ] = { xi.mod.INT,  134,  1.5,  134, 400 },
    [xi.magic.spell.RAITON_ICHI ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.RAITON_NI   ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.RAITON_SAN  ] = { xi.mod.INT,  134,  1.5,  134, 400 },
    [xi.magic.spell.SUITON_ICHI ] = { xi.mod.INT,   28,  0.5,   28, 100 },
    [xi.magic.spell.SUITON_NI   ] = { xi.mod.INT,   68,    1,   68, 250 },
    [xi.magic.spell.SUITON_SAN  ] = { xi.mod.INT,  134,  1.5,  134, 400 },

-- Divine spells: https://nw6yx36onohv5j6wmzoba3nllq-ac4c6men2g7xr2a-wiki-ffo-jp.translate.goog/html/1963.html
-- Structure:           [spellId] = {  Stat used, vNPC,    M,  vPC,   I },
    [xi.magic.spell.BANISH      ] = { xi.mod.MND,  14,     1,   14,  25 },
    [xi.magic.spell.BANISH_II   ] = { xi.mod.MND,  85,     1,   85, 113 },
    [xi.magic.spell.BANISH_III  ] = { xi.mod.MND, 198,   1.5,  198, 250 },
    [xi.magic.spell.BANISH_IV   ] = { xi.mod.MND, 420,   1.5,  420, 400 }, -- Enemy only. Stats unknown/unchecked.
    [xi.magic.spell.BANISHGA    ] = { xi.mod.MND,  50,     1,   50,  46 },
    [xi.magic.spell.BANISHGA_II ] = { xi.mod.MND, 180,     1,  180, 133 },
    [xi.magic.spell.BANISHGA_III] = { xi.mod.MND, 480,   1.5,  480, 450 }, -- Enemy only. Stats unknown.
    [xi.magic.spell.BANISHGA_IV ] = { xi.mod.MND, 600,   1.5,  600, 600 }, -- Enemy only. Stats unknown.
    [xi.magic.spell.HOLY        ] = { xi.mod.MND, 125,     1,  125, 150 },
    [xi.magic.spell.HOLY_II     ] = { xi.mod.MND, 250,     2,  250, 300 },

}

xi.spells.parameters.enhancingSong =
{
--                                          1     2                  3                       4                       5                         6                     7     8    9    10   11  12
-- Structure:                 [spellId] = { Tier, Main Effect,       subEffect,              Main Modifier,          Merit Effect,             Job-Point Effect,     power Scap Pcap Mult Div SVP },
    -- Ballad
    [xi.magic.spell.MAGES_BALLAD      ] = { 1, xi.effect.BALLAD,    xi.mod.AUGMENT_SONG_STAT, xi.mod.BALLAD_EFFECT,   0,                        0,                    1,   0,   1,   1,  0, true  },
    [xi.magic.spell.MAGES_BALLAD_II   ] = { 2, xi.effect.BALLAD,    xi.mod.AUGMENT_SONG_STAT, xi.mod.BALLAD_EFFECT,   0,                        0,                    2,   0,   2,   1,  0, true  },
    [xi.magic.spell.MAGES_BALLAD_III  ] = { 3, xi.effect.BALLAD,    xi.mod.AUGMENT_SONG_STAT, xi.mod.BALLAD_EFFECT,   0,                        0,                    3,   0,   3,   1,  0, true  },
    -- Carol - NOTE: CAROL II Gives a fixed elemental evasion. However, it also gives a Elemental Nullification effect, that follows regular song rules concerning power.
    [xi.magic.spell.FIRE_CAROL        ] = { 1, xi.effect.CAROL,     xi.magic.ele.FIRE,        xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.ICE_CAROL         ] = { 1, xi.effect.CAROL,     xi.magic.ele.ICE,         xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.WIND_CAROL        ] = { 1, xi.effect.CAROL,     xi.magic.ele.WIND,        xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.EARTH_CAROL       ] = { 1, xi.effect.CAROL,     xi.magic.ele.EARTH,       xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.LIGHTNING_CAROL   ] = { 1, xi.effect.CAROL,     xi.magic.ele.LIGHTNING,   xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.WATER_CAROL       ] = { 1, xi.effect.CAROL,     xi.magic.ele.WATER,       xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.LIGHT_CAROL       ] = { 1, xi.effect.CAROL,     xi.magic.ele.LIGHT,       xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.DARK_CAROL        ] = { 1, xi.effect.CAROL,     xi.magic.ele.DARK,        xi.mod.CAROL_EFFECT,    0,                        0,                   20, 200,  80,   8, 10, true  },
    -- [xi.magic.spell.FIRE_CAROL_II     ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.FIRE,        xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.ICE_CAROL_II      ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.ICE,         xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.WIND_CAROL_II     ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.WIND,        xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.EARTH_CAROL_II    ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.EARTH,       xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.LIGHTNING_CAROL_II] = { 2, xi.effect.CAROL_II,  xi.magic.ele.LIGHTNING,   xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.WATER_CAROL_II    ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.WATER,       xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.LIGHT_CAROL_II    ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.LIGHT,       xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- [xi.magic.spell.DARK_CAROL_II     ] = { 2, xi.effect.CAROL_II,  xi.magic.ele.DARK,        xi.mod.ETUDE_EFFECT,    0,                        0,                   10, 400,  15, 1.5, 10, true  },
    -- Etude
    [xi.magic.spell.SINEWY_ETUDE      ] = { 1, xi.effect.ETUDE,     xi.mod.STR,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.DEXTROUS_ETUDE    ] = { 1, xi.effect.ETUDE,     xi.mod.DEX,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.VIVACIOUS_ETUDE   ] = { 1, xi.effect.ETUDE,     xi.mod.VIT,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.QUICK_ETUDE       ] = { 1, xi.effect.ETUDE,     xi.mod.AGI,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.LEARNED_ETUDE     ] = { 1, xi.effect.ETUDE,     xi.mod.INT,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.SPIRITED_ETUDE    ] = { 1, xi.effect.ETUDE,     xi.mod.MND,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.ENCHANTING_ETUDE  ] = { 1, xi.effect.ETUDE,     xi.mod.CHR,               xi.mod.ETUDE_EFFECT,    0,                        0,                    3,   0,   9,   1,  0, true  },
    [xi.magic.spell.HERCULEAN_ETUDE   ] = { 2, xi.effect.ETUDE,     xi.mod.STR,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.UNCANNY_ETUDE     ] = { 2, xi.effect.ETUDE,     xi.mod.DEX,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.VITAL_ETUDE       ] = { 2, xi.effect.ETUDE,     xi.mod.VIT,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.SWIFT_ETUDE       ] = { 2, xi.effect.ETUDE,     xi.mod.AGI,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.SAGE_ETUDE        ] = { 2, xi.effect.ETUDE,     xi.mod.INT,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.LOGICAL_ETUDE     ] = { 2, xi.effect.ETUDE,     xi.mod.MND,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    [xi.magic.spell.BEWITCHING_ETUDE  ] = { 2, xi.effect.ETUDE,     xi.mod.CHR,               xi.mod.ETUDE_EFFECT,    0,                        0,                   12,   0,  15,   1,  0, true  },
    -- Madrigal: ADMITEDLY MADE UP IN ORIGINAL SCRIPT
    [xi.magic.spell.SWORD_MADRIGAL    ] = { 1, xi.effect.MADRIGAL,  xi.mod.AUGMENT_SONG_STAT, xi.mod.MADRIGAL_EFFECT, xi.merit.MADRIGAL_EFFECT, 0,                    5,  85,  45, 4.5, 18, true  },
    [xi.magic.spell.BLADE_MADRIGAL    ] = { 2, xi.effect.MADRIGAL,  xi.mod.AUGMENT_SONG_STAT, xi.mod.MADRIGAL_EFFECT, xi.merit.MADRIGAL_EFFECT, 0,                    9, 130,  60,   6, 18, true  },
    -- Mambo: ADMITEDLY MADE UP IN ORIGINAL SCRIPT
    [xi.magic.spell.SHEEPFOE_MAMBO    ] = { 1, xi.effect.MAMBO,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MAMBO_EFFECT,    0,                        0,                    5,  85,  48,   5, 18, true  },
    [xi.magic.spell.DRAGONFOE_MAMBO   ] = { 2, xi.effect.MAMBO,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MAMBO_EFFECT,    0,                        0,                    9, 130,  48,   7, 18, true  },
    -- March
    [xi.magic.spell.ADVANCING_MARCH   ] = { 1, xi.effect.MARCH,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MARCH_EFFECT,    0,                        0,                   35, 200, 108,  11,  7, true  },
    [xi.magic.spell.VICTORY_MARCH     ] = { 2, xi.effect.MARCH,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MARCH_EFFECT,    0,                        0,                   43, 300, 163,  16,  7, true  },
    [xi.magic.spell.HONOR_MARCH       ] = { 3, xi.effect.MARCH,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MARCH_EFFECT,    0,                        0,                   24, 400, 126,  12,  7, true  }, -- Not an error. It is weaker.
    -- Minne: Skill Caps unknown?
    [xi.magic.spell.KNIGHTS_MINNE     ] = { 1, xi.effect.MINNE,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MINNE_EFFECT,    xi.merit.MINNE_EFFECT,    xi.jp.MINNE_EFFECT,   8,   0,  30,   3, 10, true  },
    [xi.magic.spell.KNIGHTS_MINNE_II  ] = { 2, xi.effect.MINNE,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MINNE_EFFECT,    xi.merit.MINNE_EFFECT,    xi.jp.MINNE_EFFECT,  12,   0,  69,   7, 10, true  },
    [xi.magic.spell.KNIGHTS_MINNE_III ] = { 3, xi.effect.MINNE,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MINNE_EFFECT,    xi.merit.MINNE_EFFECT,    xi.jp.MINNE_EFFECT,  18,   0, 108,  11, 10, true  },
    [xi.magic.spell.KNIGHTS_MINNE_IV  ] = { 4, xi.effect.MINNE,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MINNE_EFFECT,    xi.merit.MINNE_EFFECT,    xi.jp.MINNE_EFFECT,  30,   0, 164,  16, 10, true  },
    [xi.magic.spell.KNIGHTS_MINNE_V   ] = { 5, xi.effect.MINNE,     xi.mod.AUGMENT_SONG_STAT, xi.mod.MINNE_EFFECT,    xi.merit.MINNE_EFFECT,    xi.jp.MINNE_EFFECT,  50,   0, 204,  20, 10, true  },
    -- Minuet
    [xi.magic.spell.VALOR_MINUET      ] = { 1, xi.effect.MINUET,    xi.mod.AUGMENT_SONG_STAT, xi.mod.MINUET_EFFECT,   xi.merit.MINUET_EFFECT,   xi.jp.MINUET_EFFECT,  5,  50,  32,   3,  8, true  },
    [xi.magic.spell.VALOR_MINUET_II   ] = { 2, xi.effect.MINUET,    xi.mod.AUGMENT_SONG_STAT, xi.mod.MINUET_EFFECT,   xi.merit.MINUET_EFFECT,   xi.jp.MINUET_EFFECT, 10, 100,  64,   6,  6, true  },
    [xi.magic.spell.VALOR_MINUET_III  ] = { 3, xi.effect.MINUET,    xi.mod.AUGMENT_SONG_STAT, xi.mod.MINUET_EFFECT,   xi.merit.MINUET_EFFECT,   xi.jp.MINUET_EFFECT, 24, 200,  96,   9,  6, true  },
    [xi.magic.spell.VALOR_MINUET_IV   ] = { 4, xi.effect.MINUET,    xi.mod.AUGMENT_SONG_STAT, xi.mod.MINUET_EFFECT,   xi.merit.MINUET_EFFECT,   xi.jp.MINUET_EFFECT, 31, 300, 112,  11,  6, true  },
    [xi.magic.spell.VALOR_MINUET_V    ] = { 5, xi.effect.MINUET,    xi.mod.AUGMENT_SONG_STAT, xi.mod.MINUET_EFFECT,   xi.merit.MINUET_EFFECT,   xi.jp.MINUET_EFFECT, 32, 500, 124,  12,  6, true  },
    -- Paeon
    [xi.magic.spell.ARMYS_PAEON       ] = { 1, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    1, 100,   2,   1,  0, true  },
    [xi.magic.spell.ARMYS_PAEON_II    ] = { 2, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    2, 150,   3,   1,  0, true  },
    [xi.magic.spell.ARMYS_PAEON_III   ] = { 3, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    3, 200,   4,   1,  0, true  },
    [xi.magic.spell.ARMYS_PAEON_IV    ] = { 4, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    4, 250,   5,   1,  0, true  },
    [xi.magic.spell.ARMYS_PAEON_V     ] = { 5, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    5, 350,   7,   1,  0, true  },
    [xi.magic.spell.ARMYS_PAEON_VI    ] = { 6, xi.effect.PAEON,     xi.mod.AUGMENT_SONG_STAT, xi.mod.PAEON_EFFECT,    0,                        0,                    6, 450,   8,   1,  0, true  },
    -- Prelude
    [xi.magic.spell.HUNTERS_PRELUDE   ] = { 1, xi.effect.PRELUDE,   xi.mod.AUGMENT_SONG_STAT, xi.mod.PRELUDE_EFFECT,  0,                        0,                   10,  85,  45, 4.5, 18, true  },
    [xi.magic.spell.ARCHERS_PRELUDE   ] = { 2, xi.effect.PRELUDE,   xi.mod.AUGMENT_SONG_STAT, xi.mod.PRELUDE_EFFECT,  0,                        0,                   20, 130,  60,   6, 18, true  },
    -- Status effect resistance: Aubade, Capriccio, Gavotte, Operetta, Pastoral,
    [xi.magic.spell.FOWL_AUBADE       ] = { 1, xi.effect.AUBADE,    xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.GOLD_CAPRICCIO    ] = { 1, xi.effect.CAPRICCIO, xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.GOBLIN_GAVOTTE    ] = { 1, xi.effect.GAVOTTE,   xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.SCOPS_OPERETTA    ] = { 1, xi.effect.OPERETTA,  xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.PUPPETS_OPERETTA  ] = { 2, xi.effect.OPERETTA,  xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   40, 200, 120,   8, 10, true  },
    [xi.magic.spell.HERB_PASTORAL     ] = { 1, xi.effect.PASTORAL,  xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.SHINING_FANTASIA  ] = { 1, xi.effect.FANTASIA,  xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    [xi.magic.spell.WARDING_ROUND     ] = { 1, xi.effect.ROUND,     xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   20, 200,  80,   8, 10, true  },
    -- Misc.
    [xi.magic.spell.GODDESSS_HYMNUS   ] = { 1, xi.effect.HYMNUS,    xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                    1,   0,   1,   0,  0, false },
    [xi.magic.spell.SENTINELS_SCHERZO ] = { 1, xi.effect.SCHERZO,   xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                    1, 350,  45,   1, 10, false },
    [xi.magic.spell.RAPTOR_MAZURKA    ] = { 1, xi.effect.MAZURKA,   xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   12,   0,  12,   0,  0, false },
    [xi.magic.spell.CHOCOBO_MAZURKA   ] = { 1, xi.effect.MAZURKA,   xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   24,   0,  24,   0,  0, false },

    -- Emnity Songs
    [xi.magic.spell.FOE_SIRVENTE      ] = { 1, xi.effect.SIRVENTE,  xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   35,   0,  35,   1,  0, true  },
    [xi.magic.spell.ADVENTURERS_DIRGE ] = { 1, xi.effect.DIRGE,     xi.mod.AUGMENT_SONG_STAT, 0,                      0,                        0,                   32,   0,  32,   0,  0, true  },
}
