ALTER TABLE sandbox
  ADD COLUMN active CHAR(1) NOT NULL DEFAULT 'y' AFTER url,
  ADD COLUMN reported DATETIME DEFAULT NULL AFTER active,
  ADD COLUMN css TEXT NOT NULL DEFAULT "" AFTER javascript,
  ADD COLUMN settings TEXT NOT NULL DEFAULT "",
  ADD COLUMN active VARCHAR(1) DEFAULT 'y',
  ADD COLUMN reported DATETIME DEFAULT NULL;
ALTER TABLE ownership
  ADD COLUMN email VARCHAR(255) NOT NULL DEFAULT "",
  ADD COLUMN last_login DATETIME NOT NULL,
  ADD COLUMN created DATETIME NOT NULL,
  ADD COLUMN updated DATETIME NOT NULL;
CREATE TABLE forgot_tokens (
  owner_name VARCHAR(255) NOT NULL,
  token VARCHAR(255) NOT NULL,
  expires DATETIME NOT NULL,
  created DATETIME NOT NULL,
  KEY `index_expires` (`expires`),
  KEY `index_token_expires` (`token`,`created`,`expires`)
);
ALTER TABLE owners
  ADD COLUMN last_updated DATETIME NOT NULL,
  ADD INDEX `last_updated` (`name`, `last_updated`);
