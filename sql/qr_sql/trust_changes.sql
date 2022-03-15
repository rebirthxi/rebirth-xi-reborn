-- Iron Eater
DELETE FROM `mob_skill_lists` WHERE skill_list_id=1032;
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Iron_Eater',1032,80); -- Shield Break
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Iron_Eater',1032,82); -- Sturmwind
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Iron_Eater',1032,86); -- Raging Rush

-- Zeid II
DELETE FROM `mob_skill_lists` WHERE skill_list_id=1125;
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Zeid_II',1125,99);  -- Nightmare Scythe
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Zeid_II',1125,102); -- Guillotine
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Zeid_II',1125,107); -- Infernal Scythe

DELETE FROM `mob_spell_lists` WHERE spell_list_id=419;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Zeid_II',419,247,20,75); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Zeid_II',419,275,45,75); -- Absorb-Tp
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Zeid_II',419,268,35,75); -- Absorb-Vit
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Zeid_II',419,230,15,75); -- Bio
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Zeid_II',419,252,37,75); -- Stun

-- Curilla
UPDATE `mob_pools` SET sJob=1 WHERE poolid=5902; -- change sub job to War
DELETE FROM `mob_spell_lists` WHERE spell_list_id=314;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,1,5,17);            -- Cure
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,2,17,30);           -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,3,30,75);           -- Cure III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,112,45,75);         -- Flash

-- Ulmia
UPDATE `mob_pools` SET sJob=3 WHERE poolid=5914;
DELETE FROM `mob_spell_lists` WHERE spell_list_id=326;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,386,25,75); -- Mage's Ballad
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,387,55,75); -- Mage's Ballad II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,428,26,66); -- Learned Etude
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,435,66,75); -- Sage Etude
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,463,16,75); -- Foe Lullaby
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,462,33,75); -- Magic Finale
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,1,1,22);    -- Cure I
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,2,22,42);   -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Ulmia',326,3,42,75);   -- Cure III

-- Joachim
DELETE FROM `mob_spell_lists` WHERE spell_list_id=323;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,419,20,60); -- Advancing March
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,420,60,75); -- Victory March
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,394,3,23);  -- Valor Minuet
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,395,23,43); -- Valor Minuet II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,396,43,63); -- Valor Minuet III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,397,63,75); -- Valor Minuet IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,421,39,75); -- Battlefield Elegy
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,368,7,17);  -- Foe Requiem
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,369,17,37); -- Foe Requiem II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,370,37,75); -- Foe Requiem III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,462,33,75); -- Magic Finale
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,1,1,22);    -- Cure I
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,2,22,42);   -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Joachim',323,3,42,75);   -- Cure III

-- King of Hearts
DELETE FROM `mob_spell_lists` WHERE spell_list_id=402;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,109,41,75);  -- Refresh
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,43,7,75);    -- Protect
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,44,27,75);   -- Protect II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,45,47,75);   -- Protect III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,46,63,75);   -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,48,17,75);   -- Shell
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,49,37,75);   -- Shell II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,50,57,75);   -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,51,68,75);   -- Shell IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,258,11,75);  -- Bind
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,216,21,75);  -- Gravity
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,253,25,75);  -- Sleep
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,252,45,75);  -- Stun
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,1,1,75);    -- Cure I
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,2,22,75);   -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,3,42,75);   -- Cure III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_King_of_Hearts',402,4,68,75);   -- Cure IV

-- Koru Moru
DELETE FROM `mob_spell_lists` WHERE spell_list_id=364;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,1,3,22);    -- Cure
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,2,22,42);   -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,3,42,68);   -- Cure III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,4,68,75);   -- Cure IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,23,1,31);   -- Dia
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,24,31,75);  -- Dia II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,260,32,75); -- Dispel
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,56,13,75);  -- Slow
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,58,6,75);   -- Paralyze
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,43,7,27);   -- Protect
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,44,27,47);  -- Protect II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,45,47,63);  -- Protect III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,46,63,75);  -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,48,17,37);  -- Shell
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,49,37,57);  -- Shell II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,50,57,68);  -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,51,68,75);  -- Shell IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,57,40,75);  -- Haste
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Koru-Moru',364,109,41,75); -- Refresh
