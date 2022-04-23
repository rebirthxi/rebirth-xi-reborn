-- Clear out the zones
DELETE FROM mob_spawn_points WHERE mobid>=17534977 and mobid <= 17535213; -- Clearing Sandy
DELETE FROM mob_groups WHERE zoneid=185;
DELETE FROM mob_spawn_points WHERE mobid>=17543169 and mobid <= 17543469; -- Clearing Windy
DELETE FROM mob_groups WHERE zoneid=187;
DELETE FROM mob_spawn_points WHERE mobid>=17539073 and mobid <= 17539312; -- Clearing Basty
DELETE FROM mob_groups WHERE zoneid=186;
DELETE FROM mob_spawn_points WHERE mobid>=17547265 and mobid<=17547499; -- Clearing Jeuno
DELETE FROM mob_groups WHERE zoneid=188;
DELETE FROM mob_spawn_points WHERE mobid>=17326081 and mobid<=17326935; -- Clear Glacier
DELETE FROM mob_groups WHERE zoneid=134;
DELETE FROM mob_spawn_points WHERE mobid>=17330177 and mobid<=17330919; -- Clear Xarcabard
DELETE FROM mob_groups WHERE zoneid=135;
--
-- Dynamis Sandoria ZoneId: 185
--

-- Sandy Mobs
INSERT INTO mob_spawn_points VALUES (17534977,'Overlords_Tombstone',"Overlord's Tombstone",2,0.027,-2,42.099,65);
INSERT INTO mob_spawn_points VALUES (17534978,'Battlechoir_Gitchfotch','Battlechoir Gitchfotch',1,2.027,-2,42.099,65);
INSERT INTO mob_spawn_points VALUES (17534979,'Soulsender_Fugbrag','Soulsender Fugbrag',9380,-2.027,-2,42.099,65);
INSERT INTO mob_spawn_points VALUES (17534980,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,142,-2,102,65);
INSERT INTO mob_spawn_points VALUES (17534981,'Vanguard_Trooper','Vanguard Trooper',9397,136,-2,108,24);
INSERT INTO mob_spawn_points VALUES (17534982,'Vanguard_Amputator','Vanguard Amputator',9381,125,0.4,99,22);
INSERT INTO mob_spawn_points VALUES (17534983,'Vanguard_Vexer','Vanguard Vexer',9398,130,-1,93,25);
INSERT INTO mob_spawn_points VALUES (17534984,'Vanguard_Pillager','Vanguard Pillager',9392,131,-1,82,52);
INSERT INTO mob_spawn_points VALUES (17534985,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,109,-1,97,52);
INSERT INTO mob_spawn_points VALUES (17534986,'Vanguard_Grappler','Vanguard Grappler',9386,102,-1,91,24);
INSERT INTO mob_spawn_points VALUES (17534987,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,115,-1,76,25);
INSERT INTO mob_spawn_points VALUES (17534988,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,135,-1,63,54);
INSERT INTO mob_spawn_points VALUES (17534989,'Vanguard_Bugler','Vanguard Bugler',9383,146,-1,50,5);
INSERT INTO mob_spawn_points VALUES (17534990,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,148,-1,36,54);
INSERT INTO mob_spawn_points VALUES (17534991,'Vanguard_Impaler','Vanguard Impaler',9389,137,-1,22,45);
INSERT INTO mob_spawn_points VALUES (17534992,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17534993,'Vanguard_Backstabber','Vanguard Backstabber',9382,103,4,14,54);
INSERT INTO mob_spawn_points VALUES (17534994,'Vanguard_Hawker','Vanguard Hawker',9388,96,4,25,45);
INSERT INTO mob_spawn_points VALUES (17534995,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17534996,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,97,4,39,25);
INSERT INTO mob_spawn_points VALUES (17534997,'Vanguards_Avatar',"Vanguard's Avatar",9394,9,4,39,25);
INSERT INTO mob_spawn_points VALUES (17534998,'Vanguard_Vexer','Vanguard Vexer',9398,96,4,49,54);
INSERT INTO mob_spawn_points VALUES (17534999,'Vanguard_Predator','Vanguard Predator',9393,98,4,61,24);
INSERT INTO mob_spawn_points VALUES (17535000,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,86,2,4,45);
INSERT INTO mob_spawn_points VALUES (17535001,'Vanguard_Grappler','Vanguard Grappler',9386,78,2,-5,85);
INSERT INTO mob_spawn_points VALUES (17535002,'Vanguard_Predator','Vanguard Predator',9393,72,2,-11,54);
INSERT INTO mob_spawn_points VALUES (17535006,'Reapertongue_Gadgquok','Reapertongue Gadgquok',9378,-100.054,1,-43.717,224.125);
INSERT INTO mob_spawn_points VALUES (17535007,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,2);
INSERT INTO mob_spawn_points VALUES (17535008,'Vanguard_Trooper','Vanguard Trooper',9397,116,1,-30,54);
INSERT INTO mob_spawn_points VALUES (17535009,'Vanguard_Amputator','Vanguard Amputator',9381,108,2,-22,45);
INSERT INTO mob_spawn_points VALUES (17535010,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,99,2,-22,85);
INSERT INTO mob_spawn_points VALUES (17535011,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,85);
INSERT INTO mob_spawn_points VALUES (17535012,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,91,2,-30,85);
INSERT INTO mob_spawn_points VALUES (17535013,'Vanguard_Backstabber','Vanguard Backstabber',9382,82,2,-38,84);
INSERT INTO mob_spawn_points VALUES (17535014,'Vanguard_Impaler','Vanguard Impaler',9389,76,2,-48,54);
INSERT INTO mob_spawn_points VALUES (17535015,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,54);
INSERT INTO mob_spawn_points VALUES (17535016,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,81,1,-62,54);
INSERT INTO mob_spawn_points VALUES (17535017,'Vanguard_Grappler','Vanguard Grappler',9386,89,1,-53,42);
INSERT INTO mob_spawn_points VALUES (17535018,'Vanguard_Amputator','Vanguard Amputator',9381,96,1,-46,54);
INSERT INTO mob_spawn_points VALUES (17535019,'Vanguard_Trooper','Vanguard Trooper',9397,104,1,-39,45);
INSERT INTO mob_spawn_points VALUES (17535020,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,43,2,-18,45);
INSERT INTO mob_spawn_points VALUES (17535021,'Vanguard_Pillager','Vanguard Pillager',9392,41,2,-13,54);
INSERT INTO mob_spawn_points VALUES (17535022,'Vanguard_Bugler','Vanguard Bugler',9383,31,2,-24,45);
INSERT INTO mob_spawn_points VALUES (17535023,'Vanguard_Predator','Vanguard Predator',9393,19,2,-22,45);
INSERT INTO mob_spawn_points VALUES (17535024,'Vanguard_Vexer','Vanguard Vexer',9398,16,2,1,45);
INSERT INTO mob_spawn_points VALUES (17535025,'Vanguard_Trooper','Vanguard Trooper',9397,25,2,1,44);
INSERT INTO mob_spawn_points VALUES (17535026,'Warchief_Tombstone','Warchief Tombstone',9400,148.990,-6.8,56.931,93);
INSERT INTO mob_spawn_points VALUES (17535027,'Vanguard_Bugler','Vanguard Bugler',9383,-25,2,2,45);
INSERT INTO mob_spawn_points VALUES (17535028,'Vanguard_Hawker','Vanguard Hawker',9388,-18,2,5,54);
INSERT INTO mob_spawn_points VALUES (17535029,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,54);
INSERT INTO mob_spawn_points VALUES (17535030,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-16,2,-17,5);
INSERT INTO mob_spawn_points VALUES (17535031,'Vanguard_Backstabber','Vanguard Backstabber',9382,-27,2,-22,45);
INSERT INTO mob_spawn_points VALUES (17535032,'Wyrmgnasher_Bjakdek','Wyrmgnasher Bjakdek',9401,102.736,1,-46.729,155);
INSERT INTO mob_spawn_points VALUES (17535033,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,103.736,1,-45.729,155);
INSERT INTO mob_spawn_points VALUES (17535034,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-40,2,-30,45);
INSERT INTO mob_spawn_points VALUES (17535035,'Vanguard_Grappler','Vanguard Grappler',9386,-40,2,-15,54);
INSERT INTO mob_spawn_points VALUES (17535036,'Vanguard_Pillager','Vanguard Pillager',9392,-51,2,-18,65);
INSERT INTO mob_spawn_points VALUES (17535037,'Vanguard_Trooper','Vanguard Trooper',9397,-72,2,-11,54);
INSERT INTO mob_spawn_points VALUES (17535038,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-78,2,-5,24);
INSERT INTO mob_spawn_points VALUES (17535039,'Vanguard_Predator','Vanguard Predator',9393,-87,2,3,45);
INSERT INTO mob_spawn_points VALUES (17535040,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-102,-2,27,45);
INSERT INTO mob_spawn_points VALUES (17535041,'Vanguard_Backstabber','Vanguard Backstabber',9382,-111,-2,21,45);
INSERT INTO mob_spawn_points VALUES (17535042,'Vanguard_Impaler','Vanguard Impaler',9389,-105,-2,15,46);
INSERT INTO mob_spawn_points VALUES (17535043,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,46);
INSERT INTO mob_spawn_points VALUES (17535044,'Voidstreaker_Butchnotch','Voidstreaker Butchnotch',9399,-267.133,-4,98.228,255);
INSERT INTO mob_spawn_points VALUES (17535045,'Vanguard_Amputator','Vanguard Amputator',9381,-104,-2,32,45);
INSERT INTO mob_spawn_points VALUES (17535046,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,-90,1,-58,45);
INSERT INTO mob_spawn_points VALUES (17535047,'Vanguard_Vexer','Vanguard Vexer',9398,-77,2,-46,65);
INSERT INTO mob_spawn_points VALUES (17535048,'Vanguard_Bugler','Vanguard Bugler',9383,-84,2,-38,45);
INSERT INTO mob_spawn_points VALUES (17535049,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,-89,2,-31,5);
INSERT INTO mob_spawn_points VALUES (17535050,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,5);
INSERT INTO mob_spawn_points VALUES (17535051,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,-96,2,-24,45);
INSERT INTO mob_spawn_points VALUES (17535052,'Vanguard_Bugler','Vanguard Bugler',9383,-107,2,-20,45);
INSERT INTO mob_spawn_points VALUES (17535053,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-114,1,-30,58);
INSERT INTO mob_spawn_points VALUES (17535054,'Vanguard_Pillager','Vanguard Pillager',9392,-106,1,-34,54);
INSERT INTO mob_spawn_points VALUES (17535055,'Vanguard_Vexer','Vanguard Vexer',9398,-100,1,-40,45);
INSERT INTO mob_spawn_points VALUES (17535056,'Vanguard_Trooper','Vanguard Trooper',9397,-92,1,-48,85);
INSERT INTO mob_spawn_points VALUES (17535057,'Warchief_Tombstone','Warchief Tombstone',9400,155.743,-6.8,41.786,128);
INSERT INTO mob_spawn_points VALUES (17535058,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-132,-2,17,45);
INSERT INTO mob_spawn_points VALUES (17535059,'Vanguard_Grappler','Vanguard Grappler',9386,-143,-2,17,45);
INSERT INTO mob_spawn_points VALUES (17535060,'Vanguard_Amputator','Vanguard Amputator',9381,-159,-1,17,54);
INSERT INTO mob_spawn_points VALUES (17535061,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,-170,-1,26,52);
INSERT INTO mob_spawn_points VALUES (17535062,'Vanguard_Vexer','Vanguard Vexer',9398,-184,-1,40,54);
INSERT INTO mob_spawn_points VALUES (17535063,'Vanguard_Pillager','Vanguard Pillager',9392,-192,-1,48,84);
INSERT INTO mob_spawn_points VALUES (17535064,'Vanguard_Trooper','Vanguard Trooper',9397,-193,-2,80,45);
INSERT INTO mob_spawn_points VALUES (17535065,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-203,-2,90,45);
INSERT INTO mob_spawn_points VALUES (17535066,'Vanguard_Hawker','Vanguard Hawker',9388,-254,-3,81,54);
INSERT INTO mob_spawn_points VALUES (17535067,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,54);
INSERT INTO mob_spawn_points VALUES (17535068,'Vanguard_Bugler','Vanguard Bugler',9383,-264,-3,83,54);
INSERT INTO mob_spawn_points VALUES (17535069,'Vanguard_Predator','Vanguard Predator',9393,-265,-4,95,84);
INSERT INTO mob_spawn_points VALUES (17535070,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-265,-3,105,54);
INSERT INTO mob_spawn_points VALUES (17535071,'Vanguard_Backstabber','Vanguard Backstabber',9382,-271,-3,115,54);
INSERT INTO mob_spawn_points VALUES (17535072,'Vanguard_Impaler','Vanguard Impaler',9389,-260,-3,112,21);
INSERT INTO mob_spawn_points VALUES (17535073,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,21);
INSERT INTO mob_spawn_points VALUES (17535074,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,-256,-3,112,54);
INSERT INTO mob_spawn_points VALUES (17535075,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,54);
INSERT INTO mob_spawn_points VALUES (17535076,'Vanguard_Hawker','Vanguard Hawker',9388,-258,-4,97,45);
INSERT INTO mob_spawn_points VALUES (17535077,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17535078,'Vanguard_Bugler','Vanguard Bugler',9383,-166,-2,64,45);
INSERT INTO mob_spawn_points VALUES (17535079,'Vanguard_Grappler','Vanguard Grappler',9386,-171,-2,52,25);
INSERT INTO mob_spawn_points VALUES (17535080,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,-170,-2,57,45);
INSERT INTO mob_spawn_points VALUES (17535081,'Vanguard_Pillager','Vanguard Pillager',9392,-165,-2,52,74);
INSERT INTO mob_spawn_points VALUES (17535082,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-153,-2,51,45);
INSERT INTO mob_spawn_points VALUES (17535083,'Vanguard_Backstabber','Vanguard Backstabber',9382,-156,-2,63,55);
INSERT INTO mob_spawn_points VALUES (17535084,'Vanguard_Trooper','Vanguard Trooper',9397,-149,-2,62,54);
INSERT INTO mob_spawn_points VALUES (17535085,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-148,-2,55,45);
INSERT INTO mob_spawn_points VALUES (17535086,'Vanguard_Amputator','Vanguard Amputator',9381,-132,-6,89,54);
INSERT INTO mob_spawn_points VALUES (17535087,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-114,-6,85,84);
INSERT INTO mob_spawn_points VALUES (17535088,'Vanguard_Bugler','Vanguard Bugler',9383,-102,-6,81,87);
INSERT INTO mob_spawn_points VALUES (17535089,'Vanguard_Predator','Vanguard Predator',9393,-92,-6,73,45);
INSERT INTO mob_spawn_points VALUES (17535090,'Vanguard_Backstabber','Vanguard Backstabber',9382,-91,-6,61,45);
INSERT INTO mob_spawn_points VALUES (17535091,'Vanguard_Grappler','Vanguard Grappler',9386,-92,-4,44,84);
INSERT INTO mob_spawn_points VALUES (17535092,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-23,2,-92,54);
INSERT INTO mob_spawn_points VALUES (17535093,'Vanguard_Predator','Vanguard Predator',9393,-24,2,-86,45);
INSERT INTO mob_spawn_points VALUES (17535094,'Vanguard_Hawker','Vanguard Hawker',9388,-23,2,-77,44);
INSERT INTO mob_spawn_points VALUES (17535095,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,44);
INSERT INTO mob_spawn_points VALUES (17535096,'Vanguard_Impaler','Vanguard Impaler',9389,-16,2,-71,45);
INSERT INTO mob_spawn_points VALUES (17535097,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17535098,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-14,2,-76,54);
INSERT INTO mob_spawn_points VALUES (17535099,'Vanguard_Amputator','Vanguard Amputator',9381,-4,2,-82,45);
INSERT INTO mob_spawn_points VALUES (17535100,'Vanguard_Bugler','Vanguard Bugler',9383,-3,2,-74,45);
INSERT INTO mob_spawn_points VALUES (17535101,'Vanguard_Predator','Vanguard Predator',9393,3,2,-72,45);
INSERT INTO mob_spawn_points VALUES (17535102,'Vanguard_Backstabber','Vanguard Backstabber',9382,9,2,-76,54);
INSERT INTO mob_spawn_points VALUES (17535103,'Vanguard_Grappler','Vanguard Grappler',9386,14,2,-70,45);
INSERT INTO mob_spawn_points VALUES (17535104,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,21,2,-76,55);
INSERT INTO mob_spawn_points VALUES (17535105,'Vanguard_Trooper','Vanguard Trooper',9397,141,-2,114,45);
INSERT INTO mob_spawn_points VALUES (17535106,'Vanguard_Predator','Vanguard Predator',9393,133,-1,74,21);
INSERT INTO mob_spawn_points VALUES (17535107,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,124,-1,74,54);
INSERT INTO mob_spawn_points VALUES (17535108,'Vanguard_Vexer','Vanguard Vexer',9398,96,1,98,84);
INSERT INTO mob_spawn_points VALUES (17535109,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,104,1,105,54);
INSERT INTO mob_spawn_points VALUES (17535110,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,114,-1,101,25);
INSERT INTO mob_spawn_points VALUES (17535111,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,25);
INSERT INTO mob_spawn_points VALUES (17535112,'Vanguard_Backstabber','Vanguard Backstabber',9382,108,-1,85,54);
INSERT INTO mob_spawn_points VALUES (17535116,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,103,4,62,54);
INSERT INTO mob_spawn_points VALUES (17535117,'Vanguard_Amputator','Vanguard Amputator',9381,130,-1,14,54);
INSERT INTO mob_spawn_points VALUES (17535118,'Vanguard_Bugler','Vanguard Bugler',9383,148,-6,57,54);
INSERT INTO mob_spawn_points VALUES (17535119,'Vanguard_Predator','Vanguard Predator',9393,146,-6,25,45);
INSERT INTO mob_spawn_points VALUES (17535120,'Vanguard_Predator','Vanguard Predator',9393,-6,-3,-34,54);
INSERT INTO mob_spawn_points VALUES (17535121,'Vanguard_Vexer','Vanguard Vexer',9398,5,-3,-33,45);
INSERT INTO mob_spawn_points VALUES (17535122,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-98,-2,20,45);
INSERT INTO mob_spawn_points VALUES (17535123,'Vanguard_Backstabber','Vanguard Backstabber',9382,-81,2,3,54);
INSERT INTO mob_spawn_points VALUES (17535124,'Vanguard_Grappler','Vanguard Grappler',9386,-61,2,-19,54);
INSERT INTO mob_spawn_points VALUES (17535125,'Vanguard_Trooper','Vanguard Trooper',9397,-45,2,-24,45);
INSERT INTO mob_spawn_points VALUES (17535126,'Vanguard_Vexer','Vanguard Vexer',9398,-106,-6,85,45);
INSERT INTO mob_spawn_points VALUES (17535127,'Vanguard_Trooper','Vanguard Trooper',9397,-122,-6,88,48);
INSERT INTO mob_spawn_points VALUES (17535128,'Warchief_Tombstone','Warchief Tombstone',9400,-80,-7,-21,31);
INSERT INTO mob_spawn_points VALUES (17535129,'Vanguard_Vexer','Vanguard Vexer',9398,-162,-2,56,45);
INSERT INTO mob_spawn_points VALUES (17535130,'Vanguard_Trooper','Vanguard Trooper',9397,-209,-2,95,54);
INSERT INTO mob_spawn_points VALUES (17535131,'Warchief_Tombstone','Warchief Tombstone',9400,154,-6,42,251);
INSERT INTO mob_spawn_points VALUES (17535132,'Vanguard_Vexer','Vanguard Vexer',9398,-194,-2,72,45);
INSERT INTO mob_spawn_points VALUES (17535133,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,-181,-8,26,65);
INSERT INTO mob_spawn_points VALUES (17535134,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-186,-8,30,24);
INSERT INTO mob_spawn_points VALUES (17535135,'Vanguard_Pillager','Vanguard Pillager',9392,-164,-8,70,45);
INSERT INTO mob_spawn_points VALUES (17535136,'Vanguard_Predator','Vanguard Predator',9393,-152,-8,69,48);
INSERT INTO mob_spawn_points VALUES (17535137,'Vanguard_Vexer','Vanguard Vexer',9398,-82,-7,-19,94);
INSERT INTO mob_spawn_points VALUES (17535138,'Vanguard_Trooper','Vanguard Trooper',9397,-73,-7,-28,45);
INSERT INTO mob_spawn_points VALUES (17535139,'Warchief_Tombstone','Warchief Tombstone',9400,-159,-8,70,127);
INSERT INTO mob_spawn_points VALUES (17535140,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,2,2,-18,45);
INSERT INTO mob_spawn_points VALUES (17535141,'Vanguard_Amputator','Vanguard Amputator',9381,-5,2,-17,45);
INSERT INTO mob_spawn_points VALUES (17535142,'Vanguard_Trooper','Vanguard Trooper',9397,-5,2,-9,45);
INSERT INTO mob_spawn_points VALUES (17535143,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,147,-2,106,65);
INSERT INTO mob_spawn_points VALUES (17535144,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,98,4,52,42);
INSERT INTO mob_spawn_points VALUES (17535145,'Vanguard_Grappler','Vanguard Grappler',9386,100,4,39,45);
INSERT INTO mob_spawn_points VALUES (17535146,'Vanguard_Pillager','Vanguard Pillager',9392,97,4,30,45);
INSERT INTO mob_spawn_points VALUES (17535147,'Vanguard_Trooper','Vanguard Trooper',9397,96,4,17,84);
INSERT INTO mob_spawn_points VALUES (17535148,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,98,2,-17,54);
INSERT INTO mob_spawn_points VALUES (17535149,'Vanguard_Hawker','Vanguard Hawker',9388,51,2,-24,54);
INSERT INTO mob_spawn_points VALUES (17535150,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,54);
INSERT INTO mob_spawn_points VALUES (17535151,'Vanguard_Predator','Vanguard Predator',9393,16,2,-15,54);
INSERT INTO mob_spawn_points VALUES (17535152,'Vanguard_Impaler','Vanguard Impaler',9389,-64,2,-25,45);
INSERT INTO mob_spawn_points VALUES (17535153,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17535156,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-70,2,-44,54);
INSERT INTO mob_spawn_points VALUES (17535157,'Vanguard_Grappler','Vanguard Grappler',9386,-99,2,-14,54);
INSERT INTO mob_spawn_points VALUES (17535158,'Vanguard_Pillager','Vanguard Pillager',9392,-119,-2,19,45);
INSERT INTO mob_spawn_points VALUES (17535159,'Vanguard_Trooper','Vanguard Trooper',9397,-89,-4,47,54);
INSERT INTO mob_spawn_points VALUES (17535160,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-93,-6,66,85);
INSERT INTO mob_spawn_points VALUES (17535161,'Vanguard_Hawker','Vanguard Hawker',9388,-97,-6,76,74);
INSERT INTO mob_spawn_points VALUES (17535162,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,74);
INSERT INTO mob_spawn_points VALUES (17535163,'Vanguard_Predator','Vanguard Predator',9393,-110,-6,86,34);
INSERT INTO mob_spawn_points VALUES (17535164,'Vanguard_Impaler','Vanguard Impaler',9389,-132,-6,82,25);
INSERT INTO mob_spawn_points VALUES (17535165,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,25);
INSERT INTO mob_spawn_points VALUES (17535168,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-149,-2,65,25);
INSERT INTO mob_spawn_points VALUES (17535169,'Vanguard_Gutslasher','Vanguard Gutslasher',9387,-163,-2,59,46);
INSERT INTO mob_spawn_points VALUES (17535170,'Vanguard_Footsoldier','Vanguard Footsoldier',9385,-193,-2,78,87);
INSERT INTO mob_spawn_points VALUES (17535171,'Vanguard_Pillager','Vanguard Pillager',9392,-199,-2,78,88);
INSERT INTO mob_spawn_points VALUES (17535172,'Vanguard_Neckchopper','Vanguard Neckchopper',9391,-205,-2,96,45);
INSERT INTO mob_spawn_points VALUES (17535173,'Vanguard_Hawker','Vanguard Hawker',9388,-251,-4,95,58);
INSERT INTO mob_spawn_points VALUES (17535174,'Vanguards_Hecteyes',"Vanguard's Hecteyes",9395,1,1,1,58);
INSERT INTO mob_spawn_points VALUES (17535175,'Vanguard_Backstabber','Vanguard Backstabber',9382,-255,-3,88,84);
INSERT INTO mob_spawn_points VALUES (17535176,'Vanguard_Backstabber','Vanguard Backstabber',9382,-272,-3,77,87);
INSERT INTO mob_spawn_points VALUES (17535177,'Vanguard_Grappler','Vanguard Grappler',9386,-261,-3,117,78);
INSERT INTO mob_spawn_points VALUES (17535178,'Vanguard_Trooper','Vanguard Trooper',9397,141,-1,59,54);
INSERT INTO mob_spawn_points VALUES (17535179,'Vanguard_Impaler','Vanguard Impaler',9389,143,-1,27,45);
INSERT INTO mob_spawn_points VALUES (17535180,'Vanguards_Wyvern',"Vanguard's Wyvern",9396,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17535181,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,101,4,23,35);
INSERT INTO mob_spawn_points VALUES (17535182,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,35);
INSERT INTO mob_spawn_points VALUES (17535183,'Vanguard_Amputator','Vanguard Amputator',9381,85,2,8,45);
INSERT INTO mob_spawn_points VALUES (17535184,'Vanguard_Amputator','Vanguard Amputator',9381,105,1,-32,45);
INSERT INTO mob_spawn_points VALUES (17535185,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,74,2,-53,45);
INSERT INTO mob_spawn_points VALUES (17535186,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,20,2,-71,45);
INSERT INTO mob_spawn_points VALUES (17535187,'Vanguard_Vexer','Vanguard Vexer',9398,-12,2,-80,45);
INSERT INTO mob_spawn_points VALUES (17535188,'Vanguard_Vexer','Vanguard Vexer',9398,-85,1,-62,45);
INSERT INTO mob_spawn_points VALUES (17535189,'Vanguard_Bugler','Vanguard Bugler',9383,-113,-2,15,75);
INSERT INTO mob_spawn_points VALUES (17535190,'Vanguard_Bugler','Vanguard Bugler',9383,-177,-1,34,84);
INSERT INTO mob_spawn_points VALUES (17535191,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,-166,-1,20,45);
INSERT INTO mob_spawn_points VALUES (17535192,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,45);
INSERT INTO mob_spawn_points VALUES (17535195,'Vanguard_Amputator','Vanguard Amputator',9381,130,-1,86,84);
INSERT INTO mob_spawn_points VALUES (17535196,'Vanguard_Amputator','Vanguard Amputator',9381,119,-1,76,52);
INSERT INTO mob_spawn_points VALUES (17535197,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,98,4,65,52);
INSERT INTO mob_spawn_points VALUES (17535198,'Vanguard_Mesmerizer','Vanguard Mesmerizer',9390,108,-1,89,52);
INSERT INTO mob_spawn_points VALUES (17535199,'Vanguard_Vexer','Vanguard Vexer',9398,133,-2,114,25);
INSERT INTO mob_spawn_points VALUES (17535200,'Vanguard_Vexer','Vanguard Vexer',9398,-33,2,-19,74);
INSERT INTO mob_spawn_points VALUES (17535201,'Vanguard_Bugler','Vanguard Bugler',9383,-125,-2,20,64);
INSERT INTO mob_spawn_points VALUES (17535202,'Vanguard_Bugler','Vanguard Bugler',9383,-137,-6,89,84);
INSERT INTO mob_spawn_points VALUES (17535203,'Vanguard_Dollmaster','Vanguard Dollmaster',9384,-157,-2,52,45);
INSERT INTO mob_spawn_points VALUES (17535204,'Vanguards_Avatar',"Vanguard's Avatar",9394,1,1,1,45);
INSERT INTO `mob_spawn_points` VALUES (17535250,'Serjeant_Tombstone','',9379,136.688,-2,105.391,90);
INSERT INTO `mob_spawn_points` VALUES (17535251,'Serjeant_Tombstone','',9379,119.913,0.1,95.374,190);
INSERT INTO `mob_spawn_points` VALUES (17535252,'Serjeant_Tombstone','',9379,126.682,0.1,88.107,5);
INSERT INTO `mob_spawn_points` VALUES (17535253,'Serjeant_Tombstone','',9379,112.427,0.1,87.995,130);
INSERT INTO `mob_spawn_points` VALUES (17535254,'Serjeant_Tombstone','',9379,119.876,0.1,81.210,70);
INSERT INTO `mob_spawn_points` VALUES (17535255,'Serjeant_Tombstone','',9379,99.192,1,105.045,25);
INSERT INTO `mob_spawn_points` VALUES (17535256,'Serjeant_Tombstone','',9379,104.360,1.739,72.454,225);
INSERT INTO `mob_spawn_points` VALUES (17535257,'Serjeant_Tombstone','',9379,94.124,4,67.970,5);
INSERT INTO `mob_spawn_points` VALUES (17535258,'Serjeant_Tombstone','',9379,93.551,4,57.181,255);
INSERT INTO `mob_spawn_points` VALUES (17535259,'Serjeant_Tombstone','',9379,101.437,4,49.919,128);
INSERT INTO `mob_spawn_points` VALUES (17535260,'Serjeant_Tombstone','',9379,94.517,4,38.095,255);
INSERT INTO `mob_spawn_points` VALUES (17535261,'Serjeant_Tombstone','',9379,101.365,4,31.923,128);
INSERT INTO `mob_spawn_points` VALUES (17535262,'Serjeant_Tombstone','',9379,98.076,4,43.770,190);
INSERT INTO `mob_spawn_points` VALUES (17535263,'Serjeant_Tombstone','',9379,113.037,2,13.811,255);
INSERT INTO `mob_spawn_points` VALUES (17535264,'Serjeant_Tombstone','',9379,125.664,0.1,14.071,255);
INSERT INTO `mob_spawn_points` VALUES (17535265,'Serjeant_Tombstone','',9379,146.385,0.1,25.423,155);
INSERT INTO `mob_spawn_points` VALUES (17535266,'Serjeant_Tombstone','',9379,153.443,0.1,41.915,128);
INSERT INTO `mob_spawn_points` VALUES (17535267,'Serjeant_Tombstone','',9379,144.434,0.1,50.906,165);
INSERT INTO `mob_spawn_points` VALUES (17535268,'Serjeant_Tombstone','',9379,147.277,0.1,53.352,165);
INSERT INTO `mob_spawn_points` VALUES (17535269,'Serjeant_Tombstone','',9379,81.960,2,10.032,225);
INSERT INTO `mob_spawn_points` VALUES (17535270,'Serjeant_Tombstone','',9379,85.910,2,6.150,225);
INSERT INTO `mob_spawn_points` VALUES (17535271,'Serjeant_Tombstone','',9379,89.895,2,1.904,225);
INSERT INTO `mob_spawn_points` VALUES (17535272,'Serjeant_Tombstone','',9379,84.160,-7.4,-17.395,155);
INSERT INTO `mob_spawn_points` VALUES (17535273,'Serjeant_Tombstone','',9379,78.887,-7.4,-22.825,155);
INSERT INTO `mob_spawn_points` VALUES (17535274,'Serjeant_Tombstone','',9379,73.609,-7.4,-28.174,155);
INSERT INTO `mob_spawn_points` VALUES (17535275,'Serjeant_Tombstone','',9379,91.528,2,-19.360,155);
INSERT INTO `mob_spawn_points` VALUES (17535276,'Serjeant_Tombstone','',9379,83.408,2,-27.379,155);
INSERT INTO `mob_spawn_points` VALUES (17535277,'Serjeant_Tombstone','',9379,75.633,2,-35.393,155);
INSERT INTO `mob_spawn_points` VALUES (17535278,'Serjeant_Tombstone','',9379,106.661,1,-42.704,155);
INSERT INTO `mob_spawn_points` VALUES (17535279,'Serjeant_Tombstone','',9379,102.736,1,-46.729,155);
INSERT INTO `mob_spawn_points` VALUES (17535280,'Serjeant_Tombstone','',9379,98.765,1,-50.868,155);
INSERT INTO `mob_spawn_points` VALUES (17535281,'Serjeant_Tombstone','',9379,85.317,1,-69.369,190);
INSERT INTO `mob_spawn_points` VALUES (17535282,'Serjeant_Tombstone','',9379,55.858,-8.6,-30.485,190);
INSERT INTO `mob_spawn_points` VALUES (17535283,'Serjeant_Tombstone','',9379,40.007,2,-29.999,190);
INSERT INTO `mob_spawn_points` VALUES (17535284,'Serjeant_Tombstone','',9379,28.071,2,-17.941,65);
INSERT INTO `mob_spawn_points` VALUES (17535285,'Serjeant_Tombstone','',9379,19.138,2.1,-2.147,65);
INSERT INTO `mob_spawn_points` VALUES (17535286,'Serjeant_Tombstone','',9379,25.969,2.1,14.172,65);
INSERT INTO `mob_spawn_points` VALUES (17535287,'Serjeant_Tombstone','',9379,-0.086,0.627,12.160,65);
INSERT INTO `mob_spawn_points` VALUES (17535288,'Serjeant_Tombstone','',9379,3.958,1.601,6.318,65);
INSERT INTO `mob_spawn_points` VALUES (17535289,'Serjeant_Tombstone','',9379,-4.098,1.595,6.354,65);
INSERT INTO `mob_spawn_points` VALUES (17535290,'Serjeant_Tombstone','',9379,-0.075,2,-3.755,65);
INSERT INTO `mob_spawn_points` VALUES (17535291,'Serjeant_Tombstone','',9379,-25.969,2.1,14.172,65);
INSERT INTO `mob_spawn_points` VALUES (17535292,'Serjeant_Tombstone','',9379,-19.138,2.1,-2.147,65);
INSERT INTO `mob_spawn_points` VALUES (17535293,'Serjeant_Tombstone','',9379,-28.071,2,-17.941,65);
INSERT INTO `mob_spawn_points` VALUES (17535294,'Serjeant_Tombstone','',9379,-40.007,2,-29.999,190);
INSERT INTO `mob_spawn_points` VALUES (17535295,'Serjeant_Tombstone','',9379,-14.034,1.7,-30.551,190);
INSERT INTO `mob_spawn_points` VALUES (17535296,'Serjeant_Tombstone','',9400,-11.855,-3,-34.075,190);
INSERT INTO `mob_spawn_points` VALUES (17535297,'Serjeant_Tombstone','',9379,-0.078,1.7,-25.982,190);
INSERT INTO `mob_spawn_points` VALUES (17535298,'Serjeant_Tombstone','',9400,0.068,-3,-32.329,190);
INSERT INTO `mob_spawn_points` VALUES (17535299,'Serjeant_Tombstone','',9379,14.034,1.7,-30.551,190);
INSERT INTO `mob_spawn_points` VALUES (17535300,'Serjeant_Tombstone','',9400,11.855,-3,-34.075,190);
INSERT INTO `mob_spawn_points` VALUES (17535301,'Serjeant_Tombstone','',9379,-10.351,2,-76.692,190);
INSERT INTO `mob_spawn_points` VALUES (17535302,'Serjeant_Tombstone','',9379,-6.2,2,-83.441,190);
INSERT INTO `mob_spawn_points` VALUES (17535303,'Serjeant_Tombstone','',9379,3.02,2,-76.773,190);
INSERT INTO `mob_spawn_points` VALUES (17535304,'Serjeant_Tombstone','',9379,6.916,2.2,-87.229,155);
INSERT INTO `mob_spawn_points` VALUES (17535305,'Serjeant_Tombstone','',9379,16.217,2.2,-96.770,190);
INSERT INTO `mob_spawn_points` VALUES (17535306,'Serjeant_Tombstone','',9379,26.094,2.2,-96.770,190);
INSERT INTO `mob_spawn_points` VALUES (17535307,'Serjeant_Tombstone','',9379,-55.735,-8.6,-30.619,195);
INSERT INTO `mob_spawn_points` VALUES (17535308,'Serjeant_Tombstone','',9379,-73.609,-7.4,-28.174,155);
INSERT INTO `mob_spawn_points` VALUES (17535309,'Serjeant_Tombstone','',9379,-78.887,-7.4,-22.825,155);
INSERT INTO `mob_spawn_points` VALUES (17535310,'Serjeant_Tombstone','',9379,-84.160,-7.4,-17.395,155);
INSERT INTO `mob_spawn_points` VALUES (17535311,'Serjeant_Tombstone','',9379,-75.633,2,-35.393,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535312,'Serjeant_Tombstone','',9379,-83.408,2,-27.379,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535313,'Serjeant_Tombstone','',9379,-91.528,2,-19.360,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535314,'Serjeant_Tombstone','',9379,-98.765,1,-50.868,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535315,'Serjeant_Tombstone','',9379,-102.736,1,-46.729,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535316,'Serjeant_Tombstone','',9379,-106.661,1,-42.704,224.125);
INSERT INTO `mob_spawn_points` VALUES (17535317,'Serjeant_Tombstone','',9379,-126.651,1,-29.291,255);
INSERT INTO `mob_spawn_points` VALUES (17535318,'Serjeant_Tombstone','',9379,-95.9,-2,23.701,25);
INSERT INTO `mob_spawn_points` VALUES (17535319,'Serjeant_Tombstone','',9379,-100.9,-2,20.701,25);
INSERT INTO `mob_spawn_points` VALUES (17535320,'Serjeant_Tombstone','',9379,-105.9,-2,16.701,25);
INSERT INTO `mob_spawn_points` VALUES (17535321,'Serjeant_Tombstone','',9379,-111.6,-2,31.857,25);
INSERT INTO `mob_spawn_points` VALUES (17535322,'Serjeant_Tombstone','',9379,-114.02,-2,13.153,190);
INSERT INTO `mob_spawn_points` VALUES (17535323,'Serjeant_Tombstone','',9379,-124.114,-2,15.237,190);
INSERT INTO `mob_spawn_points` VALUES (17535324,'Serjeant_Tombstone','',9379,-144.053,-2,14.465,190);
INSERT INTO `mob_spawn_points` VALUES (17535325,'Serjeant_Tombstone','',9379,-161.881,-1,24.125,60);
INSERT INTO `mob_spawn_points` VALUES (17535326,'Serjeant_Tombstone','',9379,-177.702,-1,28.398,225);
INSERT INTO `mob_spawn_points` VALUES (17535327,'Serjeant_Tombstone','',9379,-175.075,-1.5,36.880,100);
INSERT INTO `mob_spawn_points` VALUES (17535328,'Serjeant_Tombstone','',9379,-183.367,-1,34.208,225);
INSERT INTO `mob_spawn_points` VALUES (17535329,'Serjeant_Tombstone','',9379,-173.159,-8.8,16.215,225);
INSERT INTO `mob_spawn_points` VALUES (17535330,'Serjeant_Tombstone','',9379,-183.730,-8.8,27.698,225);
INSERT INTO `mob_spawn_points` VALUES (17535331,'Serjeant_Tombstone','',9379,-195.499,-8.8,38.713,225);
INSERT INTO `mob_spawn_points` VALUES (17535332,'Serjeant_Tombstone','',9379,-193.875,-1,54.937,65);
INSERT INTO `mob_spawn_points` VALUES (17535333,'Serjeant_Tombstone','',9379,-193.875,-2,68.196,65);
INSERT INTO `mob_spawn_points` VALUES (17535334,'Serjeant_Tombstone','',9379,-188.946,-8.8,87.053,105);
INSERT INTO `mob_spawn_points` VALUES (17535335,'Serjeant_Tombstone','',9379,-201.774,-2,88.746,30);
INSERT INTO `mob_spawn_points` VALUES (17535336,'Serjeant_Tombstone','',9379,-213.153,-2,98.015,0);
INSERT INTO `mob_spawn_points` VALUES (17535337,'Serjeant_Tombstone','',9379,-223.966,-2,98.015,0);
INSERT INTO `mob_spawn_points` VALUES (17535338,'Serjeant_Tombstone','',9379,-267.133,-4,98.228,255);
INSERT INTO `mob_spawn_points` VALUES (17535339,'Serjeant_Tombstone','',9379,-163.956,-2,54.866,190);
INSERT INTO `mob_spawn_points` VALUES (17535340,'Serjeant_Tombstone','',9379,-159.058,-2,65.685,65);
INSERT INTO `mob_spawn_points` VALUES (17535341,'Serjeant_Tombstone','',9379,-152.404,-2,54.866,190);
INSERT INTO `mob_spawn_points` VALUES (17535342,'Serjeant_Tombstone','',9379,-131.804,-4,68.627,190);
INSERT INTO `mob_spawn_points` VALUES (17535343,'Serjeant_Tombstone','',9379,-139.782,-6,90.329,255);
INSERT INTO `mob_spawn_points` VALUES (17535344,'Serjeant_Tombstone','',9379,-122.706,-6,85.879,190);
INSERT INTO `mob_spawn_points` VALUES (17535345,'Serjeant_Tombstone','',9379,-137.122,-10.8,64.746,30);
INSERT INTO `mob_spawn_points` VALUES (17535346,'Serjeant_Tombstone','',9379,-105.611,-6,85.224,30);
INSERT INTO `mob_spawn_points` VALUES (17535347,'Serjeant_Tombstone','',9379,-93.840,-6,72.156,65);
INSERT INTO `mob_spawn_points` VALUES (17535348,'Serjeant_Tombstone','',9379,-89.938,-4,51.306,65);
INSERT INTO `mob_spawn_points` VALUES (17535349,'Serjeant_Tombstone','',9379,-93.582,-4,42.906,95);

-- Sandy Groups
INSERT INTO mob_groups VALUES (1,363,185,  'Battlechoir_Gitchfotch',0,128,0,8000,0,88,90,0);
INSERT INTO mob_groups VALUES (2,3076,185, 'Overlords_Tombstone',0,128,0,12500,12500,88,90,0);
INSERT INTO mob_groups VALUES (3,3340,185, 'Reapertongue_Gadgquok',0,128,0,8000,0,88,90,0);
INSERT INTO mob_groups VALUES (4,3548,185, 'Serjeant_Tombstone',0,128,2201,1000,1000,77,79,0);
INSERT INTO mob_groups VALUES (5,3705,185, 'Soulsender_Fugbrag',0,128,0,8000,0,88,90,0);
INSERT INTO mob_groups VALUES (6,4135,185, 'Vanguard_Amputator',0,128,3701,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (7,4138,185, 'Vanguard_Backstabber',0,128,3716,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (8,4140,185, 'Vanguard_Bugler',0,128,3726,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (9,4144,185, 'Vanguard_Dollmaster',0,128,3746,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (10,4150,185,'Vanguard_Footsoldier',0,128,3770,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (11,4151,185,'Vanguard_Grappler',0,128,3775,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (12,4152,185,'Vanguard_Gutslasher',0,128,3780,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (13,4154,185,'Vanguard_Hawker',0,128,3790,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (14,4156,185,'Vanguard_Impaler',0,128,3800,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (15,4162,185,'Vanguard_Mesmerizer',0,128,3830,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (16,4165,185,'Vanguard_Neckchopper',0,128,3845,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (17,4172,185,'Vanguard_Pillager',0,128,3880,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (18,4174,185,'Vanguard_Predator',0,128,3890,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (19,4185,185,'Vanguards_Avatar',0,128,0,2400,0,88,90,0);
INSERT INTO mob_groups VALUES (20,4187,185,'Vanguards_Hecteyes',0,128,0,2400,0,88,90,0);
INSERT INTO mob_groups VALUES (21,4190,185,'Vanguards_Wyvern',0,128,0,2400,0,88,90,0);
INSERT INTO mob_groups VALUES (22,4193,185,'Vanguard_Trooper',0,128,3955,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (23,4195,185,'Vanguard_Vexer',0,128,3965,4000,0,88,90,0);
INSERT INTO mob_groups VALUES (24,4243,185,'Voidstreaker_Butchnotch',0,128,0,8000,0,88,90,0);
INSERT INTO mob_groups VALUES (25,4289,185,'Warchief_Tombstone',0,128,0,1000,1000,88,90,0);
INSERT INTO mob_groups VALUES (26,4387,185,'Wyrmgnasher_Bjakdek',0,128,0,8000,0,88,90,0);

-- No roam or links
UPDATE mob_pools SET roamflag=256, links=0 WHERE poolid=3548;

-- make sure tombstones spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=185 and name='Serjeant_Tombstone';

-- make it so tombstones respawn to 1 hour
UPDATE mob_groups SET respawntime=3600 WHERE zoneid=185 and name='Serjeant_Tombstone';

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=185 and mobid>=17534977 and mobid <= 17535390;

-- Remove 100ccs
DELETE FROM mob_droplist WHERE itemId=1453;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=185);
-- Should be redundant...... but the above one isn't working
DELETE FROM mob_droplist WHERE dropId=2201;
DELETE FROM mob_droplist WHERE dropId=2548;

-- Regular Mobs
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1452, 1000); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1452, 500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1452, 250); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1452, 125); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1516, 10); -- griffon_hide
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1517, 10); -- giant_frozen_head
INSERT INTO mob_droplist VALUES (2548, 0, 0, 1000, 1519, 10); -- fresh_orc_liver
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 11388, 67); -- pantin_babouches
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15025, 66); -- mirage_bazubands
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15040, 67); -- argute_bracers
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15074, 66); -- clerics_cap
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15081, 67); -- bards_roundlet
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15108, 66); -- valor_gauntlets
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15118, 67); -- melee_hose
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15125, 66); -- monster_trousers
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15127, 67); -- scouts_braccae
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15129, 66); -- koga_hakama
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15132, 67); -- warriors_calligae
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15136, 67); -- duelists_boots
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15145, 67); -- wyrm_greaves
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 15146, 67); -- summoners_pigaches
INSERT INTO mob_droplist VALUES (2548, 1, 1, 1, 16349, 67); -- commodore_trews

-- Serjeant Tombstones
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1452, 1000); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2201, 0, 0, 1000, 1474, 100); -- infinity_core

-- Add the drop pools
UPDATE mob_groups SET dropid=2548 WHERE zoneid=185;
UPDATE mob_groups SET dropid=2201 WHERE zoneid=185 and name='Serjeant_Tombstone';





--
-- Dynamis Windurst ZoneId: 187
--

-- Windy Mobs
INSERT INTO `mob_spawn_points` VALUES (17543169,'Tzee_Xicu_Idol','Tzee Xicu Idol',9436,44.340,-2.5,-62.903,65);
INSERT INTO `mob_spawn_points` VALUES (17543170,'Maa_Febi_the_Steadfast','Maa Febi the Steadfast',9433,44.340,-2.5,-62.903,65);
INSERT INTO `mob_spawn_points` VALUES (17543171,'Muu_Febi_the_Steadfast','Muu Febi the Steadfast',9435,44.340,-2.5,-62.903,65);
INSERT INTO `mob_spawn_points` VALUES (17543172,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543173,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543174,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543175,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543176,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543177,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543178,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543179,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543180,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543181,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543182,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543183,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543184,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543185,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543186,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543187,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543188,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543189,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543190,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543191,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543192,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543193,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543194,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543195,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543196,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543197,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543198,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543199,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543200,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543201,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543202,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543203,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543204,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543205,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543206,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543207,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543208,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543209,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543210,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543211,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543212,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543213,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543214,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543215,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543216,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543217,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543218,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543219,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543220,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543221,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543222,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543223,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543224,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543225,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543226,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543227,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543228,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543229,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543230,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543231,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543232,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543233,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543234,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543235,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543236,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543237,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543238,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543239,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543240,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543241,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543242,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543243,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543244,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543245,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543246,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543247,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543248,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543249,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543250,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543251,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543252,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543253,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543254,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543255,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543256,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543257,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543258,'Avatar_Idol','Avatar Idol',9430,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543259,'Avatar_Idol','Avatar Idol',9430,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543260,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543261,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543262,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543263,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543264,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543265,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543266,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543267,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543270,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543271,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543272,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543273,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543274,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543275,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543276,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543277,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543278,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543279,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543280,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543281,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543282,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543283,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543284,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543285,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543286,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543287,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543288,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543289,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543290,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543291,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543292,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543293,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543294,'Haa_Pevi_the_Stentorian','Haa Pevi the Stentorian',9431,-24.873,-13,258.246,65);
INSERT INTO `mob_spawn_points` VALUES (17543295,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543296,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543297,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543298,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543299,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543300,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543301,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543302,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543303,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543304,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543307,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543308,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543309,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543310,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543311,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543312,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543313,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543314,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543315,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543316,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543317,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543318,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543319,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543320,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543321,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543322,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543323,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543324,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543325,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543326,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543327,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543328,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543329,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543330,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543331,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543332,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543333,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543334,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543335,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543336,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543337,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543338,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543339,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543340,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543341,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543342,'Avatar_Idol','Avatar Idol',9430,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543343,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543344,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543345,'Loo_Hepe_the_Eyepiercer','Loo Hepe the Eyepiercer',9432,-0.07,-16.750,129.980,65);
INSERT INTO `mob_spawn_points` VALUES (17543346,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543347,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543348,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543349,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543350,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543351,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543352,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543355,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543356,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543357,'Wuu_Qoho_the_Razorclaw','Wuu Qoho the Razorclaw',9455,120.041,-11.5,151.849,135);
INSERT INTO `mob_spawn_points` VALUES (17543358,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543359,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543360,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543361,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543364,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543365,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543366,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543367,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543368,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543369,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543370,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543371,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543372,'Avatar_Idol','Avatar Idol',9430,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543373,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543374,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543375,'Xoo_Kaza_the_Solemn','Xoo Kaza the Solemn',9456,-97.159,-18,194.119,35);
INSERT INTO `mob_spawn_points` VALUES (17543376,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543377,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543378,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543379,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543380,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543381,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543382,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543383,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543384,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543385,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543386,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543387,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543388,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543389,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543390,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543391,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543394,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543395,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543396,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543397,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543398,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543399,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543400,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543401,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543402,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543403,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543404,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543405,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543406,'Vanguard_Ogresoother','Vanguard Ogresoother',9442,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543407,'Vanguards_Crow',"Vanguard's Crow",9452,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543408,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543411,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543412,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543413,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543414,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543415,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543416,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543417,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543418,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543422,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543423,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543424,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543425,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543426,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543427,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543428,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543429,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543430,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543431,'Vanguard_Partisan','Vanguard Partisan',9444,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543432,'Vanguards_Wyvern',"Vanguard's Wyvern",9453,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543433,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543434,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543435,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543436,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543437,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543438,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543439,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543440,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543441,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543442,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543443,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543444,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543445,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543446,'Avatar_Idol','Avatar Idol',9430,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543447,'Vanguard_Skirmisher','Vanguard Skirmisher',9450,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543448,'Vanguard_Sentinel','Vanguard Sentinel',9449,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543449,'Vanguard_Priest','Vanguard Priest',9447,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543450,'Vanguard_Prelate','Vanguard Prelate',9446,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543451,'Vanguard_Visionary','Vanguard Visionary',9454,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543452,'Vanguard_Liberator','Vanguard Liberator',9441,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543453,'Vanguard_Exemplar','Vanguard Exemplar',9439,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543454,'Vanguard_Inciter','Vanguard Inciter',9440,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543455,'Vanguard_Chanter','Vanguard Chanter',9438,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543456,'Vanguard_Salvager','Vanguard Salvager',9448,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543457,'Vanguard_Persecutor','Vanguard Persecutor',9445,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543458,'Vanguard_Assassin','Vanguard Assassin',9437,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543459,'Vanguard_Oracle','Vanguard Oracle',9443,0.1,-16,167,128);
INSERT INTO `mob_spawn_points` VALUES (17543460,'Vanguards_Avatar',"Vanguard's Avatar",9451,1,1,1,128);
INSERT INTO `mob_spawn_points` VALUES (17543461,'Avatar_Icon','Avatar Icon',9429,-187.639,-1.046,-118.963,125);
INSERT INTO `mob_spawn_points` VALUES (17543462,'Avatar_Icon','Avatar Icon',9429,-161.145,-1.227,-122.154,165);
INSERT INTO `mob_spawn_points` VALUES (17543463,'Avatar_Icon','Avatar Icon',9429,-158.535,-1.162,-118.347,165);
INSERT INTO `mob_spawn_points` VALUES (17543490,'Avatar_Icon','',9429,-144.618,-1.982,-139.346,85);
INSERT INTO `mob_spawn_points` VALUES (17543491,'Avatar_Icon','',9429,-136.794,-2.823,-138.889,65);
INSERT INTO `mob_spawn_points` VALUES (17543492,'Avatar_Icon','',9429,-126.172,-2.590,-142.082,65);
INSERT INTO `mob_spawn_points` VALUES (17543493,'Avatar_Icon','',9429,-108.605,-2.549,-134.611,85);
INSERT INTO `mob_spawn_points` VALUES (17543494,'Avatar_Icon','',9434,-79.651,-2.5,-118.350,115);
INSERT INTO `mob_spawn_points` VALUES (17543495,'Avatar_Icon','',9429,-52.504,-2.5,-111.144,165);
INSERT INTO `mob_spawn_points` VALUES (17543496,'Avatar_Icon','',9429,-38.032,-2.5,-85.584,85);
INSERT INTO `mob_spawn_points` VALUES (17543497,'Avatar_Icon','',9429,-23.906,-2.5,-61.261,85);
INSERT INTO `mob_spawn_points` VALUES (17543498,'Avatar_Icon','',9429,-3.274,-4.019,-64.248,200);
INSERT INTO `mob_spawn_points` VALUES (17543499,'Avatar_Icon','',9429,0.370,-5.944,-37.463,65);
INSERT INTO `mob_spawn_points` VALUES (17543500,'Avatar_Icon','',9429,-0.461,-6.674,-31.350,65);
INSERT INTO `mob_spawn_points` VALUES (17543501,'Avatar_Icon','',9429,3.824,-6.994,-31.350,65);
INSERT INTO `mob_spawn_points` VALUES (17543502,'Avatar_Icon','',9429,21.205,-2.812,-50.742,65);
INSERT INTO `mob_spawn_points` VALUES (17543503,'Avatar_Icon','',9429,36.275,-2.5,-58.587,65);
INSERT INTO `mob_spawn_points` VALUES (17543504,'Avatar_Icon','',9429,44.125,-2.5,-59.244,65);
INSERT INTO `mob_spawn_points` VALUES (17543505,'Avatar_Icon','',9429,52.323,-2.5,-58.587,65);
INSERT INTO `mob_spawn_points` VALUES (17543506,'Avatar_Icon','',9429,40.207,-1.453,-78.510,185);
INSERT INTO `mob_spawn_points` VALUES (17543507,'Avatar_Icon','',9429,83.963,-2.5,-96.033,175);
INSERT INTO `mob_spawn_points` VALUES (17543508,'Avatar_Icon','',9429,90.652,-2.727,-148.551,185);
INSERT INTO `mob_spawn_points` VALUES (17543509,'Avatar_Icon','',9429,65.185,-7.5,-57.768,195);
INSERT INTO `mob_spawn_points` VALUES (17543510,'Avatar_Icon','',9429,42.378,-7.5,-51.584,195);
INSERT INTO `mob_spawn_points` VALUES (17543511,'Avatar_Icon','',9429,30.451,-6.572,-39.108,65);
INSERT INTO `mob_spawn_points` VALUES (17543512,'Avatar_Icon','',9429,-8.801,-9.033,-17.102,195);
INSERT INTO `mob_spawn_points` VALUES (17543513,'Avatar_Icon','',9429,9.895,-9.313,-14.138,195);
INSERT INTO `mob_spawn_points` VALUES (17543514,'Avatar_Icon','',9429,27.652,-10,8.739,105);
INSERT INTO `mob_spawn_points` VALUES (17543515,'Avatar_Icon','',9429,46.422,-9.835,28.752,5);
INSERT INTO `mob_spawn_points` VALUES (17543516,'Avatar_Icon','',9429,49.930,-9.942,41.450,80);
INSERT INTO `mob_spawn_points` VALUES (17543517,'Avatar_Icon','',9429,64.334,-9.874,26.454,155);
INSERT INTO `mob_spawn_points` VALUES (17543518,'Avatar_Icon','',9429,86.974,-2.5,85.454,135);
INSERT INTO `mob_spawn_points` VALUES (17543519,'Avatar_Icon','',9429,101.048,-2.5,109.966,135);
INSERT INTO `mob_spawn_points` VALUES (17543520,'Avatar_Icon','',9429,102.260,-2.560,120.680,135);
INSERT INTO `mob_spawn_points` VALUES (17543521,'Avatar_Icon','',9429,110.463,-8,113.824,135);
INSERT INTO `mob_spawn_points` VALUES (17543522,'Avatar_Icon','',9429,120.041,-11.5,151.849,135);
INSERT INTO `mob_spawn_points` VALUES (17543523,'Avatar_Icon','',9429,120.041,-11.5,148.919,135);
INSERT INTO `mob_spawn_points` VALUES (17543524,'Avatar_Icon','',9429,120.041,-11.5,155.017,135);
INSERT INTO `mob_spawn_points` VALUES (17543525,'Avatar_Icon','',9429,118.004,-11.5,151.849,135);
INSERT INTO `mob_spawn_points` VALUES (17543526,'Avatar_Icon','',9429,99.246,-8.784,152.172,135);
INSERT INTO `mob_spawn_points` VALUES (17543527,'Avatar_Icon','',9429,102.710,-10.386,137.261,250);
INSERT INTO `mob_spawn_points` VALUES (17543528,'Avatar_Icon','',9429,106.473,-10.270,173.311,155);
INSERT INTO `mob_spawn_points` VALUES (17543529,'Avatar_Icon','',9429,92.322,-7.608,188.556,95);
INSERT INTO `mob_spawn_points` VALUES (17543530,'Avatar_Icon','',9429,99.466,-7.5,187.188,95);
INSERT INTO `mob_spawn_points` VALUES (17543531,'Avatar_Icon','',9429,91.105,-7.5,195.459,95);
INSERT INTO `mob_spawn_points` VALUES (17543532,'Avatar_Icon','',9429,95.517,-8.026,191.536,95);
INSERT INTO `mob_spawn_points` VALUES (17543533,'Avatar_Icon','',9429,117.729,-12.5,201.286,95);
INSERT INTO `mob_spawn_points` VALUES (17543534,'Avatar_Icon','',9429,-87.922,-2.5,40.738,30);
INSERT INTO `mob_spawn_points` VALUES (17543535,'Avatar_Icon','',9429,-74.119,-2.5,26.479,155);
INSERT INTO `mob_spawn_points` VALUES (17543536,'Avatar_Icon','',9429,-72.609,-2.5,25.107,155);
INSERT INTO `mob_spawn_points` VALUES (17543537,'Avatar_Icon','',9429,-70.349,-2.5,23.216,155);
INSERT INTO `mob_spawn_points` VALUES (17543538,'Avatar_Icon','',9429,-88.225,-5,83.377,65);
INSERT INTO `mob_spawn_points` VALUES (17543539,'Avatar_Icon','',9429,-88.225,-6.071,86.674,65);
INSERT INTO `mob_spawn_points` VALUES (17543540,'Avatar_Icon','',9429,-88.225,-6.944,89.527,65);
INSERT INTO `mob_spawn_points` VALUES (17543541,'Avatar_Icon','',9429,-87.144,-9.464,104.559,65);
INSERT INTO `mob_spawn_points` VALUES (17543542,'Avatar_Icon','',9429,-70.664,-5.342,121.321,160);
INSERT INTO `mob_spawn_points` VALUES (17543543,'Avatar_Icon','',9429,-70.798,-5,125.08,160);
INSERT INTO `mob_spawn_points` VALUES (17543544,'Avatar_Icon','',9429,-72.933,-5.347,122.258,160);
INSERT INTO `mob_spawn_points` VALUES (17543545,'Avatar_Icon','',9429,-99.357,-5.5,130.757,240);
INSERT INTO `mob_spawn_points` VALUES (17543546,'Avatar_Icon','',9429,-97.498,-5.5,127.194,5);
INSERT INTO `mob_spawn_points` VALUES (17543547,'Avatar_Icon','',9429,-100.114,5.250,134.822,225);
INSERT INTO `mob_spawn_points` VALUES (17543548,'Avatar_Icon','',9429,-98.051,-5.250,124.362,15);
INSERT INTO `mob_spawn_points` VALUES (17543549,'Avatar_Icon','',9429,-85.803,-5.805,121.716,65);
INSERT INTO `mob_spawn_points` VALUES (17543550,'Avatar_Icon','',9429,-102.751,-5.250,136.649,210);
INSERT INTO `mob_spawn_points` VALUES (17543551,'Avatar_Icon','',9429,-98.692,-5.320,148.536,75);
INSERT INTO `mob_spawn_points` VALUES (17543552,'Avatar_Icon','',9429,-95.698,-5.450,148.536,75);
INSERT INTO `mob_spawn_points` VALUES (17543553,'Avatar_Icon','',9429,-104.634,-10.5,128.782,240);
INSERT INTO `mob_spawn_points` VALUES (17543554,'Avatar_Icon','',9429,-111.592,-10,132.734,240);
INSERT INTO `mob_spawn_points` VALUES (17543555,'Avatar_Icon','',9429,-107.430,-10,121.499,240);
INSERT INTO `mob_spawn_points` VALUES (17543556,'Avatar_Icon','',9429,-182,-2.412,148.05,0);
INSERT INTO `mob_spawn_points` VALUES (17543557,'Avatar_Icon','',9429,-153,-2.5,148.05,125);
INSERT INTO `mob_spawn_points` VALUES (17543558,'Avatar_Icon','',9429,-150,-2.5,148.05,125);
INSERT INTO `mob_spawn_points` VALUES (17543559,'Avatar_Icon','',9429,-147,-2.5,148.05,125);
INSERT INTO `mob_spawn_points` VALUES (17543560,'Avatar_Icon','',9429,-97.159,-18,194.119,35);
INSERT INTO `mob_spawn_points` VALUES (17543561,'Avatar_Icon','',9429,-93.864,-13,190.184,35);
INSERT INTO `mob_spawn_points` VALUES (17543562,'Avatar_Icon','',9429,-88.022,-12.461,202.448,35);
INSERT INTO `mob_spawn_points` VALUES (17543563,'Avatar_Icon','',9429,-101.304,-17.5,198.942,35);
INSERT INTO `mob_spawn_points` VALUES (17543564,'Avatar_Icon','',9429,-115.146,-17.5,201.803,35);
INSERT INTO `mob_spawn_points` VALUES (17543565,'Avatar_Icon','',9429,-56.762,-12.5,228.704,75);
INSERT INTO `mob_spawn_points` VALUES (17543566,'Avatar_Icon','',9429,-38.636,-12.5,242.795,235);
INSERT INTO `mob_spawn_points` VALUES (17543567,'Avatar_Icon','',9429,-53.402,-12.5,233.396,235);
INSERT INTO `mob_spawn_points` VALUES (17543568,'Avatar_Icon','',9429,-60.255,-12.5,212.912,75);
INSERT INTO `mob_spawn_points` VALUES (17543569,'Avatar_Icon','',9429,-25.873,-13,259.246,65);
INSERT INTO `mob_spawn_points` VALUES (17543570,'Avatar_Icon','',9429,-29.947,-17.5,270.230,65);
INSERT INTO `mob_spawn_points` VALUES (17543571,'Avatar_Icon','',9429,-21.944,-17.5,270.230,65);
INSERT INTO `mob_spawn_points` VALUES (17543572,'Avatar_Icon','',9429,-18.366,-17.5,279.317,65);
INSERT INTO `mob_spawn_points` VALUES (17543573,'Avatar_Icon','',9429,14.390,-7.654,257.319,85);
INSERT INTO `mob_spawn_points` VALUES (17543574,'Avatar_Icon','',9429,11.831,-7.357,264.341,15);
INSERT INTO `mob_spawn_points` VALUES (17543575,'Avatar_Icon','',9429,-3.533,-9.872,273.694,30);
INSERT INTO `mob_spawn_points` VALUES (17543576,'Avatar_Icon','',9429,-3.829,-10.021,282.654,65);
INSERT INTO `mob_spawn_points` VALUES (17543577,'Avatar_Icon','',9434,7.691,-2.5,279.7,225);
INSERT INTO `mob_spawn_points` VALUES (17543578,'Avatar_Icon','',9429,22.171,0.264,241.186,90);
INSERT INTO `mob_spawn_points` VALUES (17543579,'Avatar_Icon','',9429,26.716,0.796,237.578,90);
INSERT INTO `mob_spawn_points` VALUES (17543580,'Avatar_Icon','',9429,47.893,-7.5,223.349,155);
INSERT INTO `mob_spawn_points` VALUES (17543581,'Avatar_Icon','',9429,44.804,-7.5,219.557,155);
INSERT INTO `mob_spawn_points` VALUES (17543582,'Avatar_Icon','',9429,51.560,-7.5,220.141,155);
INSERT INTO `mob_spawn_points` VALUES (17543583,'Avatar_Icon','',9429,48.472,-7.5,216.492,155);
INSERT INTO `mob_spawn_points` VALUES (17543584,'Avatar_Icon','',9429,-51.232,-13.5,127.08,115);
INSERT INTO `mob_spawn_points` VALUES (17543585,'Avatar_Icon','',9429,-49.690,-13.5,124.414,115);
INSERT INTO `mob_spawn_points` VALUES (17543586,'Avatar_Icon','',9429,-43.232,-14.931,132.08,115);
INSERT INTO `mob_spawn_points` VALUES (17543587,'Avatar_Icon','',9429,-41.690,-14.931,129.414,115);
INSERT INTO `mob_spawn_points` VALUES (17543588,'Avatar_Icon','',9429,-36.232,-16,136.08,115);
INSERT INTO `mob_spawn_points` VALUES (17543589,'Avatar_Icon','',9429,-34.690,-16,133.414,115);
INSERT INTO `mob_spawn_points` VALUES (17543590,'Avatar_Icon','',9429,-28.483,-16,188.262,35);
INSERT INTO `mob_spawn_points` VALUES (17543591,'Avatar_Icon','',9429,28.483,-16,188.262,95);
INSERT INTO `mob_spawn_points` VALUES (17543592,'Avatar_Icon','',9429,-0.07,-16.750,129.980,65);


-- Windy Groups
INSERT INTO mob_groups VALUES (1, 294, 187, 'Avatar_Icon', 0, 128, 210, 1000, 1000, 80, 83, 0);
INSERT INTO mob_groups VALUES (2, 295, 187, 'Avatar_Idol', 0, 128, 211, 1000, 1000, 81, 84, 0);
INSERT INTO mob_groups VALUES (3, 1864, 187, 'Haa_Pevi_the_Stentorian', 0, 128, 1617, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (4, 2437, 187, 'Loo_Hepe_the_Eyepiercer', 0, 128, 2077, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (5, 2464, 187, 'Maa_Febi_the_Steadfast', 0, 128, 2107, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (6, 2777, 187, 'Muu_Febi_the_Steadfast', 0, 128, 2398, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (7, 4070, 187, 'Tzee_Xicu_Idol', 0, 128, 3644, 12500, 12500, 88, 90, 0);
INSERT INTO mob_groups VALUES (8, 4137, 187, 'Vanguard_Assassin', 0, 128, 3711, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (9, 4141, 187, 'Vanguard_Chanter', 0, 128, 3731, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (10, 4148, 187, 'Vanguard_Exemplar', 0, 128, 3762, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (11, 4157, 187, 'Vanguard_Inciter', 0, 128, 3805, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (12, 4159, 187, 'Vanguard_Liberator', 0, 128, 3815, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (13, 4167, 187, 'Vanguard_Ogresoother', 0, 128, 3855, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (14, 4168, 187, 'Vanguard_Oracle', 0, 128, 3860, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (15, 4169, 187, 'Vanguard_Partisan', 0, 128, 3865, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (16, 4171, 187, 'Vanguard_Persecutor', 0, 128, 3875, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (17, 4175, 187, 'Vanguard_Prelate', 0, 128, 3895, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (18, 4176, 187, 'Vanguard_Priest', 0, 128, 3900, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (19, 4180, 187, 'Vanguard_Salvager', 0, 128, 3920, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (20, 4181, 187, 'Vanguard_Sentinel', 0, 128, 3925, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (21, 4183, 187, 'Vanguard_Skirmisher', 0, 128, 3935, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (22, 4185, 187, 'Vanguards_Avatar', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (23, 4186, 187, 'Vanguards_Crow', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (24, 4190, 187, 'Vanguards_Wyvern', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (25, 4198, 187, 'Vanguard_Visionary', 0, 128, 3980, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (26, 4384, 187, 'Wuu_Qoho_the_Razorclaw', 0, 128, 4195, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (27, 4399, 187, 'Xoo_Kaza_the_Solemn', 0, 128, 4206, 8000, 0, 88, 90, 0);

-- make sure avatar icons spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=187 and name='Avatar_Icon';

-- make it so tombstones respawn
UPDATE mob_groups SET respawntime=3600 WHERE zoneid=187 and name='Avatar_Icon';

-- No roam or links
UPDATE mob_pools SET roamflag=256, links=0 WHERE poolid=294;

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=187 and mobid>=17543169 and mobid <= 17543625;

-- Remove 100ccs
DELETE FROM mob_droplist WHERE itemId=1450;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=187);
-- Should be redundant...... but the above one isn't working
DELETE FROM mob_droplist WHERE dropId=195; -- Avatar Icons pool
DELETE FROM mob_droplist WHERE dropId=2553;

-- Vanguard Mobs
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1449, 1000); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1449, 500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1449, 250); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1449, 125); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1464, 10); -- lancewood_log
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1466, 10); -- pile_of_relic_iron
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2553, 0, 0, 1000, 1518, 10); -- colossal_skull
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 11382, 67); -- mirage_charuqs
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 11398, 66); -- argute_loafers
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15031, 67); -- pantin_dastanas
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15038, 66); -- etoile_bangles
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15072, 67); -- warriors_mask
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15077, 66); -- assassins_bonnet
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15080, 67); -- monster_helm
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15084, 66); -- koga_hatsuburi
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15105, 67); -- sorcerers_gloves
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15109, 66); -- abyss_gauntlets
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15112, 67); -- scouts_bracers
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15128, 67); -- saotome_haidate
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15131, 67); -- summoners_spats
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15134, 67); -- clerics_duckbills
INSERT INTO mob_droplist VALUES (2553, 1, 1, 1, 15138, 67); -- valor_leggings

-- Avatar Icon
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1449, 1000); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (195, 0, 0, 1000, 1474, 100); -- infinity_core

-- Add the drop pools
UPDATE mob_groups SET dropid=2553 WHERE zoneid=187;
UPDATE mob_groups SET dropid=195 WHERE zoneid=187 and name='Avatar_Icon';







--
-- Dynamis Bastok ZoneId: 186
--

-- Basty Mobs
INSERT INTO `mob_spawn_points` VALUES (17539073,'Gu_Dha_Effigy',"Gu'Dha Effigy",9407,-16.032,-1.001,-126.959,195);
INSERT INTO `mob_spawn_points` VALUES (17539074,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539075,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539076,'Vanguard_Beasttender','Vanguard Beasttender',9410,41,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539077,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539078,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,7,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539079,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539080,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539081,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539082,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539083,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539084,'Vanguard_Constable','Vanguard Constable',9411,-10,0.1,-73,67);
INSERT INTO `mob_spawn_points` VALUES (17539085,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,81,0.1,-72,255);
INSERT INTO `mob_spawn_points` VALUES (17539086,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,62,0.1,-68,255);
INSERT INTO `mob_spawn_points` VALUES (17539087,'Vanguard_Kusa','Vanguard Kusa',9415,79,0.1,-72,255);
INSERT INTO `mob_spawn_points` VALUES (17539088,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,37,0.1,-41,60);
INSERT INTO `mob_spawn_points` VALUES (17539089,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539090,'Vanguard_Vindicator','Vanguard Vindicator',9427,62,0.1,-79,255);
INSERT INTO `mob_spawn_points` VALUES (17539091,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539092,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539093,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539094,'Vanguard_Minstrel','Vanguard Minstrel',9418,64,0.1,-68,255);
INSERT INTO `mob_spawn_points` VALUES (17539095,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539096,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,18,0.1,-72,50);
INSERT INTO `mob_spawn_points` VALUES (17539097,'Vanguard_Kusa','Vanguard Kusa',9415,10,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539098,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539099,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539100,'Vanguard_Protector','Vanguard Protector',9419,64,0.1,-79,255);
INSERT INTO `mob_spawn_points` VALUES (17539101,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539102,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539103,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539104,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539105,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,0.5,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539106,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539107,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539108,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539109,'Vanguard_Minstrel','Vanguard Minstrel',9418,39,0.1,-41,60);
INSERT INTO `mob_spawn_points` VALUES (17539110,'Vanguard_Beasttender','Vanguard Beasttender',9410,39,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539111,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539112,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539113,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539114,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539115,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539116,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539117,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539121,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539122,'Vanguard_Minstrel','Vanguard Minstrel',9418,20,0.1,-72,50);
INSERT INTO `mob_spawn_points` VALUES (17539123,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539124,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539125,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539126,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539127,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539128,'Vanguard_Minstrel','Vanguard Minstrel',9418,17,0.1,-92,188);
INSERT INTO `mob_spawn_points` VALUES (17539129,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539130,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539131,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539132,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539133,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539134,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539135,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539136,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539137,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539138,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539139,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539140,'Vanguard_Vigilante','Vanguard Vigilante',9426,-18,0.1,-71,79);
INSERT INTO `mob_spawn_points` VALUES (17539141,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,-20,0.1,-71,79);
INSERT INTO `mob_spawn_points` VALUES (17539142,'Adamantking_Image','Adamantking Image',9402,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539143,'Gu_Nhi_Noondozer',"Gu'Nhi Noondozer",9408,71.414,7,-34.489,189);
INSERT INTO `mob_spawn_points` VALUES (17539144,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539145,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539146,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539147,'Ze_Vho_Fallsplitter',"Ze'Vho Fallsplitter",9428,-186.984,-8.527,-21.746,251);
INSERT INTO `mob_spawn_points` VALUES (17539148,'Adamantking_Image','Adamantking Image',9402,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539149,'Adamantking_Image','Adamantking Image',9402,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539150,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,15,0.1,-92,188);
INSERT INTO `mob_spawn_points` VALUES (17539151,'Vanguard_Kusa','Vanguard Kusa',9415,-8,0.1,-73,67);
INSERT INTO `mob_spawn_points` VALUES (17539152,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539153,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539154,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539155,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539156,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539157,'Vanguard_Purloiner','Vanguard Purloiner',9420,43,0.1,-54,60);
INSERT INTO `mob_spawn_points` VALUES (17539158,'Vanguard_Vindicator','Vanguard Vindicator',9427,41,0.1,-54,60);
INSERT INTO `mob_spawn_points` VALUES (17539159,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539160,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539164,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539165,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539166,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539167,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539168,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539169,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539170,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539174,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539175,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539176,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539177,'Vanguard_Beasttender','Vanguard Beasttender',9410,46,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539178,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539179,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539180,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539181,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539182,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539183,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539184,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539185,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539186,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539187,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539188,'Gi_Pha_Manameister',"Gi'Pha Manameister",9406,86.225,7,-3.857,189);
INSERT INTO `mob_spawn_points` VALUES (17539189,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539190,'Ko_Dho_Cannonball',"Ko'Dho Cannonball",9409,-102.901,12,75.354,64);
INSERT INTO `mob_spawn_points` VALUES (17539191,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539192,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539193,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539194,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539195,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539196,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539197,'Vanguard_Beasttender','Vanguard Beasttender',9410,48,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539198,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539199,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539200,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539201,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539202,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539203,'Vanguard_Minstrel','Vanguard Minstrel',9418,1.1,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539204,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,-1.1,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539205,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539206,'Vanguard_Mason','Vanguard Mason',9416,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539207,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539208,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539209,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539210,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539211,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539212,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539213,'Vanguard_Beasttender','Vanguard Beasttender',9410,29,0.1,-92,195);
INSERT INTO `mob_spawn_points` VALUES (17539214,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539215,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539216,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539217,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539218,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539219,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539220,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539221,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539222,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539223,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539224,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539225,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539226,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539230,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539231,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539232,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539233,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539237,'Vanguard_Beasttender','Vanguard Beasttender',9410,31,0.1,-92,195);
INSERT INTO `mob_spawn_points` VALUES (17539238,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,195);
INSERT INTO `mob_spawn_points` VALUES (17539239,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539240,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539241,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539242,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539243,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539244,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539245,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539246,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539247,'Vanguard_Beasttender','Vanguard Beasttender',9410,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539248,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539249,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539250,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539251,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539252,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539253,'Adamantking_Image','Adamantking Image',9402,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539254,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539255,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539256,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539257,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539258,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539259,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539260,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539261,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539262,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539263,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539264,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539265,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539268,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539269,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539270,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539271,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539272,'Vanguard_Undertaker','Vanguard Undertaker',9425,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539273,'Vanguards_Avatar',"Vanguard's Avatar",9421,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539276,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539277,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539278,'Vanguard_Defender','Vanguard Defender',9412,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539279,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539280,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539281,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539282,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539283,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539284,'Vanguard_Beasttender','Vanguard Beasttender',9410,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539285,'Vanguards_Scorpion',"Vanguard's Scorpion",9422,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539288,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539289,'Vanguard_Kusa','Vanguard Kusa',9415,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539290,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539291,'Vanguard_Drakekeeper','Vanguard Drakekeeper',9413,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539292,'Vanguards_Wyvern',"Vanguard's Wyvern",9423,1,1,1,60);
INSERT INTO `mob_spawn_points` VALUES (17539295,'Vanguard_Hatamoto','Vanguard Hatamoto',9414,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539296,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539297,'Vanguard_Purloiner','Vanguard Purloiner',9420,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539298,'Vanguard_Thaumaturge','Vanguard Thaumaturge',9424,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539299,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539300,'Vanguard_Vindicator','Vanguard Vindicator',9427,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539301,'Vanguard_Militant','Vanguard Militant',9417,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539302,'Vanguard_Vigilante','Vanguard Vigilante',9426,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539303,'Vanguard_Protector','Vanguard Protector',9419,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539304,'Vanguard_Constable','Vanguard Constable',9411,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539305,'Vanguard_Minstrel','Vanguard Minstrel',9418,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539306,'Adamantking_Image','Adamantking Image',9402,-215,0.1,58,16);
INSERT INTO `mob_spawn_points` VALUES (17539307,'Zo_Pha_Forgesoul',"Zo'Pha Forgesoul",0,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539308,'Ra_Gho_Darkfount',"Ra'Gho Darkfount",0,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539309,'Ra_Gho_s_Avatar',"Ra'Gho's Avatar",0,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539310,'Va_Zhe_Pummelsong',"Va'Zhe Pummelsong",0,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539311,'Bu_Bho_Truesteel',"Bu'Bho Truesteel",0,395,0.1,342,60);
INSERT INTO `mob_spawn_points` VALUES (17539350,'Adamantking_Effigy','',9403,80,0.1,-72,255);
INSERT INTO `mob_spawn_points` VALUES (17539351,'Adamantking_Effigy','',9403,63,0.1,-68,255);
INSERT INTO `mob_spawn_points` VALUES (17539352,'Adamantking_Effigy','',9403,63,0.1,-79,255);
INSERT INTO `mob_spawn_points` VALUES (17539353,'Adamantking_Effigy','',9403,42,0.1,-54,60);
INSERT INTO `mob_spawn_points` VALUES (17539354,'Adamantking_Effigy','',9403,38,0.1,-41,60);
INSERT INTO `mob_spawn_points` VALUES (17539355,'Adamantking_Effigy','',9403,40,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539356,'Adamantking_Effigy','',9403,47,0.1,-90,195);
INSERT INTO `mob_spawn_points` VALUES (17539357,'Adamantking_Effigy','',9403,30,0.1,-92,195);
INSERT INTO `mob_spawn_points` VALUES (17539358,'Adamantking_Effigy','',9403,19,0.1,-72,50);
INSERT INTO `mob_spawn_points` VALUES (17539359,'Adamantking_Effigy','',9403,16,0.1,-92,188);
INSERT INTO `mob_spawn_points` VALUES (17539360,'Adamantking_Effigy','',9403,9,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539361,'Adamantking_Effigy','',9403,0.1,0.1,-74,60);
INSERT INTO `mob_spawn_points` VALUES (17539362,'Adamantking_Effigy','',9403,-9,0.1,-73,67);
INSERT INTO `mob_spawn_points` VALUES (17539363,'Adamantking_Effigy','',9403,-19,0.1,-71,79);
INSERT INTO `mob_spawn_points` VALUES (17539364,'Adamantking_Effigy','',9403,16.742,-3,-50.091,45);
INSERT INTO `mob_spawn_points` VALUES (17539365,'Adamantking_Effigy','',9403,8.515,-3,-51.904,54);
INSERT INTO `mob_spawn_points` VALUES (17539366,'Adamantking_Effigy','',9403,-0.013,-3,-52.621,62);
INSERT INTO `mob_spawn_points` VALUES (17539367,'Adamantking_Effigy','',9403,-8.220,-3,-51.746,72);
INSERT INTO `mob_spawn_points` VALUES (17539368,'Adamantking_Effigy','',9403,-15.944,-3,-49.777,74);
INSERT INTO `mob_spawn_points` VALUES (17539369,'Adamantking_Effigy','',9403,-33.522,0.1,-80.036,0);
INSERT INTO `mob_spawn_points` VALUES (17539370,'Adamantking_Effigy','',9403,-26.634,-1.001,-108.440,189);
INSERT INTO `mob_spawn_points` VALUES (17539371,'Adamantking_Effigy','',9403,-16.294,-1.001,-115.393,189);
INSERT INTO `mob_spawn_points` VALUES (17539372,'Adamantking_Effigy','',9403,-26.634,-1.001,-115.393,189);
INSERT INTO `mob_spawn_points` VALUES (17539373,'Adamantking_Effigy','',9403,-5.827,-1.001,-122.276,189);
INSERT INTO `mob_spawn_points` VALUES (17539374,'Adamantking_Effigy','',9403,-16.294,-1.001,-122.276,189);
INSERT INTO `mob_spawn_points` VALUES (17539375,'Adamantking_Effigy','',9403,-26.634,-1.001,-122.276,189);
INSERT INTO `mob_spawn_points` VALUES (17539376,'Adamantking_Effigy','',9403,-37.627,0.1,-56.767,61);
INSERT INTO `mob_spawn_points` VALUES (17539377,'Adamantking_Effigy','',9403,-37.627,0.1,-37.326,61);
INSERT INTO `mob_spawn_points` VALUES (17539378,'Adamantking_Effigy','',9403,-26.426,0.1,-25.160,130);
INSERT INTO `mob_spawn_points` VALUES (17539379,'Adamantking_Effigy','',9403,-44.8,0.1,-20.042,63);
INSERT INTO `mob_spawn_points` VALUES (17539380,'Adamantking_Effigy','',9403,-1.262,0.1,-24.863,0);
INSERT INTO `mob_spawn_points` VALUES (17539381,'Adamantking_Effigy','',9403,-4.799,0.1,-19.634,64);
INSERT INTO `mob_spawn_points` VALUES (17539382,'Adamantking_Effigy','',9403,30.215,0.1,-25.692,64);
INSERT INTO `mob_spawn_points` VALUES (17539383,'Adamantking_Effigy','',9403,-43.961,0.1,-2.568,129);
INSERT INTO `mob_spawn_points` VALUES (17539384,'Adamantking_Effigy','',9403,-43.961,0.1,4.788,129);
INSERT INTO `mob_spawn_points` VALUES (17539385,'Adamantking_Effigy','',9403,-40.612,-3.493,11.618,129);
INSERT INTO `mob_spawn_points` VALUES (17539386,'Adamantking_Effigy','',9403,-53.001,0.1,38.570,67);
INSERT INTO `mob_spawn_points` VALUES (17539387,'Adamantking_Effigy','',9403,-64.729,0.1,38.325,64);
INSERT INTO `mob_spawn_points` VALUES (17539388,'Adamantking_Effigy','',9403,-15.686,7,31.901,128);
INSERT INTO `mob_spawn_points` VALUES (17539389,'Adamantking_Effigy','',9403,-15.686,7,28.285,128);
INSERT INTO `mob_spawn_points` VALUES (17539390,'Adamantking_Effigy','',9403,2.372,7,12.613,189);
INSERT INTO `mob_spawn_points` VALUES (17539391,'Adamantking_Effigy','',9403,2.242,7,-7.880,194);
INSERT INTO `mob_spawn_points` VALUES (17539392,'Adamantking_Effigy','',9403,21.475,7,0.743,128);
INSERT INTO `mob_spawn_points` VALUES (17539393,'Adamantking_Effigy','',9403,21.475,7,-4.066,128);
INSERT INTO `mob_spawn_points` VALUES (17539394,'Adamantking_Effigy','',9403,31.2,7,8.167,64);
INSERT INTO `mob_spawn_points` VALUES (17539395,'Adamantking_Effigy','',9403,31.477,0.1,24.376,64);
INSERT INTO `mob_spawn_points` VALUES (17539396,'Adamantking_Effigy','',9403,72.666,7,2.452,64);
INSERT INTO `mob_spawn_points` VALUES (17539397,'Adamantking_Effigy','',9403,82.185,7,2.838,64);
INSERT INTO `mob_spawn_points` VALUES (17539398,'Adamantking_Effigy','',9403,90.687,7,-4.318,128);
INSERT INTO `mob_spawn_points` VALUES (17539399,'Adamantking_Effigy','',9403,71.414,7,-34.489,189);
INSERT INTO `mob_spawn_points` VALUES (17539400,'Adamantking_Effigy','',9403,78.414,7,-34.489,189);
INSERT INTO `mob_spawn_points` VALUES (17539401,'Adamantking_Effigy','',9403,64.414,7,-34.489,189);
INSERT INTO `mob_spawn_points` VALUES (17539402,'Adamantking_Effigy','',9403,-73.720,0.1,5.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539403,'Adamantking_Effigy','',9403,-73.720,0.1,-0.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539404,'Adamantking_Effigy','',9403,-73.720,0.1,-5.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539405,'Adamantking_Effigy','',9403,-88.095,0.1,5.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539406,'Adamantking_Effigy','',9403,-88.095,0.1,-0.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539407,'Adamantking_Effigy','',9403,-88.095,0.1,-5.067,251);
INSERT INTO `mob_spawn_points` VALUES (17539408,'Adamantking_Effigy','',9403,-109.673,0.1,-11.081,226);
INSERT INTO `mob_spawn_points` VALUES (17539409,'Adamantking_Effigy','',9403,-96.758,8,41.372,128);
INSERT INTO `mob_spawn_points` VALUES (17539410,'Adamantking_Effigy','',9403,-102.447,8,51.057,64);
INSERT INTO `mob_spawn_points` VALUES (17539411,'Adamantking_Effigy','',9403,-107.964,12,67.738,64);
INSERT INTO `mob_spawn_points` VALUES (17539412,'Adamantking_Effigy','',9403,-98.207,12,67.738,64);
INSERT INTO `mob_spawn_points` VALUES (17539413,'Adamantking_Effigy','',9403,-103.901,12,75.354,64);
INSERT INTO `mob_spawn_points` VALUES (17539414,'Adamantking_Effigy','',9403,-107.813,0.1,-35.067,189);
INSERT INTO `mob_spawn_points` VALUES (17539415,'Adamantking_Effigy','',9403,-101.693,-8,-59.783,128);
INSERT INTO `mob_spawn_points` VALUES (17539416,'Adamantking_Effigy','',9403,-51.157,-8,-54.751,128);
INSERT INTO `mob_spawn_points` VALUES (17539417,'Adamantking_Effigy','',9403,-51.157,-8,-62.671,128);
INSERT INTO `mob_spawn_points` VALUES (17539418,'Adamantking_Effigy','',9403,-61.375,-8.326,-77.963,0);
INSERT INTO `mob_spawn_points` VALUES (17539419,'Adamantking_Effigy','',9403,-126.877,-0.503,-1.482,64);
INSERT INTO `mob_spawn_points` VALUES (17539420,'Adamantking_Effigy','',9403,-131.574,-0.503,-1.482,64);
INSERT INTO `mob_spawn_points` VALUES (17539421,'Adamantking_Effigy','',9403,-135.340,0.1,-28.985,236);
INSERT INTO `mob_spawn_points` VALUES (17539422,'Adamantking_Effigy','',9403,-127.116,0.1,-36.239,189);
INSERT INTO `mob_spawn_points` VALUES (17539423,'Adamantking_Effigy','',9403,-119.221,0.1,-37.095,189);
INSERT INTO `mob_spawn_points` VALUES (17539424,'Adamantking_Effigy','',9403,-125.663,0.1,-63.316,189);
INSERT INTO `mob_spawn_points` VALUES (17539425,'Adamantking_Effigy','',9403,-121.518,-3.493,-74.536,189);
INSERT INTO `mob_spawn_points` VALUES (17539426,'Adamantking_Effigy','',9403,-137.012,-11.917,28.544,251);
INSERT INTO `mob_spawn_points` VALUES (17539427,'Adamantking_Effigy','',9403,-146.968,0.1,2.770,64);
INSERT INTO `mob_spawn_points` VALUES (17539428,'Adamantking_Effigy','',9403,-153.321,0.1,-0.427,64);
INSERT INTO `mob_spawn_points` VALUES (17539429,'Adamantking_Effigy','',9403,-165.745,-3.493,-0.417,0);
INSERT INTO `mob_spawn_points` VALUES (17539430,'Adamantking_Effigy','',9403,-158.790,0.1,-16.950,236);
INSERT INTO `mob_spawn_points` VALUES (17539431,'Adamantking_Effigy','',9403,-153.024,0.1,-31.128,189);
INSERT INTO `mob_spawn_points` VALUES (17539432,'Adamantking_Effigy','',9403,-153.453,0.1,-41.707,189);
INSERT INTO `mob_spawn_points` VALUES (17539433,'Adamantking_Effigy','',9403,-182.264,-8.527,-27.226,189);
INSERT INTO `mob_spawn_points` VALUES (17539434,'Adamantking_Effigy','',9403,-186.984,-8.527,-21.746,251);
INSERT INTO `mob_spawn_points` VALUES (17539435,'Adamantking_Effigy','',9403,-186.984,-8.617,-15.014,251);
INSERT INTO `mob_spawn_points` VALUES (17539436,'Adamantking_Effigy','',9403,-29.770,0.1,22.304,189);
INSERT INTO `mob_spawn_points` VALUES (17539437,'Adamantking_Effigy','',9403,-13.889,0.1,29.555,128);
INSERT INTO `mob_spawn_points` VALUES (17539438,'Adamantking_Effigy','',9403,-0.850,0.1,37.738,128);
INSERT INTO `mob_spawn_points` VALUES (17539439,'Adamantking_Effigy','',9403,8.737,0.1,24.564,64);
INSERT INTO `mob_spawn_points` VALUES (17539440,'Adamantking_Effigy','',9403,2.153,0.1,9.722,189);
INSERT INTO `mob_spawn_points` VALUES (17539441,'Adamantking_Effigy','',9403,9.009,0.1,-0.958,189);
INSERT INTO `mob_spawn_points` VALUES (17539442,'Adamantking_Effigy','',9403,9.009,0.1,-15.261,189);
INSERT INTO `mob_spawn_points` VALUES (17539443,'Adamantking_Effigy','',9403,16.576,0.1,7.992,128);
INSERT INTO `mob_spawn_points` VALUES (17539444,'Adamantking_Effigy','',9403,37.086,0.1,7.992,128);
INSERT INTO `mob_spawn_points` VALUES (17539445,'Adamantking_Effigy','',9403,36.552,0.1,18.912,64);
INSERT INTO `mob_spawn_points` VALUES (17539446,'Adamantking_Effigy','',9403,54.062,0.1,7.992,128);
INSERT INTO `mob_spawn_points` VALUES (17539447,'Adamantking_Effigy','',9403,60.116,0.1,-1.510,189);
INSERT INTO `mob_spawn_points` VALUES (17539448,'Adamantking_Effigy','',9403,53.258,0.1,-13.116,251);
INSERT INTO `mob_spawn_points` VALUES (17539449,'Adamantking_Effigy','',9403,61.273,0.1,-20.293,191);
INSERT INTO `mob_spawn_points` VALUES (17539450,'Adamantking_Effigy','',9403,70.144,0.1,10.093,64);
INSERT INTO `mob_spawn_points` VALUES (17539451,'Adamantking_Effigy','',9403,86.028,0.1,10.093,64);

-- Basty Groups
INSERT INTO mob_groups VALUES (1, 43, 186, 'Adamantking_Effigy', 0, 128, 23, 1000, 1000, 80, 83, 0);
INSERT INTO mob_groups VALUES (2, 400, 186, 'Be_Ebo_Tortoisedriver', 0, 128, 4473, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (3, 1179, 186, 'Effigy_Shield', 0, 128, 843, 5500, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (4, 1614, 186, 'Gi_Pha_Manameister', 0, 128, 4473, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (5, 1855, 186, 'Gu_Dha_Effigy', 0, 128, 4472, 12500, 12500, 88, 90, 0);
INSERT INTO mob_groups VALUES (6, 1859, 186, 'Gu_Nhi_Noondozer', 0, 128, 4473, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (7, 2285, 186, 'Ko_Dho_Cannonball', 0, 128, 4473, 8000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (8, 4139, 186, 'Vanguard_Beasttender', 0, 128, 3721, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (9, 4142, 186, 'Vanguard_Constable', 0, 128, 3736, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (10, 4143, 186, 'Vanguard_Defender', 0, 128, 3741, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (11, 4146, 186, 'Vanguard_Drakekeeper', 0, 128, 3752, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (12, 4153, 186, 'Vanguard_Hatamoto', 0, 128, 3785, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (13, 4158, 186, 'Vanguard_Kusa', 0, 128, 3810, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (14, 4161, 186, 'Vanguard_Mason', 0, 128, 3825, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (15, 4163, 186, 'Vanguard_Militant', 0, 128, 3835, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (16, 4164, 186, 'Vanguard_Minstrel', 0, 128, 3840, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (17, 4177, 186, 'Vanguard_Protector', 0, 128, 3905, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (18, 4178, 186, 'Vanguard_Purloiner', 0, 128, 3910, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (19, 4185, 186, 'Vanguards_Avatar', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (20, 4188, 186, 'Vanguards_Scorpion', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (21, 4190, 186, 'Vanguards_Wyvern', 0, 128, 0, 2400, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (22, 4191, 186, 'Vanguard_Thaumaturge', 0, 128, 3945, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (23, 4194, 186, 'Vanguard_Undertaker', 0, 128, 3960, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (24, 4196, 186, 'Vanguard_Vigilante', 0, 128, 3970, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (25, 4197, 186, 'Vanguard_Vindicator', 0, 128, 3975, 4000, 0, 88, 90, 0);
INSERT INTO mob_groups VALUES (26, 4499, 186, 'Ze_Vho_Fallsplitter', 0, 128, 4473, 8000, 0, 88, 90, 0);

-- make sure avatar icons spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=186 and name='Adamantking_Effigy';

-- make it so tombstones respawn
UPDATE mob_groups SET respawntime=3600 WHERE zoneid=186 and name='Adamantking_Effigy';

-- No roam or links
UPDATE mob_pools SET roamflag=256, links=0 WHERE poolid=43;

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=186 and mobid>=17539073 and mobid <= 17539472;

-- Remove 100ccs
DELETE FROM mob_droplist WHERE itemId=1456;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=186);
-- Should be redundant...... but the above one isn't working
DELETE FROM mob_droplist WHERE dropId=20; -- Avatar Icons pool
DELETE FROM mob_droplist WHERE dropId=2558;

INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1455, 1000); -- one_byne_bill
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (20, 0, 0, 1000, 1474, 100); -- infinity_core


INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1455, 1000); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1455, 500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1455, 250); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1455, 125); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1469, 10); -- chunk_of_wootz_ore
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2558, 0, 0, 1000, 1521, 10); -- vial_of_slime_juice
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 11385, 67); -- commodore_bottes
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 11478, 66); -- etoile_tiara
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15078, 67); -- valor_coronet
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15092, 66); -- assassins_vest
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15095, 67); -- monster_jackcoat
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15106, 66); -- duelists_gloves
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15111, 67); -- bards_cuffs
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15113, 66); -- saotome_kote
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15116, 67); -- summoners_bracers
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15120, 67); -- sorcerers_tonban
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15130, 67); -- wyrm_brais
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15133, 67); -- melee_gaiters
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 15139, 67); -- abyss_sollerets
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 16346, 67); -- mirage_shalwar
INSERT INTO mob_droplist VALUES (2558, 1, 1, 1, 16362, 66); -- argute_pants

-- Add the drop pools
UPDATE mob_groups SET dropid=2558 WHERE zoneid=186;
UPDATE mob_groups SET dropid=20 WHERE zoneid=186 and name='Adamantking_Effigy';



--
-- Dynamis Jeuno ZoneId: 188
--

-- Jeuno Mobs
INSERT INTO `mob_spawn_points` VALUES (17547265,'Goblin_Golem','Goblin Golem',9467,0.058,0.003,-102.143,195);
INSERT INTO `mob_spawn_points` VALUES (17547266,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547267,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547268,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547269,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547270,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547271,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547272,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547273,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547274,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547275,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547276,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547277,'Gabblox_Magpietongue','Gabblox Magpietongue',9466,18.037,9,-35.956,125);
INSERT INTO `mob_spawn_points` VALUES (17547278,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547279,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547280,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547281,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547282,'Vanguard_Dragontamer','Vanguard Dragontamer',10898,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547283,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547284,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547285,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547287,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547288,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547289,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547290,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547291,'Tufflix_Loglimbs','Tufflix Loglimbs',9489,-18.230,9,-49.996,255);
INSERT INTO `mob_spawn_points` VALUES (17547292,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547293,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547294,'Cloktix_Longnail','Cloktix Longnail',9462,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547296,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547297,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547298,'Smeltix_Thickhide','Smeltix Thickhide',9484,5.906,9,-43.921,255);
INSERT INTO `mob_spawn_points` VALUES (17547299,'Jabkix_Pigeonpecs','Jabkix Pigeonpecs',9473,-6.038,9,-44.088,125);
INSERT INTO `mob_spawn_points` VALUES (17547300,'Wasabix_Callusdigit','Wasabix Callusdigit',9508,0.079,9,-49.934,65);
INSERT INTO `mob_spawn_points` VALUES (17547304,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547305,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547306,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547307,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547308,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547309,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547310,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547311,'Hermitrix_Toothrot','Hermitrix Toothrot',9470,23.987,0.003,-35.930,255);
INSERT INTO `mob_spawn_points` VALUES (17547312,'Wyrmwix_Snakespecs','Wyrmwix Snakespecs',9509,50.890,0.003,-18.868,65);
INSERT INTO `mob_spawn_points` VALUES (17547313,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547314,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547315,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547316,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547317,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547318,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547319,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547320,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547321,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547322,'Morgmox_Moldnoggin','Morgmox Moldnoggin',9478,0.043,0.002,-89.892,195);
INSERT INTO `mob_spawn_points` VALUES (17547323,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547324,'Sparkspox_Sweatbrow','Sparkspox Sweatbrow',9486,-31.780,3,-5.957,125);
INSERT INTO `mob_spawn_points` VALUES (17547325,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547326,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547327,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547328,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547329,'Sparkspox_Sweatbrow','Sparkspox Sweatbrow',9486,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547331,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547332,'Vanguard_Dragontamer','Vanguard Dragontamer',10898,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547333,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547334,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547335,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547336,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547337,'Morgmox_Moldnoggin','Morgmox Moldnoggin',9478,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547338,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547339,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547340,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547341,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547342,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547343,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547344,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547345,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547346,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547347,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547348,'Vanguard_Dragontamer','Vanguard Dragontamer',10898,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547349,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547350,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547351,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547352,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547353,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547354,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547355,'Elixmix_Hooknose','Elixmix Hooknose',9464,-70.342,5.591,-16.037,255);
INSERT INTO `mob_spawn_points` VALUES (17547356,'Bandrix_Rockjaw','Bandrix Rockjaw',9458,0.003,3,10.123,65);
INSERT INTO `mob_spawn_points` VALUES (17547357,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547358,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547359,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547360,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547361,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547362,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547363,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547364,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547365,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547366,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547367,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547368,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547369,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547370,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547371,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547372,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547373,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547374,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547375,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547376,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547377,'Buffrix_Eargone','Buffrix Eargone',9461,-22.225,0.003,-50.051,125);
INSERT INTO `mob_spawn_points` VALUES (17547378,'Humnox_Drumbelly','Humnox Drumbelly',9471,-39.084,0.005,-54.677,65);
INSERT INTO `mob_spawn_points` VALUES (17547379,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547380,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547381,'Buffrix_Eargone','Buffrix Eargone',9461,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547382,'Humnox_Drumbelly','Humnox Drumbelly',9471,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547383,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547384,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547385,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547386,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547387,'Buffrix_Eargone','Buffrix Eargone',9461,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547388,'Humnox_Drumbelly','Humnox Drumbelly',9471,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547391,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547392,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547393,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547394,'Ticktox_Beadyeyes','Ticktox Beadyeyes',9487,-1.993,3.1,115.998,65);
INSERT INTO `mob_spawn_points` VALUES (17547395,'Lurklox_Dhalmelneck','Lurklox Dhalmelneck',9476,0.108,-2.5,56.484,65);
INSERT INTO `mob_spawn_points` VALUES (17547396,'Trailblix_Goatmug','Trailblix Goatmug',9488,-56.008,12,-34.180,195);
INSERT INTO `mob_spawn_points` VALUES (17547397,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547398,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547399,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547401,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547402,'Kikklix_Longlegs','Kikklix Longlegs',9475,-1.039,0.003,-88.171,195);
INSERT INTO `mob_spawn_points` VALUES (17547403,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547404,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547405,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547406,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547408,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547409,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547410,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547411,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547412,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547413,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547414,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547415,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547416,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547417,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547418,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547419,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547421,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547422,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547423,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547424,'Karashix_Swollenskull','Karashix Swollenskull',9474,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547425,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547426,'Vanguard_Dragontamer','Vanguard Dragontamer',10898,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547427,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547429,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547430,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547431,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547432,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547433,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547434,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547435,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547436,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547437,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547438,'Mortilox_Wartpaws','Mortilox Wartpaws',9479,-70.342,5.591,-7.988,255);
INSERT INTO `mob_spawn_points` VALUES (17547439,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547440,'Karashix_Swollenskull','Karashix Swollenskull',9474,-0.001,2,36.015,195);
INSERT INTO `mob_spawn_points` VALUES (17547441,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547442,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547443,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547444,'Vanguards_Avatar',"Vanguard's Avatar",9503,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547445,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547446,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547447,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547448,'Vanguard_Maestro','Vanguard Maestro',9496,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547449,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547450,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547451,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547452,'Vanguard_Dragontamer','Vanguard Dragontamer',10898,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547453,'Vanguards_Wyvern',"Vanguard's Wyvern",9505,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547454,'Rutrix_Hamgams','Rutrix Hamgams',9481,0.001,3,16.220,195);
INSERT INTO `mob_spawn_points` VALUES (17547455,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547456,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547457,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547458,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547459,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547460,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547461,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547462,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547463,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547464,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547465,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547466,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547468,'Snypestix_Eaglebeak','Snypestix Eaglebeak',9485,0.001,3,1.679,195);
INSERT INTO `mob_spawn_points` VALUES (17547469,'Vanguard_Smithy','Vanguard Smithy',9502,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547470,'Vanguard_Pitfighter','Vanguard Pitfighter',9499,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547471,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547472,'Anvilix_Sootwrists','Anvilix Sootwrists',9457,7.286,3,-4.979,125);
INSERT INTO `mob_spawn_points` VALUES (17547473,'Bootrix_Jaggedelbow','Bootrix Jaggedelbow',9460,-0.03,3,10.150,65);
INSERT INTO `mob_spawn_points` VALUES (17547474,'Mobpix_Mucousmouth','Mobpix Mucousmouth',9477,21.01,0.002,-3.774,65);
INSERT INTO `mob_spawn_points` VALUES (17547475,'Vanguard_Alchemist','Vanguard Alchemist',9491,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547476,'Vanguard_Shaman','Vanguard Shaman',9501,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547477,'Vanguard_Enchanter','Vanguard Enchanter',9494,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547479,'Eremix_Snottynostril','Eremix Snottynostril',9465,48.977,9,-54.201,195);
INSERT INTO `mob_spawn_points` VALUES (17547480,'Jabbrox_Grannyguise','Jabbrox Grannyguise',9472,-8.274,9,-34.073,255);
INSERT INTO `mob_spawn_points` VALUES (17547481,'Vanguard_Armorer','Vanguard Armorer',9493,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547482,'Vanguard_Tinkerer','Vanguard Tinkerer',9506,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547483,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547484,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547485,'Scruffix_Shaggychest','Scruffix Shaggychest',9482,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547486,'Tymexox_Ninefingers','Tymexox Ninefingers',9490,-30.024,0.002,-35.735,65);
INSERT INTO `mob_spawn_points` VALUES (17547487,'Blazox_Boneybod','Blazox Boneybod',9459,49.604,5.250,-38.548,195);
INSERT INTO `mob_spawn_points` VALUES (17547488,'Vanguards_Slime',"Vanguard's Slime",9504,1,1,1,185);
INSERT INTO `mob_spawn_points` VALUES (17547489,'Vanguard_Ambusher','Vanguard Ambusher',9492,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547490,'Prowlox_Barrelbelly','Prowlox Barrelbelly',9480,7.925,9,-33.894,65);
INSERT INTO `mob_spawn_points` VALUES (17547491,'Vanguard_Hitman','Vanguard Hitman',9495,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547295,'Goblin_Replica','Goblin Replica',9468,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547286,'Vanguard_Necromancer','Vanguard Necromancer',9497,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547330,'Vanguard_Ronin','Vanguard Ronin',9500,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547400,'Vanguard_Welldigger','Vanguard Welldigger',9507,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547407,'Kikklix_Longlegs','Kikklix Longlegs',9475,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547428,'Vanguard_Pathfinder','Vanguard Pathfinder',9498,4.484,9,-76.822,185);
INSERT INTO `mob_spawn_points` VALUES (17547478,'Distilix_Stickytoes','Distilix Stickytoes',9463,0.048,3.501,-12.474,195);
INSERT INTO `mob_spawn_points` VALUES (17547530,'Goblin_Statue','',9469,42.031,9.001,-52.002,255);
INSERT INTO `mob_spawn_points` VALUES (17547531,'Goblin_Replica','',9468,35.902,9.001,-52.002,255);
INSERT INTO `mob_spawn_points` VALUES (17547532,'Goblin_Statue','',9469,50.890,0.003,-18.868,65);
INSERT INTO `mob_spawn_points` VALUES (17547533,'Goblin_Replica','',9468,39.993,0.003,-23.990,195);
INSERT INTO `mob_spawn_points` VALUES (17547534,'Goblin_Statue','',9469,39.993,0.003,-26.255,195);
INSERT INTO `mob_spawn_points` VALUES (17547535,'Goblin_Statue','',9469,33.9,0.005,-17.879,65);
INSERT INTO `mob_spawn_points` VALUES (17547536,'Goblin_Statue','',9469,32.055,0.005,-19.827,65);
INSERT INTO `mob_spawn_points` VALUES (17547537,'Goblin_Statue','',9469,29.999,0.005,-17.887,65);
INSERT INTO `mob_spawn_points` VALUES (17547538,'Goblin_Statue','',9469,31.933,0.002,-1.946,65);
INSERT INTO `mob_spawn_points` VALUES (17547539,'Goblin_Statue','',9469,23.987,0.003,-35.930,255);
INSERT INTO `mob_spawn_points` VALUES (17547540,'Goblin_Statue','',9469,34.2,0.003,-45.012,125);
INSERT INTO `mob_spawn_points` VALUES (17547541,'Goblin_Statue','',9469,26.098,-0.528,-50.03,255);
INSERT INTO `mob_spawn_points` VALUES (17547542,'Goblin_Statue','',9469,32.132,0.002,-77.904,195);
INSERT INTO `mob_spawn_points` VALUES (17547543,'Goblin_Statue','',9469,19.902,0.002,-74.003,255);
INSERT INTO `mob_spawn_points` VALUES (17547544,'Goblin_Statue','',9469,11.864,0.003,-78.092,195);
INSERT INTO `mob_spawn_points` VALUES (17547545,'Goblin_Statue','',9469,4.077,0.002,-66.135,65);
INSERT INTO `mob_spawn_points` VALUES (17547546,'Goblin_Statue','',9469,1.829,0.005,-75.964,255);
INSERT INTO `mob_spawn_points` VALUES (17547547,'Goblin_Statue','',9469,0.043,0.002,-89.892,195);
INSERT INTO `mob_spawn_points` VALUES (17547548,'Goblin_Statue','',9469,-18.04,0.005,-77.966,195);
INSERT INTO `mob_spawn_points` VALUES (17547549,'Goblin_Statue','',9469,-23.298,0.005,-73.038,255);
INSERT INTO `mob_spawn_points` VALUES (17547550,'Goblin_Statue','',9469,-25.764,0.004,-62.986,125);
INSERT INTO `mob_spawn_points` VALUES (17547551,'Goblin_Statue','',9469,-37.003,0.005,-60.858,25);
INSERT INTO `mob_spawn_points` VALUES (17547552,'Goblin_Statue','',9469,-39.084,0.005,-54.677,65);
INSERT INTO `mob_spawn_points` VALUES (17547553,'Goblin_Statue','',9469,-38.896,0.005,-49.237,195);
INSERT INTO `mob_spawn_points` VALUES (17547554,'Goblin_Statue','',9469,-30.186,0.002,-52.067,255);
INSERT INTO `mob_spawn_points` VALUES (17547555,'Goblin_Statue','',9469,-22.225,0.003,-50.051,125);
INSERT INTO `mob_spawn_points` VALUES (17547556,'Goblin_Statue','',9469,-31.883,1,-31.527,195);
INSERT INTO `mob_spawn_points` VALUES (17547557,'Goblin_Statue','',9469,-27.438,1,-31.466,195);
INSERT INTO `mob_spawn_points` VALUES (17547558,'Goblin_Replica','',9468,-31.780,3,-5.957,125);
INSERT INTO `mob_spawn_points` VALUES (17547559,'Goblin_Statue','',9469,-29.750,3,-7.973,125);
INSERT INTO `mob_spawn_points` VALUES (17547560,'Goblin_Statue','',9469,-29.750,3,-4.064,125);
INSERT INTO `mob_spawn_points` VALUES (17547561,'Goblin_Statue','',9469,-7.977,3,-3.870,65);
INSERT INTO `mob_spawn_points` VALUES (17547562,'Goblin_Statue','',9469,-0.011,3,-10.099,195);
INSERT INTO `mob_spawn_points` VALUES (17547563,'Goblin_Statue','',9469,19.519,1,-4.004,125);
INSERT INTO `mob_spawn_points` VALUES (17547564,'Goblin_Statue','',9469,-56.195,6,-5.991,255);
INSERT INTO `mob_spawn_points` VALUES (17547565,'Goblin_Statue','',9469,-60.094,6,0.016,255);
INSERT INTO `mob_spawn_points` VALUES (17547566,'Goblin_Statue','',9469,-60.094,6,-12.016,255);
INSERT INTO `mob_spawn_points` VALUES (17547567,'Goblin_Statue','',9469,-58.265,6,5.970,255);
INSERT INTO `mob_spawn_points` VALUES (17547568,'Goblin_Statue','',9469,-70.342,5.591,-7.988,255);
INSERT INTO `mob_spawn_points` VALUES (17547569,'Goblin_Statue','',9469,-70.342,5.591,-16.037,255);
INSERT INTO `mob_spawn_points` VALUES (17547570,'Goblin_Statue','',9469,-40.818,8,-18.949,125);
INSERT INTO `mob_spawn_points` VALUES (17547571,'Goblin_Statue','',9469,-57.936,12,-24.241,195);
INSERT INTO `mob_spawn_points` VALUES (17547572,'Goblin_Statue','',9469,-56.008,12,-34.180,195);
INSERT INTO `mob_spawn_points` VALUES (17547573,'Goblin_Statue','',9469,-65.015,12,-32.986,255);
INSERT INTO `mob_spawn_points` VALUES (17547574,'Goblin_Replica','',9468,0.003,3,10.123,65);
INSERT INTO `mob_spawn_points` VALUES (17547575,'Goblin_Statue','',9469,-7.981,2,37.791,195);
INSERT INTO `mob_spawn_points` VALUES (17547576,'Goblin_Statue','',9469,7.981,2,37.791,195);
INSERT INTO `mob_spawn_points` VALUES (17547577,'Goblin_Statue','',9469,-0.047,2,44.222,65);
INSERT INTO `mob_spawn_points` VALUES (17547578,'Goblin_Statue','',9469,0.108,-2.5,56.484,65);
INSERT INTO `mob_spawn_points` VALUES (17547579,'Goblin_Statue','',9469,-14.259,2,45.917,255);
INSERT INTO `mob_spawn_points` VALUES (17547580,'Goblin_Statue','',9469,-14.259,2,57.953,255);
INSERT INTO `mob_spawn_points` VALUES (17547581,'Goblin_Statue','',9469,-21.586,2,63.964,255);
INSERT INTO `mob_spawn_points` VALUES (17547582,'Goblin_Statue','',9469,14.259,2,45.917,125);
INSERT INTO `mob_spawn_points` VALUES (17547583,'Goblin_Statue','',9469,14.259,2,57.953,125);
INSERT INTO `mob_spawn_points` VALUES (17547584,'Goblin_Statue','',9469,21.586,2,63.964,125);
INSERT INTO `mob_spawn_points` VALUES (17547585,'Goblin_Statue','',9469,-9.961,2,74.192,65);
INSERT INTO `mob_spawn_points` VALUES (17547586,'Goblin_Statue','',9469,9.961,2,74.192,65);
INSERT INTO `mob_spawn_points` VALUES (17547587,'Goblin_Statue','',9469,0.059,2,76.138,65);
INSERT INTO `mob_spawn_points` VALUES (17547588,'Goblin_Statue','',9469,-0.007,3,104.065,65);
INSERT INTO `mob_spawn_points` VALUES (17547589,'Goblin_Statue','',9469,-1.993,3.1,112.205,65);
INSERT INTO `mob_spawn_points` VALUES (17547590,'Goblin_Statue','',9469,1.993,3.1,112.205,65);
INSERT INTO `mob_spawn_points` VALUES (17547591,'Goblin_Statue','',9469,-1.993,3.1,115.998,65);
INSERT INTO `mob_spawn_points` VALUES (17547592,'Goblin_Statue','',9469,1.993,3.1,115.998,65);
INSERT INTO `mob_spawn_points` VALUES (17547593,'Goblin_Statue','',9469,-0.037,2,126.924,65);
INSERT INTO `mob_spawn_points` VALUES (17547594,'Goblin_Statue','',9469,-0.046,-5,66.181,65);
INSERT INTO `mob_spawn_points` VALUES (17547595,'Goblin_Statue','',9469,-0.036,-5,28.083,65);
INSERT INTO `mob_spawn_points` VALUES (17547596,'Goblin_Statue','',9469,-1.999,9,-32.074,195);
INSERT INTO `mob_spawn_points` VALUES (17547597,'Goblin_Statue','',9469,1.999,9,-32.074,195);
INSERT INTO `mob_spawn_points` VALUES (17547598,'Goblin_Statue','',9469,0.024,9,-38.129,195);
INSERT INTO `mob_spawn_points` VALUES (17547599,'Goblin_Statue','',9469,-6.038,9,-44.088,125);
INSERT INTO `mob_spawn_points` VALUES (17547600,'Goblin_Statue','',9469,0.079,9,-49.934,65);
INSERT INTO `mob_spawn_points` VALUES (17547601,'Goblin_Statue','',9469,5.906,9,-43.921,255);
INSERT INTO `mob_spawn_points` VALUES (17547602,'Goblin_Statue','',9469,18.037,9,-35.956,125);
INSERT INTO `mob_spawn_points` VALUES (17547603,'Goblin_Statue','',9469,-18.230,9,-49.996,255);
INSERT INTO `mob_spawn_points` VALUES (17547604,'Goblin_Statue','',9469,4.024,9,-61.976,195);
INSERT INTO `mob_spawn_points` VALUES (17547605,'Goblin_Statue','',9469,20.247,9,-50.072,125);
INSERT INTO `mob_spawn_points` VALUES (17547606,'Goblin_Statue','',9469,20.247,9,-53.965,125);

-- Jeuno Groups
INSERT INTO mob_groups VALUES (1,194,188,'Anvilix_Sootwrists',0,128,150,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (2,336,188,'Bandrix_Rockjaw',0,128,236,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (3,449,188,'Blazox_Boneybod',0,128,322,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (4,505,188,'Bootrix_Jaggedelbow',0,128,374,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (5,554,188,'Buffrix_Eargone',0,128,412,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (6,745,188,'Cloktix_Longnail',0,128,546,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (7,1052,188,'Distilix_Stickytoes',0,128,752,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (8,1199,188,'Elixmix_Hooknose',0,128,856,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (9,1251,188,'Eremix_Snottynostril',0,128,895,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (10,1444,188,'Gabblox_Magpietongue',0,128,1066,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (11,1668,188,'Goblin_Golem',0,128,1335,12500,12500,78, 80,0);
INSERT INTO mob_groups VALUES (12,1707,188,'Goblin_Replica',0,128,1435,1000,1000,78, 80,0);
INSERT INTO mob_groups VALUES (13,1716,188,'Goblin_Statue',0,128,1435,1000,1000,70,72,0);
INSERT INTO mob_groups VALUES (14,1935,188,'Hermitrix_Toothrot',0,128,1672,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (15,2007,188,'Humnox_Drumbelly',0,128,1715,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (16,2115,188,'Jabbrox_Grannyguise',0,128,1815,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (17,2116,188,'Jabkix_Pigeonpecs',0,128,1816,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (18,2191,188,'Karashix_Swollenskull',0,128,1870,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (19,2225,188,'Kikklix_Longlegs',0,128,1895,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (20,2453,188,'Lurklox_Dhalmelneck',0,128,2096,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (21,2711,188,'Mobpix_Mucousmouth',0,128,2329,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (22,2747,188,'Morgmox_Moldnoggin',0,128,2354,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (23,2751,188,'Mortilox_Wartpaws',0,128,2359,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (24,3213,188,'Prowlox_Barrelbelly',0,128,2836,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (25,3419,188,'Rutrix_Hamgams',0,128,3020,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (26,3507,188,'Scruffix_Shaggychest',0,128,3089,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (27,3674,188,'Slystix_Megapeepers',0,128,3238,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (28,3676,188,'Smeltix_Thickhide',0,128,3239,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (29,3692,188,'Snypestix_Eaglebeak',0,128,3271,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (30,3718,188,'Sparkspox_Sweatbrow',0,128,3292,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (31,3917,188,'Ticktox_Beadyeyes',0,128,3523,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (32,3985,188,'Trailblix_Goatmug',0,128,3575,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (33,4047,188,'Tufflix_Loglimbs',0,128,3619,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (34,4064,188,'Tymexox_Ninefingers',0,128,3639,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (35,4133,188,'Vanguard_Alchemist',0,128,3691,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (36,4134,188,'Vanguard_Ambusher',0,128,3696,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (37,4136,188,'Vanguard_Armorer',0,128,3706,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (38,4147,188,'Vanguard_Enchanter',0,128,3757,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (39,4155,188,'Vanguard_Hitman',0,128,3795,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (40,4160,188,'Vanguard_Maestro',0,128,3820,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (41,4166,188,'Vanguard_Necromancer',0,128,3850,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (42,4170,188,'Vanguard_Pathfinder',0,128,3870,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (43,4173,188,'Vanguard_Pitfighter',0,128,3885,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (44,4179,188,'Vanguard_Ronin',0,128,3915,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (45,4182,188,'Vanguard_Shaman',0,128,3930,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (46,4184,188,'Vanguard_Smithy',0,128,3940,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (47,4185,188,'Vanguards_Avatar',0,128,0,2400,1000,78, 80,0);
INSERT INTO mob_groups VALUES (48,4189,188,'Vanguards_Slime',0,128,0,2400,1000,78, 80,0);
INSERT INTO mob_groups VALUES (49,4190,188,'Vanguards_Wyvern',0,128,0,2400,1000,78, 80,0);
INSERT INTO mob_groups VALUES (50,4192,188,'Vanguard_Tinkerer',0,128,3950,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (51,4199,188,'Vanguard_Welldigger',0,128,3985,4000,0,78, 80,0);
INSERT INTO mob_groups VALUES (52,4303,188,'Wasabix_Callusdigit',0,128,4084,8000,0,78, 80,0);
INSERT INTO mob_groups VALUES (53,4388,188,'Wyrmwix_Snakespecs',0,128,4197,8000,0,78, 80,0);

-- make sure avatar icons spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=188 and name='Goblin_Statue';

-- make it so tombstones respawn
UPDATE mob_groups SET respawntime=1800 WHERE zoneid=188 and name='Goblin_Statue';

-- No roam or links
UPDATE mob_pools SET roamflag=256, links=0 WHERE poolid=1716;

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=188 and mobid>=17547265 and mobid<=17547678;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=188);
-- Should be redundant...... but the above one isn't working
DELETE FROM mob_droplist WHERE dropId=1144; -- Stone Drops
DELETE FROM mob_droplist WHERE dropId=2543; -- Mob Drops

-- Mob Drops
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1449, 250); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1452, 250); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1455, 250); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1449, 150); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1449, 150); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1452, 150); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1452, 150); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1455, 150); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1455, 150); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1449, 50); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1449, 50); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1452, 50); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1452, 50); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1455, 50); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1455, 50); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2543, 0, 0, 1000, 1520, 10); -- jar_of_goblin_grease
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 11396, 67); -- etoile_toe_shoes
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15028, 66); -- commodore_gants
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15082, 67); -- scouts_beret
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15102, 66); -- warriors_mufflers
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15103, 67); -- melee_gloves
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15115, 66); -- wyrm_finger_gauntlets
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15119, 67); -- clerics_pantaloons
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15121, 66); -- duelists_tights
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15124, 67); -- abyss_flanchard
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15135, 66); -- sorcerers_sabots
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15137, 67); -- assassins_poulaines
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15141, 67); -- bards_slippers
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15143, 67); -- saotome_sune-ate
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 15144, 67); -- koga_kyahan
INSERT INTO mob_droplist VALUES (2543, 1, 1, 1, 16352, 67); -- pantin_churidars

INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1449, 500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1452, 500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1455, 500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (1144, 0, 0, 1000, 1474, 100); -- infinity_core

-- Add the drop pools
UPDATE mob_groups SET dropid=2543 WHERE zoneid=188;
UPDATE mob_groups SET dropid=1144 WHERE zoneid=188 and name='Goblin_Statue';

--
-- Dynamis Glacier ZoneId: 134
--

-- Glacier Mobs
INSERT INTO `mob_spawn_points` VALUES (17326081,'Angra_Mainyu','Angra Mainyu',7001,280.089,20,543.372,69);
INSERT INTO `mob_spawn_points` VALUES (17326082,'Fire_Pukis','Fire Pukis',7022,277.593,20,534.495,54);
INSERT INTO `mob_spawn_points` VALUES (17326083,'Poison_Pukis','Poison Pukis',7072,283.023,20,535.913,65);
INSERT INTO `mob_spawn_points` VALUES (17326084,'Wind_Pukis','Wind Pukis',7160,282.791,20,528.890,65);
INSERT INTO `mob_spawn_points` VALUES (17326085,'Petro_Pukis','Petro Pukis',7071,276.765,20,529.017,57);
INSERT INTO `mob_spawn_points` VALUES (17326086,'Goublefaupe','Goublefaupe',7028,100.271,-20.250,136.712,69);
INSERT INTO `mob_spawn_points` VALUES (17326087,'Quiebitiel','Quiebitiel',7074,-19.628,-60.250,-62.420,62);
INSERT INTO `mob_spawn_points` VALUES (17326088,'Mildaunegeux','Mildaunegeux',7062,59.686,-0.250,-337.037,185);
INSERT INTO `mob_spawn_points` VALUES (17326089,'Velosareon','Velosareon',7158,263.139,-0.250,-19.780,1);
INSERT INTO `mob_spawn_points` VALUES (17326090,'Dagourmarche','Dagourmarche',7010,-176.751,-40.250,-219.692,255);
INSERT INTO `mob_spawn_points` VALUES (17326099,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326100,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326101,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326102,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326103,'Vanguard_Beasttender','Vanguard Beasttender',7097,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326104,'Vanguards_Scorpion',"Vanguard's Scorpion",7146,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326105,'Vanguard_Minstrel','Vanguard Minstrel',7122,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326106,'Gu_Nha_Wallstormer',"Gu'Nha Wallstormer",7032,251.607,0.379,240.670,69);
INSERT INTO `mob_spawn_points` VALUES (17326107,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326108,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326109,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326110,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326111,'Vanguard_Drakekeeper','Vanguard Drakekeeper',7104,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326112,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326113,'Vanguard_Minstrel','Vanguard Minstrel',7122,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326114,'Na_Hya_Floodmaker',"Na'Hya Floodmaker",7068,-79.436,-20.113,-273.770,118);
INSERT INTO `mob_spawn_points` VALUES (17326115,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326116,'Vanguard_Defender','Vanguard Defender',7101,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326117,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326118,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326119,'Vanguard_Kusa','Vanguard Kusa',7116,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326120,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326121,'Vanguard_Purloiner','Vanguard Purloiner',7136,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326122,'Vanguard_Mason','Vanguard Mason',7119,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326123,'Vanguard_Mason','Vanguard Mason',7119,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326124,'Vanguard_Undertaker','Vanguard Undertaker',7152,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326125,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326126,'Ji_Fhu_Infiltrator',"Ji'Fhu Infiltrator",7055,160.404,-19.549,27.451,72);
INSERT INTO `mob_spawn_points` VALUES (17326127,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326128,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326129,'Vanguard_Purloiner','Vanguard Purloiner',7136,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326130,'Vanguard_Vigilante','Vanguard Vigilante',7154,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326131,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326132,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326133,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326134,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326135,'Ga_Fho_Venomtouch',"Ga'Fho Venomtouch",7142,252.963,-20.784,-140.905,17);
INSERT INTO `mob_spawn_points` VALUES (17326136,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326137,'Vanguard_Purloiner','Vanguard Purloiner',7136,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326138,'Vanguard_Defender','Vanguard Defender',7101,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326139,'Vanguard_Vigilante','Vanguard Vigilante',7154,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326140,'Vanguard_Vigilante','Vanguard Vigilante',7154,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326141,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326142,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326143,'Vanguard_Beasttender','Vanguard Beasttender',7097,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326144,'Vanguards_Scorpion',"Vanguard's Scorpion",7146,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326145,'Ta_Hyu_Gallanthunter',"Ta'Hyu Gallanthunter",7088,174.087,-19.417,27.687,63);
INSERT INTO `mob_spawn_points` VALUES (17326146,'Vanguard_Undertaker','Vanguard Undertaker',7152,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326147,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326148,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326149,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326150,'Vanguard_Minstrel','Vanguard Minstrel',7122,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326151,'Nu_Bhi_Spiraleye',"Nu'Bhi Spiraleye",7070,69.8,-19.659,-249.635,245);
INSERT INTO `mob_spawn_points` VALUES (17326152,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326153,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326154,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326155,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326156,'De_Bho_Pyrohand',"De'Bho Pyrohand",7013,252.963,-20.784,-140.905,17);
INSERT INTO `mob_spawn_points` VALUES (17326157,'Vanguard_Drakekeeper','Vanguard Drakekeeper',7104,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326158,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326159,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326160,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326161,'Vanguard_Kusa','Vanguard Kusa',7116,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326162,'Go_Tyo_Magenapper',"Go'Tyo Magenapper",7029,228.681,-20.421,-156.130,183);
INSERT INTO `mob_spawn_points` VALUES (17326163,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326164,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326165,'Vanguard_Vigilante','Vanguard Vigilante',7154,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326166,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326167,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326168,'So_Zho_Metalbender',"So'Zho Metalbender",7084,252.963,-20.784,-140.905,17);
INSERT INTO `mob_spawn_points` VALUES (17326169,'Vanguard_Vindicator','Vanguard Vindicator',7155,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326170,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326171,'Vanguard_Defender','Vanguard Defender',7101,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326172,'Vanguard_Defender','Vanguard Defender',7101,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326173,'Mu_Gha_Legionkiller',"Mu'Gha Legionkiller",7067,65.413,-19.346,-199.106,182);
INSERT INTO `mob_spawn_points` VALUES (17326174,'Vanguard_Purloiner','Vanguard Purloiner',7136,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326175,'Vanguard_Purloiner','Vanguard Purloiner',7136,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326176,'Vanguard_Minstrel','Vanguard Minstrel',7122,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326177,'Vanguard_Beasttender','Vanguard Beasttender',7097,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326178,'Vanguards_Scorpion',"Vanguard's Scorpion",7146,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326179,'So_Gho_Adderhandler',"So'Gho Adderhandler",7083,252.963,-20.784,-140.905,17);
INSERT INTO `mob_spawn_points` VALUES (17326180,'Vanguards_Scorpion',"Vanguard's Scorpion",7146,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326181,'Vanguard_Vigilante','Vanguard Vigilante',7154,-400,94.313,-63.5,127);
INSERT INTO `mob_spawn_points` VALUES (17326182,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326183,'Vanguard_Mason','Vanguard Mason',7119,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326184,'Vanguard_Mason','Vanguard Mason',7119,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326185,'Gu_Khu_Dukesniper',"Gu'Khu Dukesniper",7031,251.607,0.379,240.670,69);
INSERT INTO `mob_spawn_points` VALUES (17326186,'Vanguard_Constable','Vanguard Constable',7100,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326187,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326188,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326189,'Vanguard_Hatamoto','Vanguard Hatamoto',7111,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326190,'Ji_Khu_Towercleaver',"Ji'Khu Towercleaver",7056,262.424,-19.233,-114.368,251);
INSERT INTO `mob_spawn_points` VALUES (17326191,'Vanguard_Protector','Vanguard Protector',7135,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326192,'Vanguard_Militant','Vanguard Militant',7121,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326193,'Vanguard_Kusa','Vanguard Kusa',7116,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326194,'Vanguard_Kusa','Vanguard Kusa',7116,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326195,'Mi_Rhe_Whisperblade',"Mi'Rhe Whisperblade",7064,66.923,-19.655,-218.081,198);
INSERT INTO `mob_spawn_points` VALUES (17326196,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326197,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326198,'Vanguard_Thaumaturge','Vanguard Thaumaturge',7149,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326199,'Vanguard_Undertaker','Vanguard Undertaker',7152,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326200,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326201,'Be_Zhe_Keeprazer',"Be'Zhe Keeprazer",7004,123.343,-20,-201.344,241);
INSERT INTO `mob_spawn_points` VALUES (17326202,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326203,'Adamantking_Effigy','Adamantking Effigy',7000,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326204,'Adamantking_Effigy','Adamantking Effigy',7000,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326205,'Adamantking_Effigy','Adamantking Effigy',7000,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326206,'Adamantking_Effigy','Adamantking Effigy',7000,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326207,'Dynamis_Effigy','Adamantking Image',7017,257.287,-21.161,-142.054,81);
INSERT INTO `mob_spawn_points` VALUES (17326208,'Vanguard_Trooper','Vanguard Trooper',7151,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326209,'Vanguard_Neckchopper','Vanguard Neckchopper',7123,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326210,'Vanguard_Footsoldier','Vanguard Footsoldier',7108,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326211,'Vanguard_Footsoldier','Vanguard Footsoldier',7108,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326212,'Humegutter_Adzjbadj','Humegutter Adzjbadj',7035,377.925,0.327,-171.507,96);
INSERT INTO `mob_spawn_points` VALUES (17326213,'Vanguard_Vexer','Vanguard Vexer',7153,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326214,'Vanguard_Vexer','Vanguard Vexer',7153,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326215,'Vanguard_Backstabber','Vanguard Backstabber',7096,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326216,'Jeunoraider_Gepkzip','Jeunoraider Gepkzip',7054,282.762,0.734,224.614,42);
INSERT INTO `mob_spawn_points` VALUES (17326217,'Vanguard_Grappler','Vanguard Grappler',7109,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326218,'Cobraclaw_Buchzvotch','Cobraclaw Buchzvotch',7009,388.575,0.4,18.444,192);
INSERT INTO `mob_spawn_points` VALUES (17326219,'Vanguard_Footsoldier','Vanguard Footsoldier',7108,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326220,'Vanguard_Gutslasher','Vanguard Gutslasher',7110,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326221,'Vanguard_Amputator','Vanguard Amputator',7093,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326222,'Vanguard_Amputator','Vanguard Amputator',7093,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326223,'Wraithdancer_Gidbnod','Wraithdancer Gidbnod',7161,365.053,0.101,-206.342,139);
INSERT INTO `mob_spawn_points` VALUES (17326224,'Vanguard_Backstabber','Vanguard Backstabber',7096,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326225,'Vanguard_Impaler','Vanguard Impaler',7114,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326226,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326227,'Vanguard_Predator','Vanguard Predator',7132,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326228,'Vanguard_Predator','Vanguard Predator',7132,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326229,'Galkarider_Retzpratz','Galkarider Retzpratz',7024,393.606,0.228,27.242,211);
INSERT INTO `mob_spawn_points` VALUES (17326230,'Vanguard_Grappler','Vanguard Grappler',7109,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326231,'Vanguard_Dollmaster','Vanguard Dollmaster',7102,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326232,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326233,'Deathcaller_Bidfbid','Deathcaller Bidfbid',7012,-49.369,0.001,-303.104,48);
INSERT INTO `mob_spawn_points` VALUES (17326234,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326235,'Vanguard_Vexer','Vanguard Vexer',7153,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326236,'Vanguard_Vexer','Vanguard Vexer',7153,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326237,'Spinalsucker_Galflmall','Spinalsucker Galflmall',7085,377.925,0.327,-171.507,96);
INSERT INTO `mob_spawn_points` VALUES (17326238,'Vanguard_Mesmerizer','Vanguard Mesmerizer',7120,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326239,'Vanguard_Hawker','Vanguard Hawker',7112,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326240,'Vanguards_Hecteyes',"Vanguard's Hecteyes",7145,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326241,'Vanguard_Pillager','Vanguard Pillager',7130,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326242,'Vanguard_Pillager','Vanguard Pillager',7130,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326243,'Lockbuster_Zapdjipp','Lockbuster Zapdjipp',7060,391.617,0.001,10.540,152);
INSERT INTO `mob_spawn_points` VALUES (17326244,'Vanguard_Pillager','Vanguard Pillager',7130,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326245,'Vanguard_Predator','Vanguard Predator',7132,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326246,'Vanguard_Trooper','Vanguard Trooper',7151,-195.866,-10.5,39.163,120);
INSERT INTO `mob_spawn_points` VALUES (17326247,'Vanguard_Trooper','Vanguard Trooper',7151,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326248,'Heavymail_Djidzbad','Heavymail Djidzbad',7033,-112.136,0.192,-396.596,203);
INSERT INTO `mob_spawn_points` VALUES (17326249,'Vanguard_Neckchopper','Vanguard Neckchopper',7123,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326250,'Vanguard_Footsoldier','Vanguard Footsoldier',7108,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326251,'Vanguard_Bugler','Vanguard Bugler',7098,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326252,'Vanguard_Dollmaster','Vanguard Dollmaster',7102,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326253,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326254,'Vanguard_Gutslasher','Vanguard Gutslasher',7110,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326255,'Elvaanlopper_Grokdok','Elvaanlopper Grokdok',7021,377.925,0.327,-171.507,96);
INSERT INTO `mob_spawn_points` VALUES (17326256,'Vanguard_Neckchopper','Vanguard Neckchopper',7123,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326257,'Vanguard_Neckchopper','Vanguard Neckchopper',7123,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326258,'Skinmask_Ugghfogg','Skinmask Ugghfogg',7080,-119.632,0.818,-383.615,109);
INSERT INTO `mob_spawn_points` VALUES (17326259,'Vanguard_Amputator','Vanguard Amputator',7093,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326260,'Vanguard_Mesmerizer','Vanguard Mesmerizer',7120,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326261,'Vanguard_Mesmerizer','Vanguard Mesmerizer',7120,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326262,'Taruroaster_Biggsjig','Taruroaster Biggsjig',7087,-96.830,0.840,-400.133,24);
INSERT INTO `mob_spawn_points` VALUES (17326263,'Vanguard_Hawker','Vanguard Hawker',7112,-30.245,-20.006,-106.834,127);
INSERT INTO `mob_spawn_points` VALUES (17326264,'Vanguards_Hecteyes',"Vanguard's Hecteyes",7145,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326265,'Mithraslaver_Debhabob','Mithraslaver Debhabob',7063,350.179,0.6,-149.998,132);
INSERT INTO `mob_spawn_points` VALUES (17326266,'Vanguards_Hecteyes',"Vanguard's Hecteyes",7145,0.357,-28.024,-58.155,127);
INSERT INTO `mob_spawn_points` VALUES (17326267,'Vanguard_Bugler','Vanguard Bugler',7098,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326268,'Vanguard_Bugler','Vanguard Bugler',7098,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326269,'Vanguard_Bugler','Vanguard Bugler',7098,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326270,'Ultrasonic_Zeknajak','Ultrasonic Zeknajak',7090,282.762,0.734,224.614,42);
INSERT INTO `mob_spawn_points` VALUES (17326271,'Vanguard_Impaler','Vanguard Impaler',7114,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326272,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326273,'Drakefeast_Wubmfub','Drakefeast Wubmfub',7014,377.925,0.327,-171.507,96);
INSERT INTO `mob_spawn_points` VALUES (17326274,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326275,'Serjeant_Tombstone','Serjeant Tombstone',7078,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326276,'Serjeant_Tombstone','Serjeant Tombstone',7078,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326277,'Serjeant_Tombstone','Serjeant Tombstone',7078,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326278,'Serjeant_Tombstone','Serjeant Tombstone',7078,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326279,'Dynamis_Tombstone','Warchief Tombstone',7020,381.676,-0.357,-175.592,1);
INSERT INTO `mob_spawn_points` VALUES (17326280,'Vanguard_Sentinel','Vanguard Sentinel',7139,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326281,'Vanguard_Assassin','Vanguard Assassin',7095,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326282,'Vanguard_Skirmisher','Vanguard Skirmisher',7141,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326283,'Vanguard_Skirmisher','Vanguard Skirmisher',7141,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326284,'Foo_Peku_the_Bloodcloak','Foo Peku the Bloodcloak',7023,118.902,-40,-2.955,185);
INSERT INTO `mob_spawn_points` VALUES (17326285,'Vanguard_Visionary','Vanguard Visionary',7156,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326286,'Vanguard_Liberator','Vanguard Liberator',7117,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326287,'Vanguard_Sentinel','Vanguard Sentinel',7139,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326288,'Vanguard_Sentinel','Vanguard Sentinel',7139,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326289,'Xaa_Chau_the_Roctalon','Xaa Chau the Roctalon',7162,-192.704,-39.787,-212.934,150);
INSERT INTO `mob_spawn_points` VALUES (17326290,'Vanguard_Exemplar','Vanguard Exemplar',7106,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326291,'Vanguard_Ogresoother','Vanguard Ogresoother',7125,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326292,'Vanguards_Crow',"Vanguard's Crow",7144,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326293,'Vanguard_Priest','Vanguard Priest',7134,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326294,'Vanguard_Priest','Vanguard Priest',7134,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326295,'Koo_Saxu_the_Everfast','Koo Saxu the Everfast',7058,68.337,-40,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326296,'Vanguard_Inciter','Vanguard Inciter',7115,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326297,'Vanguard_Chanter','Vanguard Chanter',7099,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326298,'Vanguard_Prelate','Vanguard Prelate',7133,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326299,'Vanguard_Prelate','Vanguard Prelate',7133,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326300,'Bhuu_Wjato_the_Firepool','Bhuu Wjato the Firepool',7005,78.337,-39.435,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326301,'Vanguard_Skirmisher','Vanguard Skirmisher',7141,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326302,'Vanguard_Visionary','Vanguard Visionary',7156,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326303,'Vanguard_Visionary','Vanguard Visionary',7156,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326304,'Caa_Xaza_the_Madpiercer','Caa Xaza the Madpiercer',7008,48.337,-39.119,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326305,'Vanguard_Partisan','Vanguard Partisan',7127,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326306,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326307,'Maa_Zaua_the_Wyrmkeeper','Maa Zaua the Wyrmkeeper',7061,-46.006,-39.961,-233.167,195);
INSERT INTO `mob_spawn_points` VALUES (17326308,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326309,'Vanguard_Skirmisher','Vanguard Skirmisher',7141,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326310,'Vanguard_Priest','Vanguard Priest',7134,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326311,'Vanguard_Liberator','Vanguard Liberator',7117,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326312,'Vanguard_Liberator','Vanguard Liberator',7117,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326313,'Ryy_Qihi_the_Idolrobber','Ryy Qihi the Idolrobber',7077,287.338,0.106,210.410,150);
INSERT INTO `mob_spawn_points` VALUES (17326314,'Vanguard_Salvager','Vanguard Salvager',7138,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326315,'Vanguard_Oracle','Vanguard Oracle',7126,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326316,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326317,'Vanguard_Exemplar','Vanguard Exemplar',7106,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326318,'Vanguard_Exemplar','Vanguard Exemplar',7106,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326319,'Guu_Waji_the_Preacher','Guu Waji the Preacher',7030,68.337,-40,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326320,'Vanguard_Prelate','Vanguard Prelate',7133,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326321,'Vanguard_Inciter','Vanguard Inciter',7115,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326322,'Vanguard_Inciter','Vanguard Inciter',7115,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326323,'Nee_Huxa_the_Judgmental','Nee Huxa the Judgmental',7069,68.337,-40,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326324,'Vanguard_Assassin','Vanguard Assassin',7095,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326325,'Kuu_Xuka_the_Nimble','Kuu Xuka the Nimble',7059,68.337,-40,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326326,'Vanguard_Ogresoother','Vanguard Ogresoother',7125,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326327,'Vanguards_Crow',"Vanguard's Crow",7144,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326328,'Soo_Jopo_the_Fiendking','Soo Jopo the Fiendking',7082,-36.191,-39.011,-220.196,195);
INSERT INTO `mob_spawn_points` VALUES (17326329,'Vanguards_Crow',"Vanguard's Crow",7144,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326330,'Vanguard_Persecutor','Vanguard Persecutor',7129,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326331,'Vanguard_Partisan','Vanguard Partisan',7127,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326332,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326333,'Vanguard_Chanter','Vanguard Chanter',7099,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326334,'Vanguard_Chanter','Vanguard Chanter',7099,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326335,'Xhoo_Fuza_the_Sublime','Xhoo Fuza the Sublime',7163,-30.709,-39.221,-249.811,195);
INSERT INTO `mob_spawn_points` VALUES (17326336,'Vanguard_Liberator','Vanguard Liberator',7117,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326337,'Vanguard_Prelate','Vanguard Prelate',7133,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326338,'Vanguard_Salvager','Vanguard Salvager',7138,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326339,'Vanguard_Salvager','Vanguard Salvager',7138,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326340,'Hee_Mida_the_Meticulous','Hee Mida the Meticulous',7034,-2.550,-40.167,-209.283,130);
INSERT INTO `mob_spawn_points` VALUES (17326341,'Vanguard_Assassin','Vanguard Assassin',7095,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326342,'Vanguard_Persecutor','Vanguard Persecutor',7129,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326343,'Vanguard_Persecutor','Vanguard Persecutor',7129,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326344,'Knii_Hoqo_the_Bisector','Knii Hoqo the Bisector',7057,287.338,0.106,210.410,150);
INSERT INTO `mob_spawn_points` VALUES (17326345,'Vanguard_Oracle','Vanguard Oracle',7126,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326346,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326347,'Puu_Timu_the_Phantasmal','Puu Timu the Phantasmal',7073,-81.290,-40,-259.308,255);
INSERT INTO `mob_spawn_points` VALUES (17326348,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326349,'Avatar_Icon','Avatar Icon',7003,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326350,'Avatar_Icon','Avatar Icon',7003,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326351,'Avatar_Icon','Avatar Icon',7003,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326352,'Avatar_Icon','Avatar Icon',7003,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326353,'Dynamis_Icon','Avatar Idol',7018,55.512,-39.253,49.759,65);
INSERT INTO `mob_spawn_points` VALUES (17326354,'Vanguard_Smithy','Vanguard Smithy',7142,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326355,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326356,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326357,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326358,'Vanguard_Pathfinder','Vanguard Pathfinder',7128,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326359,'Vanguards_Slime',"Vanguard's Slime",7147,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326360,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326361,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326362,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326363,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326364,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326365,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326366,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326367,'Vanguard_Ambusher','Vanguard Ambusher',7092,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326368,'Vanguard_Necromancer','Vanguard Necromancer',7124,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326369,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326370,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326371,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326372,'Vanguard_Smithy','Vanguard Smithy',7142,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326373,'Vanguard_Smithy','Vanguard Smithy',7142,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326374,'Moltenox_Stubthumbs','Moltenox Stubthumbs',7065,56.123,-61.229,-58.851,94);
INSERT INTO `mob_spawn_points` VALUES (17326375,'Vanguard_Ronin','Vanguard Ronin',7137,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326376,'Vanguard_Hitman','Vanguard Hitman',7113,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326377,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326378,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326379,'Droprix_Granitepalms','Droprix Granitepalms',7016,-128.857,-59.556,-179.772,233);
INSERT INTO `mob_spawn_points` VALUES (17326380,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326381,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326382,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326383,'Vanguard_Impaler','Vanguard Dragontamer',7114,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326384,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326385,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326386,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326387,'Brewnix_Bittypupils','Brewnix Bittypupils',7007,274.079,0.095,239.793,136);
INSERT INTO `mob_spawn_points` VALUES (17326388,'Vanguard_Smithy','Vanguard Smithy',7142,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326389,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326390,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326391,'Vanguard_Necromancer','Vanguard Necromancer',7124,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326392,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326393,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326394,'Vanguard_Ambusher','Vanguard Ambusher',7092,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326395,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326396,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326397,'Ascetox_Ratgums','Ascetox Ratgums',7002,-43.07,-59.110,-97.816,121);
INSERT INTO `mob_spawn_points` VALUES (17326398,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326399,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326400,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326401,'Gibberox_Pimplebeak','Gibberox Pimplebeak',7026,94.968,-59.307,200.551,99);
INSERT INTO `mob_spawn_points` VALUES (17326402,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326403,'Vanguard_Hitman','Vanguard Hitman',7113,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326404,'Vanguard_Hitman','Vanguard Hitman',7113,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326405,'Swypestix_Tigershins','Swypestix Tigershins',7086,-4.165,-59.660,68.984,53);
INSERT INTO `mob_spawn_points` VALUES (17326406,'Vanguard_Pathfinder','Vanguard Pathfinder',7128,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326407,'Vanguards_Slime',"Vanguard's Slime",7147,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326408,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326409,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326410,'Bordox_Kittyback','Bordox Kittyback',7006,-41.103,-60,-118.675,134);
INSERT INTO `mob_spawn_points` VALUES (17326411,'Vanguard_Tinkerer','Vanguard Tinkerer',7150,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326412,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326413,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326414,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326415,'Ruffbix_Jumbolobes','Ruffbix Jumbolobes',7076,56.123,-61.229,-58.851,94);
INSERT INTO `mob_spawn_points` VALUES (17326416,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326417,'Vanguard_Pathfinder','Vanguard Pathfinder',7128,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326418,'Vanguards_Slime',"Vanguard's Slime",7147,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326420,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326421,'Draklix_Scalecrust','Draklix Scalecrust',7015,8.932,-59.282,57.038,64);
INSERT INTO `mob_spawn_points` VALUES (17326422,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326423,'Vanguard_Smithy','Vanguard Smithy',7142,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326424,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326425,'Vanguard_Tinkerer','Vanguard Tinkerer',7150,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326426,'Vanguard_Tinkerer','Vanguard Tinkerer',7150,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326427,'Tocktix_Thinlids','Tocktix Thinlids',7089,274.079,0.095,239.793,136);
INSERT INTO `mob_spawn_points` VALUES (17326428,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326429,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326430,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326431,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326432,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326433,'Vanguard_Alchemist','Vanguard Alchemist',7091,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326434,'Vanguard_Maestro','Vanguard Maestro',7118,149.257,-17.658,-114.08,127);
INSERT INTO `mob_spawn_points` VALUES (17326436,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326437,'Vanguard_Pathfinder','Vanguard Pathfinder',7128,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326438,'Vanguards_Slime',"Vanguard's Slime",7147,-388.488,93.467,-76.863,127);
INSERT INTO `mob_spawn_points` VALUES (17326439,'Routsix_Rubbertendon','Routsix Rubbertendon',7075,106.820,-59.486,-39.087,94);
INSERT INTO `mob_spawn_points` VALUES (17326440,'Vanguards_Slime',"Vanguard's Slime",7147,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326441,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326442,'Vanguard_Shaman','Vanguard Shaman',7140,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326443,'Vanguard_Enchanter','Vanguard Enchanter',7105,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326444,'Vanguard_Necromancer','Vanguard Necromancer',7124,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326445,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326446,'Morblox_Chubbychin','Morblox Chubbychin',7066,56.123,-61.229,-58.851,94);
INSERT INTO `mob_spawn_points` VALUES (17326447,'Vanguards_Avatar',"Vanguard's Avatar",7143,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326448,'Vanguard_Armorer','Vanguard Armorer',7094,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326449,'Vanguard_Ronin','Vanguard Ronin',7137,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326450,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326451,'Vanguard_Maestro','Vanguard Maestro',7118,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326452,'Whistrix_Toadthroat','Whistrix Toadthroat',7159,100.578,-60.708,-58.551,95);
INSERT INTO `mob_spawn_points` VALUES (17326453,'Vanguard_Welldigger','Vanguard Welldigger',7157,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326455,'Vanguards_Wyvern',"Vanguard's Wyvern",7148,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326456,'Vanguard_Ambusher','Vanguard Ambusher',7092,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326457,'Vanguard_Ambusher','Vanguard Ambusher',7092,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326458,'Slinkix_Trufflesniff','Slinkix Trufflesniff',7081,56.123,-61.229,-58.851,94);
INSERT INTO `mob_spawn_points` VALUES (17326459,'Vanguard_Pitfighter','Vanguard Pitfighter',7131,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326460,'Vanguard_Hitman','Vanguard Hitman',7113,-155.1,-25.748,113.5,46);
INSERT INTO `mob_spawn_points` VALUES (17326461,'Vanguard_Ronin','Vanguard Ronin',7137,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326462,'Vanguard_Ronin','Vanguard Ronin',7137,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326463,'Shisox_Widebrow','Shisox Widebrow',7079,43.071,-59.468,146.630,79);
INSERT INTO `mob_spawn_points` VALUES (17326464,'Goblin_Statue','Goblin Replica',7027,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326465,'Goblin_Statue','Goblin Replica',7027,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326466,'Goblin_Statue','Goblin Replica',7027,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326467,'Goblin_Statue','Goblin Replica',7027,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326468,'Dynamis_Statue','Goblin Statue',7019,77.514,-59.791,-48.208,112);
INSERT INTO `mob_spawn_points` VALUES (17326469,'Hydra_Warrior','Hydra Warrior',7052,-70.756,-70.543,105.626,8);
INSERT INTO `mob_spawn_points` VALUES (17326470,'Hydra_Monk','Hydra Monk',7041,-70.756,-70.543,105.626,8);
INSERT INTO `mob_spawn_points` VALUES (17326471,'Hydra_White_Mage','Hydra White Mage',7053,-70.756,-70.543,105.626,8);
INSERT INTO `mob_spawn_points` VALUES (17326472,'Hydra_Red_Mage','Hydra Red Mage',7045,-70.756,-70.543,105.626,8);
INSERT INTO `mob_spawn_points` VALUES (17326473,'Vanguard_Eye','Vanguard Eye',7107,-70.756,-70.543,105.626,8);
INSERT INTO `mob_spawn_points` VALUES (17326474,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326475,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326476,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326477,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326478,'Vanguard_Eye','Vanguard Eye',7107,-119.596,-79.884,126.334,81);
INSERT INTO `mob_spawn_points` VALUES (17326479,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326480,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326481,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326482,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326483,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326484,'Vanguard_Eye','Vanguard Eye',7107,-140.757,-79.763,143.012,56);
INSERT INTO `mob_spawn_points` VALUES (17326485,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326486,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326487,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326488,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326489,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326490,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326491,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326492,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326493,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326494,'Vanguard_Eye','Vanguard Eye',7107,-163.942,-79.597,147.917,28);
INSERT INTO `mob_spawn_points` VALUES (17326495,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326496,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326497,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326498,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326499,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326500,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326501,'Vanguard_Eye','Vanguard Eye',7107,-163.840,-79.854,166.931,67);
INSERT INTO `mob_spawn_points` VALUES (17326502,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326503,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326504,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326505,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326506,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326507,'Vanguard_Eye','Vanguard Eye',7107,-124.703,-79.870,166.282,58);
INSERT INTO `mob_spawn_points` VALUES (17326508,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326509,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326510,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326511,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326512,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326513,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326514,'Vanguard_Eye','Vanguard Eye',7107,-110.417,-79.975,153.7,73);
INSERT INTO `mob_spawn_points` VALUES (17326515,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326516,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326517,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326518,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326519,'Vanguard_Eye','Vanguard Eye',7107,-89.536,-79.410,140.982,56);
INSERT INTO `mob_spawn_points` VALUES (17326520,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326521,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326522,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326523,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326524,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326525,'Vanguard_Eye','Vanguard Eye',7107,-60.404,-79.168,164.639,57);
INSERT INTO `mob_spawn_points` VALUES (17326526,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326527,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326528,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326529,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326530,'Vanguard_Eye','Vanguard Eye',7107,-42.475,-79.738,150.735,47);
INSERT INTO `mob_spawn_points` VALUES (17326531,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326532,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326533,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326534,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326535,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326536,'Vanguard_Eye','Vanguard Eye',7107,-44.848,-79.143,138.026,69);
INSERT INTO `mob_spawn_points` VALUES (17326537,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326538,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326539,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326540,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326541,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326542,'Vanguard_Eye','Vanguard Eye',7107,-51.607,-79.706,124.808,68);
INSERT INTO `mob_spawn_points` VALUES (17326543,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326544,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326545,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326546,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326547,'Vanguard_Eye','Vanguard Eye',7107,-80.905,-80,121.252,32);
INSERT INTO `mob_spawn_points` VALUES (17326548,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326549,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326550,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326551,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326552,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326553,'Vanguard_Eye','Vanguard Eye',7107,-138.384,-79.645,212.405,65);
INSERT INTO `mob_spawn_points` VALUES (17326554,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326555,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326556,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326557,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326558,'Vanguard_Eye','Vanguard Eye',7107,-91.799,-79.624,83.629,203);
INSERT INTO `mob_spawn_points` VALUES (17326559,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326560,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326561,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326562,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326563,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326564,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326565,'Vanguard_Eye','Vanguard Eye',7107,-97.574,-79.525,74.218,204);
INSERT INTO `mob_spawn_points` VALUES (17326566,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326567,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326568,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326569,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326570,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326571,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326572,'Vanguard_Eye','Vanguard Eye',7107,-23.948,-80.122,-9.697,215);
INSERT INTO `mob_spawn_points` VALUES (17326573,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326574,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326575,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326576,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326577,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326578,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326579,'Vanguard_Eye','Vanguard Eye',7107,-37.508,-80.009,-18.245,247);
INSERT INTO `mob_spawn_points` VALUES (17326580,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326581,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326582,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326583,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326584,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326585,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326586,'Vanguard_Eye','Vanguard Eye',7107,-61.034,-80,-43.2,215);
INSERT INTO `mob_spawn_points` VALUES (17326587,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326588,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326589,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326590,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326591,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326592,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326593,'Vanguard_Eye','Vanguard Eye',7107,-77.556,-80.007,-58.505,246);
INSERT INTO `mob_spawn_points` VALUES (17326594,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326595,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326596,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326597,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326598,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326599,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326600,'Vanguard_Eye','Vanguard Eye',7107,-95.954,-80.249,-70.323,215);
INSERT INTO `mob_spawn_points` VALUES (17326601,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326602,'Hydras_Hound',"Hydra's Hound",7049,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326603,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326604,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326605,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326606,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326607,'Vanguard_Eye','Vanguard Eye',7107,-100.357,-80.079,-83.182,208);
INSERT INTO `mob_spawn_points` VALUES (17326608,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326609,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326610,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326611,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326612,'Vanguard_Eye','Vanguard Eye',7107,-154.278,-80,-158.949,253);
INSERT INTO `mob_spawn_points` VALUES (17326613,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326614,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326615,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326616,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326617,'Vanguard_Eye','Vanguard Eye',7107,-170.938,-79.654,-160.285,254);
INSERT INTO `mob_spawn_points` VALUES (17326618,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326619,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326620,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326621,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326622,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326623,'Vanguard_Eye','Vanguard Eye',7107,-149.824,-79.736,-137.753,251);
INSERT INTO `mob_spawn_points` VALUES (17326624,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326625,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326626,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326627,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326628,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326629,'Vanguard_Eye','Vanguard Eye',7107,-153.617,-80.120,-118.303,46);
INSERT INTO `mob_spawn_points` VALUES (17326630,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326631,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326632,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326633,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326634,'Vanguard_Eye','Vanguard Eye',7107,-168.216,-79.849,-124.715,19);
INSERT INTO `mob_spawn_points` VALUES (17326635,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326636,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326637,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326638,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326639,'Vanguard_Eye','Vanguard Eye',7107,-182.095,-79.106,-121.402,252);
INSERT INTO `mob_spawn_points` VALUES (17326640,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326641,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326642,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326643,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326644,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326645,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326646,'Vanguard_Eye','Vanguard Eye',7107,-178.03,-79.453,-112.513,47);
INSERT INTO `mob_spawn_points` VALUES (17326647,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326648,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326649,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326650,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326651,'Vanguard_Eye','Vanguard Eye',7107,-227.671,-81.553,-138.408,9);
INSERT INTO `mob_spawn_points` VALUES (17326652,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326653,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326654,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326655,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326656,'Vanguard_Eye','Vanguard Eye',7107,-227.289,-79.563,-124.574,7);
INSERT INTO `mob_spawn_points` VALUES (17326657,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326658,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326659,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326660,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326661,'Vanguard_Eye','Vanguard Eye',7107,-298.993,-80.175,-106.453,19);
INSERT INTO `mob_spawn_points` VALUES (17326662,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326663,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326664,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326665,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326666,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326667,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326668,'Vanguard_Eye','Vanguard Eye',7107,-289.822,-80.246,-91.561,44);
INSERT INTO `mob_spawn_points` VALUES (17326669,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326670,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326671,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326672,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326673,'Vanguard_Eye','Vanguard Eye',7107,-279.612,-80,-77.447,42);
INSERT INTO `mob_spawn_points` VALUES (17326674,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326675,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326676,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326677,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326678,'Vanguard_Eye','Vanguard Eye',7107,-139.344,-100.296,9.409,122);
INSERT INTO `mob_spawn_points` VALUES (17326679,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326680,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326681,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326682,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326683,'Vanguard_Eye','Vanguard Eye',7107,-139.998,-99.250,-8.461,144);
INSERT INTO `mob_spawn_points` VALUES (17326684,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326685,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326686,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326687,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326688,'Vanguard_Eye','Vanguard Eye',7107,-148.905,-99.571,-23.720,123);
INSERT INTO `mob_spawn_points` VALUES (17326689,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326690,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326691,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326692,'Vanguard_Eye','Vanguard Eye',7107,-133.215,-99.483,-40.412,129);
INSERT INTO `mob_spawn_points` VALUES (17326693,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326694,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326695,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326696,'Vanguard_Eye','Vanguard Eye',7107,-127.683,-99.201,-60.268,24);
INSERT INTO `mob_spawn_points` VALUES (17326697,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326698,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326699,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326700,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326701,'Vanguard_Eye','Vanguard Eye',7107,-121.659,-99.485,-26.807,111);
INSERT INTO `mob_spawn_points` VALUES (17326702,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326703,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326704,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326705,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326706,'Vanguard_Eye','Vanguard Eye',7107,-69.808,-99.911,10.446,108);
INSERT INTO `mob_spawn_points` VALUES (17326707,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326708,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326709,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326710,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326711,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326712,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326713,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326714,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326715,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326716,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326717,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326718,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326719,'Hydra_Bard','Hydra Bard',7036,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326720,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326721,'Vanguard_Eye','Vanguard Eye',7107,-57.487,-99.127,38.534,83);
INSERT INTO `mob_spawn_points` VALUES (17326722,'Hydra_Monk','Hydra Monk',7041,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326723,'Hydra_Samurai','Hydra Samurai',7046,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326724,'Hydra_Summoner','Hydra Summoner',7047,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326725,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326726,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326727,'Vanguard_Eye','Vanguard Eye',7107,-245.636,-99.856,10.365,250);
INSERT INTO `mob_spawn_points` VALUES (17326728,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326729,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326730,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326731,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326732,'Vanguard_Eye','Vanguard Eye',7107,-246.362,-99.347,22.109,10);
INSERT INTO `mob_spawn_points` VALUES (17326733,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326734,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326735,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326736,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326737,'Vanguard_Eye','Vanguard Eye',7107,-246.525,-100.128,33.760,3);
INSERT INTO `mob_spawn_points` VALUES (17326738,'Hydra_Paladin','Hydra Paladin',7043,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326739,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326740,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326741,'Hydra_Thief','Hydra Thief',7051,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326742,'Vanguard_Eye','Rearguard Eye',7107,-277.825,-99.706,19.946,67);
INSERT INTO `mob_spawn_points` VALUES (17326743,'Hydra_Monk','Hydra Monk',7041,-294.085,-100,29.412,39);
INSERT INTO `mob_spawn_points` VALUES (17326744,'Hydra_Bard','Hydra Bard',7036,-294.085,-100,29.412,39);
INSERT INTO `mob_spawn_points` VALUES (17326745,'Hydra_Ranger','Hydra Ranger',7044,-294.085,-100,29.412,39);
INSERT INTO `mob_spawn_points` VALUES (17326746,'Hydra_Dragoon','Hydra Dragoon',7040,-294.085,-100,29.412,39);
INSERT INTO `mob_spawn_points` VALUES (17326747,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,39);
INSERT INTO `mob_spawn_points` VALUES (17326748,'Vanguard_Eye','Rearguard Eye',7107,-294.085,-100,29.412,39);
INSERT INTO `mob_spawn_points` VALUES (17326749,'Hydra_Dark_Knight','Hydra Dark Knight',7039,-307.423,-100,54,12);
INSERT INTO `mob_spawn_points` VALUES (17326750,'Hydra_Samurai','Hydra Samurai',7046,-307.423,-100,54,12);
INSERT INTO `mob_spawn_points` VALUES (17326751,'Hydra_Ninja','Hydra Ninja',7042,-307.423,-100,54,12);
INSERT INTO `mob_spawn_points` VALUES (17326752,'Hydra_Summoner','Hydra Summoner',7047,-307.423,-100,54,12);
INSERT INTO `mob_spawn_points` VALUES (17326753,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,12);
INSERT INTO `mob_spawn_points` VALUES (17326754,'Vanguard_Eye','Rearguard Eye',7107,-307.423,-100,54,12);
INSERT INTO `mob_spawn_points` VALUES (17326755,'Hydra_White_Mage','Hydra White Mage',7053,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326756,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326757,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326758,'Hydra_Beastmaster','Hydra Beastmaster',7037,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326759,'Hydras_Hound',"Hydra's Hound",7049,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326761,'Hydra_Black_Mage','Hydra Black Mage',7038,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326762,'Hydra_Dark_Knight','Hydra Dark Knight',7039,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326763,'Hydra_Ranger','Hydra Ranger',7044,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326764,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326765,'Vanguard_Eye','Rearguard Eye',7107,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326766,'Hydra_Warrior','Hydra Warrior',7052,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326767,'Hydra_Red_Mage','Hydra Red Mage',7045,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326768,'Hydra_Ninja','Hydra Ninja',7042,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326769,'Hydra_Dragoon','Hydra Dragoon',7040,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326770,'Hydras_Wyvern',"Hydra's Wyvern",7050,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17326771,'Vanguard_Eye','Rearguard Eye',7107,0.001,0.001,0.001,0);
INSERT INTO `mob_spawn_points` VALUES (17326772,'Hydra_Monk','Hydra Monk',7041,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326773,'Hydra_White_Mage','Hydra White Mage',7053,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326774,'Hydra_Black_Mage','Hydra Black Mage',7038,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326775,'Hydra_Summoner','Hydra Summoner',7047,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326776,'Hydras_Avatar',"Hydra's Avatar",7048,1,1,1,214);
INSERT INTO `mob_spawn_points` VALUES (17326777,'Hydra_Bard','Hydra Bard',7036,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326778,'Hydra_White_Mage','Hydra White Mage',7053,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326779,'Hydra_Thief','Hydra Thief',7051,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326780,'Hydra_Paladin','Hydra Paladin',7043,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326781,'Vanguard_Eye','Vanguard Eye',7107,-361.489,-100.029,75.448,214);
INSERT INTO `mob_spawn_points` VALUES (17326782,'Hydra_Warrior','Hydra Warrior',7052,-347.786,-100.577,95.177,129);
INSERT INTO `mob_spawn_points` VALUES (17326783,'Hydra_Beastmaster','Hydra Beastmaster',7037,-347.786,-100.577,95.177,129);
INSERT INTO `mob_spawn_points` VALUES (17326784,'Hydras_Hound',"Hydra's Hound",7049,-347.786,-100.577,95.177,129);
INSERT INTO `mob_spawn_points` VALUES (17326785,'Hydra_Monk','Hydra Monk',7041,-347.786,-100.577,95.177,129);
INSERT INTO `mob_spawn_points` VALUES (17326786,'Vanguard_Eye','Vanguard Eye',7107,-347.786,-100.577,95.177,129);
INSERT INTO `mob_spawn_points` VALUES (17326787,'Hydra_Black_Mage','Hydra Black Mage',7038,-339.5,-99.026,120.220,61);
INSERT INTO `mob_spawn_points` VALUES (17326788,'Hydra_Red_Mage','Hydra Red Mage',7045,-339.5,-99.026,120.220,61);
INSERT INTO `mob_spawn_points` VALUES (17326789,'Hydra_Dark_Knight','Hydra Dark Knight',7039,-339.5,-99.026,120.220,61);
INSERT INTO `mob_spawn_points` VALUES (17326790,'Vanguard_Eye','Vanguard Eye',7107,-339.5,-99.026,120.220,61);
INSERT INTO `mob_spawn_points` VALUES (17326830,'Avatar_Icon','',7003,-267.748,-39.630,-340.741,65);
INSERT INTO `mob_spawn_points` VALUES (17326831,'Goblin_Statue','',7027,-251.953,-40.009,-331.571,65);
INSERT INTO `mob_spawn_points` VALUES (17326832,'Serjeant_Tombstone','',7078,-282.405,-39.264,-335.404,65);
INSERT INTO `mob_spawn_points` VALUES (17326833,'Adamantking_Effigy','',7000,-235.322,-40.035,-322.380,65);
INSERT INTO `mob_spawn_points` VALUES (17326834,'Avatar_Icon','',7003,-278.758,-39.806,-312.101,65);
INSERT INTO `mob_spawn_points` VALUES (17326835,'Goblin_Statue','',7027,-269.419,-40.427,-288.963,65);
INSERT INTO `mob_spawn_points` VALUES (17326836,'Serjeant_Tombstone','',7078,-293.389,-41,-302.289,65);
INSERT INTO `mob_spawn_points` VALUES (17326837,'Adamantking_Effigy','',7000,-283.969,-40.003,-277.352,65);
INSERT INTO `mob_spawn_points` VALUES (17326838,'Avatar_Icon','',7003,-180.209,-39.773,-206.273,190);
INSERT INTO `mob_spawn_points` VALUES (17326839,'Avatar_Icon','',7003,-192.704,-39.787,-212.934,150);
INSERT INTO `mob_spawn_points` VALUES (17326840,'Avatar_Icon','',7003,-192.670,-39.789,-227.356,104);
INSERT INTO `mob_spawn_points` VALUES (17326841,'Avatar_Icon','',7003,-180.614,-39.763,-233.859,69);
INSERT INTO `mob_spawn_points` VALUES (17326842,'Avatar_Icon','',7003,-167.8,-39.783,-212.432,235);
INSERT INTO `mob_spawn_points` VALUES (17326843,'Avatar_Icon','',7003,-46.006,-39.961,-233.167,195);
INSERT INTO `mob_spawn_points` VALUES (17326844,'Avatar_Icon','',7003,-36.191,-39.011,-220.196,195);
INSERT INTO `mob_spawn_points` VALUES (17326845,'Avatar_Icon','',7003,-19.716,-41.035,-216.491,195);
INSERT INTO `mob_spawn_points` VALUES (17326846,'Avatar_Icon','',7003,-2.550,-40.167,-209.283,130);
INSERT INTO `mob_spawn_points` VALUES (17326847,'Avatar_Icon','',7003,-30.417,-40.204,-238.810,195);
INSERT INTO `mob_spawn_points` VALUES (17326848,'Avatar_Icon','',7003,-30.709,-39.221,-249.811,195);
INSERT INTO `mob_spawn_points` VALUES (17326849,'Avatar_Icon','',7003,-81.290,-40,-259.308,255);
INSERT INTO `mob_spawn_points` VALUES (17326850,'Avatar_Icon','',7003,118.902,-40,-2.955,185);
INSERT INTO `mob_spawn_points` VALUES (17326851,'Avatar_Icon','',7003,86.821,-39.833,4.560,185);
INSERT INTO `mob_spawn_points` VALUES (17326852,'Avatar_Icon','',7003,78.939,-40.052,-5.018,185);
INSERT INTO `mob_spawn_points` VALUES (17326853,'Avatar_Icon','',7003,68.337,-40,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326854,'Avatar_Icon','',7003,55.512,-39.253,39.759,65);
INSERT INTO `mob_spawn_points` VALUES (17326855,'Avatar_Icon','',7003,48.337,-39.119,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326856,'Avatar_Icon','',7003,55.512,-39.363,60.929,65);
INSERT INTO `mob_spawn_points` VALUES (17326857,'Avatar_Icon','',7003,68.337,-39.363,60.929,65);
INSERT INTO `mob_spawn_points` VALUES (17326858,'Avatar_Icon','',7003,78.337,-39.435,52.062,65);
INSERT INTO `mob_spawn_points` VALUES (17326859,'Avatar_Icon','',7003,68.337,-39.618,39.759,65);
INSERT INTO `mob_spawn_points` VALUES (17326860,'Goblin_Statue','',7027,-128.857,-59.556,-179.772,233);
INSERT INTO `mob_spawn_points` VALUES (17326861,'Goblin_Statue','',7027,-131.463,-60.110,-187.426,244);
INSERT INTO `mob_spawn_points` VALUES (17326862,'Goblin_Statue','',7027,-135.975,-59.717,-179.952,227);
INSERT INTO `mob_spawn_points` VALUES (17326863,'Goblin_Statue','',7027,-43.07,-59.110,-97.816,121);
INSERT INTO `mob_spawn_points` VALUES (17326864,'Goblin_Statue','',7027,-41.103,-60,-118.675,134);
INSERT INTO `mob_spawn_points` VALUES (17326865,'Goblin_Statue','',7027,-40.057,-59.061,-138.804,114);
INSERT INTO `mob_spawn_points` VALUES (17326866,'Goblin_Statue','',7027,-31.103,-59.756,-117.376,135);
INSERT INTO `mob_spawn_points` VALUES (17326867,'Goblin_Statue','',7027,-16.349,-60.234,-131.986,120);
INSERT INTO `mob_spawn_points` VALUES (17326868,'Goblin_Statue','',7027,3.710,-59.968,44.651,65);
INSERT INTO `mob_spawn_points` VALUES (17326869,'Goblin_Statue','',7027,8.932,-59.282,57.038,64);
INSERT INTO `mob_spawn_points` VALUES (17326870,'Goblin_Statue','',7027,-4.165,-59.660,68.984,53);
INSERT INTO `mob_spawn_points` VALUES (17326871,'Goblin_Statue','',7027,43.071,-59.468,146.630,79);
INSERT INTO `mob_spawn_points` VALUES (17326872,'Goblin_Statue','',7027,37.6,-60,160.974,70);
INSERT INTO `mob_spawn_points` VALUES (17326873,'Goblin_Statue','',7027,44.342,-59.984,197.576,80);
INSERT INTO `mob_spawn_points` VALUES (17326874,'Goblin_Statue','',7027,62.538,-60.249,187.338,90);
INSERT INTO `mob_spawn_points` VALUES (17326875,'Goblin_Statue','',7027,94.968,-59.307,200.551,99);
INSERT INTO `mob_spawn_points` VALUES (17326876,'Goblin_Statue','',7027,56.123,-61.229,-58.851,94);
INSERT INTO `mob_spawn_points` VALUES (17326877,'Goblin_Statue','',7027,44.526,-59.975,-75.971,99);
INSERT INTO `mob_spawn_points` VALUES (17326878,'Goblin_Statue','',7027,41.223,-59.01,-60.183,94);
INSERT INTO `mob_spawn_points` VALUES (17326879,'Goblin_Statue','',7027,42.582,-59.890,-46.223,90);
INSERT INTO `mob_spawn_points` VALUES (17326880,'Goblin_Statue','',7027,56.642,-59.565,-32.128,84);
INSERT INTO `mob_spawn_points` VALUES (17326881,'Goblin_Statue','',7027,106.820,-59.486,-39.087,94);
INSERT INTO `mob_spawn_points` VALUES (17326882,'Goblin_Statue','',7027,100.578,-60.708,-58.551,95);
INSERT INTO `mob_spawn_points` VALUES (17326883,'Adamantking_Effigy','',7000,160.404,-19.549,27.451,72);
INSERT INTO `mob_spawn_points` VALUES (17326884,'Adamantking_Effigy','',7000,174.087,-19.417,27.687,63);
INSERT INTO `mob_spawn_points` VALUES (17326885,'Adamantking_Effigy','',7000,165.510,-19.926,43.599,138);
INSERT INTO `mob_spawn_points` VALUES (17326886,'Adamantking_Effigy','',7000,175.960,-19.963,16.757,154);
INSERT INTO `mob_spawn_points` VALUES (17326887,'Adamantking_Effigy','',7000,65.413,-19.346,-199.106,182);
INSERT INTO `mob_spawn_points` VALUES (17326888,'Adamantking_Effigy','',7000,67.195,-19.759,-206.310,65);
INSERT INTO `mob_spawn_points` VALUES (17326889,'Adamantking_Effigy','',7000,66.923,-19.655,-218.081,198);
INSERT INTO `mob_spawn_points` VALUES (17326890,'Adamantking_Effigy','',7000,58.678,-19.263,-233.499,78);
INSERT INTO `mob_spawn_points` VALUES (17326891,'Adamantking_Effigy','',7000,69.8,-19.659,-249.635,245);
INSERT INTO `mob_spawn_points` VALUES (17326892,'Adamantking_Effigy','',7000,123.343,-20,-201.344,241);
INSERT INTO `mob_spawn_points` VALUES (17326893,'Adamantking_Effigy','',7000,-32.936,-19.848,-279.634,61);
INSERT INTO `mob_spawn_points` VALUES (17326894,'Adamantking_Effigy','',7000,-46.876,-19.857,-280.782,51);
INSERT INTO `mob_spawn_points` VALUES (17326895,'Adamantking_Effigy','',7000,-79.436,-20.113,-273.770,118);
INSERT INTO `mob_spawn_points` VALUES (17326896,'Adamantking_Effigy','',7000,-72.512,-19.634,-298.678,193);
INSERT INTO `mob_spawn_points` VALUES (17326897,'Adamantking_Effigy','',7000,252.963,-20.784,-140.905,17);
INSERT INTO `mob_spawn_points` VALUES (17326898,'Adamantking_Effigy','',7000,239.248,-20,-118.750,179);
INSERT INTO `mob_spawn_points` VALUES (17326899,'Adamantking_Effigy','',7000,231.531,-20,-127.776,81);
INSERT INTO `mob_spawn_points` VALUES (17326900,'Adamantking_Effigy','',7000,228.722,-20.084,-134.699,79);
INSERT INTO `mob_spawn_points` VALUES (17326901,'Adamantking_Effigy','',7000,228.681,-20.421,-156.130,183);
INSERT INTO `mob_spawn_points` VALUES (17326902,'Adamantking_Effigy','',7000,240.397,-20,-167.888,2);
INSERT INTO `mob_spawn_points` VALUES (17326903,'Adamantking_Effigy','',7000,251.691,-20.672,-138.353,207);
INSERT INTO `mob_spawn_points` VALUES (17326904,'Adamantking_Effigy','',7000,287.398,-20,-123.672,12);
INSERT INTO `mob_spawn_points` VALUES (17326905,'Adamantking_Effigy','',7000,262.424,-19.233,-114.368,251);
INSERT INTO `mob_spawn_points` VALUES (17326906,'Serjeant_Tombstone','',7078,-13.519,0.001,-332.657,212);
INSERT INTO `mob_spawn_points` VALUES (17326907,'Serjeant_Tombstone','',7078,-23.504,0.001,-312.3,229);
INSERT INTO `mob_spawn_points` VALUES (17326908,'Serjeant_Tombstone','',7078,-49.369,0.001,-303.104,48);
INSERT INTO `mob_spawn_points` VALUES (17326909,'Serjeant_Tombstone','',7078,-57.942,0.143,-322.988,71);
INSERT INTO `mob_spawn_points` VALUES (17326910,'Serjeant_Tombstone','',7078,-66.692,0.001,-344.814,39);
INSERT INTO `mob_spawn_points` VALUES (17326911,'Serjeant_Tombstone','',7078,-96.830,0.840,-400.133,24);
INSERT INTO `mob_spawn_points` VALUES (17326912,'Serjeant_Tombstone','',7078,-112.136,0.192,-396.596,203);
INSERT INTO `mob_spawn_points` VALUES (17326913,'Serjeant_Tombstone','',7078,-119.632,0.818,-383.615,109);
INSERT INTO `mob_spawn_points` VALUES (17326914,'Serjeant_Tombstone','',7078,388.130,0.383,2.175,94);
INSERT INTO `mob_spawn_points` VALUES (17326915,'Serjeant_Tombstone','',7078,391.617,0.001,10.540,152);
INSERT INTO `mob_spawn_points` VALUES (17326916,'Serjeant_Tombstone','',7078,388.575,0.4,18.444,192);
INSERT INTO `mob_spawn_points` VALUES (17326917,'Serjeant_Tombstone','',7078,393.606,0.228,27.242,211);
INSERT INTO `mob_spawn_points` VALUES (17326918,'Serjeant_Tombstone','',7078,395.501,0.024,42.672,73);
INSERT INTO `mob_spawn_points` VALUES (17326919,'Serjeant_Tombstone','',7078,377.925,0.327,-171.507,96);
INSERT INTO `mob_spawn_points` VALUES (17326920,'Serjeant_Tombstone','',7078,365.053,0.101,-206.342,139);
INSERT INTO `mob_spawn_points` VALUES (17326921,'Serjeant_Tombstone','',7078,373.676,0.563,-200.479,232);
INSERT INTO `mob_spawn_points` VALUES (17326922,'Serjeant_Tombstone','',7078,385.529,0.534,-193.834,236);
INSERT INTO `mob_spawn_points` VALUES (17326923,'Serjeant_Tombstone','',7078,396.266,0.430,-187.652,241);
INSERT INTO `mob_spawn_points` VALUES (17326924,'Serjeant_Tombstone','',7078,393.836,0.103,-156.067,220);
INSERT INTO `mob_spawn_points` VALUES (17326925,'Serjeant_Tombstone','',7078,381.179,0.813,-152.528,137);
INSERT INTO `mob_spawn_points` VALUES (17326926,'Serjeant_Tombstone','',7078,366.147,0.411,-151.774,132);
INSERT INTO `mob_spawn_points` VALUES (17326927,'Serjeant_Tombstone','',7078,350.179,0.6,-149.998,132);
INSERT INTO `mob_spawn_points` VALUES (17326928,'Adamantking_Effigy','',7003,245,0.008,75.634,248);
INSERT INTO `mob_spawn_points` VALUES (17326929,'Goblin_Statue','',7027,240.555,0.280,89.614,224);
INSERT INTO `mob_spawn_points` VALUES (17326930,'Serjeant_Tombstone','',7000,231.395,0.292,105.041,187);
INSERT INTO `mob_spawn_points` VALUES (17326931,'Avatar_Icon','',7078,220.263,0.986,120.972,132);
INSERT INTO `mob_spawn_points` VALUES (17326932,'Adamantking_Effigy','',7003,251.607,0.379,240.670,69);
INSERT INTO `mob_spawn_points` VALUES (17326933,'Goblin_Statue','',7027,274.079,0.095,239.793,136);
INSERT INTO `mob_spawn_points` VALUES (17326934,'Serjeant_Tombstone','',7000,282.762,0.734,224.614,42);
INSERT INTO `mob_spawn_points` VALUES (17326935,'Avatar_Icon','',7078,287.338,0.106,210.410,150);

-- Glacier Groups
INSERT INTO mob_groups VALUES (164,43,134,'Adamantking_Effigy',0,128,842,1000,1000,77,79,0);
INSERT INTO mob_groups VALUES (1,141,134,'Angra_Mainyu',0,128,0,12500,12500,90,92,0);
INSERT INTO mob_groups VALUES (2,257,134,'Ascetox_Ratgums',0,128,187,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (3,294,134,'Avatar_Icon',0,128,2191,1000,1000,77,79,0);
INSERT INTO mob_groups VALUES (4,401,134,'Be_Zhe_Keeprazer',0,128,280,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (5,408,134,'Bhuu_Wjato_the_Firepool',0,128,284,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (6,508,134,'Bordox_Kittyback',0,128,375,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (7,529,134,'Brewnix_Bittypupils',0,128,395,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (8,594,134,'Caa_Xaza_the_Madpiercer',0,128,441,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (9,755,134,'Cobraclaw_Buchzvotch',0,128,553,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (10,892,134,'Dagourmarche',0,128,559,0,0,90,92,0);
INSERT INTO mob_groups VALUES (11,893,134,'Dagourmarche_s',0,128,0,0,0,90,92,0);
INSERT INTO mob_groups VALUES (12,934,134,'Deathcaller_Bidfbid',0,128,655,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (13,1021,134,'De_Bho_Pyrohand',0,128,726,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (14,1107,134,'Drakefeast_Wubmfub',0,128,789,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (15,1109,134,'Draklix_Scalecrust',0,128,791,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (16,1125,134,'Droprix_Granitepalms',0,128,804,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (17,1152,134,'Dynamis_Effigy',0,128,822,1000,1000,90,92,0);
INSERT INTO mob_groups VALUES (18,1153,134,'Dynamis_Icon',0,128,823,1000,1000,90,92,0);
INSERT INTO mob_groups VALUES (19,1155,134,'Dynamis_Statue',0,128,825,1000,1000,90,92,0);
INSERT INTO mob_groups VALUES (20,1156,134,'Dynamis_Tombstone',0,128,4073,1000,1000,90,92,0);
INSERT INTO mob_groups VALUES (21,1204,134,'Elvaanlopper_Grokdok',0,128,859,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (22,1344,134,'Fire_Pukis',0,128,0,10000,0,90,92,0);
INSERT INTO mob_groups VALUES (23,1399,134,'Foo_Peku_the_Bloodcloak',0,128,1025,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (24,1453,134,'Galkarider_Retzpratz',0,128,1071,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (25,1484,134,'Ga_Fho_Venomtouch',0,128,1095,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (26,1542,134,'Gibberox_Pimplebeak',0,128,1138,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (27,1716,134,'Goblin_Statue',0,128,1434,1000,1000,77,79,0);
INSERT INTO mob_groups VALUES (28,1774,134,'Goublefaupe',0,128,1211,0,0,90,92,0);
INSERT INTO mob_groups VALUES (29,1784,134,'Go_Tyo_Magenapper',0,128,1538,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (30,1853,134,'Guu_Waji_the_Preacher',0,128,1610,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (31,1857,134,'Gu_Khu_Dukesniper',0,128,1611,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (32,1858,134,'Gu_Nha_Wallstormer',0,128,1612,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (33,1909,134,'Wulgaru',0,128,1646,0,0,90,92,0);
INSERT INTO mob_groups VALUES (34,1914,134,'Hee_Mida_the_Meticulous',0,128,1650,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (35,2005,134,'Humegutter_Adzjbadj',0,128,1714,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (36,2019,134,'Hydra_Bard',0,128,1723,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (37,2020,134,'Hydra_Beastmaster',0,128,1725,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (38,2021,134,'Hydra_Black_Mage',0,128,1727,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (39,2022,134,'Hydra_Dark_Knight',0,128,1729,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (40,2023,134,'Hydra_Dragoon',0,128,1731,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (41,2024,134,'Hydra_Monk',0,128,1733,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (42,2025,134,'Hydra_Ninja',0,128,1735,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (43,2026,134,'Hydra_Paladin',0,128,1737,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (44,2027,134,'Hydra_Ranger',0,128,1739,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (45,2028,134,'Hydra_Red_Mage',0,128,1741,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (46,2029,134,'Hydra_Samurai',0,128,1743,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (47,2030,134,'Hydra_Summoner',0,128,1745,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (48,2031,134,'Hydras_Avatar',0,128,0,3300,1000,92,94,0);
INSERT INTO mob_groups VALUES (49,2032,134,'Hydras_Hound',0,128,0,3300,0,92,94,0);
INSERT INTO mob_groups VALUES (50,2033,134,'Hydras_Wyvern',0,128,0,3300,1000,92,94,0);
INSERT INTO mob_groups VALUES (51,2034,134,'Hydra_Thief',0,128,1747,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (52,2035,134,'Hydra_Warrior',0,128,1749,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (53,2036,134,'Hydra_White_Mage',0,128,1751,5500,0,92,94,0);
INSERT INTO mob_groups VALUES (54,2148,134,'Jeunoraider_Gepkzip',0,128,1846,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (55,2151,134,'Ji_Fhu_Infiltrator',0,128,1847,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (56,2153,134,'Ji_Khu_Towercleaver',0,128,1848,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (57,2273,134,'Knii_Hoqo_the_Bisector',0,128,1948,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (58,2281,134,'Koo_Saxu_the_Everfast',0,128,1953,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (59,2303,134,'Kuu_Xuka_the_Nimble',0,128,1973,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (60,2429,134,'Lockbuster_Zapdjipp',0,128,2073,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (61,2466,134,'Maa_Zaua_the_Wyrmkeeper',0,128,2109,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (62,2660,134,'Mildaunegeux',0,128,1672,0,0,90,92,0);
INSERT INTO mob_groups VALUES (63,2681,134,'Mithraslaver_Debhabob',0,128,2305,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (64,2683,134,'Mi_Rhe_Whisperblade',0,128,2306,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (65,2728,134,'Moltenox_Stubthumbs',0,128,2334,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (66,2740,134,'Morblox_Chubbychin',0,128,2347,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (67,2778,134,'Mu_Gha_Legionkiller',0,128,2399,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (68,2814,134,'Na_Hya_Floodmaker',0,128,2419,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (69,2818,134,'Nee_Huxa_the_Judgmental',0,128,2420,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (70,2928,134,'Nu_Bhi_Spiraleye',0,128,2495,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (71,3122,134,'Petro_Pukis',0,128,0,10000,0,90,92,0);
INSERT INTO mob_groups VALUES (72,3167,134,'Poison_Pukis',0,128,0,10000,0,90,92,0);
INSERT INTO mob_groups VALUES (73,3238,134,'Puu_Timu_the_Phantasmal',0,128,2881,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (74,3289,134,'Quiebitiel',0,128,2066,0,0,90,92,0);
INSERT INTO mob_groups VALUES (75,3399,134,'Routsix_Rubbertendon',0,128,3007,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (76,3412,134,'Ruffbix_Jumbolobes',0,128,3012,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (77,3423,134,'Ryy_Qihi_the_Idolrobber',0,128,3021,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (78,3548,134,'Serjeant_Tombstone',0,128,4073,1000,1000,77,79,0);
INSERT INTO mob_groups VALUES (79,3606,134,'Shisox_Widebrow',0,128,3187,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (80,3650,134,'Skinmask_Ugghfogg',0,128,3227,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (81,3671,134,'Slinkix_Trufflesniff',0,128,3236,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (82,3702,134,'Soo_Jopo_the_Fiendking',0,128,3278,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (83,3715,134,'So_Gho_Adderhandler',0,128,3290,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (84,3717,134,'So_Zho_Metalbender',0,128,3291,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (85,3729,134,'Spinalsucker_Galflmall',0,128,3302,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (86,3829,134,'Swypestix_Tigershins',0,128,3419,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (87,3849,134,'Taruroaster_Biggsjig',0,128,3435,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (88,3857,134,'Ta_Hyu_Gallanthunter',0,128,3442,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (89,3940,134,'Tocktix_Thinlids',0,128,3531,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (90,4084,134,'Ultrasonic_Zeknajak',0,128,3649,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (91,4133,134,'Vanguard_Alchemist',0,128,3690,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (92,4134,134,'Vanguard_Ambusher',0,128,3695,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (93,4135,134,'Vanguard_Amputator',0,128,3700,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (94,4136,134,'Vanguard_Armorer',0,128,3705,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (95,4137,134,'Vanguard_Assassin',0,128,3710,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (96,4138,134,'Vanguard_Backstabber',0,128,3715,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (97,4139,134,'Vanguard_Beasttender',0,128,3720,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (98,4140,134,'Vanguard_Bugler',0,128,3725,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (99,4141,134,'Vanguard_Chanter',0,128,3730,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (100,4142,134,'Vanguard_Constable',0,128,3735,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (101,4143,134,'Vanguard_Defender',0,128,3740,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (102,4144,134,'Vanguard_Dollmaster',0,128,3745,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (103,4145,134,'Vanguard_Dragon',0,128,0,17000,0,90,92,0);
INSERT INTO mob_groups VALUES (104,4146,134,'Vanguard_Drakekeeper',0,128,3751,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (105,4147,134,'Vanguard_Enchanter',0,128,3756,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (106,4148,134,'Vanguard_Exemplar',0,128,3761,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (107,4149,134,'Vanguard_Eye',0,128,3765,2000,2000,90,92,0);
INSERT INTO mob_groups VALUES (108,4150,134,'Vanguard_Footsoldier',0,128,3769,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (109,4151,134,'Vanguard_Grappler',0,128,3774,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (110,4152,134,'Vanguard_Gutslasher',0,128,3779,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (111,4153,134,'Vanguard_Hatamoto',0,128,3784,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (112,4154,134,'Vanguard_Hawker',0,128,3789,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (113,4155,134,'Vanguard_Hitman',0,128,3794,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (114,4156,134,'Vanguard_Impaler',0,128,3799,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (115,4157,134,'Vanguard_Inciter',0,128,3804,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (116,4158,134,'Vanguard_Kusa',0,128,3809,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (117,4159,134,'Vanguard_Liberator',0,128,3814,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (118,4160,134,'Vanguard_Maestro',0,128,3819,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (119,4161,134,'Vanguard_Mason',0,128,3824,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (120,4162,134,'Vanguard_Mesmerizer',0,128,3829,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (121,4163,134,'Vanguard_Militant',0,128,3834,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (122,4164,134,'Vanguard_Minstrel',0,128,3839,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (123,4165,134,'Vanguard_Neckchopper',0,128,3844,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (124,4166,134,'Vanguard_Necromancer',0,128,3849,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (125,4167,134,'Vanguard_Ogresoother',0,128,3854,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (126,4168,134,'Vanguard_Oracle',0,128,3859,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (127,4169,134,'Vanguard_Partisan',0,128,3864,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (128,4170,134,'Vanguard_Pathfinder',0,128,3869,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (129,4171,134,'Vanguard_Persecutor',0,128,3874,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (130,4172,134,'Vanguard_Pillager',0,128,3879,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (131,4173,134,'Vanguard_Pitfighter',0,128,3884,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (132,4174,134,'Vanguard_Predator',0,128,3889,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (133,4175,134,'Vanguard_Prelate',0,128,3894,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (134,4176,134,'Vanguard_Priest',0,128,3899,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (135,4177,134,'Vanguard_Protector',0,128,3904,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (136,4178,134,'Vanguard_Purloiner',0,128,3909,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (137,4179,134,'Vanguard_Ronin',0,128,3914,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (138,4180,134,'Vanguard_Salvager',0,128,3919,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (139,4181,134,'Vanguard_Sentinel',0,128,3924,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (140,4182,134,'Vanguard_Shaman',0,128,3929,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (141,4183,134,'Vanguard_Skirmisher',0,128,3934,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (142,4184,134,'Vanguard_Smithy',0,128,3939,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (143,4185,134,'Vanguards_Avatar',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (144,4186,134,'Vanguards_Crow',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (145,4187,134,'Vanguards_Hecteyes',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (146,4188,134,'Vanguards_Scorpion',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (147,4189,134,'Vanguards_Slime',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (148,4190,134,'Vanguards_Wyvern',0,128,0,2400,0,90,92,0);
INSERT INTO mob_groups VALUES (149,4191,134,'Vanguard_Thaumaturge',0,128,3944,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (150,4192,134,'Vanguard_Tinkerer',0,128,3949,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (151,4193,134,'Vanguard_Trooper',0,128,3954,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (152,4194,134,'Vanguard_Undertaker',0,128,3959,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (153,4195,134,'Vanguard_Vexer',0,128,3964,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (154,4196,134,'Vanguard_Vigilante',0,128,3969,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (155,4197,134,'Vanguard_Vindicator',0,128,3974,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (156,4198,134,'Vanguard_Visionary',0,128,3979,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (157,4199,134,'Vanguard_Welldigger',0,128,3984,4000,0,90,92,0);
INSERT INTO mob_groups VALUES (158,4219,134,'Velosareon',0,128,4003,0,0,90,92,0);
INSERT INTO mob_groups VALUES (159,4330,134,'Whistrix_Toadthroat',0,128,4140,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (160,4351,134,'Wind_Pukis',0,128,0,10000,0,90,92,0);
INSERT INTO mob_groups VALUES (161,4380,134,'Wraithdancer_Gidbnod',0,128,4193,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (162,4391,134,'Xaa_Chau_the_Roctalon',0,128,4201,8000,0,90,92,0);
INSERT INTO mob_groups VALUES (163,4394,134,'Xhoo_Fuza_the_Sublime',0,128,4203,8000,0,90,92,0);

-- make sure avatar icons spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=134 and (name='Goblin_Statue' or name='Avatar_Icon' or name='Serjeant_Tombstone' or name='Vanguard_Eye');

-- make it so tombstones respawn
UPDATE mob_groups SET respawntime=3600 WHERE zoneid=134 and (name='Goblin_Statue' or name='Avatar_Icon' or name='Serjeant_Tombstone' or name='Vanguard_Eye');

-- No roam or links
UPDATE mob_pools SET roamflag=256, links=0 WHERE poolid=4149;

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=134 and mobid>=17326081 and mobid<=17326935;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=134);
-- Should be redundant...... but the above one isn't working
DELETE FROM mob_droplist WHERE dropId=1144; -- Stone Drops
DELETE FROM mob_droplist WHERE dropId=2557; -- Basty Mob Drops
DELETE FROM mob_droplist WHERE dropId=3114;
DELETE FROM mob_droplist WHERE dropId=2547; -- Sandy Mob Drops
DELETE FROM mob_droplist WHERE dropId=3118;
DELETE FROM mob_droplist WHERE dropId=2552; -- Windy Mob Drops
DELETE FROM mob_droplist WHERE dropId=3120;
DELETE FROM mob_droplist WHERE dropId=1343; -- Hydra Drops
DELETE FROM mob_droplist WHERE dropId=2561;
DELETE FROM mob_droplist WHERE dropId=2542; -- Goblin Drops
DELETE FROM mob_droplist WHERE dropid=3116;

-- Fix Mildaunequex droppool
INSERT INTO mob_droplist VALUES (1672, 0, 0, 1000, 1570, 330); -- Attestation of Accuracy
INSERT INTO mob_droplist VALUES (1672, 0, 0, 1000, 1564, 330); -- Attestation of Legerity
INSERT INTO mob_droplist VALUES (1672, 0, 0, 1000, 1556, 330); -- Attestation of Might

-- Updated Attestation DropIds directly in groups

-- Bastok Dorps
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1455, 1000); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1455, 500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1455, 250); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1455, 125); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1469, 10); -- chunk_of_wootz_ore
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2557, 0, 0, 1000, 1521, 10); -- vial_of_slime_juice
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 11292, 50); -- mirage_jubbah
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 11295, 50); -- commodore_frac
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 11298, 50); -- pantin_tobe
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 11307, 50); -- argute_gown
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15088, 50); -- melee_cyclas
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15089, 50); -- clerics_briault
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15090, 50); -- sorcerers_coat
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15091, 50); -- duelists_tabard
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15094, 50); -- abyss_cuirass
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15096, 50); -- bards_justaucorps
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15098, 50); -- saotome_domaru
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15099, 50); -- koga_chainmail
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15100, 50); -- wyrm_mail
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15101, 50); -- summoners_doublet
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15117, 50); -- warriors_cuisses
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15122, 50); -- assassins_culottes
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15123, 50); -- valor_breeches
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15140, 50); -- monster_gaiters
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 15142, 50); -- scouts_socks
INSERT INTO mob_droplist VALUES (2557, 1, 1, 1, 16360, 50); -- etoile_tights
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Vindicator' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Protector' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Beasttender' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Minstrel' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='GuNha_Wallstormer' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Militant' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Drakekeeper' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='NaHya_Floodmaker' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Constable' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Defender' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Hatamoto' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Kusa' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Purloiner' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Mason' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Undertaker' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='JiFhu_Infiltrator' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Vigilante' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='GaFho_Venomtouch' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='TaHyu_Gallanthunter' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='NuBhi_Spiraleye' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='Vanguard_Thaumaturge' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='DeBho_Pyrohand' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='GoTyo_Magenapper' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='SoZho_Metalbender' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='MuGha_Legionkiller' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='SoGho_Adderhandler' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='GuKhu_Dukesniper' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='JiKhu_Towercleaver' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='MiRhe_Whisperblade' and zoneId=134;
UPDATE mob_groups SET dropId=2557 WHERE name='BeZhe_Keeprazer' and zoneId=134;

-- Bastok Stone
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1455, 1000); -- one_byne_bill
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1455, 100); -- one_byne_bill
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (3114, 0, 0, 1000, 1474, 100); -- infinity_core
UPDATE mob_groups SET dropId=3114 WHERE name='Adamantking_Effigy' and zoneId=134;

-- Sandy Dorps
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1452, 1000); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1452, 500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1452, 250); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1452, 125); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1516, 10); -- griffon_hide
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1517, 10); -- giant_frozen_head
INSERT INTO mob_droplist VALUES (2547, 0, 0, 1000, 1519, 10); -- fresh_orc_liver
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 11292, 50); -- mirage_jubbah
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 11295, 50); -- commodore_frac
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 11298, 50); -- pantin_tobe
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 11307, 50); -- argute_gown
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15088, 50); -- melee_cyclas
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15089, 50); -- clerics_briault
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15090, 50); -- sorcerers_coat
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15091, 50); -- duelists_tabard
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15094, 50); -- abyss_cuirass
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15096, 50); -- bards_justaucorps
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15098, 50); -- saotome_domaru
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15099, 50); -- koga_chainmail
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15100, 50); -- wyrm_mail
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15101, 50); -- summoners_doublet
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15117, 50); -- warriors_cuisses
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15122, 50); -- assassins_culottes
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15123, 50); -- valor_breeches
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15140, 50); -- monster_gaiters
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 15142, 50); -- scouts_socks
INSERT INTO mob_droplist VALUES (2547, 1, 1, 1, 16360, 50); -- etoile_tights
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Trooper' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Neckchopper' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Footsoldier' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Humegutter_Adzjbadj' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Vexer' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Backstabber' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Jeunoraider_Gepkzip' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Grappler' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Cobraclaw_Buchzvotch' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Gutslasher' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Amputator' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Wraithdancer_Gidbnod' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Impaler' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Predator' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Galkarider_Retzpratz' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Dollmaster' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Deathcaller_Bidfbid' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Spinalsucker_Galflmall' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Mesmerizer' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Hawker' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Pillager' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Lockbuster_Zapdjipp' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Heavymail_Djidzbad' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Vanguard_Bugler' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Elvaanlopper_Grokdok' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Skinmask_Ugghfogg' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Taruroaster_Biggsjig' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Mithraslaver_Debhabob' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Ultrasonic_Zeknajak' and zoneId=134;
UPDATE mob_groups SET dropId=2547 WHERE name='Drakefeast_Wubmfub' and zoneId=134;

-- Sandy Stone
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1452, 1000); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1452, 100); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (3118, 0, 0, 1000, 1474, 100); -- infinity_core
UPDATE mob_groups SET dropId=3114 WHERE name='Serjeant_Tombstone' and zoneId=134;

-- Windy Dorps
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1449, 1000); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1449, 500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1449, 250); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1449, 125); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1464, 10); -- lancewood_log
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1466, 10); -- pile_of_relic_iron
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2552, 0, 0, 1000, 1518, 10); -- colossal_skull
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 11292, 50); -- mirage_jubbah
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 11295, 50); -- commodore_frac
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 11298, 50); -- pantin_tobe
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 11307, 50); -- argute_gown
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15088, 50); -- melee_cyclas
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15089, 50); -- clerics_briault
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15090, 50); -- sorcerers_coat
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15091, 50); -- duelists_tabard
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15094, 50); -- abyss_cuirass
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15096, 50); -- bards_justaucorps
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15098, 50); -- saotome_domaru
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15099, 50); -- koga_chainmail
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15100, 50); -- wyrm_mail
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15101, 50); -- summoners_doublet
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15117, 50); -- warriors_cuisses
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15122, 50); -- assassins_culottes
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15123, 50); -- valor_breeches
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15140, 50); -- monster_gaiters
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 15142, 50); -- scouts_socks
INSERT INTO mob_droplist VALUES (2552, 1, 1, 1, 16360, 50); -- etoile_tights
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Sentinel' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Assassin' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Skirmisher' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Foo_Peku_the_Bloodcloak' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Visionary' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Liberator' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Xaa_Chau_the_Roctalon' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Exemplar' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Ogresoother' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Priest' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Koo_Saxu_the_Everfast' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Inciter' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Chanter' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Prelate' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Bhuu_Wjato_the_Firepool' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Caa_Xaza_the_Madpiercer' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Partisan' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Maa_Zaua_the_Wyrmkeeper' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Ryy_Qihi_the_Idolrobber' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Salvager' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Oracle' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Guu_Waji_the_Preacher' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Nee_Huxa_the_Judgmental' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Kuu_Xuka_the_Nimble' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Soo_Jopo_the_Fiendking' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Vanguard_Persecutor' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Xhoo_Fuza_the_Sublime' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Hee_Mida_the_Meticulous' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Knii_Hoqo_the_Bisector' and zoneId=134;
UPDATE mob_groups SET dropId=2552 WHERE name='Puu_Timu_the_Phantasmal' and zoneId=134;

-- Windy Stone
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1449, 1000); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1449, 100); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (3120, 0, 0, 1000, 1474, 100); -- infinity_core
UPDATE mob_groups SET dropId=3120 WHERE name='Avatar_Icon' and zoneId=134;

-- Hydra Dorps
INSERT INTO mob_droplist VALUES (4800,0,0,1000,15871,90); -- Warrior's Stone
INSERT INTO mob_droplist VALUES (4801,0,0,1000,15478,90); -- Melee Cape
INSERT INTO mob_droplist VALUES (4802,0,0,1000,15872,90); -- Cleric's Belt
INSERT INTO mob_droplist VALUES (4803,0,0,1000,15874,90); -- Sorcerer's belt
INSERT INTO mob_droplist VALUES (4804,0,0,1000,15873,90); -- Duelist's Belt
INSERT INTO mob_droplist VALUES (4805,0,0,1000,15480,90); -- Assassin's Cape

INSERT INTO mob_droplist VALUES (4806,0,0,1000,15481,90); -- Valor Cape
INSERT INTO mob_droplist VALUES (4807,0,0,1000,15479,90); -- Abyss Cape
INSERT INTO mob_droplist VALUES (4808,0,0,1000,15875,90); -- Monster Belt
INSERT INTO mob_droplist VALUES (4809,0,0,1000,15482,90); -- Bard's Cape
INSERT INTO mob_droplist VALUES (4810,0,0,1000,15876,90); -- Scout's Belt
INSERT INTO mob_droplist VALUES (4811,0,0,1000,15879,90); -- Saotome Koshi-Ate
INSERT INTO mob_droplist VALUES (4812,0,0,1000,15877,90); -- Koga Sarashi
INSERT INTO mob_droplist VALUES (4813,0,0,1000,15878,90); -- Wyrm Belt
INSERT INTO mob_droplist VALUES (4814,0,0,1000,15484,90); -- Summoner's Cape

-- new age jobs
INSERT INTO mob_droplist VALUES (4809,0,0,1000,16244,90); -- Mirage Mantle
INSERT INTO mob_droplist VALUES (4810,0,0,1000,15920,90); -- Commodore Belt
INSERT INTO mob_droplist VALUES (4808,0,0,1000,16245,90); -- Pantin Cape
INSERT INTO mob_droplist VALUES (4805,0,0,1000,16248,90); -- Etoile Cape
INSERT INTO mob_droplist VALUES (4804,0,0,1000,15925,90); -- Argute Belt

UPDATE mob_groups SET dropId=4800 WHERE name='Hydra_Warrior' and zoneId=134;
UPDATE mob_groups SET dropId=4801 WHERE name='Hydra_Monk' and zoneId=134;
UPDATE mob_groups SET dropId=4802 WHERE name='Hydra_White_Mage' and zoneId=134;
UPDATE mob_groups SET dropId=4803 WHERE name='Hydra_Black_Mage' and zoneId=134;
UPDATE mob_groups SET dropId=4804 WHERE name='Hydra_Red_Mage' and zoneId=134;
UPDATE mob_groups SET dropId=4805 WHERE name='Hydra_Thief' and zoneId=134;

UPDATE mob_groups SET dropId=4806 WHERE name='Hydra_Paladin' and zoneId=134;
UPDATE mob_groups SET dropId=4807 WHERE name='Hydra_Dark_Knight' and zoneId=134;
UPDATE mob_groups SET dropId=4808 WHERE name='Hydra_Beastmaster' and zoneId=134;
UPDATE mob_groups SET dropId=4809 WHERE name='Hydra_Bard' and zoneId=134;
UPDATE mob_groups SET dropId=4810 WHERE name='Hydra_Ranger' and zoneId=134;
UPDATE mob_groups SET dropId=4811 WHERE name='Hydra_Samurai' and zoneId=134;
UPDATE mob_groups SET dropId=4812 WHERE name='Hydra_Ninja' and zoneId=134;
UPDATE mob_groups SET dropId=4813 WHERE name='Hydra_Dragoon' and zoneId=134;
UPDATE mob_groups SET dropId=4814 WHERE name='Hydra_Summoner' and zoneId=134;

-- Vanguard Eyes
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1449, 500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1452, 500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1455, 500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 4248, 50); -- copy_of_ginuvas_battle_theory
UPDATE mob_groups SET dropId=2561 WHERE name='Vanguard_Eye' and zoneId=134;

-- Goblin Mobs
INSERT INTO mob_droplist VALUES (2542, 0, 0, 1000, 1449, 333); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2542, 0, 0, 1000, 1452, 333); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2542, 0, 0, 1000, 1455, 333); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2542, 0, 0, 1000, 1470, 10); -- sparkling_stone
INSERT INTO mob_droplist VALUES (2542, 0, 0, 1000, 1520, 10); -- jar_of_goblin_grease
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 11292, 50); -- mirage_jubbah
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 11295, 50); -- commodore_frac
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 11298, 50); -- pantin_tobe
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 11307, 50); -- argute_gown
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15088, 50); -- melee_cyclas
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15089, 50); -- clerics_briault
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15090, 50); -- sorcerers_coat
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15091, 50); -- duelists_tabard
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15094, 50); -- abyss_cuirass
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15096, 50); -- bards_justaucorps
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15098, 50); -- saotome_domaru
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15099, 50); -- koga_chainmail
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15100, 50); -- wyrm_mail
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15101, 50); -- summoners_doublet
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15117, 50); -- warriors_cuisses
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15122, 50); -- assassins_culottes
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15123, 50); -- valor_breeches
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15140, 50); -- monster_gaiters
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 15142, 50); -- scouts_socks
INSERT INTO mob_droplist VALUES (2542, 1, 1, 1, 16360, 50); -- etoile_tights
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Smithy' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Pitfighter' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Shaman' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Enchanter' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Pathfinder' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Maestro' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Welldigger' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Armorer' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Ambusher' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Necromancer' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Moltenox_Stubthumbs' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Ronin' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Hitman' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Droprix_Granitepalms' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Dragontamer' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Alchemist' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Brewnix_Bittypupils' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Ascetox_Ratgums' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Gibberox_Pimplebeak' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Swypestix_Tigershins' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Bordox_Kittyback' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Vanguard_Tinkerer' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Ruffbix_Jumbolobes' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Draklix_Scalecrust' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Tocktix_Thinlids' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Routsix_Rubbertendon' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Morblox_Chubbychin' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Whistrix_Toadthroat' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Slinkix_Trufflesniff' and zoneid=134;
UPDATE mob_groups SET dropid=2542 WHERE name='Shisox_Widebrow' and zoneid=134;

-- Goblin Statue
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 748, 20); -- gold_beastcoin
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 1449, 333); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 1452, 333); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 1455, 333); -- one_byne_bill
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 1470, 50); -- sparkling_stone
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 1474, 100); -- infinity_core
INSERT INTO mob_droplist VALUES (3116, 0, 0, 1000, 4248, 10); -- copy_of_ginuvas_battle_theory
UPDATE mob_groups SET dropid=3116 WHERE name='Goblin_Statue' and zoneid=134;


--
-- Dynamis Xarcabard ZoneId: 135
--

-- Xarc Mobs

INSERT INTO `mob_spawn_points` VALUES (17330177,'Dynamis_Lord','Dynamis Lord',7187,-414.282,-44,20.427,254);
INSERT INTO `mob_spawn_points` VALUES (17330178,'Dynamis_Lord','Dynamis Lord',7187,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330179,'Dynamis_Lord','Dynamis Lord',7187,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330180,'Dynamis_Lord','Dynamis Lord',7187,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330181,'Dynamis_Lord','Dynamis Lord',7187,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330182,'Dynamis_Lord','Dynamis Lord',7187,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330183,'Ying','Ying',7239,-364,-35.661,17,254);
INSERT INTO `mob_spawn_points` VALUES (17330184,'Yang','Yang',7238,-364,-35.974,24,254);

INSERT INTO `mob_spawn_points` VALUES (17330199,'Animated_Knuckles','Animated Knuckles',7171,340.986,-29.367,307.346,65); -- 162
INSERT INTO `mob_spawn_points` VALUES (17330200,'Animated_Dagger','Animated Dagger',7166,153.690,-24.117,-234.320,249); -- 152
INSERT INTO `mob_spawn_points` VALUES (17330201,'Animated_Longsword','Animated Longsword',7174,537.681,-8.055,220.543,130); -- 165
INSERT INTO `mob_spawn_points` VALUES (17330202,'Animated_Claymore','Animated Claymore',7165,19.222,-25.389,-427.764,195); -- 154
INSERT INTO `mob_spawn_points` VALUES (17330203,'Animated_Tabar','Animated Tabar',7179,-122.038,-36.035,124.691,50); -- 158
INSERT INTO `mob_spawn_points` VALUES (17330204,'Animated_Great_Axe','Animated Great Axe',7167,321.221,-8,161.909,65); -- 163
INSERT INTO `mob_spawn_points` VALUES (17330205,'Animated_Spear','Animated Spear',7177,160.836,-36.257,30,195); -- 160
INSERT INTO `mob_spawn_points` VALUES (17330206,'Animated_Scythe','Animated Scythe',7175,538.05,-0.128,19.014,130); -- 166
INSERT INTO `mob_spawn_points` VALUES (17330207,'Animated_Kunai','Animated Kunai',7172,243.750,-27.248,95.569,190); -- 161
INSERT INTO `mob_spawn_points` VALUES (17330208,'Animated_Tachi','Animated Tachi',7180,-140.547,-21.359,130.509,55); -- 157
INSERT INTO `mob_spawn_points` VALUES (17330209,'Animated_Hammer','Animated Hammer',7169,340.345,0.272,-334.634,185); -- 151
INSERT INTO `mob_spawn_points` VALUES (17330210,'Animated_Staff','Animated Staff',7178,43.634,-36.077,71.441,190); -- 159
INSERT INTO `mob_spawn_points` VALUES (17330211,'Animated_Longbow','Animated Longbow',7173,-341.510,-35.048,81.082,80); -- 156
INSERT INTO `mob_spawn_points` VALUES (17330212,'Animated_Gun','Animated Gun',7168,-323.451,-28,-81.981,210); -- 155
INSERT INTO `mob_spawn_points` VALUES (17330213,'Animated_Horn','Animated Horn',7170,395.764,-8.013,40.003,10); -- 164
INSERT INTO `mob_spawn_points` VALUES (17330214,'Animated_Shield','Animated Shield',7176,99.202,-24.225,-341.460,195); -- 153
INSERT INTO `mob_spawn_points` VALUES (17330215,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330216,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330217,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330218,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330219,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330220,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330221,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330222,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330223,'Marquis_Decarabia','Marquis Decarabia',7211,151.237,-21.048,-38.143,95);
INSERT INTO `mob_spawn_points` VALUES (17330224,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330225,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330226,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330227,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330228,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330229,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330232,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330233,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330234,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330235,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330236,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330237,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330238,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330239,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330242,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330243,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330244,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330245,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330246,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330247,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330250,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330251,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330252,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330253,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330254,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330255,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330258,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330259,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330260,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330261,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330262,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330263,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330264,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330265,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330266,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330267,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330268,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330269,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330270,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330271,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330272,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330275,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330276,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330277,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330278,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330279,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330280,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330281,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330282,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330283,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330284,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330287,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330288,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330289,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330290,'Satellite_Shield','Satellite Shield',7229,98.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330291,'Satellite_Shield','Satellite Shield',7229,98.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330292,'Satellite_Shield','Satellite Shield',7229,98.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330293,'Vanguard_Eye','Vanguard Eye',7237,418,-0.112,-181,250); -- 001
INSERT INTO `mob_spawn_points` VALUES (17330294,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330295,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330296,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330297,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330298,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330299,'Satellite_Shield','Satellite Shield',7229,100.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330300,'Satellite_Shield','Satellite Shield',7229,100.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330301,'Satellite_Shield','Satellite Shield',7229,100.202,-24.225,-341.460,195);
INSERT INTO `mob_spawn_points` VALUES (17330302,'Vanguard_Eye','Vanguard Eye',7237,412,-0.006,-181,250); -- 002
INSERT INTO `mob_spawn_points` VALUES (17330303,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330304,'Duke_Gomory','Duke Gomory',7185,120.105,-28.770,-117.808,130);
INSERT INTO `mob_spawn_points` VALUES (17330305,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330306,'Satellite_Daggers','Satellite Daggers',7219,152.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330307,'Satellite_Daggers','Satellite Daggers',7219,152.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330308,'Satellite_Daggers','Satellite Daggers',7219,152.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330309,'Satellite_Knuckles','Satellite Knuckles',7224,339.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330310,'Satellite_Knuckles','Satellite Knuckles',7224,339.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330311,'Satellite_Knuckles','Satellite Knuckles',7224,339.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330312,'Vanguard_Eye','Vanguard Eye',7237,412,0.150,-189,250); -- 003
INSERT INTO `mob_spawn_points` VALUES (17330313,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330314,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330315,'Count_Raum','Count Raum',7181,41.055,-28.730,-138.265,128);
INSERT INTO `mob_spawn_points` VALUES (17330316,'Satellite_Daggers','Satellite Daggers',7219,154.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330317,'Satellite_Daggers','Satellite Daggers',7219,154.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330318,'Satellite_Daggers','Satellite Daggers',7219,154.690,-24.117,-234.320,249);
INSERT INTO `mob_spawn_points` VALUES (17330319,'Satellite_Knuckles','Satellite Knuckles',7224,341.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330320,'Satellite_Knuckles','Satellite Knuckles',7224,341.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330321,'Satellite_Knuckles','Satellite Knuckles',7224,341.986,-29.367,307.346,65);
INSERT INTO `mob_spawn_points` VALUES (17330322,'Vanguard_Eye','Vanguard Eye',7237,418,0.449,-189,250); -- 004
INSERT INTO `mob_spawn_points` VALUES (17330323,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330324,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330325,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330326,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330327,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330328,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330329,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330330,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330331,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330332,'Prince_Seere','Prince Seere',7217,120.105,-28.770,-113.993,130);
INSERT INTO `mob_spawn_points` VALUES (17330333,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330334,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330335,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330336,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330337,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330338,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330339,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330340,'Vanguard_Eye','Vanguard Eye',7237,360.315,8,-195.962,207); -- 006
INSERT INTO `mob_spawn_points` VALUES (17330341,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330342,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330343,'Marquis_Orias','Marquis Orias',7214,57.692,-28.511,-193.675,100);
INSERT INTO `mob_spawn_points` VALUES (17330344,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330345,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330346,'Satellite_Hammers','Satellite Hammers',7222,340.345,0.272,-334.634,185);
INSERT INTO `mob_spawn_points` VALUES (17330347,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330348,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330349,'Satellite_Staves','Satellite Staves',7231,43.634,-36.077,71.441,190);
INSERT INTO `mob_spawn_points` VALUES (17330350,'Vanguard_Eye','Vanguard Eye',7237,351.545,8.176,-198.220,161); -- 007
INSERT INTO `mob_spawn_points` VALUES (17330351,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330352,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330353,'Duke_Berith','Duke Berith',7184,158.285,-21.056,-43.306,95);
INSERT INTO `mob_spawn_points` VALUES (17330354,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330355,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330356,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330357,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330358,'Vanguard_Eye','Vanguard Eye',7237,352.855,7.880,-202.615,95); -- 008
INSERT INTO `mob_spawn_points` VALUES (17330359,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330360,'Marquis_Sabnak','Marquis Sabnak',7215,41.055,-28.694,-134.699,128);
INSERT INTO `mob_spawn_points` VALUES (17330361,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330362,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330363,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330364,'Satellite_Longswords','Satellite Longswords',7227,537.681,-8.055,220.543,130);
INSERT INTO `mob_spawn_points` VALUES (17330365,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330366,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330367,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330368,'Vanguard_Eye','Vanguard Eye',7237,360.414,7.898,-204.767,50); -- 009
INSERT INTO `mob_spawn_points` VALUES (17330369,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330370,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330371,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330372,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330373,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330374,'Satellite_Claymores','Satellite Claymores',7218,19.222,-25.389,-427.764,195);
INSERT INTO `mob_spawn_points` VALUES (17330375,'Vanguard_Eye','Vanguard Eye',7237,369.655,-0.584,-252.07,185); -- 011
INSERT INTO `mob_spawn_points` VALUES (17330376,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330377,'Count_Zaebos','Count Zaebos',7183,154.372,-21.033,-40.290,95);
INSERT INTO `mob_spawn_points` VALUES (17330378,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330379,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330380,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330381,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330382,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330383,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330384,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330385,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330386,'Vanguard_Eye','Vanguard Eye',7237,349.287,0.064,-253.5,185); -- 013
INSERT INTO `mob_spawn_points` VALUES (17330387,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330388,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330389,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330390,'Marquis_Andras','Marquis Andras',7209,121.105,-28.775,-122.08,130);
INSERT INTO `mob_spawn_points` VALUES (17330391,'Andrass_Vouivre',"Andras's Vouivre",7164,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330392,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330393,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330394,'Satellite_Tabars','Satellite Tabars',7232,-122.038,-36.035,124.691,50);
INSERT INTO `mob_spawn_points` VALUES (17330395,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330396,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330397,'Satellite_Great_Axes','Satellite Great Axes',7220,321.221,-8,161.909,65);
INSERT INTO `mob_spawn_points` VALUES (17330398,'Vanguard_Eye','Vanguard Eye',7237,346.029,0.042,-288.860,200); -- 014
INSERT INTO `mob_spawn_points` VALUES (17330399,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330400,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330401,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330402,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330403,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330404,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330405,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330406,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330407,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330408,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330409,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330410,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330411,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330412,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330413,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330414,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330415,'Marquis_Cimeries','Marquis Cimeries',7210,-2.337,-28.555,-97.302,140);
INSERT INTO `mob_spawn_points` VALUES (17330416,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330417,'Duke_Scox','Duke Scox',7186,60.769,-28.491,-195.910,100);
INSERT INTO `mob_spawn_points` VALUES (17330418,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330419,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330420,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330421,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330422,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330423,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330424,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330425,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330426,'Vanguard_Eye','Vanguard Eye',7237,337.885,0.455,-288.741,200); -- 015
INSERT INTO `mob_spawn_points` VALUES (17330427,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330428,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330429,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330430,'King_Zagan','King Zagan',7208,-2.337,-28.555,-97.302,140);
INSERT INTO `mob_spawn_points` VALUES (17330431,'Zagans_Wyvern',"Zagan's Wyvern",7240,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330432,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330433,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330434,'Satellite_Scythes','Satellite Scythes',7228,538.05,-0.128,19.014,130);
INSERT INTO `mob_spawn_points` VALUES (17330435,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330436,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330437,'Satellite_Spears','Satellite Spears',7230,160.836,-36.257,30,195);
INSERT INTO `mob_spawn_points` VALUES (17330438,'Vanguard_Eye','Vanguard Eye',7237,328.788,-0.230,-288.831,200); -- 016
INSERT INTO `mob_spawn_points` VALUES (17330439,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330440,'Count_Vine','Count Vine',7182,-3.448,-28.531,-101.450,140);
INSERT INTO `mob_spawn_points` VALUES (17330441,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330442,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330443,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330444,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330445,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330446,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330447,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330448,'Vanguard_Eye','Vanguard Eye',7237,301.926,0.038,-272.534,5); -- 017
INSERT INTO `mob_spawn_points` VALUES (17330449,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330450,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330451,'Marquis_Gamygyn','Marquis Gamygyn',7212,63.313,-28.513,-199.167,100);
INSERT INTO `mob_spawn_points` VALUES (17330452,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330453,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330454,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330455,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330456,'Satellite_Kunai','Satellite Kunai',7225,243.750,-27.248,95.569,190);
INSERT INTO `mob_spawn_points` VALUES (17330457,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330458,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330459,'Satellite_Tachi','Satellite Tachi',7233,-140.547,-21.359,130.509,55);
INSERT INTO `mob_spawn_points` VALUES (17330460,'Vanguard_Eye','Vanguard Eye',7237,308.273,3.943,-260.934,5); -- 018
INSERT INTO `mob_spawn_points` VALUES (17330461,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330462,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330463,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330464,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330465,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330466,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330467,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330468,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330469,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330470,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330473,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330474,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330475,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330476,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330477,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330478,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330479,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330480,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330481,'Marquis_Nebiros','Marquis Nebiros',7213,41.055,-28.714,-129.534,128);
INSERT INTO `mob_spawn_points` VALUES (17330482,'Nebiross_Avatar',"Nebiros's Avatar",7216,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330485,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330486,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330487,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330488,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330489,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330490,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330491,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330492,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330493,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330494,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330495,'Satellite_Horns','Satellite Horns',7223,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330496,'Satellite_Horns','Satellite Horns',7223,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330497,'Satellite_Horns','Satellite Horns',7223,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330498,'Vanguard_Eye','Vanguard Eye',7237,312.873,6.884,-249.573,5); -- 019
INSERT INTO `mob_spawn_points` VALUES (17330499,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330500,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330501,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330502,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330503,'Satellite_Horns','Satellite Horns',7223,395.764,-8.013,40.003,10);
INSERT INTO `mob_spawn_points` VALUES (17330504,'Satellite_Horns','Satellite Horns',7223,395.764,-8.013,40.003,10);
INSERT INTO `mob_spawn_points` VALUES (17330505,'Satellite_Horns','Satellite Horns',7223,395.764,-8.013,40.003,10);
INSERT INTO `mob_spawn_points` VALUES (17330506,'Vanguard_Eye','Vanguard Eye',7237,263.630,-2.706,-254.793,255); -- 020
INSERT INTO `mob_spawn_points` VALUES (17330507,'Vanguard_Dragon','Vanguard Dragon',7236,-215.397,-7.021,40.349,1); -- 167
INSERT INTO `mob_spawn_points` VALUES (17330508,'Vanguard_Dragon','Vanguard Dragon',7236,-235.966,-11.874,73.221,1); -- 168
INSERT INTO `mob_spawn_points` VALUES (17330509,'Vanguard_Dragon','Vanguard Dragon',7236,-245.116,-12.053,-8.722,225); -- 169
INSERT INTO `mob_spawn_points` VALUES (17330510,'Vanguard_Dragon','Vanguard Dragon',7236,-229.234,-10.338,-78.140,1); -- 170
INSERT INTO `mob_spawn_points` VALUES (17330511,'Vanguard_Dragon','Vanguard Dragon',7236,-270.384,-18.779,-83.921,15); -- 171
INSERT INTO `mob_spawn_points` VALUES (17330512,'Vanguard_Dragon','Vanguard Dragon',7236,-275.774,-20,40.145,240); -- 172
INSERT INTO `mob_spawn_points` VALUES (17330513,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330514,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330515,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330516,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330517,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330518,'Satellite_Guns','Satellite Guns',7221,-323.451,-28,-81.981,210);
INSERT INTO `mob_spawn_points` VALUES (17330519,'Vanguard_Dragon','Vanguard Dragon',7236,-319.548,-27.811,87.819,35); -- 173
INSERT INTO `mob_spawn_points` VALUES (17330520,'Vanguard_Dragon','Vanguard Dragon',7236,-318.762,-28,42.098,210); -- 174
INSERT INTO `mob_spawn_points` VALUES (17330521,'Vanguard_Dragon','Vanguard Dragon',7236,-291.017,-21.514,9.659,200); -- 175
INSERT INTO `mob_spawn_points` VALUES (17330522,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330523,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330524,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330525,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330526,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330527,'Satellite_Longbows','Satellite Longbows',7226,-341.510,-35.048,81.082,80);
INSERT INTO `mob_spawn_points` VALUES (17330528,'Vanguard_Dragon','Vanguard Dragon',7236,-307.651,-26.427,-39.145,200); -- 176
INSERT INTO `mob_spawn_points` VALUES (17330529,'Vanguard_Dragon','Vanguard Dragon',7236,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330530,'Vanguard_Dragon','Vanguard Dragon',7236,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330531,'Tombstone_Prototype','Tombstone Prototype',7235,357,8,-199.7,190); -- 010 TE 30min
INSERT INTO `mob_spawn_points` VALUES (17330532,'Effigy_Prototype','Effigy Prototype',7188,-107.803,-39.795,36.116,160); -- 112 HP bonus
INSERT INTO `mob_spawn_points` VALUES (17330533,'Icon_Prototype','Icon Prototype',7189,195.02,-16.129,-155.693,65); -- 052 HP Bonus
INSERT INTO `mob_spawn_points` VALUES (17330534,'Statue_Prototype','Statue Prototype',7234,415,-0.173,-185.797,2); -- 005
INSERT INTO `mob_spawn_points` VALUES (17330536,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330537,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330538,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330539,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330540,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330541,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330542,'Vanguard_Eye','Vanguard Eye',7237,265.827,-2.448,-243.361,255); -- 021
INSERT INTO `mob_spawn_points` VALUES (17330543,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330544,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330545,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330546,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330547,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330548,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330549,'Vanguard_Eye','Vanguard Eye',7237,267.453,-3.753,-228.574,255); -- 022
INSERT INTO `mob_spawn_points` VALUES (17330550,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330551,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330552,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330553,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330554,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330555,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330556,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330557,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330558,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330559,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330560,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330561,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330562,'Vanguard_Eye','Vanguard Eye',7237,275.725,-4.360,-207.357,15); -- 023
INSERT INTO `mob_spawn_points` VALUES (17330563,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330564,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330565,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330566,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330567,'Vanguard_Eye','Vanguard Eye',7237,280.726,-0.418,-192.707,15); -- 024
INSERT INTO `mob_spawn_points` VALUES (17330568,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330569,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330570,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330571,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330572,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330573,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330574,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330575,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330576,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330577,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330578,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330579,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330580,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330581,'Vanguard_Eye','Vanguard Eye',7237,285.781,-3.891,-180.309,15); -- 025
INSERT INTO `mob_spawn_points` VALUES (17330582,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330583,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330584,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330585,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330586,'Vanguard_Eye','Vanguard Eye',7237,378.862,1.213,-108.607,75); -- 026
INSERT INTO `mob_spawn_points` VALUES (17330587,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330588,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330589,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330590,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330591,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330592,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330593,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330594,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330595,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330596,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330597,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330598,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330599,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330600,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330601,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330602,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330603,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330604,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330605,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330606,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330607,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330608,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330609,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330610,'Vanguard_Eye','Vanguard Eye',7237,381.862,-1.607,-103.217,75); -- 027
INSERT INTO `mob_spawn_points` VALUES (17330611,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330612,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330613,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330614,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330615,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330616,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330617,'Vanguard_Eye','Vanguard Eye',7237,384.862,-3.133,-97.473,75); -- 028
INSERT INTO `mob_spawn_points` VALUES (17330618,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330619,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330620,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330621,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330622,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330623,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330624,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330625,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330626,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330627,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330628,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330629,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330630,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330631,'Vanguard_Eye','Vanguard Eye',7237,290.560,-7.683,-112.868,75); -- 029
INSERT INTO `mob_spawn_points` VALUES (17330632,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330633,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330634,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330635,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330636,'Vanguard_Eye','Vanguard Eye',7237,286.445,-8.449,-106.932,44); -- 030
INSERT INTO `mob_spawn_points` VALUES (17330637,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330638,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330639,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330640,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330641,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330642,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330643,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330644,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330645,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330646,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330647,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330648,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330649,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330650,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330651,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330652,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330653,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330654,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330655,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330656,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330657,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330658,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330659,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330660,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330661,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330662,'Vanguard_Eye','Vanguard Eye',7237,281.303,-7.284,-100.940,50); -- 031
INSERT INTO `mob_spawn_points` VALUES (17330663,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330664,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330665,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330666,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330667,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330668,'Vanguard_Eye','Vanguard Eye',7237,274.896,-7.660,-95.866,42); -- 032
INSERT INTO `mob_spawn_points` VALUES (17330669,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330670,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330671,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330672,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330673,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330674,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330675,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330676,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330677,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330678,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330679,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330680,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330681,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330682,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330683,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330684,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330685,'Vanguard_Eye','Vanguard Eye',7237,269.758,-7.764,-89.851,44); -- 033
INSERT INTO `mob_spawn_points` VALUES (17330686,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330687,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330688,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330689,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330690,'Vanguard_Eye','Vanguard Eye',7237,264.258,-7.779,-82.3,54); -- 034
INSERT INTO `mob_spawn_points` VALUES (17330691,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330692,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330693,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330694,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330695,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330696,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330697,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330698,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330699,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330700,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330701,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330702,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330703,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330704,'Kindred_Paladin','Kindred Paladin',7197,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330705,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330706,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330707,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330708,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330709,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330710,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330711,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330712,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330713,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330714,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330715,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330716,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330717,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330718,'Vanguard_Eye','Vanguard Eye',7237,249.871,-14.914,-182.861,15); -- 035
INSERT INTO `mob_spawn_points` VALUES (17330719,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330720,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330721,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330722,'Kindred_Monk','Kindred Monk',7195,-59.333,0.227,-448.239,25);
INSERT INTO `mob_spawn_points` VALUES (17330723,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330724,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330725,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330726,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330727,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330728,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330729,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330730,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330731,'Vanguard_Eye','Vanguard Eye',7237,251.101,-13.483,-175.558,15); -- 036
INSERT INTO `mob_spawn_points` VALUES (17330732,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330733,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330734,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330735,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330736,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330737,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330738,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330739,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330740,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330741,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330742,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330743,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330744,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330745,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330746,'Vanguard_Eye','Vanguard Eye',7237,243.782,-15.716,-178.414,15); -- 037
INSERT INTO `mob_spawn_points` VALUES (17330747,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330748,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330749,'Vanguard_Eye','Vanguard Eye',7237,241.405,-15.828,-185.216,15); -- 038
INSERT INTO `mob_spawn_points` VALUES (17330750,'Kindred_Warrior','Kindred Warrior',7206,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330751,'Kindred_Monk','Kindred Monk',7195,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330752,'Kindred_White_Mage','Kindred White Mage',7207,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330753,'Kindred_Black_Mage','Kindred Black Mage',7192,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330754,'Kindred_Red_Mage','Kindred Red Mage',7199,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330755,'Kindred_Thief','Kindred Thief',7205,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330756,'Vanguard_Eye','Vanguard Eye',7237,245.501,-15.430,-195.044,15); -- 039
INSERT INTO `mob_spawn_points` VALUES (17330757,'Kindred_Paladin','Kindred Paladin',7197,15.202,0.188,-426.599,127);
INSERT INTO `mob_spawn_points` VALUES (17330758,'Kindred_Dark_Knight','Kindred Dark Knight',7193,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330759,'Kindred_Beastmaster','Kindred Beastmaster',7191,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330760,'Kindreds_Vouivre',"Kindred's Vouivre",7203,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330761,'Kindred_Bard','Kindred Bard',7190,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330762,'Vanguard_Eye','Vanguard Eye',7237,245.501,-16,-200.082,15); -- 040
INSERT INTO `mob_spawn_points` VALUES (17330763,'Kindred_Ranger','Kindred Ranger',7198,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330764,'Kindred_Samurai','Kindred Samurai',7200,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330765,'Kindred_Ninja','Kindred Ninja',7196,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330766,'Kindred_Dragoon','Kindred Dragoon',7194,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330767,'Kindreds_Wyvern',"Kindred's Wyvern",7204,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330768,'Kindred_Summoner','Kindred Summoner',7201,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330769,'Kindreds_Avatar',"Kindred's Avatar",7202,1,1,1,0);
INSERT INTO `mob_spawn_points` VALUES (17330770,'Vanguard_Eye','Vanguard Eye',7237,237.312,-16,-195.770,15); -- 041

INSERT INTO `mob_spawn_points` VALUES (17330812,'Tombstone_Prototype','',7235,360,0.325,-251.153,185); -- 012
INSERT INTO `mob_spawn_points` VALUES (17330813,'Vanguard_Eye','',7237,239.240,-15.872,-190.943,15); -- 042
INSERT INTO `mob_spawn_points` VALUES (17330814,'Icon_Prototype','',7189,248.501,-15.988,-189.08,15); -- 043 TE 30min
INSERT INTO `mob_spawn_points` VALUES (17330815,'Vanguard_Eye','',7237,180.844,-20.289,-242.087,180); -- 044
INSERT INTO `mob_spawn_points` VALUES (17330816,'Vanguard_Eye','',7237,187.983,-18.370,-246.605,220); -- 045
INSERT INTO `mob_spawn_points` VALUES (17330817,'Vanguard_Eye','',7237,180.844,-20.315,-242.087,110); -- 046
INSERT INTO `mob_spawn_points` VALUES (17330818,'Vanguard_Eye','',7237,185.369,-18.674,-234.04,130); -- 047
INSERT INTO `mob_spawn_points` VALUES (17330819,'Vanguard_Eye','',7237,201.044,-16,-160.717,68); -- 048
INSERT INTO `mob_spawn_points` VALUES (17330820,'Vanguard_Eye','',7237,189.323,-17.616,-160.717,128); -- 049
INSERT INTO `mob_spawn_points` VALUES (17330821,'Vanguard_Eye','',7237,189.323,-16.864,-151.273,192); -- 050
INSERT INTO `mob_spawn_points` VALUES (17330822,'Vanguard_Eye','',7237,201.044,-16.831,-151.273,188); -- 051
INSERT INTO `mob_spawn_points` VALUES (17330823,'Vanguard_Eye','',7237,175.032,-19.196,-117.814,65); -- 053
INSERT INTO `mob_spawn_points` VALUES (17330824,'Vanguard_Eye','',7237,215.145,-21.681,-117.814,65); -- 054
INSERT INTO `mob_spawn_points` VALUES (17330825,'Vanguard_Eye','',7237,215.145,-7.433,-80.263,65); -- 055
INSERT INTO `mob_spawn_points` VALUES (17330826,'Vanguard_Eye','',7237,175.032,-13.669,-80.263,65); -- 056
INSERT INTO `mob_spawn_points` VALUES (17330827,'Vanguard_Eye','',7237,191.346,-8.653,25.931,85); -- 057
INSERT INTO `mob_spawn_points` VALUES (17330828,'Vanguard_Eye','',7237,198.785,-7.137,22.723,85); -- 058
INSERT INTO `mob_spawn_points` VALUES (17330829,'Vanguard_Eye','',7237,204.544,-7.215,19.345,85); -- 059
INSERT INTO `mob_spawn_points` VALUES (17330830,'Tombstone_Prototype','',7235,201.713,-7.592,27.825,85); -- 060 TE 30min
INSERT INTO `mob_spawn_points` VALUES (17330831,'Vanguard_Eye','',7237,277.205,-7.493,51.644,65); -- 061
INSERT INTO `mob_spawn_points` VALUES (17330832,'Vanguard_Eye','',7237,279.188,-7.348,54.557,65); -- 062
INSERT INTO `mob_spawn_points` VALUES (17330833,'Vanguard_Eye','',7237,282.112,-7.149,57.031,65); -- 063
INSERT INTO `mob_spawn_points` VALUES (17330834,'Vanguard_Eye','',7237,285.180,-7.477,54.557,65); -- 064
INSERT INTO `mob_spawn_points` VALUES (17330835,'Vanguard_Eye','',7237,287.890,-8.022,51.644,65); -- 065
INSERT INTO `mob_spawn_points` VALUES (17330836,'Vanguard_Eye','',7237,362.343,-8,122.067,15); -- 066
INSERT INTO `mob_spawn_points` VALUES (17330837,'Vanguard_Eye','',7237,360.329,-8,116.850,15); -- 067
INSERT INTO `mob_spawn_points` VALUES (17330838,'Vanguard_Eye','',7237,360.738,-7.363,-58.008,80); -- 068
INSERT INTO `mob_spawn_points` VALUES (17330839,'Vanguard_Eye','',7237,371.349,-6.943,-61.2,80); -- 069
INSERT INTO `mob_spawn_points` VALUES (17330840,'Vanguard_Eye','',7237,380.480,-3.378,-63.993,80); -- 070
INSERT INTO `mob_spawn_points` VALUES (17330841,'Vanguard_Eye','',7237,390.032,-1.292,-66.887,80); -- 071
INSERT INTO `mob_spawn_points` VALUES (17330842,'Vanguard_Eye','',7237,401.144,0.169,-72.609,80); -- 072
INSERT INTO `mob_spawn_points` VALUES (17330843,'Icon_Prototype','Icon_Prototype',7189,385.745,-2.379,-52.840,80); -- 073 MP Bonus
INSERT INTO `mob_spawn_points` VALUES (17330844,'Vanguard_Eye','',7237,397.684,-5.759,-13.987,78); -- 074
INSERT INTO `mob_spawn_points` VALUES (17330845,'Vanguard_Eye','',7237,391.583,-7.889,5.689,42); -- 075
INSERT INTO `mob_spawn_points` VALUES (17330846,'Vanguard_Eye','',7237,402.669,-7.368,11.416,60); -- 076
INSERT INTO `mob_spawn_points` VALUES (17330847,'Vanguard_Eye','',7237,399.159,-7.796,-5.689,75); -- 077
INSERT INTO `mob_spawn_points` VALUES (17330848,'Vanguard_Eye','',7237,434.790,-5.561,64.165,31); -- 078
INSERT INTO `mob_spawn_points` VALUES (17330849,'Vanguard_Eye','',7237,434.758,-6.845,69.228,149); -- 079
INSERT INTO `mob_spawn_points` VALUES (17330850,'Vanguard_Eye','',7237,440.08,-6.410,68.898,248); -- 080
INSERT INTO `mob_spawn_points` VALUES (17330851,'Vanguard_Eye','',7237,441.565,-5.618,63.561,253); -- 081
INSERT INTO `mob_spawn_points` VALUES (17330852,'Vanguard_Eye','',7237,437.994,-5.873,66.933,109); -- 082
INSERT INTO `mob_spawn_points` VALUES (17330853,'Vanguard_Eye','',7237,487.723,-0.187,35.874,162); -- 083
INSERT INTO `mob_spawn_points` VALUES (17330854,'Vanguard_Eye','',7237,483.390,-0.163,32.759,162); -- 084
INSERT INTO `mob_spawn_points` VALUES (17330855,'Vanguard_Eye','',7237,491.259,-0.068,28.413,162); -- 085
INSERT INTO `mob_spawn_points` VALUES (17330856,'Vanguard_Eye','',7237,501.097,-7.785,199.877,65); -- 086
INSERT INTO `mob_spawn_points` VALUES (17330857,'Vanguard_Eye','',7237,502.711,-8.085,207.491,65); -- 087
INSERT INTO `mob_spawn_points` VALUES (17330858,'Vanguard_Eye','',7237,516.001,-7.844,218.116,99); -- 088
INSERT INTO `mob_spawn_points` VALUES (17330859,'Vanguard_Eye','',7237,62.086,-24,-272.564,175); -- 089
INSERT INTO `mob_spawn_points` VALUES (17330860,'Vanguard_Eye','',7237,54.042,-24,-292.997,215); -- 090
INSERT INTO `mob_spawn_points` VALUES (17330861,'Vanguard_Eye','',7237,91.938,-24.029,-252.619,160); -- 091
INSERT INTO `mob_spawn_points` VALUES (17330862,'Vanguard_Eye','',7237,100.352,-23.729,-277.825,195); -- 092
INSERT INTO `mob_spawn_points` VALUES (17330863,'Vanguard_Eye','',7237,13.842,-23.437,-362.646,188); -- 093
INSERT INTO `mob_spawn_points` VALUES (17330864,'Vanguard_Eye','',7237,21.842,-23.001,-362.646,188); -- 094
INSERT INTO `mob_spawn_points` VALUES (17330865,'Vanguard_Eye','',7237,29.842,-23.708,-362.646,188); -- 095
INSERT INTO `mob_spawn_points` VALUES (17330866,'Vanguard_Eye','',7237,37.842,-24,-362.646,188); -- 096
INSERT INTO `mob_spawn_points` VALUES (17330867,'Vanguard_Eye','',7237,-7.330,-15.835,43.794,1); -- 097
INSERT INTO `mob_spawn_points` VALUES (17330868,'Vanguard_Eye','',7237,-7.330,-15.913,34.734,1); -- 098
INSERT INTO `mob_spawn_points` VALUES (17330869,'Vanguard_Eye','',7237,50.142,-15.702,20.529,40); -- 099
INSERT INTO `mob_spawn_points` VALUES (17330870,'Vanguard_Eye','',7237,41.762,-15.182,16.378,40); -- 100
INSERT INTO `mob_spawn_points` VALUES (17330871,'Vanguard_Eye','',7237,33.616,-15.980,11.759,40); -- 101
INSERT INTO `mob_spawn_points` VALUES (17330872,'Vanguard_Eye','',7237,48.401,-23.409,-42.703,65); -- 102
INSERT INTO `mob_spawn_points` VALUES (17330873,'Vanguard_Eye','',7237,60.569,-20.346,-42.703,65); -- 103
INSERT INTO `mob_spawn_points` VALUES (17330874,'Vanguard_Eye','',7237,77.555,-24,-80.936,65); -- 104
INSERT INTO `mob_spawn_points` VALUES (17330875,'Vanguard_Eye','',7237,90.01,-23.701,-80.585,65); -- 105
INSERT INTO `mob_spawn_points` VALUES (17330876,'Vanguard_Eye','',7237,21.459,-29.461,129.1,60); -- 106
INSERT INTO `mob_spawn_points` VALUES (17330877,'Vanguard_Eye','',7237,25.028,-33.567,140.099,60); -- 107
INSERT INTO `mob_spawn_points` VALUES (17330878,'Vanguard_Eye','',7237,29.206,-35.531,148.478,60); -- 108
INSERT INTO `mob_spawn_points` VALUES (17330879,'Vanguard_Eye','',7237,31.859,-35.794,157.356,60); -- 109
INSERT INTO `mob_spawn_points` VALUES (17330880,'Vanguard_Eye','',7237,-116.770,-35.530,92.742,60); -- 110
INSERT INTO `mob_spawn_points` VALUES (17330881,'Vanguard_Eye','',7237,-116.466,-36,80.336,60); -- 111
INSERT INTO `mob_spawn_points` VALUES (17330882,'Vanguard_Eye','',7237,-135.374,-28.5,80.998,60); -- 113
INSERT INTO `mob_spawn_points` VALUES (17330883,'Vanguard_Eye','',7237,-135.884,-26.036,95.486,60); -- 114
INSERT INTO `mob_spawn_points` VALUES (17330884,'Vanguard_Eye','',7237,37.539,-35.774,88.537,180); -- 115
INSERT INTO `mob_spawn_points` VALUES (17330885,'Vanguard_Eye','',7237,45.908,-35.845,88.537,180); -- 116
INSERT INTO `mob_spawn_points` VALUES (17330886,'Vanguard_Eye','',7237,227.912,-28.187,145.546,72); -- 117
INSERT INTO `mob_spawn_points` VALUES (17330887,'Vanguard_Eye','',7237,224.987,-28.304,150.890,160); -- 118
INSERT INTO `mob_spawn_points` VALUES (17330888,'Vanguard_Eye','',7237,230.083,-27.933,153.155,75); -- 119
INSERT INTO `mob_spawn_points` VALUES (17330889,'Vanguard_Eye','',7237,234.276,-27.777,148.672,236); -- 120
INSERT INTO `mob_spawn_points` VALUES (17330890,'Vanguard_Eye','',7237,156.372,-35.016,59.701,194); -- 121
INSERT INTO `mob_spawn_points` VALUES (17330891,'Vanguard_Eye','',7237,165.651,-35.222,59.844,194); -- 122
INSERT INTO `mob_spawn_points` VALUES (17330892,'Vanguard_Eye','',7237,239.793,-27.760,111.181,195); -- 123
INSERT INTO `mob_spawn_points` VALUES (17330893,'Vanguard_Eye','',7237,249.793,-27.885,111.181,195); -- 124
INSERT INTO `mob_spawn_points` VALUES (17330894,'Vanguard_Eye','',7237,300.912,-27.8,220.120,55); -- 125
INSERT INTO `mob_spawn_points` VALUES (17330895,'Vanguard_Eye','',7237,298.887,-28.165,226.473,50); -- 126
-- INSERT INTO `mob_spawn_points` VALUES (17330896,'Vanguard_Eye','',7237,152.237,-21.048,-38.143,95); -- 127--
-- INSERT INTO `mob_spawn_points` VALUES (17330897,'Vanguard_Eye','',7237,155.372,-21.033,-40.290,95); -- 128
-- INSERT INTO `mob_spawn_points` VALUES (17330898,'Vanguard_Eye','',7237,158.285,-21.056,-43.306,95); -- 129
-- INSERT INTO `mob_spawn_points` VALUES (17330899,'Vanguard_Eye','',7237,120.105,-28.770,-113.993,130); -- 130
-- INSERT INTO `mob_spawn_points` VALUES (17330900,'Vanguard_Eye','',7237,120.105,-28.770,-117.808,130); -- 131
-- INSERT INTO `mob_spawn_points` VALUES (17330901,'Vanguard_Eye','',7237,120.105,-28.775,-122.08,130); -- 132
-- INSERT INTO `mob_spawn_points` VALUES (17330902,'Vanguard_Eye','',7237,64.313,-28.513,-199.167,100); -- 133
-- INSERT INTO `mob_spawn_points` VALUES (17330903,'Vanguard_Eye','',7237,61.769,-28.491,-195.910,100); -- 134
-- INSERT INTO `mob_spawn_points` VALUES (17330904,'Vanguard_Eye','',7237,58.692,-28.511,-193.675,100); -- 135
-- INSERT INTO `mob_spawn_points` VALUES (17330905,'Vanguard_Eye','',7237,40.055,-28.730,-138.265,128); -- 136
-- INSERT INTO `mob_spawn_points` VALUES (17330906,'Vanguard_Eye','',7237,40.055,-28.694,-134.699,128); -- 137
-- INSERT INTO `mob_spawn_points` VALUES (17330907,'Vanguard_Eye','',7237,40.055,-28.714,-129.534,128); -- 138
-- INSERT INTO `mob_spawn_points` VALUES (17330908,'Vanguard_Eye','',7237,-3.337,-28.555,-97.302,140); -- 139
-- INSERT INTO `mob_spawn_points` VALUES (17330909,'Vanguard_Eye','',7237,-4.448,-28.531,-101.450,140); -- 140
-- INSERT INTO `mob_spawn_points` VALUES (17330910,'Vanguard_Eye','',7237,-3.337,-28.555,-97.302,140); -- 141
INSERT INTO `mob_spawn_points` VALUES (17330911,'Effigy_Prototype','',7188,-46.543,-24.648,-126.451,238); -- 142 HP bonus
INSERT INTO `mob_spawn_points` VALUES (17330912,'Statue_Prototype','',7234,-86.590,-24.835,-87.031,233); -- 143 TE 30min
INSERT INTO `mob_spawn_points` VALUES (17330913,'Vanguard_Eye','',7237,-128,-23.478,-35,254); -- 144
INSERT INTO `mob_spawn_points` VALUES (17330914,'Vanguard_Eye','',7237,-128,-22.340,-26,254); -- 145
INSERT INTO `mob_spawn_points` VALUES (17330915,'Vanguard_Eye','',7237,-128,-20.734,-17,254); -- 146
INSERT INTO `mob_spawn_points` VALUES (17330916,'Vanguard_Eye','',7237,-128,-16.623,-8,254); -- 147
INSERT INTO `mob_spawn_points` VALUES (17330917,'Vanguard_Eye','',7237,-128,-15.797,1,254); -- 148
INSERT INTO `mob_spawn_points` VALUES (17330918,'Vanguard_Eye','',7237,-128,-16.324,9,254); -- 149
INSERT INTO `mob_spawn_points` VALUES (17330919,'Statue_Prototype','',7234,-140.143,-18.903,-14.502,254); -- 150 TE 30min

-- Xarcabard Groups
INSERT INTO mob_groups VALUES (1,134,135,'Andrass_Vouivre',21600,128,0,7500,0,84,86,0);
INSERT INTO mob_groups VALUES (2,143,135,'Animated_Claymore',0,128,95,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (3,144,135,'Animated_Dagger',0,128,96,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (4,145,135,'Animated_Great_Axe',0,128,97,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (5,146,135,'Animated_Gun',0,128,98,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (6,147,135,'Animated_Hammer',0,128,99,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (7,148,135,'Animated_Horn',0,128,100,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (8,149,135,'Animated_Knuckles',0,128,101,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (9,150,135,'Animated_Kunai',0,128,102,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (10,151,135,'Animated_Longbow',0,128,103,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (11,152,135,'Animated_Longsword',0,128,104,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (12,153,135,'Animated_Scythe',0,128,105,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (13,154,135,'Animated_Shield',0,128,106,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (14,155,135,'Animated_Spear',0,128,107,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (15,156,135,'Animated_Staff',0,128,108,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (16,157,135,'Animated_Tabar',0,128,109,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (20,158,135,'Animated_Tachi',0,128,110,20500,0,93,95,0);
INSERT INTO mob_groups VALUES (21,817,135,'Count_Raum',21600,0,583,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (22,818,135,'Count_Vine',21600,0,584,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (23,819,135,'Count_Zaebos',21600,0,585,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (24,1131,135,'Duke_Berith',21600,0,806,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (25,1133,135,'Duke_Gomory',21600,0,807,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (26,1135,135,'Duke_Scox',21600,0,809,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (27,1154,135,'Dynamis_Lord',0,128,824,81000,0,93,95,0);
INSERT INTO mob_groups VALUES (28,1178,135,'Effigy_Prototype',0,128,842,1000,1000,93,95,0);
INSERT INTO mob_groups VALUES (39,2047,135,'Icon_Prototype',0,128,2191,1000,1000,93,95,0);
INSERT INTO mob_groups VALUES (40,2232,135,'Kindred_Bard',0,128,1899,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (51,2233,135,'Kindred_Beastmaster',0,128,1901,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (52,2234,135,'Kindred_Black_Mage',0,128,1904,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (53,2235,135,'Kindred_Dark_Knight',0,128,1907,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (54,2236,135,'Kindred_Dragoon',0,128,1909,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (55,2237,135,'Kindred_Monk',0,128,1911,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (56,2238,135,'Kindred_Ninja',0,128,1913,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (57,2239,135,'Kindred_Paladin',0,128,1915,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (58,2240,135,'Kindred_Ranger',0,128,1917,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (59,2241,135,'Kindred_Red_Mage',0,128,1919,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (60,2242,135,'Kindred_Samurai',0,128,1921,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (61,2243,135,'Kindred_Summoner',0,128,1924,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (62,2244,135,'Kindreds_Avatar',0,128,0,3300,1000,84,86,0);
INSERT INTO mob_groups VALUES (63,2246,135,'Kindreds_Vouivre',0,128,0,3300,0,84,86,0);
INSERT INTO mob_groups VALUES (64,2247,135,'Kindreds_Wyvern',0,128,0,3300,1000,84,86,0);
INSERT INTO mob_groups VALUES (65,2248,135,'Kindred_Thief',0,128,1926,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (66,2249,135,'Kindred_Warrior',0,128,1929,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (67,2250,135,'Kindred_White_Mage',0,128,1931,5500,0,93,95,0);
INSERT INTO mob_groups VALUES (68,2263,135,'King_Zagan',21600,0,1938,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (69,2570,135,'Marquis_Andras',21600,0,2207,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (70,2572,135,'Marquis_Cimeries',21600,0,2208,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (71,2573,135,'Marquis_Decarabia',21600,0,2209,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (72,2575,135,'Marquis_Gamygyn',21600,0,2211,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (73,2576,135,'Marquis_Nebiros',21600,0,2212,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (74,2577,135,'Marquis_Orias',21600,0,2213,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (75,2578,135,'Marquis_Sabnak',21600,0,2214,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (76,2816,135,'Nebiross_Avatar',21600,128,0,7500,0,84,86,0);
INSERT INTO mob_groups VALUES (77,3198,135,'Prince_Seere',21600,0,2827,12500,0,93,95,0);
INSERT INTO mob_groups VALUES (78,3467,135,'Satellite_Claymores',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (79,3468,135,'Satellite_Daggers',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (80,3469,135,'Satellite_Great_Axes',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (81,3470,135,'Satellite_Guns',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (82,3471,135,'Satellite_Hammers',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (83,3472,135,'Satellite_Horns',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (84,3473,135,'Satellite_Knuckles',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (85,3474,135,'Satellite_Kunai',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (86,3475,135,'Satellite_Longbows',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (87,3476,135,'Satellite_Longswords',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (88,3477,135,'Satellite_Scythes',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (89,3478,135,'Satellite_Shield',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (90,3479,135,'Satellite_Spears',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (91,3480,135,'Satellite_Staves',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (92,3481,135,'Satellite_Tabars',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (93,3482,135,'Satellite_Tachi',0,128,0,4000,0,93,95,0);
INSERT INTO mob_groups VALUES (94,3759,135,'Statue_Prototype',0,128,1434,1000,1000,93,95,0);
INSERT INTO mob_groups VALUES (95,3941,135,'Tombstone_Prototype',0,128,4073,1000,1000,93,95,0);
INSERT INTO mob_groups VALUES (96,4145,135,'Vanguard_Dragon',0,128,3747,30000,0,93,95,0);
INSERT INTO mob_groups VALUES (97,4149,135,'Vanguard_Eye',0,128,3765,1500,1500,84,86,0);
INSERT INTO mob_groups VALUES (98,4464,135,'Yang',0,128,0,17000,0,93,95,0);
INSERT INTO mob_groups VALUES (99,4473,135,'Ying',0,128,0,17000,0,93,95,0);
INSERT INTO mob_groups VALUES (100,4487,135,'Zagans_Wyvern',0,128,0,7500,2000,84,86,0);

-- make sure avatar icons spawn
UPDATE mob_groups SET spawntype=0 WHERE zoneid=135 and name='Vanguard_Eye';

-- make it so tombstones respawn
UPDATE mob_groups SET respawntime=3600 WHERE zoneid=135 and name='Vanguard_Eye';

-- Fix the long list of mob_spawn_points that don't have "new" group ids
UPDATE mob_groups, mob_spawn_points SET mob_spawn_points.groupid=mob_groups.groupid WHERE mob_groups.name=mob_spawn_points.mobname and mob_groups.zoneid=135 and mobid>=17330177 and mobid<=17330919;

-- DELETE FROM mob_droplist WHERE dropId in (SELECT distinct dropId FROM mob_groups WHERE zoneid=135);
-- Handled Animated Weapon Droppools in mob_groups
DELETE FROM mob_droplist WHERE dropid=1442; -- Delete Kindred drop pool
DELETE FROM mob_droplist WHERE dropid=2561; -- Vanguard Eye Pool

-- Keep DSP pools
UPDATE mob_groups SET dropid=1626 WHERE name='Marquis_Decarabia';
INSERT INTO mob_droplist VALUES (1626,0,0,1000,11465,90); -- BLU Piece
UPDATE mob_groups SET dropid=715 WHERE name='Duke_Gomory';
UPDATE mob_groups SET dropid=519 WHERE name='Count_Raum';
INSERT INTO mob_droplist VALUES (519,0,0,1000,11305,90); -- DNC Piece
UPDATE mob_groups SET dropid=2021 WHERE name='Prince_Seere';
UPDATE mob_groups SET dropid=1630 WHERE name='Marquis_Orias';
UPDATE mob_groups SET dropid=714 WHERE name='Duke_Berith';
INSERT INTO mob_droplist VALUES (714,0,0,1000,11480,90); -- SCH Pice
UPDATE mob_groups SET dropid=1631 WHERE name='Marquis_Sabnak';
UPDATE mob_groups SET dropid=521 WHERE name='Count_Zaebos';
UPDATE mob_groups SET dropid=1624 WHERE name='Marquis_Andras';
INSERT INTO mob_droplist VALUES (1624,0,0,1000,11471,90); -- PUP Piece
UPDATE mob_groups SET dropid=1625 WHERE name='Marquis_Cimeries';
INSERT INTO mob_droplist VALUES (1625,0,0,1000,11468,90); -- COR Piece
UPDATE mob_groups SET dropid=717 WHERE name='Duke_Scox';
UPDATE mob_groups SET dropid=1452 WHERE name='King_Zagan';
UPDATE mob_groups SET dropid=520 WHERE name='Count_Vine';
UPDATE mob_groups SET dropid=1628 WHERE name='Marquis_Gamygyn';
UPDATE mob_groups SET dropid=1629 WHERE name='Marquis_Nebiros';

-- Kindred Drop Pools
INSERT INTO mob_droplist VALUES (1442,1,2,1,1450,337); -- Jadeshell
INSERT INTO mob_droplist VALUES (1442,1,2,1,1453,333); -- M Silver Piece
INSERT INTO mob_droplist VALUES (1442,1,2,1,1456,333); -- 100 Byne
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1449,500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1452,500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1455,500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1449,250); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1452,250); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (1442,0,0,1000,1455,250); -- one_byne_bill
INSERT INTO mob_droplist VALUES (1442,1,1,10,11305,50); -- etoile_casaque
INSERT INTO mob_droplist VALUES (1442,1,1,10,11465,50); -- mirage_keffiyeh
INSERT INTO mob_droplist VALUES (1442,1,1,10,11468,50); -- commodore_tricorne
INSERT INTO mob_droplist VALUES (1442,1,1,10,11471,50); -- pantin_taj
INSERT INTO mob_droplist VALUES (1442,1,1,10,11480,50); -- argute_mortarboard
INSERT INTO mob_droplist VALUES (1442,1,1,10,15073,50); -- melee_crown
INSERT INTO mob_droplist VALUES (1442,1,1,10,15075,50); -- sorcerers_petasos
INSERT INTO mob_droplist VALUES (1442,1,1,10,15076,50); -- duelists_chapeau
INSERT INTO mob_droplist VALUES (1442,1,1,10,15079,50); -- abyss_burgeonet
INSERT INTO mob_droplist VALUES (1442,1,1,10,15083,50); -- saotome_kabuto
INSERT INTO mob_droplist VALUES (1442,1,1,10,15085,50); -- wyrm_armet
INSERT INTO mob_droplist VALUES (1442,1,1,10,15086,50); -- summoners_horn
INSERT INTO mob_droplist VALUES (1442,1,1,10,15087,50); -- warriors_lorica
INSERT INTO mob_droplist VALUES (1442,1,1,10,15093,50); -- valor_surcoat
INSERT INTO mob_droplist VALUES (1442,1,1,10,15097,50); -- scouts_jerkin
INSERT INTO mob_droplist VALUES (1442,1,1,10,15104,50); -- clerics_mitts
INSERT INTO mob_droplist VALUES (1442,1,1,10,15107,50); -- assassins_armlets
INSERT INTO mob_droplist VALUES (1442,1,1,10,15110,50); -- monster_gloves
INSERT INTO mob_droplist VALUES (1442,1,1,10,15114,50); -- koga_tekko
INSERT INTO mob_droplist VALUES (1442,1,1,10,15126,50); -- bards_cannions
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Paladin' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Dark_Knight' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Beastmaster' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Ranger' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Bard' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Samurai' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Ninja' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Summoner' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Dragoon' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_White_Mage' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Black_Mage' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Red_Mage' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Warrior' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Monk' and zoneid=135;
UPDATE mob_groups SET dropId=1442 WHERE name='Kindred_Thief' and zoneid=135;

-- Vanguard Eye Drop Pools
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 4248, 20); -- copy_of_ginuvas_battle_theory
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1455, 500); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1452, 500); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1449, 500); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1455, 250); -- one_byne_bill
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1452, 250); -- ordelle_bronzepiece
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 1449, 250); -- tukuku_whiteshell
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 749, 50); -- mythril_beastcoin
INSERT INTO mob_droplist VALUES (2561, 0, 0, 1000, 748, 20); -- gold_beastcoin
UPDATE mob_groups SET dropId=2561 WHERE name='Vanguard_Eye' and zoneid=135;
