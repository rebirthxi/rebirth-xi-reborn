-- Aspidochelone

-- HP to 6000 from 15000
UPDATE mob_groups t
SET t.HP = 60000
WHERE t.groupid = 7
  AND t.zoneid = 128;

-- Level to 90 from 85, small bump for difficulty
UPDATE mob_groups t
SET t.minLevel = 90,
    t.maxLevel = 90
WHERE t.groupid = 7
  AND t.zoneid = 128;

-- Fafnir

-- Level to 92 from 90, small bump for difficulty
UPDATE mob_groups t
SET t.minLevel = 92,
    t.maxLevel = 92
WHERE t.groupid = 5
  AND t.zoneid = 154;

-- Nidhogg

-- Level to 95 from 90, small bump for difficulty
UPDATE mob_groups t
SET t.minLevel = 95,
    t.maxLevel = 95
WHERE t.groupid = 6
  AND t.zoneid = 154;

-- Behemoth

-- Level to 80 from 70, now retail accurate?
UPDATE mob_groups t
SET t.minLevel = 80,
    t.maxLevel = 80
WHERE t.groupid = 9
  AND t.zoneid = 127;

-- King Behemoth

-- Level to 90 from 85, small bump for difficulty
UPDATE mob_groups t
SET t.minLevel = 90,
    t.maxLevel = 90
WHERE t.groupid = 10
  AND t.zoneid = 127;

-- Tiamat

-- Level up to 100 from 95
UPDATE xidb.mob_groups t
SET t.minLevel = 100,
    t.maxLevel = 100
WHERE t.groupid = 46
  AND t.zoneid = 7;

-- Vrtra

-- Level up to 100 from 95
UPDATE xidb.mob_groups t
SET t.minLevel = 100,
    t.maxLevel = 100
WHERE t.groupid = 37
  AND t.zoneid = 190;

-- Jormungand

-- Level up to 100 from
UPDATE xidb.mob_groups t
SET t.minLevel = 100,
    t.maxLevel = 100
WHERE t.groupid = 40
  AND t.zoneid = 5;

-- Cerberus

-- Level up to 90 from 85
UPDATE xidb.mob_groups t
SET t.minLevel = 90,
    t.maxLevel = 90
WHERE t.groupid = 37
  AND t.zoneid = 61;

-- Khimaira

-- Level up to 90 from 85
UPDATE xidb.mob_groups t
SET t.minLevel = 90,
    t.maxLevel = 90
WHERE t.groupid = 59
  AND t.zoneid = 79;

-- Hydra

-- Level up to 85 from 80
UPDATE xidb.mob_groups t
SET t.minLevel = 85,
    t.maxLevel = 85
WHERE t.groupid = 38
  AND t.zoneid = 51;
