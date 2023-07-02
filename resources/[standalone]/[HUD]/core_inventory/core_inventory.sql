CREATE TABLE `coreinventories` (
  `name` varchar(100) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `players` ADD `inventorysettings` LONGTEXT NULL DEFAULT NULL;

ALTER TABLE `coreinventories` ADD CONSTRAINT name_pk PRIMARY KEY (`name`);
