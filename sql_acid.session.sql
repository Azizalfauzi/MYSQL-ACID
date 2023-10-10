--- ATOMICITY
---
DROP TABLE accounts;
---
CREATE TABLE accounts(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    balance BIGINT NOT NULL,
    PRIMARY KEY (id)
) Engine = InnoDb;
--- 
DESC accounts;
--- 
ALTER TABLE accounts
MODIFY id VARCHAR(100) NOT NULL;
---
START TRANSACTION;
---
INSERT INTO accounts(id, name, balance)
VALUES('aziz', 'Aziz Alfa', 1000000);
---
SELECT *
FROM accounts;
---
INSERT INTO accounts(id, name, balance)
VALUES('betta', 'Betta Adi', 1500000);
---
COMMIT;
--- ATOMICITY FAILED
START TRANSACTION;
---
SELECT *
FROM accounts;
---
DELETE FROM accounts
WHERE id = 'aziz';
--- 
DELETE FROM accounts
WHERE id = 'betta';
---
ROLLBACK;
--- CONSISTENCY
START TRANSACTION;
---
SELECT *
FROM accounts;
---
DESC accounts;
---
UPDATE accounts
SET name = "Zuhaha"
WHERE id = "aziz";
---
COMMIT;
--- ISOLATION
START TRANSACTION;
----
SELECT *
FROM accounts
WHERE id IN ('aziz', 'betta') FOR
UPDATE;
---
UPDATE accounts
SET balance = balance - 50000
WHERE id = 'aziz';
---
UPDATE accounts
SET balance = balance + 50000
WHERE id = 'betta';
COMMIT;
SELECT *
FROM accounts;
--- DURABILITY
START TRANSACTION;
---
SELECT *
FROM accounts
WHERE id IN('aziz', 'betta') FOR
UPDATE;
----
UPDATE accounts
SET balance = balance - 50000
WHERE id = 'aziz';
---
SELECT * FROM accounts;