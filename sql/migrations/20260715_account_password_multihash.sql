-- Required before enabling bcrypt/Argon2 account hashes in the auth server.
-- This is a metadata-only widening for the existing account.password column.
ALTER TABLE `account`.`account`
    MODIFY COLUMN `password` VARCHAR(255) NOT NULL DEFAULT '';
