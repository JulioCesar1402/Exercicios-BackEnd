CREATE FULLTEXT INDEX index_category
ON sakila.category(name);

-- Após ter criado o índice, mensure o custo com a seguinte query:
SELECT *
FROM sakila.category
WHERE MATCH(name) AGAINST('action');
-- ` feito no workbench para ver o
-- ` execution plan
-- ? Query cost: 0.35

-- * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=

DROP INDEX index_category on sakila.category;

-- Após ter excluído o índice, mensure o custo com a seguinte query:
SELECT *
FROM sakila.category
WHERE name LIKE '%action%';
-- ` feito no workbench para ver o
-- ` execution plan
-- ? Query cost: 1.85

-- # ==============================================================

CREATE INDEX postal_code_index
ON sakila.address(postal_code);

-- Mensure o custo com index na seguinte query:
SELECT *
FROM sakila.address
WHERE postal_code = '36693';
-- ` feito no workbench para ver o
-- ` execution plan
-- ? Query cost: 0.35

-- Mensure o custo sem index na seguinte query:

DROP INDEX postal_code_index on sakila.address;

SELECT *
FROM sakila.address
WHERE postal_code = '36693';
-- ` feito no workbench para ver o
-- ` execution plan
-- ? Query cost: 61.80

-- * ==============================================================
SHOW DATABASES;
USE hr;

SHOW TABLES;

SHOW COLUMNS FROM locations;

ALTER TABLE hr.locations
CHANGE STREET_ADDRESS address
VARCHAR(40) NOT NULL;

-- # ==============================================================
SHOW COLUMNS FROM hr.regions;

ALTER TABLE hr.regions
CHANGE REGION_NAME region
VARCHAR(25) DEFAULT NULL;

-- # ==============================================================

SHOW COLUMNS FROM hr.countries;
ALTER TABLE hr.countries
CHANGE country_name country
VARCHAR(40) NOT NULL;