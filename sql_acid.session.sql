CREATE TABLE accounts(
    id VARCHAR(100),
    name VARCHAR(100) NOT NULL,
    balance BIGINT NOT NULL,
    PRIMARY KEY (id)
);
--- 
DESC accounts;
--- 
ALTER TABLE accounts
MODIFY id VARCHAR(100) NOT NULL;