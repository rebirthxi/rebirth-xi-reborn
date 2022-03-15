-- Level Buff
UPDATE mob_groups SET minLevel=90, maxLevel=90 WHERE name='Za_Dha_Adamantking' and zoneid=148;
UPDATE mob_groups SET minLevel=90, maxLevel=90 WHERE name='Tzee_Xicu_the_Manifest' and zoneid=151;
UPDATE mob_groups SET minLevel=90, maxLevel=90 WHERE name='Overlord_Bakgodek' and zoneid=150;

-- Droppools

-- Zha'Dha (dropId: 2830)
DELETE FROM mob_droplist WHERE dropId=2830;
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 11538, 1000); -- Nexus Cape
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 17584, 1000); -- Signet Staff
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 17584, 100);
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 17584, 50);
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 1525, 200); -- Adamantoise Egg
INSERT INTO mob_droplist VALUES (2830, 0, 0, 1000, 14429, 350); -- Republic Aketon
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,17073,70);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,658,70);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,703,170);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,737,50);
INSERT INTO `mob_droplist` VALUES (2830,2,0,1000,751,0);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,830,50);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,844,300);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,866,70);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,887,100);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,902,20);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,1110,100);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,1132,270);
INSERT INTO `mob_droplist` VALUES (2830,0,0,1000,1132,130);

-- Tzee Xicu (dropId: 2511)
DELETE FROM mob_droplist WHERE dropId=2511;
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 17585, 1000); -- Signet Staff
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 11538, 1000); -- Nexus Cape
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 17585, 100);
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 17585, 50);
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 1526, 200); -- Wyrm Beard
INSERT INTO mob_droplist VALUES (2511, 0, 0, 1000, 14430, 350); -- Federation Aketon
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,17528,150);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,17619,930);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,658,50);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,703,100);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,737,130);
INSERT INTO `mob_droplist` VALUES (2511,2,0,1000,751,0);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,823,50);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,830,30);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,836,30);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,844,360);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,887,100);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,902,80);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,942,230);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,1110,80);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,1132,310);
INSERT INTO `mob_droplist` VALUES (2511,0,0,1000,1132,150);

-- Bakgodek (dropId: 1966)
DELETE FROM mob_droplist WHERE dropId=1966;
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 17583, 1000); -- Signet Staff
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 11538, 1000); -- Nexus Cape
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 17583, 100);
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 17583, 50);
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 1527, 200); -- Behemoth Tongue
INSERT INTO mob_droplist VALUES (1966, 0, 0, 1000, 14428, 350); -- Kingdom Aketon
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,12362,190);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,17649,810);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,17928,70);
INSERT INTO `mob_droplist` VALUES (1966,2,0,1000,656,0);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,703,150);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,737,50);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,823,80);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,844,470);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,887,30);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,902,30);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,942,310);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,1110,30);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,1132,230);
INSERT INTO `mob_droplist` VALUES (1966,0,0,1000,1132,110);