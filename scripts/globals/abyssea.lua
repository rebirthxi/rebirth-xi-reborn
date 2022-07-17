-----------------------------------
-- Abyssea Global
-----------------------------------
require("scripts/globals/spell_data")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
-----------------------------------
xi = xi or {}
xi.abyssea = xi.abyssea or {}

xi.abyssea.exitPositions =
{
    [xi.zone.ABYSSEA_KONSCHTAT]  = {   88.4, -68.09, -579.97, 128, 108 },
    [xi.zone.ABYSSEA_TAHRONGI]   = {  -28.6,  46.17,  -680.3, 192, 117 },
    [xi.zone.ABYSSEA_LA_THEINE]  = {   -562,      0,     640, 158, 102 },
    [xi.zone.ABYSSEA_ATTOHWA]    = {   -340, -23.36,   48.49,  31, 118 },
    [xi.zone.ABYSSEA_MISAREAUX]  = { 363.47,      0, -119.72, 129, 103 },
    [xi.zone.ABYSSEA_VUNKERL]    = { 242.98,   0.24,    8.72, 157, 104 },
    [xi.zone.ABYSSEA_ALTEPA]     = {    340,  -0.52,    -668, 192, 107 },
    [xi.zone.ABYSSEA_ULEGUERAND] = {    270,   -7.8,     -82,  64, 112 },
    [xi.zone.ABYSSEA_GRAUBERG]   = {    -64,      0,     600,   0, 106 },
}

xi.abyssea.lightType =
{
    PEARL   = 1,
    GOLDEN  = 2,
    SILVERY = 3,
    EBON    = 4,
    AZURE   = 5,
    RUBY    = 6,
    AMBER   = 7,
}

local lightData =
{-- Light Type                         Cap  Maximum Tier
    [xi.abyssea.lightType.PEARL  ] = { 230, 2 },
    [xi.abyssea.lightType.GOLDEN ] = { 200, 2 },
    [xi.abyssea.lightType.SILVERY] = { 200, 2 },
    [xi.abyssea.lightType.EBON   ] = { 200, 2 },
    [xi.abyssea.lightType.AZURE  ] = { 255, 4 },
    [xi.abyssea.lightType.RUBY   ] = { 255, 4 },
    [xi.abyssea.lightType.AMBER  ] = { 255, 4 },
}

xi.abyssea.abyssiteType =
{
    SOJOURN      =  1,
    CELERITY     =  2,
    AVARICE      =  3,
    CONFLUENCE   =  4,
    EXPERTISE    =  5,
    FORTUNE      =  6,
    KISMET       =  7,
    PROSPERITY   =  8,
    DESTINY      =  9,
    ACUMEN       = 10,
    LENITY       = 11,
    PERSPICACITY = 12,
    THE_REAPER   = 13,
    GUERDON      = 14,
    FURTHERANCE  = 15,
    MERIT        = 16,
    LUNAR        = 17,
    DISCERNMENT  = 18,
    COSMOS       = 19,
    DEMILUNE     = 20,
}

-- Sequential Abyssite Key Items.
-- NOTE: Demilune is not sequential, and handled in a separate table
local abyssiteKeyItems =
{--  Type                                      Beginning KI                            Ending KI
    [xi.abyssea.abyssiteType.SOJOURN     ] = { xi.ki.IVORY_ABYSSITE_OF_SOJOURN,        xi.ki.EMERALD_ABYSSITE_OF_SOJOURN    },
    [xi.abyssea.abyssiteType.CELERITY    ] = { xi.ki.AZURE_ABYSSITE_OF_CELERITY,       xi.ki.IVORY_ABYSSITE_OF_CELERITY     },
    [xi.abyssea.abyssiteType.AVARICE     ] = { xi.ki.VIRIDIAN_ABYSSITE_OF_AVARICE,     xi.ki.VERMILLION_ABYSSITE_OF_AVARICE },
    [xi.abyssea.abyssiteType.CONFLUENCE  ] = { xi.ki.IVORY_ABYSSITE_OF_CONFLUENCE,     xi.ki.INDIGO_ABYSSITE_OF_CONFLUENCE  },
    [xi.abyssea.abyssiteType.EXPERTISE   ] = { xi.ki.IVORY_ABYSSITE_OF_EXPERTISE,      xi.ki.EMERALD_ABYSSITE_OF_EXPERTISE  },
    [xi.abyssea.abyssiteType.FORTUNE     ] = { xi.ki.IVORY_ABYSSITE_OF_FORTUNE,        xi.ki.EMERALD_ABYSSITE_OF_FORTUNE    },
    [xi.abyssea.abyssiteType.KISMET      ] = { xi.ki.SCARLET_ABYSSITE_OF_KISMET,       xi.ki.VERMILLION_ABYSSITE_OF_KISMET  },
    [xi.abyssea.abyssiteType.PROSPERITY  ] = { xi.ki.AZURE_ABYSSITE_OF_PROSPERITY,     xi.ki.IVORY_ABYSSITE_OF_PROSPERITY   },
    [xi.abyssea.abyssiteType.DESTINY     ] = { xi.ki.VIRIDIAN_ABYSSITE_OF_DESTINY,     xi.ki.IVORY_ABYSSITE_OF_DESTINY      },
    [xi.abyssea.abyssiteType.ACUMEN      ] = { xi.ki.IVORY_ABYSSITE_OF_ACUMEN,         xi.ki.EMERALD_ABYSSITE_OF_ACUMEN     },
    [xi.abyssea.abyssiteType.LENITY      ] = { xi.ki.SCARLET_ABYSSITE_OF_LENITY,       xi.ki.EMERALD_ABYSSITE_OF_LENITY     },
    [xi.abyssea.abyssiteType.PERSPICACITY] = { xi.ki.SCARLET_ABYSSITE_OF_PERSPICACITY, xi.ki.VERM_ABYSSITE_OF_PERSPICACITY  },
    [xi.abyssea.abyssiteType.THE_REAPER  ] = { xi.ki.AZURE_ABYSSITE_OF_THE_REAPER,     xi.ki.INDIGO_ABYSSITE_OF_THE_REAPER  },
    [xi.abyssea.abyssiteType.GUERDON     ] = { xi.ki.VIRIDIAN_ABYSSITE_OF_GUERDON,     xi.ki.VERMILLION_ABYSSITE_OF_GUERDON },
    [xi.abyssea.abyssiteType.FURTHERANCE ] = { xi.ki.SCARLET_ABYSSITE_OF_FURTHERANCE,  xi.ki.IVORY_ABYSSITE_OF_FURTHERANCE  },
    [xi.abyssea.abyssiteType.MERIT       ] = { xi.ki.AZURE_ABYSSITE_OF_MERIT,          xi.ki.INDIGO_ABYSSITE_OF_MERIT       },
    [xi.abyssea.abyssiteType.LUNAR       ] = { xi.ki.LUNAR_ABYSSITE1,                  xi.ki.LUNAR_ABYSSITE3                },
    [xi.abyssea.abyssiteType.DISCERNMENT ] = { xi.ki.ABYSSITE_OF_DISCERNMENT,          xi.ki.ABYSSITE_OF_DISCERNMENT        },
    [xi.abyssea.abyssiteType.COSMOS      ] = { xi.ki.ABYSSITE_OF_THE_COSMOS,           xi.ki.ABYSSITE_OF_THE_COSMOS         },
}

local demiluneKeyItems =
{
    xi.ki.CLEAR_DEMILUNE_ABYSSITE,
    xi.ki.COLORFUL_DEMILUNE_ABYSSITE,
    xi.ki.SCARLET_DEMILUNE_ABYSSITE,
    xi.ki.AZURE_DEMILUNE_ABYSSITE,
    xi.ki.VIRIDIAN_DEMILUNE_ABYSSITE,
    xi.ki.JADE_DEMILUNE_ABYSSITE,
    xi.ki.SAPPHIRE_DEMILUNE_ABYSSITE,
    xi.ki.CRIMSON_DEMILUNE_ABYSSITE,
    xi.ki.EMERALD_DEMILUNE_ABYSSITE,
    xi.ki.VERMILLION_DEMILUNE_ABYSSITE,
    xi.ki.INDIGO_DEMILUNE_ABYSSITE,
}

-- TODO: Separate by zone
xi.abyssea.mob =
{
    -- Attohwa Chasm
    ['Amun']          = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.SHRIVELED_HECTEYES_STALK   } },
    ['Berstuk']       = { ['Atma'] = { xi.ki.ATMA_OF_THE_GLUTINOUS_OOZE    }, ['Normal'] = {                                  } },
    ['Blazing_Eruca'] = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.BULBOUS_CRAWLER_COCOON     } },
    ['Drekavac']      = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.WRITHING_GHOST_FINGER      } },
    ['Gieremund']     = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.RUSTED_HOUND_COLLAR        } },
    ['Gaizkin']       = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.BLOTCHED_DOOMED_TONGUE     } },
    ['Granite_Borer'] = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.VENOMOUS_WAMOURA_FEELER    } },
    ['Itzpapalotl']   = { ['Atma'] = { xi.ki.ATMA_OF_THE_CLAWED_BUTTERFLY  }, ['Normal'] = {                                  } },
    ['Kampe']         = { ['Atma'] = { xi.ki.ATMA_OF_THE_GOLDEN_CLAW       }, ['Normal'] = {                                  } },
    ['Kharon']        = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.CRACKED_SKELETON_CLAVICLE  } },
    ['Maahes']        = { ['Atma'] = { xi.ki.ATMA_OF_THE_LIGHTNING_BEAST   }, ['Normal'] = {                                  } },
    ['Mielikki']      = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.JADE_ABYSSITE_OF_SOJOURN   } },
    ['Nightshade']    = { ['Atma'] = { xi.ki.ATMA_OF_THE_NOXIOUS_BLOOM     }, ['Normal'] = {                                  } },
    ['Pallid_Percy']  = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.MUCID_WORM_SEGMENT         } },
    ['Smok']          = { ['Atma'] = { xi.ki.ATMA_OF_THE_SMOLDERING_SKY    }, ['Normal'] = {                                  } },
    ['Svarbhanu']     = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.HOLLOW_DRAGON_EYE          } },
    ['Titlacauan']    = { ['Atma'] = { xi.ki.ATMA_OF_UNDYING               }, ['Normal'] = {                                  } },
    ['Tunga']         = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.DISTENDED_CHIGOE_ABDOMEN   } },
    ['Ulhuadshi']     = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.JADE_ABYSSITE_OF_MERIT     } },
    ['Wherwetrice']   = { ['Atma'] = {                                     }, ['Normal'] = { xi.ki.JADE_ABYSSITE_OF_EXPERTISE } },
    ['Yaanei']        = { ['Atma'] = { xi.ki.ATMA_OF_THE_IMPREGNABLE_TOWER }, ['Normal'] = {                                  } },

    -- Konschtat Highlands
    ['Gangly_Gean']        = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.FRAGRANT_TREANT_PETAL    } },
    ['Raskovnik']          = { ['Atma'] = { xi.ki.ATMA_OF_THRASHING_TENDRILS   }, ['Normal'] = { xi.ki.FETID_RAFFLESIA_STALK    } },
    ['Clingy_Clare']       = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.DECAYING_MORBOL_TOOTH    } },
    ['Fistule']            = { ['Atma'] = { xi.ki.ATMA_OF_VICISSITUDE          }, ['Normal'] = { xi.ki.TURBID_SLIME_OIL         } },
    ['Kukulkan']           = { ['Atma'] = { xi.ki.ATMA_OF_THE_NOXIOUS_FANG     }, ['Normal'] = { xi.ki.VENOMOUS_PEISTE_CLAW     } },
    ['Tonberry_Lieje']     = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.TWISTED_TONBERRY_CROWN   } },
    ['Alkonost']           = { ['Atma'] = { xi.ki.ATMA_OF_GALES                }, ['Normal'] = { xi.ki.TATTERED_HIPPOGRYPH_WING } },
    ['Keratyrannos']       = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.CRACKED_WIVRE_HORN       } },
    ['Arimaspi']           = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.MUCID_AHRIMAN_EYEBALL    } },
    ['Balaur']             = { ['Atma'] = { xi.ki.ATMA_OF_STORMBREATH          }, ['Normal'] = {                                } },
    ['Bloodeye_Vileberry'] = { ['Atma'] = { xi.ki.ATMA_OF_CLOAK_AND_DAGGER     }, ['Normal'] = {                                } },
    ['Eccentric_Eve']      = { ['Atma'] = { xi.ki.ATMA_OF_THE_VORACIOUS_VIOLET }, ['Normal'] = {                                } },
    ['Fear_Gorta']         = { ['Atma'] = { xi.ki.AZURE_ABYSSITE_OF_THE_REAPER }, ['Normal'] = {                                } },
    ['Khalamari']          = { ['Atma'] = { xi.ki.ATMA_OF_THE_DRIFTER          }, ['Normal'] = {                                } },
    ['Pavan']              = { ['Atma'] = { xi.ki.AZURE_ABYSSITE_OF_LENITY     }, ['Normal'] = {                                } },
    ['Turul']              = { ['Atma'] = { xi.ki.ATMA_OF_THE_STORMBIRD        }, ['Normal'] = {                                } },

    --La Thiene Plateau
    ['Trudging_Thomas']     = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.MARBLED_MUTTON_CHOP      } },
    ['Megantereon']         = { ['Atma'] = { xi.ki.ATMA_OF_THE_SAVAGE_TIGER                               }, ['Normal'] = { xi.ki.BLOODIED_SABER_TOOTH     } },
    ['Briareus']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_STOUT_ARM                                  }, ['Normal'] = { xi.ki.BLOOD_SMEARED_GIGAS_HELM } },
    ['La_Theine_Liege']     = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.PELLUCID_FLY_EYE         } },
    ['Baba_Yaga']           = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.SHIMMERING_PIXIE_PINION  } },
    ['Pantagruel']          = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.WARPED_GIGAS_ARMBAND     } },
    ['Grandgousier']        = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.SEVERED_GIGAS_COLLAR     } },
    ['Adamastor']           = { ['Atma'] = {                                                              }, ['Normal'] = { xi.ki.DENTED_GIGAS_SHIELD      } },
    ['Carabosse']           = { ['Atma'] = { xi.ki.ATMA_OF_ALLURE                                         }, ['Normal'] = { xi.ki.GLITTERING_PIXIE_CHOKER  } },
    ['Chasmic_Hornet']      = { ['Atma'] = { xi.ki.SCARLET_ABYSSITE_OF_PERSPICACITY                       }, ['Normal'] = {                                } },
    ['Dozing_Dorian']       = { ['Atma'] = { xi.ki.ATMA_OF_THE_EBON_HOOF                                  }, ['Normal'] = {                                } },
    ['Hadhayosh']           = { ['Atma'] = { xi.ki.ATMA_OF_THE_LION                                       }, ['Normal'] = {                                } },
    ['Karkinos']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_TWIN_CLAW                                  }, ['Normal'] = {                                } },
    ['Lugarhoo']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_BAYING_MOON                                }, ['Normal'] = {                                } },
    ['Mangy-tailed_Marvin'] = { ['Atma'] = { xi.ki.SCARLET_ABYSSITE_OF_LENITY                             }, ['Normal'] = {                                } },
    ['Megamaw_Mikey']       = { ['Atma'] = { xi.ki.ATMA_OF_TREMORS                                        }, ['Normal'] = {                                } },
    ['Ovni']                = { ['Atma'] = { xi.ki.ATMA_OF_THE_HEAVENS, xi.ki.SCARLET_ABYSSITE_OF_SOJOURN }, ['Normal'] = {                                } },

    -- Misareaux Coast
    ['Abyssic_Cluster']     = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.BLAZING_CLUSTER_SOUL             } },
    ['Amhuluk']             = { ['Atma'] = { xi.ki.ATMA_OF_THE_STRANGLING_WIND  }, ['Normal'] = {                                        } },
    ['Asanbosam']           = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.BLOODIED_BAT_FUR                 } },
    ['Avalerion']           = { ['Atma'] = { xi.ki.ATMA_OF_THE_WINGED_ENIGMA    }, ['Normal'] = {                                        } },
    ['Cep-Kamuy']           = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.GLISTENING_OROBON_LIVER          } },
    ['Cirein-croin']        = { ['Atma'] = { xi.ki.ATMA_OF_THE_DEEP_DEVOURER    }, ['Normal'] = {                                        } },
    ['Flame_Skimmer']       = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.SAPPHIRE_ABYSSITE_OF_FURTHERANCE } },
    ['Funereal_Apkallu']    = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.JAGGED_APKALLU_BEAK              } },
    ['Gukumatz']            = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.MOLTED_PEISTE_SKIN               } },
    ['Heqet']               = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.DOFFED_POROGGO_HAT               } },
    ['Ironclad_Observer']   = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.SCALDING_IRONCLAD_SPIKE          } },
    ['Ironclad_Pulverizer'] = { ['Atma'] = { xi.ki.ATMA_OF_THE_RAZED_RUIN       }, ['Normal'] = {                                        } },
    ['Karkatakam']          = { ['Atma'] = { xi.ki.ATMA_OF_THE_CRADLE           }, ['Normal'] = {                                        } },
    ['Kutharei']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_MOUNTED_CHAMPION }, ['Normal'] = {                                        } },
    ['Manohra']             = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.CLIPPED_BIRD_WING                } },
    ['Minax_Bugard']        = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.BLOODSTAINED_BUGARD_FANG         } },
    ['Nehebkau']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_RAPID_REPTILIAN  }, ['Normal'] = {                                        } },
    ['Nonno']               = { ['Atma'] = { xi.ki.ATMA_OF_THE_UNTOUCHED        }, ['Normal'] = {                                        } },
    ['Npfundlwa']           = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.SAPPHIRE_ABYSSITE_OF_FORTUNE     } },
    ['Sirrush']             = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.GNARLED_LIZARD_NAIL              } },
    ['Sobek']               = { ['Atma'] = { xi.ki.ATMA_OF_THE_GNARLED_HORN     }, ['Normal'] = {                                        } },
    ['Tuskertrap']          = { ['Atma'] = {                                    }, ['Normal'] = { xi.ki.SAPPHIRE_ABYSSITE_OF_LENITY      } },

    -- Tahrongi Canyon
    ['Adze']            = { ['Atma'] = { xi.ki.ATMA_OF_CALAMITY                                        }, ['Normal'] = { xi.ki.STICKY_GNAT_WING            } },
    ['Ophanim']         = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.VEINOUS_HECTEYES_EYELID     } },
    ['Treble_Noctules'] = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.TORN_BAT_WING               } },
    ['Hedetet']         = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.GORY_SCORPION_CLAW          } },
    ['Chukwa']          = { ['Atma'] = { xi.ki.ATMA_OF_THE_ADAMANTINE                                  }, ['Normal'] = { xi.ki.MOSSY_ADAMANTOISE_SHELL     } },
    ['Alectryon']       = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.FAT_LINED_COCKATRICE_SKIN   } },
    ['Minhocao']        = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.SODDEN_SANDWORM_HUSK        } },
    ['Muscaliet']       = { ['Atma'] = {                                                               }, ['Normal'] = { xi.ki.LUXURIANT_MANTICORE_MANE    } },
    ['Chloris']         = { ['Atma'] = { xi.ki.ATMA_OF_THE_HARVESTER                                   }, ['Normal'] = { xi.ki.OVERGROWN_MANDRAGORA_FLOWER } },
    ['Glavoid']         = { ['Atma'] = { xi.ki.ATMA_OF_DUNES                                           }, ['Normal'] = { xi.ki.CHIPPED_SANDWORM_TOOTH      } },
    ['Bhumi']           = { ['Atma'] = { xi.ki.VIRIDIAN_ABYSSITE_OF_MERIT                              }, ['Normal'] = {                                   } },
    ['Cuelebre']        = { ['Atma'] = { xi.ki.VIRIDIAN_ABYSSITE_OF_DESTINY, xi.ki.ATMA_OF_THE_CLAW    }, ['Normal'] = {                                   } },
    ['Iratham']         = { ['Atma'] = { xi.ki.ATMA_OF_THE_COSMOS                                      }, ['Normal'] = {                                   } },
    ['Lacovie']         = { ['Atma'] = { xi.ki.ATMA_OF_THE_STRONGHOLD                                  }, ['Normal'] = {                                   } },
    ['Manananggal']     = { ['Atma'] = { xi.ki.VIRIDIAN_ABYSSITE_OF_DESTINY                            }, ['Normal'] = {                                   } },
    ['Mictlantecuhtli'] = { ['Atma'] = { xi.ki.ATMA_OF_BALEFUL_BONES, xi.ki.VIRIDIAN_ABYSSITE_OF_MERIT }, ['Normal'] = {                                   } },
    ['Myrmecoleon']     = { ['Atma'] = { xi.ki.ATMA_OF_THE_IMPALER                                     }, ['Normal'] = {                                   } },
    ['Quetzalli']       = { ['Atma'] = { xi.ki.VIRIDIAN_ABYSSITE_OF_AVARICE                            }, ['Normal'] = {                                   } },

    -- Vunkerl Inlet
    ['Armillaria']             = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.CRIMSON_ABYSSITE_OF_ACUMEN     } },
    ['Ayravata']               = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.MALODOROUS_MARID_FUR           } },
    ['Bukhis']                 = { ['Atma'] = { xi.ki.ATMA_OF_THE_SANGUINE_SCYTHE     }, ['Normal'] = {                                      } },
    ['Chhir_Batti']            = { ['Atma'] = { xi.ki.ATMA_OF_THE_MURKY_MIASMA        }, ['Normal'] = {                                      } },
    ['Div-e_Sepid']            = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.CHIPPED_IMPS_OLIFANT           } },
    ['Durinn']                 = { ['Atma'] = { xi.ki.ATMA_OF_THE_MINIKIN_MONSTROSITY }, ['Normal'] = {                                      } },
    ['Dvalinn']                = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.DECAYED_DVERGR_TOOTH           } },
    ['Hanuman']                = { ['Atma'] = { xi.ki.ATMA_OF_THE_AVARICIOUS_APE      }, ['Normal'] = {                                      } },
    ['Hrosshvalur']            = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.SHIMMERING_PUGIL_SCALE         } },
    ['Iktomi']                 = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.CRIMSON_ABYSSITE_OF_DESTINY    } },
    ['Iku-Turso']              = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.GLOSSY_SEA_MONK_SUCKER         } },
    ['Kadraeth_the_Hatespawn'] = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.PULSATING_SOULFLAYER_BEARD     } },
    ['Karkadann']              = { ['Atma'] = { xi.ki.ATMA_OF_THE_BLINDING_HORN       }, ['Normal'] = {                                      } },
    ['Khalkotaur']             = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.INGROWN_TAURUS_NAIL            } },
    ['Lord_Varney']            = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.IMBRUED_VAMPYR_FANG            } },
    ['Pascerpot']              = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.CRIMSON_ABYSSITE_OF_CONFLUENCE } },
    ['Quasimodo']              = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.OSSIFIED_GARGOUILLE_HAND       } },
    ['Rakshas']                = { ['Atma'] = {                                       }, ['Normal'] = { xi.ki.WARPED_SMILODON_CHOKER         } },
    ['Seps']                   = { ['Atma'] = { xi.ki.ATMA_OF_THE_APPARITIONS         }, ['Normal'] = {                                      } },
    ['Sedna']                  = { ['Atma'] = { xi.ki.ATMA_OF_THE_TUSKED_TERROR       }, ['Normal'] = {                                      } },
    ['Sippoy']                 = { ['Atma'] = { xi.ki.ATMA_OF_THE_WOULD_BE_KING       }, ['Normal'] = {                                      } },
    ['Xan']                    = { ['Atma'] = { xi.ki.ATMA_OF_THE_SHIMMERING_SHELL    }, ['Normal'] = {                                      } },
}

xi.abyssea.triggerType =
{
    RED    = 0,
    YELLOW = 1,
    BLUE   = 2,
}

xi.abyssea.deathType =
{
    NONE        = 0,
    PHYSICAL    = 1,
    MAGICAL     = 2,
    WS_PHYSICAL = 3,
    WS_MAGICAL  = 4,
}

local redWeakness =
{
    xi.weaponskill.SERAPH_BLADE,
    xi.weaponskill.SERAPH_STRIKE,
    xi.weaponskill.TACHI_KOKI,
    xi.weaponskill.SUNBURST,
    xi.weaponskill.ENERGY_DRAIN,
    xi.weaponskill.BLADE_EI,
    xi.weaponskill.SHADOW_OF_DEATH,
    xi.weaponskill.RED_LOTUS_BLADE,
    xi.weaponskill.EARTH_CRUSHER,
    xi.weaponskill.CYCLONE,
    xi.weaponskill.TACHI_JINPU,
    xi.weaponskill.FREEZEBITE,
    xi.weaponskill.RAIDEN_THRUST,
}

local yellowWeakness =
{
    [xi.magic.element.FIRE] =
    {
        xi.magic.spell.FIRE_III,
        xi.magic.spell.FIRE_IV,
        xi.magic.spell.FIRAGA_III,
        xi.magic.spell.FLARE,
        xi.magic.spell.HEAT_BREATH,
        xi.magic.spell.KATON_NI,
        xi.magic.spell.ICE_THRENODY,
    },

    [xi.magic.element.ICE] =
    {
        xi.magic.spell.BLIZZARD_III,
        xi.magic.spell.BLIZZARD_IV,
        xi.magic.spell.BLIZZAGA_III,
        xi.magic.spell.FREEZE,
        xi.magic.spell.ICE_BREAK,
        xi.magic.spell.HYOTON_NI,
        xi.magic.spell.WIND_THRENODY,
    },

    [xi.magic.element.WIND] =
    {
        xi.magic.spell.AERO_III,
        xi.magic.spell.AERO_IV,
        xi.magic.spell.AEROGA_III,
        xi.magic.spell.TORNADO,
        xi.magic.spell.MYSTERIOUS_LIGHT,
        xi.magic.spell.HUTON_NI,
        xi.magic.spell.EARTH_THRENODY,
    },

    [xi.magic.element.EARTH] =
    {
        xi.magic.spell.STONE_III,
        xi.magic.spell.STONE_IV,
        xi.magic.spell.STONEGA_III,
        xi.magic.spell.QUAKE,
        xi.magic.spell.MAGNETITE_CLOUD,
        xi.magic.spell.DOTON_NI,
        xi.magic.spell.LIGHTNING_THRENODY,
    },

    [xi.magic.element.THUNDER] =
    {
        xi.magic.spell.THUNDER_III,
        xi.magic.spell.THUNDER_IV,
        xi.magic.spell.THUNDAGA_III,
        xi.magic.spell.BURST,
        xi.magic.spell.MIND_BLAST,
        xi.magic.spell.RAITON_NI,
        xi.magic.spell.WATER_THRENODY,
    },

    [xi.magic.element.WATER] =
    {
        xi.magic.spell.WATER_III,
        xi.magic.spell.WATER_IV,
        xi.magic.spell.WATERGA_III,
        xi.magic.spell.FLOOD,
        xi.magic.spell.MAELSTROM,
        xi.magic.spell.SUITON_NI,
        xi.magic.spell.FIRE_THRENODY,
    },

    [xi.magic.element.LIGHT] =
    {
        xi.magic.spell.BANISH_II,
        xi.magic.spell.BANISH_III,
        xi.magic.spell.BANISHGA,
        xi.magic.spell.BANISHGA_II,
        xi.magic.spell.HOLY,
        xi.magic.spell.FLASH,
        xi.magic.spell.RADIANT_BREATH,
        xi.magic.spell.DARK_THRENODY,
    },

    [xi.magic.element.DARK] =
    {
        xi.magic.spell.ASPIR,
        xi.magic.spell.DRAIN,
        xi.magic.spell.BIO_II,
        xi.magic.spell.DISPEL,
        xi.magic.spell.EYES_ON_ME,
        xi.magic.spell.KURAYAMI_NI,
        xi.magic.spell.LIGHT_THRENODY,
    },
}

local blueWeakness =
{
    -- Piercing: 0600 - 1400
    {
        xi.weaponskill.SIDEWINDER,
        xi.weaponskill.BLAST_ARROW,
        xi.weaponskill.ARCHING_ARROW,
        xi.weaponskill.EMPYREAL_ARROW,
        xi.weaponskill.SLUG_SHOT,
        xi.weaponskill.BLAST_SHOT,
        xi.weaponskill.HEAVY_SHOT,
        xi.weaponskill.DETONATOR,
        xi.weaponskill.SHADOWSTICH,
        xi.weaponskill.DANCING_EDGE,
        xi.weaponskill.SHARK_BITE,
        xi.weaponskill.EVISCERATION,
        xi.weaponskill.SKEWER,
        xi.weaponskill.WHEELING_THRUST,
        xi.weaponskill.IMPULSE_DRIVE,
    },

    -- Slashing: 1400 - 2200
    {
        xi.weaponskill.VORPAL_BLADE,
        xi.weaponskill.SWIFT_BLADE,
        xi.weaponskill.SAVAGE_BLADE,
        xi.weaponskill.BLADE_TEN,
        xi.weaponskill.BLADE_KU,
        xi.weaponskill.MISTRAL_AXE,
        xi.weaponskill.DECIMATION,
        xi.weaponskill.CROSS_REAPER,
        xi.weaponskill.SPIRAL_HELL,
        xi.weaponskill.FULL_BREAK,
        xi.weaponskill.STEEL_CYCLONE,
        xi.weaponskill.TACHI_GEKKO,
        xi.weaponskill.TACHI_KASHA,
        xi.weaponskill.SPINNING_SLASH,
        xi.weaponskill.GROUND_STRIKE,
    },

    -- Blunt: 2200 - 0600
    {
        xi.weaponskill.SKULLBREAKER,
        xi.weaponskill.TRUE_STRIKE,
        xi.weaponskill.JUDGMENT,
        xi.weaponskill.HEXA_STRIKE,
        xi.weaponskill.BLACK_HALO,
        xi.weaponskill.RAGING_FISTS,
        xi.weaponskill.SPINNING_ATTACK,
        xi.weaponskill.HOWLING_FIST,
        xi.weaponskill.DRAGON_KICK,
        xi.weaponskill.ASURAN_FISTS,
        xi.weaponskill.HEAVY_SWING,
        xi.weaponskill.SHELL_CRUSHER,
        xi.weaponskill.FULL_SWING,
        xi.weaponskill.SPIRIT_TAKER,
        xi.weaponskill.RETRIBUTION,
    },
}

-- [ZoneID] = { Required Trades Event, Has Key Items Event, Missing Key Item Event }
local popEvents =
{
    [xi.zone.ABYSSEA_KONSCHTAT]        = { 1010, 1020, 1021 },
    [xi.zone.ABYSSEA_TAHRONGI]         = { 1010, 1020, 1021 },
    [xi.zone.ABYSSEA_LA_THEINE]        = { 1010, 1020, 1021 },
    [xi.zone.ABYSSEA_ATTOHWA]          = { 1010, 1022, 1023 },
    [xi.zone.ABYSSEA_MISAREAUX]        = { 1010, 1022, 1021 },
    [xi.zone.ABYSSEA_VUNKERL]          = { 1010, 1015, 1120 },
    [xi.zone.ABYSSEA_ALTEPA]           = { 1010, 1020, 1021 },
    [xi.zone.ABYSSEA_ULEGUERAND]       = { 1010, 1020, 1025 },
    [xi.zone.ABYSSEA_GRAUBERG]         = { 1010, 1020, 1021 },
    [xi.zone.ABYSSEA_EMPYREAL_PARADOX] = { 1010, 1020, 1021 },
}

-----------------------------------
-- public functions
-----------------------------------

-- returns Traverser Stone KI cap
xi.abyssea.getTraverserCap = function(player)
    local stones = 3

    for keyItem = xi.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, xi.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(keyItem) then
            stones = stones + 1
        end
    end

    return stones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
xi.abyssea.getHeldTraverserStones = function(player)
    local stones = 0

    for keyItem = xi.ki.TRAVERSER_STONE1, xi.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(keyItem) then
            stones = stones + 1
        end
    end

    return stones
end

-- removes Traverser Stone KIs
xi.abyssea.spendTravStones = function(player, spentstones)
    local numRemoved = 0

    for keyItem = xi.ki.TRAVERSER_STONE6, xi.ki.TRAVERSER_STONE1 do
        if numRemoved == spentstones then
            break
        elseif player:hasKeyItem(keyItem) then
            player:delKeyItem(keyItem)
            numRemoved = numRemoved + 1
        end
    end
end

-- returns total "Abyssite of <thing>"
xi.abyssea.getAbyssiteTotal = function(player, enumVal)
    local kiCount = 0

    for keyItem = abyssiteKeyItems[enumVal][1], abyssiteKeyItems[enumVal][2] do
        if player:hasKeyItem(keyItem) then
            kiCount = kiCount + 1
        end
    end

    return kiCount
end

xi.abyssea.canGiveNMKI = function(mob, dropChance)
    local redProcValue = mob:getLocalVar("[AbysseaRedProc]")

    if math.random(1, 100) <= dropChance or redProcValue == 1 then
        return true
    end

    return false
end

xi.abyssea.giveNMDrops = function(mob, player, ID)
    local atmaDrops = xi.abyssea.mob[mob:getName()]['Atma']
    local normalDrops = xi.abyssea.mob[mob:getName()]['Normal']
    local playerClaimed = GetPlayerByID(mob:getLocalVar("[ClaimedBy]"))

    for k, v in pairs(normalDrops) do
        if xi.abyssea.canGiveNMKI(mob, 20) then
            playerClaimed:addKeyItem(v)
            playerClaimed:messageSpecial(ID.text.KEYITEM_OBTAINED, v)
        end
    end

    for k, v in pairs(atmaDrops) do
        local ally = playerClaimed:getAlliance()

        for _, member in ipairs(ally) do
            if not member:hasKeyItem(v) and xi.abyssea.canGiveNMKI(mob, 10) then
                member:addKeyItem(v)
                member:messageSpecial(ID.text.KEYITEM_OBTAINED, v)
            end
        end

        if not playerClaimed:hasKeyItem(v) then
            playerClaimed:addKeyItem(v)
            playerClaimed:messageSpecial(ID.text.KEYITEM_OBTAINED, v)
        end
    end

    -- TODO: Handle increased droprate with Yellow and Blue procs
end

-- Returns Bitmask of Demulune KeyItems
xi.abyssea.getDemiluneAbyssite = function(player)
    local demiluneMask = 0

    for k, keyItem in ipairs(demiluneKeyItems) do
        if player:hasKeyItem(keyItem) then
            demiluneMask = demiluneMask + bit.lshift(1, k - 1)
        end
    end

    return demiluneMask
end

xi.abyssea.getNewYellowWeakness = function(mob)
    local day = VanadielDayOfTheWeek()
    local weakness = math.random(day - 1, day + 1)

    if weakness < 0 then
        weakness = 7
    elseif weakness > 7 then
        weakness = 0
    end

    local element = xi.magic.dayElement[weakness]
    return yellowWeakness[element][math.random(#yellowWeakness[element])]
end

xi.abyssea.getNewRedWeakness = function(mob)
    return redWeakness[math.random(#redWeakness)]
end

xi.abyssea.getNewBlueWeakness = function(mob)
    local time = VanadielHour()
    local table = 3

    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end

    return blueWeakness[table][math.random(#blueWeakness[table])]
end

xi.abyssea.procMonster = function(mob, player, triggerType)
    if player and player:getAllegiance() == 1 then
        local master = player:getMaster()

        if master then
            player = master
        end

        if triggerType == xi.abyssea.triggerType.RED then
            if mob:getLocalVar("[AbysseaRedProc]") == 0 then
                mob:setLocalVar("[AbysseaRedProc]", 1)
            else
                mob:setLocalVar("[AbysseaRedProc]", 0)
            end
            mob:weaknessTrigger(2)
            mob:addStatusEffect(xi.effect.TERROR, 0, 0, 30)
        elseif triggerType == xi.abyssea.triggerType.YELLOW then
            if mob:getLocalVar("[AbysseaYellowProc]") == 0 then
                mob:setLocalVar("[AbysseaYellowProc]", 1)
            else
                mob:setLocalVar("[AbysseaYellowProc]", 0)
            end
            mob:weaknessTrigger(1)
            mob:addStatusEffect(xi.effect.TERROR, 0, 0, 30)
        elseif triggerType == xi.abyssea.triggerType.BLUE then
            if mob:getLocalVar("[AbysseaBlueProc]") == 0 then
                mob:setLocalVar("[AbysseaBlueProc]", 1)
            else
                mob:setLocalVar("[AbysseaBlueProc]", 0)
            end
            mob:weaknessTrigger(0)
            mob:addStatusEffect(xi.effect.TERROR, 0, 0, 30)
        end
    end
end

-- trade to QM to pop mob
xi.abyssea.qmOnTrade = function(player, npc, trade, mobId, reqTrade)
    -- validate QM pop data
    -- local zoneId = player:getZoneID()
    -- validate trade-to-pop
    if #reqTrade == 0 or trade:getItemCount() ~= #reqTrade then
        return false
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if not trade:hasItemQty(v, 1) then
            return false
        end
    end

    if GetMobByID(mobId):isSpawned() then
        return false
    end

    -- complete trade and pop nm
    player:tradeComplete()
    local dx = player:getXPos() + math.random(-1, 1)
    local dy = player:getYPos()
    local dz = player:getZPos() + math.random(-1, 1)
    GetMobByID(mobId):setSpawn(dx, dy, dz)

    SpawnMob(mobId):updateClaim(player)
    GetMobByID(mobId):setLocalVar("[ClaimedBy]", player:getID())

    return true
end

local checkMobID = function(zoneId, mobId)
    for i, v in pairs(zones[zoneId].mob) do
        if v == mobId then
            return true
        end
    end
    return false
end

xi.abyssea.qmOnTrigger = function(player, npc, mobId, kis, tradeReqs)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]

    if mobId == 0 then
        -- validate trade-to-pop
        local t = tradeReqs
        if #t > 0 then
            for i = 1, 8 do
                if not t[i] then
                    t[i] = 0
                end
            end
            player:startEvent(events[1], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8]) -- report required trades
            return true
        end
    end

    -- validate nm status
    if GetMobByID(mobId):isSpawned() then
        return false
    end

    if #kis == 0 then
        return false
    end

    -- validate kis
    local validKis = true
    local kisExpected = {}

    for index = 1, 8 do
        local keyItem = kis[index] or 0

        if keyItem ~= 0 and not player:hasKeyItem(keyItem) then
            validKis = false
        end
        player:setLocalVar("KI" .. index, keyItem)
        kisExpected[index] = keyItem
    end

    local pop = checkMobID(zoneId, mobId)
    player:setLocalVar("[AbysseaPopNmID]", mobId)
    -- start event
    if validKis and pop then
        player:startEvent(events[2], kisExpected[1], kisExpected[2], kisExpected[3], kisExpected[4], kisExpected[5], kisExpected[6], kisExpected[7], kisExpected[8]) -- player has all key items
        return true
    else
        player:startEvent(events[3], kisExpected[1], kisExpected[2], kisExpected[3], kisExpected[4], kisExpected[5], kisExpected[6], kisExpected[7], kisExpected[8]) -- player is missing key items
        return false
    end
end

xi.abyssea.qmOnEventUpdate = function(player, csid, option)
    return false
end

xi.abyssea.qmOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local ID = zones[player:getZoneID()]

    if csid == events[2] and option == 1 then

        for i = 1, 8 do
            local keyItem = player:getLocalVar("KI" .. i)
            if keyItem == 0 then
                break
            end

            if player:hasKeyItem(keyItem) then
                player:delKeyItem(keyItem)
                player:messageSpecial(ID.text.LOST_KEYITEM, keyItem)
            end
        end

        -- pop nm
        local nm = player:getLocalVar("[AbysseaPopNmID]")
        local dx = player:getXPos() + math.random(-1, 1)
        local dy = player:getYPos()
        local dz = player:getZPos() + math.random(-1, 1)

        GetMobByID(nm):setSpawn(dx, dy, dz)
        SpawnMob(nm):updateClaim(player)
        GetMobByID(nm):setLocalVar("[ClaimedBy]", player:getID())

        return true
    end
end

xi.abyssea.isInAbysseaZone = function(player)
    return player:getCurrentRegion() == xi.region.ABYSSEA
end

-----------------------------------
-- Light Handling
-----------------------------------
xi.abyssea.getLightsTable = function(player)
    local lightMaskFirst  = player:getCharVar("abysseaLights1")
    local lightMaskSecond = player:getCharVar("abysseaLights2")
    local lightValues = { 0, 0, 0, 0, 0, 0, 0 }

    for v = 1, 7 do
        if v <= 4 then
            lightValues[v] = bit.band(bit.rshift(lightMaskFirst, (v - 1) * 8), 0xFF)
        else
            lightValues[v] = bit.band(bit.rshift(lightMaskSecond, (v - 5) * 8), 0xFF)
        end
    end

    return lightValues
end

local function setLightsFromTable(player, lightTable)
    local lightMaskFirst  = 0
    local lightMaskSecond = 0

    for k = 1, 7 do
        if k <= 4 then
            lightMaskFirst = lightMaskFirst + bit.lshift(lightTable[k], (k - 1) * 8)
        else
            lightMaskSecond = lightMaskSecond + bit.lshift(lightTable[k], (k - 1) * 8)
        end
    end

    player:setCharVar("abysseaLights1", lightMaskFirst)
    player:setCharVar("abysseaLights2", lightMaskSecond)
end

xi.abyssea.displayAbysseaLights = function(player)
    if xi.abyssea.isInAbysseaZone(player) then
        local ID = zones[player:getZoneID()]
        local lightValues = xi.abyssea.getLightsTable(player)

        player:messageName(ID.text.LIGHTS_MESSAGE_1, nil,
                              lightValues[xi.abyssea.lightType.PEARL],
                              lightValues[xi.abyssea.lightType.EBON],
                              lightValues[xi.abyssea.lightType.GOLDEN],
                              lightValues[xi.abyssea.lightType.SILVERY])

        player:messageName(ID.text.LIGHTS_MESSAGE_2, nil,
                              lightValues[xi.abyssea.lightType.AZURE],
                              lightValues[xi.abyssea.lightType.RUBY],
                              lightValues[xi.abyssea.lightType.AMBER])
    end
end

xi.abyssea.resetPlayerLights = function(player)
    player:setCharVar("abysseaLights1", 0)
    player:setCharVar("abysseaLights2", 0)
end

xi.abyssea.setBonusLights = function(player)
    local lightTable = {}

    for _, v in ipairs(xi.abyssea.lightType) do
        lightTable[v] = xi.settings.main.ABYSSEA_BONUSLIGHT_AMOUNT
    end

    setLightsFromTable(player, lightTable)
end

xi.abyssea.addPlayerLights = function(player, light, amount)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local tierMsg = 0
    local lightAmount = amount or 0

    if lightAmount <= 8 then
        tierMsg = 0
    elseif lightAmount <= 16 then
        tierMsg = 1
    elseif lightAmount <= 32 then
        tierMsg = 2
    elseif lightAmount <= 64 then
        tierMsg = 3
    else
        tierMsg = 4
    end

    if tierMsg > lightData[light][2] then
        tierMsg = lightData[light][2]
    end

    local lightTable = xi.abyssea.getLightsTable(player)
    lightTable[light] = utils.clamp(lightTable[light] + lightAmount, 0, lightData[light][1])
    player:messageSpecial(ID.text.BODY_EMITS_OFFSET + (light - 1), tierMsg)
    setLightsFromTable(player, lightTable)
end

xi.abyssea.getLightValue = function(player, light)
    return bit.band(bit.rshift(player:getCharVar("abysseaLights"), (light - 1) * 2), 0xFF)
end

xi.abyssea.canEnterAbyssea = function(player)
    -- TODO
    return true
end

xi.abyssea.displayTimeRemaining = function(player)
    local ID = zones[player:getZoneID()]
    local visitantEffect = player:getStatusEffect(xi.effect.VISITANT)
    local secondsRemaining = visitantEffect:getTimeRemaining() / 1000

    if secondsRemaining >= 120 then
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET + 1, secondsRemaining / 60, 1)
    elseif secondsRemaining >= 60 then
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET, secondsRemaining / 60, 1)
    else
        player:messageSpecial(ID.text.ABYSSEA_TIME_OFFSET + 1, secondsRemaining, 0)
    end
end

-----------------------------------
-- Zone Global Functions
-----------------------------------
xi.abyssea.onZoneIn = function(player)
    -- If the player is a GM, and has GM toggled active, give them permanent visitant
    -- status.  TODO: nameFlags enum
    if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)
    end
end

xi.abyssea.afterZoneIn = function(player)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]

    -- Add 5 minutes of hidden time to get "real" visitant status.  The additional 4 seconds
    -- is intentional due to tick variances (up to 3s), and the status will be deleted should
    -- the countdown timer for visitant status reach 0 before actually running out of time on
    -- the effect.
    if not player:hasStatusEffect(xi.effect.VISITANT) then
        player:addStatusEffectEx(xi.effect.VISITANT, 0, 0, 3, 304)
    end

    local visitantEffect = player:getStatusEffect(xi.effect.VISITANT)
    if visitantEffect and visitantEffect:getIcon() == 0 then
        player:messageName(ID.text.ABYSSEA_TIME_OFFSET + 5, nil, 5)
    end
end

-----------------------------------
-- Searing Ward Functions
-----------------------------------
local searingWardTetherLocations =
{
    [xi.zone.ABYSSEA_KONSCHTAT]  = {  114, -72.39, -808, 160 },
    [xi.zone.ABYSSEA_TAHRONGI]   = {    0,     40, -676, 192 },
    [xi.zone.ABYSSEA_LA_THEINE]  = { -480,      0,  760,  64 },
    [xi.zone.ABYSSEA_ATTOHWA]    = { -140,     20, -162, 192 },
    [xi.zone.ABYSSEA_MISAREAUX]  = {  608,  -15.8,  280, 128 },
    [xi.zone.ABYSSEA_VUNKERL]    = { -324,  -38.8,  664,   0 },
    [xi.zone.ABYSSEA_ALTEPA]     = {  396,      0,  276,  64 },
    [xi.zone.ABYSSEA_ULEGUERAND] = { -180,    -40, -504, 192 },
    [xi.zone.ABYSSEA_GRAUBERG]   = { -506,     25, -764,   0 },
}

xi.abyssea.searingWardTimer = function(player)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]
    local tetherTimer = player:getLocalVar('tetherTimer')

    if tetherTimer > 1 then
        if tetherTimer == 11 or tetherTimer <= 6 then
            player:messageSpecial(ID.text.RETURNING_TO_SEARING_IN, tetherTimer - 1)
        end

        player:setLocalVar('tetherTimer', tetherTimer - 1)
        player:timer(1500, function() xi.abyssea.searingWardTimer(player) end)
    elseif tetherTimer == 1 then
        player:setLocalVar('tetherTimer', 0)
        player:messageSpecial(ID.text.RETURNING_TO_WARD)
        player:setPos(unpack(searingWardTetherLocations[zoneID]))
    end
end

xi.abyssea.onWardRegionLeave = function(player)
    local ID = zones[player:getZoneID()]
    local visitantEffect = player:getStatusEffect(xi.effect.VISITANT)

    if visitantEffect and visitantEffect:getIcon() == 0 then
        player:messageName(ID.text.NO_VISITANT_WARD, nil, 10)
        player:setLocalVar('tetherTimer', 11)
    end
end

xi.abyssea.onWardRegionEnter = function(player)
    player:setLocalVar('tetherTimer', 0)
end

-----------------------------------
-- Support NPC Functions
-- Traverser Stone, Abyssea Warp
-----------------------------------
local supportNPCData =
{--                          Traverser,  Warp
    [xi.zone.HEAVENS_TOWER]  = {   434,   433 },
    [xi.zone.RULUDE_GARDENS] = { 10186, 10185 },
    [xi.zone.PORT_BASTOK]    = {   405,   404 },
    [xi.zone.PORT_JEUNO]     = {   328,   339 },
    [xi.zone.PORT_SAN_DORIA] = {   796,   795 },
    [xi.zone.PORT_WINDURST]  = {   874,   873 },
}

-- TODO: Combine this into one table with teleportData
local abysseaMawQuests =
{
    [0] = xi.quest.id.abyssea.A_GOLDSTRUCK_GIGAS,
    [1] = xi.quest.id.abyssea.TO_PASTE_A_PEISTE,
    [2] = xi.quest.id.abyssea.MEGADRILE_MENACE,
    [3] = xi.quest.id.abyssea.THE_BEAST_OF_BASTORE,
    [4] = xi.quest.id.abyssea.A_DELECTABLE_DEMON,
    [5] = xi.quest.id.abyssea.A_FLUTTERY_FIEND,
    [6] = xi.quest.id.abyssea.A_BEAKED_BLUSTERER,
    [7] = xi.quest.id.abyssea.A_MAN_EATING_MITE,
    [8] = xi.quest.id.abyssea.AN_ULCEROUS_URAGNITE,
}

local teleportData =
{
    { -562,   0,  640,  26, 102 }, -- La Theine Plateau
    {   91, -68, -582, 237, 108 }, -- Konschtat Highlands
    {  -28,  46, -680,  76, 117 }, -- Tahrongi Canyon
    {  241,   0,   11,  42, 104 }, -- Jugner Forest (Vunkerl)
    {  362,   0, -119,   4, 103 }, -- Valkurm Dunes (Misareaux)
    { -338, -23,   47, 167, 118 }, -- Buburimu Peninsula (Attohwa)
    {  337,   0, -675,  52, 107 }, -- South Gustaberg (Altepa)
    {  269,  -7,  -75, 192, 112 }, -- Xarcabard (Uleguerand)
    {  -71,   0,  601, 126, 106 }, -- North Gustaberg (Grauberg)
}

local function getUnlockedMawTable(player)
    local unlockedMawTable = { 0, 0, 0 }

    for mawIndex = 0, 8 do
        if player:getQuestStatus(xi.quest.log_id.ABYSSEA, abysseaMawQuests[mawIndex]) >= QUEST_ACCEPTED then
            local tableKey = math.floor(mawIndex / 3) + 1

            unlockedMawTable[tableKey] = utils.mask.setBit(unlockedMawTable[tableKey], mawIndex % 3, 1)
        end
    end

    return unlockedMawTable
end

xi.abyssea.warpNPCOnTrigger = function(player, npc)
    local totalCruor = player:getCurrency("cruor")
    local unlockedMaws = getUnlockedMawTable(player)
    local statusParam = player:hasCompletedQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS) and 2 or 0

    player:startEvent(supportNPCData[player:getZoneID()][2], statusParam, totalCruor, unlockedMaws[1], unlockedMaws[2], unlockedMaws[3])
end

xi.abyssea.warpNPCOnEventUpdate = function(player, csid, option)
end

xi.abyssea.warpNPCOnEventFinish = function(player, csid, option, npc)
    local teleportSelection = bit.band(bit.rshift(option, 2), 0xF)

    -- Bit 8 is set for all teleport selections
    if
        utils.mask.getBit(option, 8) and
        player:getCurrency("cruor") >= 200
    then
        player:delCurrency("cruor", 200)
        player:setPos(unpack(teleportData[teleportSelection]))
    end
end

xi.abyssea.traverserNPCOnTrigger = function(player, npc)
    local zoneID = player:getZoneID()
    local ID = zones[zoneID]
    local availableStones = player:getAvailableTraverserStones()
    local numTraverserHeld = xi.abyssea.getHeldTraverserStones(player)
    local maxTraverserCanHold = xi.abyssea.getTraverserCap(player)
    local messageType = availableStones > 0 and 0 or 2

    -- messageType parameter determines what is displayed to the player depending
    -- on other values: 0 = Eligible for Stone, 1 = Holding maximum stones, and
    -- 2 = No stones available

    if numTraverserHeld >= maxTraverserCanHold then
        messageType = 1
    end

    if
        zoneID ~= xi.zone.PORT_JEUNO and
        not player:hasCompletedQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS)
    then
        player:messageText(npc, ID.text.NOT_ACQUAINTED)
    elseif player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DAWN_OF_DEATH) >= QUEST_ACCEPTED then
        player:startEvent(supportNPCData[zoneID][1], 0, availableStones, numTraverserHeld, messageType, 1, 1, 1, 3) -- Post "The Truth Beckons" Menu
    end
end

xi.abyssea.traverserNPCOnUpdate = function(player, csid, option)
    if csid == supportNPCData[player:getZoneID()][1] then
        if option == 3 then
            -- The following values calculates the amount of time remaining for a stone by working backwards from current time.
            -- Recharge interval is the adjusted value in hours, and remaining is in seconds initially.  Retail will display
            -- the result as a minute value to the player.

            local rechargeInterval = 20 - xi.abyssea.getAbyssiteTotal(player, xi.abyssea.abyssiteType.CELERITY)
            local lastStoneClaimedTime = os.time() - player:getTraverserEpoch() - rechargeInterval * 3600 * player:getClaimedTraverserStones()
            local rechargeRemaining = rechargeInterval * 60 - lastStoneClaimedTime / 60

            player:updateEvent(0, 0, 0, 0, rechargeRemaining)
        end
    end
end

xi.abyssea.traverserNPCOnEventFinish = function(player, csid, option, npc)
    local zoneID = player:getZoneID()

    if
        csid == supportNPCData[zoneID][1] and
        option == 6
    then
        local ID = zones[zoneID]
        local availableStones = player:getAvailableTraverserStones()
        local numTraverserHeld = xi.abyssea.getHeldTraverserStones(player)
        local requestedStones = xi.abyssea.getTraverserCap(player) - numTraverserHeld

        -- Make sure we don't hand out stones if the player doesn't have them in reserve
        if requestedStones > availableStones then
            requestedStones = availableStones
        end

        player:addClaimedTraverserStones(requestedStones)

        local startKeyItem = xi.ki.TRAVERSER_STONE1 + numTraverserHeld - 1
        for keyItem = startKeyItem, startKeyItem + requestedStones do
            player:addKeyItem(keyItem)
        end

        local kiMessage = requestedStones > 1 and ID.text.OBTAINED_NUM_KEYITEMS or ID.text.OBTAINED_NUM_KEYITEMS + 1
        player:messageSpecial(kiMessage, xi.ki.TRAVERSER_STONE1, requestedStones)
    end
end

local zoneQuestReward =
{
    xi.ki.LUNAR_ABYSSITE2,
    xi.ki.IVORY_ABYSSITE_OF_FORTUNE,
    xi.ki.IVORY_ABYSSITE_OF_ACUMEN,
    xi.ki.IVORY_ABYSSITE_OF_THE_REAPER,
    xi.ki.IVORY_ABYSSITE_OF_PERSPICACITY,
    xi.ki.IVORY_ABYSSITE_OF_GUERDON,
    xi.ki.LUNAR_ABYSSITE3,
    xi.ki.IVORY_ABYSSITE_OF_PROSPERITY,
    xi.ki.IVORY_ABYSSITE_OF_DESTINY,
}

xi.abyssea.getZoneKIReward = function(player)
    local numCompleted = 0

    for i = 0, 8 do
        if player:hasCompletedQuest(xi.quest.log_id.ABYSSEA, abysseaMawQuests[i]) then
            numCompleted = numCompleted + 1
        end
    end

    return zoneQuestReward[numCompleted + 1]
end
