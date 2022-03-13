
-- Bard
INSERT INTO item_mods VALUES (13857, 2005, 1); -- Choral Roundlet
INSERT INTO item_mods VALUES (15234, 2005, 2); -- Choral Roundlet +1
INSERT INTO item_mods VALUES (14098,  446, 1); -- Choral Slippers
INSERT INTO item_mods VALUES (15361,  446, 2); -- Choral Slippers +1

-- Black Mage
INSERT INTO item_mods VALUES (14092, 2006, -20); -- Wizard's Sabots
INSERT INTO item_mods VALUES (15355, 2006, -30); -- Wizard's Sabots +1

-- Dragoon
INSERT INTO item_mods VALUES (13974, 2007, 20); -- Drachen Finger Gauntlets
INSERT INTO item_mods VALUES (14903, 2007, 30); -- Drachen Finger Gauntlets +1
INSERT INTO item_mods VALUES (12649, 2013,  5); -- Drachen Mail
INSERT INTO item_mods VALUES (14486, 2013,  7); -- Drachen Mail +1

-- Monk
INSERT INTO item_mods VALUES (14215, 2008, 10); -- Temple Hose
INSERT INTO item_mods VALUES (15562, 2008, 20); -- Temple Hose +1

-- Ranger
INSERT INTO item_mods VALUES (14099, 2009, 30); -- Hunter's socks
INSERT INTO item_mods VALUES (15362, 2009, 60); -- Hunter's socks +1

-- Samurai
INSERT INTO item_mods VALUES (13781, 2010, 20); -- Myochin Domaru
INSERT INTO item_mods VALUES (14484, 2010, 30); -- Myochin Domaru +1
INSERT INTO item_mods VALUES (14100,    8,  2); -- Myochin Sune-ate
INSERT INTO item_mods VALUES (14100,   25,  3); -- Myochin Sune-ate
INSERT INTO item_mods VALUES (15363,    8,  4); -- Myochin Sune-ate
INSERT INTO item_mods VALUES (15363,   25,  6); -- Myochin Sune-ate

-- Thief
INSERT INTO item_mods VALUES (13966, 2011,  5); -- Rogue's Armlets
INSERT INTO item_mods VALUES (14895, 2011, 10); -- Rogue's Armlets +1
INSERT INTO item_mods VALUES (14219,  520, 10); -- Rogue's Culottes
INSERT INTO item_mods VALUES (15566,  520, 15); -- Rogue's Culottes +1

-- White Mage
INSERT INTO item_mods VALUES (13855, 2012, -50);  -- Healer's Cap
INSERT INTO item_mods VALUES (15227, 2012, -100); -- Healer's Cap +1
INSERT INTO item_mods VALUES (14091, 1109,   2); -- Healer's Duckbills
INSERT INTO item_mods VALUES (15354, 1109,   4); -- Healer's Duckbills +1

-- Blue Mage
INSERT INTO item_mods VALUES (14928,   12,  3); -- Magus Bazubands
INSERT INTO item_mods VALUES (14928,   13,  3); -- Magus Bazubands
INSERT INTO item_mods VALUES (14928,   28,  5); -- Magus Bazubands
DELETE FROM item_mods WHERE itemId=15024 and modiD=12; -- Magus Bazubands +1
INSERT INTO item_mods VALUES (15024,   12,  5); -- Magus Bazubands +1
INSERT INTO item_mods VALUES (15024,   13,  5); -- Magus Bazubands +1
INSERT INTO item_mods VALUES (15024,   28,  7); -- Magus Bazubands +1
INSERT INTO item_mods VALUES (15684,  384,  2); -- Magus Charuqs
INSERT INTO item_mods VALUES (11381,  384,  3); -- Magus Charuqs +1

-- Corsair
INSERT INTO item_mods VALUES (14929,  882, 30); -- Corsair's Gants
INSERT INTO item_mods VALUES (15027,  882, 60); -- Corsair's Gants +1
INSERT INTO item_mods VALUES (15601,   28,  2); -- Corsair's Culottes
INSERT INTO item_mods VALUES (16348,   28,  4); -- Corsair's Culottes +1

-- Dancer
INSERT INTO item_mods VALUES (16138,   25,  3); -- Dancer's Tiara MALE
INSERT INTO item_mods VALUES (16139,   25,  3); -- Dancer's Tiara FEMALE
INSERT INTO item_mods VALUES (11475,   25,  5); -- Dancer's Tiara +1 MALE
INSERT INTO item_mods VALUES (11476,   25,  5); -- Dancer's Tiara +1 FEMALE
INSERT INTO item_mods VALUES (14578,  174, 10); -- Dancer's Casaque MALE
INSERT INTO item_mods VALUES (14579,  174, 10); -- Dancer's Casaque FEMALE
INSERT INTO item_mods VALUES (11302,  174, 15); -- Dancer's Casaque +1 MALE
INSERT INTO item_mods VALUES (11303,  174, 15); -- Dancer's Casaque +1 FEMALE

-- Dark Knight
DELETE FROM item_mods WHERE itemId=12645 and modId=114; -- Chaos Cuirass
INSERT INTO item_mods VALUES (12645,  116, 15); -- Chaos Cuirass
DELETE FROM item_mods WHERE itemId=14480 and modId=114; -- Chaos Cuirass +1
INSERT INTO item_mods VALUES (14480,  116, 15); -- Chaos Cuirass +1
INSERT INTO item_mods VALUES (14480,   30,  5); -- Chaos Cuirass +1
INSERT INTO item_mods VALUES (14221,  521, 10); -- Chaos Flanchard
INSERT INTO item_mods VALUES (15568,  521, 20); -- Chaos Flanchard +1

-- Ninja
DELETE FROM item_mods WHERE itemId=13869 and modId=14; -- Ninja Hatsuburi
INSERT INTO item_mods VALUES (13869,   12,  5); -- Ninja Hatsuburi
DELETE FROM item_mods WHERE itemId=15237 and modId=14; -- Ninja Hatsuburi +1
INSERT INTO item_mods VALUES (15237,   12,  8); -- Ninja Hatsuburi +1
INSERT INTO item_mods VALUES (14226,  110,  5); -- Ninja Hakama
INSERT INTO item_mods VALUES (14226,  118,  5); -- Ninja Hakama
INSERT INTO item_mods VALUES (15573,  110, 10); -- Ninja Hakama +1
INSERT INTO item_mods VALUES (15573,  118, 10); -- Ninja Hakama +1

-- Paladin
INSERT INTO item_mods VALUES (13967,  374,  5); -- Gallant Gauntlets
INSERT INTO item_mods VALUES (14896,  374, 10); -- Gallant Gauntlets +1
DELETE FROM item_mods WHERE itemId=14095 and modId=14; -- Gallant Leggings
INSERT INTO item_mods VALUES (14095,  10,   5); -- Gallant Leggings
DELETE FROM item_mods WHERE itemId=15358 and modId=14; -- Gallant Leggings +1
INSERT INTO item_mods VALUES (15358,  10,  10); -- Gallant Leggigns +1

-- Red Mage
INSERT INTO item_mods VALUES (13965, 374,   5); -- Warlock's Gloves
INSERT INTO item_mods VALUES (14894, 374,  10); -- Warlock's Gloves +1
INSERT INTO item_mods VALUES (14093, 116,   5); -- Warlock's Boots
INSERT INTO item_mods VALUES (15356, 116,  10); -- Warlock's Boots +1

-- Summoner
INSERT INTO item_mods VALUES (14103, 346,   1); -- Evoker's Pigaches
DELETE FROM item_mods WHERE itemId=15366 and modId=346;
INSERT INTO item_mods VALUES (15366, 346,   2); -- Evoker's Pigaches +1

-- Warrior
DELETE FROM item_mods WHERE itemId=12511 and modId=9; -- Fighter's Mask
INSERT INTO item_mods VALUES (12511,   8,   3); -- Fighter's Mask
DELETE FROM item_mods WHERE itemId=15225 and modId=9; -- Fighter's Mask +1
INSERT INTO item_mods VALUES (15225,   8,   5); -- Fighter's Mask +1
INSERT INTO item_mods VALUES (12638, 954,  10); -- Fighter's Lorica
INSERT INTO item_mods VALUES (14473, 954,  20); -- Fighter's Lorica +1
DELETE FROM item_mods WHERE itemId=14089 and modId=11; -- Fighter's Calligae
INSERT INTO item_mods VALUES (14089,   8,   3); -- Fighter's Calligae
DELETE FROM item_mods WHERE itemId=15352 and modId=11; -- Fighter's Calligae +1
INSERT INTO item_mods VALUES (15352,   8,   5); -- Fighter's Calligae +1
