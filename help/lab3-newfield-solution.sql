-- If you cannot install the extension check the PostgreSQL instance
-- you are using allows you to install extensions.
CREATE EXTENSION IF NOT EXISTS citext;

ALTER TABLE Customer
ADD EmailAddress CITEXT DEFAULT NULL;