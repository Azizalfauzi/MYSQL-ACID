--- ATOMICITY SUCCESS
---
DROP TABLE accounts;
---
CREATE TABLE accounts(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    balance BIGINT NOT NULL,
    PRIMARY KEY (id)
);
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
SELECT * FROM accounts;
---
DELETE FROM accounts
WHERE id = 'aziz';
--- 
DELETE FROM accounts
WHERE id = 'betta';
---
ROLLBACK;
