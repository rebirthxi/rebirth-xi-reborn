-- ------------------------------------
-- HARVESTING_RESULT	 = 513,
-- LOGGING_RESULT		 = 514,
-- MINING_RESULT		 = 515,
-- EXCAVATION_RESULT	 = 2000
-- HARVESTING_TOOL_BREAK = 2001
-- LOGGING_TOOL_BREAK	 = 2002
-- MINING_TOOL_BREAK	 = 2003
-- EXCAVATION_TOOL_BREAK = 2004
--
-- Set Mods: -18% break chance, +3% item rarity
-- ------------------------------------
-- Field Tunica Set: change to only break-chance mods
DELETE FROM `item_mods` WHERE itemId = 14374;
DELETE FROM `item_mods` WHERE itemId = 14817;
DELETE FROM `item_mods` WHERE itemId = 14297;
DELETE FROM `item_mods` WHERE itemId = 14176;
INSERT INTO `item_mods` VALUES (14374,2001,60); -- Body
INSERT INTO `item_mods` VALUES (14374,2002,60);
INSERT INTO `item_mods` VALUES (14374,2003,60);
INSERT INTO `item_mods` VALUES (14374,2004,60);
INSERT INTO `item_mods` VALUES (14374,1,2);
INSERT INTO `item_mods` VALUES (14817,2002,60); -- Gloves
INSERT INTO `item_mods` VALUES (14817,2003,60);
INSERT INTO `item_mods` VALUES (14817,2004,60);
INSERT INTO `item_mods` VALUES (14817,1,1);
INSERT INTO `item_mods` VALUES (14297,2001,60); -- Trousers
INSERT INTO `item_mods` VALUES (14297,2002,60);
INSERT INTO `item_mods` VALUES (14297,1,1);
INSERT INTO `item_mods` VALUES (14176,2001,60); -- Boots
INSERT INTO `item_mods` VALUES (14176,2003,60);
INSERT INTO `item_mods` VALUES (14176,2004,60);
INSERT INTO `item_mods` VALUES (14176,1,1);
-- Worker Tunica Set improves results and break chance
INSERT INTO `item_mods` VALUES (14375,2001,60); -- Body
INSERT INTO `item_mods` VALUES (14375,2002,60);
INSERT INTO `item_mods` VALUES (14375,2003,60);
INSERT INTO `item_mods` VALUES (14375,2004,60);
INSERT INTO `item_mods` VALUES (14375,2000,10);
UPDATE `item_mods` SET value=10 WHERE itemId=14375 AND modId=513;
UPDATE `item_mods` SET value=10 WHERE itemId=14375 AND modId=514;
UPDATE `item_mods` SET value=10 WHERE itemId=14375 AND modId=515;
INSERT INTO `item_mods` VALUES (14818,2002,60); -- Gloves
INSERT INTO `item_mods` VALUES (14818,2003,60);
INSERT INTO `item_mods` VALUES (14818,2004,60);
INSERT INTO `item_mods` VALUES (14818,2000,10);
UPDATE `item_mods` SET value=10 WHERE itemId=14818 AND modId=514;
UPDATE `item_mods` SET value=10 WHERE itemId=14818 AND modId=515;
INSERT INTO `item_mods` VALUES (14298,2001,60); -- Trousers
INSERT INTO `item_mods` VALUES (14298,2002,60);
UPDATE `item_mods` SET value=10 WHERE itemId=14298 AND modId=513;
UPDATE `item_mods` SET value=10 WHERE itemId=14298 AND modId=514;
INSERT INTO `item_mods` VALUES (14177,2001,60); -- Boots
INSERT INTO `item_mods` VALUES (14177,2003,60);
INSERT INTO `item_mods` VALUES (14177,2004,60);
INSERT INTO `item_mods` VALUES (14177,2000,10);
UPDATE `item_mods` SET value=10 WHERE itemId=14177 AND modId=513;
UPDATE `item_mods` SET value=10 WHERE itemId=14177 AND modId=515;