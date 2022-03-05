SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `char_distribution_xp` (
    `charid` int(10) unsigned NOT NULL,
    `war` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `mnk` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `whm` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `blm` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `rdm` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `thf` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `pld` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `drk` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `bst` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `brd` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `rng` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `sam` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `nin` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `drg` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `smn` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `blu` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `cor` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `pup` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `dnc` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `sch` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `geo` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `run` tinyint(2) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=95;