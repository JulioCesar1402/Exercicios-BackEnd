-- * Como clonar uma tabela
-- ` estrutura:
-- ` CREATE TABLE nome_nova_tb LIKE tabela_a_ser_clonada
-- ` todo Ex:
USE w3schools;
CREATE TABLE new_orders LIKE orders;

-- * criando uma `view` -> tabela temporaria
-- ` estrutura
-- ` CREATE VIEW nome_da_view AS query;
-- # podendo ter funções

CREATE VIEW top_10_customers AS
    SELECT c.customer_id, c.first_name, SUM(p.amount) AS total_amount_spent
    FROM sakila.payment p
    INNER JOIN sakila.customer c ON p.customer_id = c.customer_id
    GROUP BY customer_id
    ORDER BY total_amount_spent DESC
    LIMIT 10;

SELECT * FROM top_10_customers;

-- ` Como apagá-la
-- ` DROP VIEW nome_da_view;

DROP VIEW top_10_customers;

-- todo =============================================================================

USE sakila;
CREATE TABLE noticia(
    noticia_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    historia VARCHAR(300)
) engine = InnoDB;

-- * Algumas das alterações que podem ser feitas em uma tabela.
SELECT * FROM sakila.noticia;
-- Adicionar uma nova coluna
ALTER TABLE noticia ADD COLUMN data_postagem date NOT NULL;

-- Modificar o tipo e propriedades de uma coluna
ALTER TABLE noticia MODIFY noticia_id BIGINT;

-- Adicionar incremento automático a uma coluna
-- (especifique o tipo da coluna + auto_increment)
ALTER TABLE noticia MODIFY noticia_id BIGINT auto_increment;

-- Alterar o tipo e nome de uma coluna
ALTER TABLE noticia CHANGE historia conteudo_postagem VARCHAR(1000) NOT NULL;

-- Dropar/Excluir uma coluna
ALTER TABLE noticia DROP COLUMN data_postagem;

-- Adicionar uma nova coluna após outra
ALTER TABLE noticia ADD COLUMN data_postagem DATETIME NOT NULL AFTER noticia_id;

-- * Uma otima forma de ver as alterações da estrutura
-- ` SHOW COLUMNS FROM nome_da_tabela;
SHOW COLUMNS FROM sakila.noticia;

-- & =====================================================================================================

-- * como DROPar uma tabela
-- ` DROP TABLE nome_da_tabela;
-- ! O COMANDO A BAIXO NÃO VAI FUNCIONAR
-- ? Isso porquê a tabela é uma referencia de chave estrangeira
DROP TABLE sakila.language;

-- * AGORA ESSA SIM VAI SER REMOVIDA
-- ? Uma vez que é sem relação com as demais
DROP TABLE sakila.noticia;

-- todo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE INDEX index_first_name ON sakila.actor(first_name);

SELECT *
FROM sakila.actor
WHERE first_name = 'RITA';

DROP INDEX index_first_name ON sakila.actor;

SELECT *
FROM sakila.actor
WHERE first_name = 'RITA';

-- * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ?1 --------------------------------------------------------------
USE sakila;
CREATE VIEW film_with_categories AS
    SELECT F.title, C.category_id, C.name from sakila.film F
    INNER JOIN sakila.film_category FC
    ON FC.film_id = F.film_id
    INNER JOIN sakila.category C
    ON C.category_id = FC.category_id
    ORDER BY F.title;

SELECT * FROM sakila.film_with_categories;

-- ?2 --------------------------------------------------------------
CREATE VIEW film_info AS
    SELECT A.actor_id,
    CONCAT(A.first_name, ' ', A.last_name)
    AS 'actor',
    F.title
    FROM sakila.actor A
    INNER JOIN sakila.film_actor FA
    ON A.actor_id = FA.actor_id
    INNER JOIN sakila.film F
    ON F.film_id = FA.film_id
    ORDER BY actor;

SELECT * FROM sakila.film_info;

-- ?3 --------------------------------------------------------------

CREATE VIEW address_info AS
    SELECT A.address_id,
    A.address,
    A.district,
    C.city_id,
    C.city
    FROM sakila.address A
    INNER JOIN sakila.city C
    ON A.city_id = C.city_id
    ORDER BY C.city;

SELECT * FROM sakila.address_info;

-- ?3 --------------------------------------------------------------

CREATE VIEW movies_languages AS
    SELECT f.title,
    f.language_id,
    l.name
    FROM sakila.film f
    INNER JOIN sakila.language l
    ON f.language_id = l.language_id;

SELECT * FROM sakila.movies_languages;
