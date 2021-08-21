-- SELECT * from sakila.staff;

-- * como inserir dados a uma tabela:
-- INSERT INTO nome_da_tabela (coluna1, coluna2)
-- VALUES ('valor_coluna1', 'valor_coluna2');

-- *como inserir mais de uma linha a uma tabela:
-- INSERT INTO nome_da_tabela (coluna1, coluna2) VALUES
-- ('valor_1','valor_2'),
-- ('valor_3','valor_4'),
-- ('valor_5','valor_6');

-- -- * inserir valores de umma tabela a outra:
-- INSERT INTO tabelaA (coluna1, coluna2)
--     SELECT tabelaB.coluna1, tabelaB.coluna2
--     FROM tabelaB
--     WHERE tabelaB.nome_da_coluna <> 'algumValor'
--     ORDER BY tabelaB.coluna_de_ordenacao;

-- #=====================================================================

-- *Insira um novo funcionário na tabela sakila.staff .
-- !Para saber quais campos são obrigatórios, clique com o botão direito na tabela sakila.staff e selecione "Table Inspector". Clique na aba "columns" e verifique quais campos aceitam nulos para te guiar. Lembre-se de que valores que são gerados automaticamente não precisam ser inseridos manualmente. Boa explorada!

-- insert into sakila.staff
-- (first_name, last_name, address_id, store_id, username)
-- values
-- ('Julio', 'Cesar', 5, 1, 'monts');

-- *Feito o exercício anterior, vamos agora para o nível 2. Insira dois funcionários novos em apenas uma query .

-- insert into sakila.staff
-- (first_name, last_name, address_id, store_id, username)
-- VALUES
-- ('Pedro', 'Souza', 3, 2, 'ordep'),
-- ('Vitoria', 'Garcia', 73, 1, 'pai');

-- *Selecione os cinco primeiros nomes e sobrenomes da tabela sakila.customer e cadastre essas pessoas como atores na tabela sakila.actor .

insert into sakila.actor (first_name, last_name)
select first_name, last_name
from sakila.customer
limit 5;

-- *Cadastre três categorias de uma vez só na tabela sakila.category .
-- SELECT * from sakila.category;

-- insert into sakila.category (name)
-- values ('aquele lá'), ('ai tem ou outro ali'), ('esse é bom');

-- *Cadastre uma nova loja na tabela sakila.store .

-- select * from sakila.store;

-- INSERT into sakila.store
-- (manager_staff_id, address_id)
-- values (3, 2);

-- #=====================================================================

-- SELECT * from sakila.staff;
-- update sakila.staff
-- set first_name = 'Carlin'
-- WHERE first_name = 'Vitoria';

-- ! um mostro para alteração em massa
-- * -- Opção 1 - Incluindo a lista de condições fixas
-- UPDATE sakila.actor
-- SET first_name = 'JOE'
-- WHERE actor_id IN (1,2,3);

-- * -- Opção 2 - Especificando como cada entrada será alterada individualmente
-- UPDATE sakila.actor
-- SET first_name = (
-- CASE actor_id WHEN 1 THEN 'JOE' -- se actor_id = 1, alterar first_name para 'JOE'
--               WHEN 2 THEN 'DAVIS' -- se actor_id = 2, alterar first_name para 'DAVIS'
--               WHEN 3 THEN 'CAROLINE' -- se actor_id = 3, alterar first_name para 'CAROLINE'
--           ELSE first_name -- em todos os outros casos, mantém-se o first_name
-- END);

-- # ================================================

-- SET SQL_SAFE_UPDATES = 0;
-- * Atualize o primeiro nome de todas as pessoas da tabela sakila.actor que possuem o primeiro nome "JULIA" para "JULES".

-- select * from sakila.actor;
-- update sakila.actor
-- set first_name = 'JULES'
-- where first_name = 'JULIA';

-- * Foi exigido que a categoria "Sci-Fi" seja alterada para "Science Fiction".

-- SELECT * from sakila.category;

-- update sakila.category
-- set name = 'Science Fiction'
-- where name = 'Sci-Fi';

-- * Atualize o valor do aluguel para $25 de todos os filmes com duração maior que 100 minutos e que possuem a classificações "G" , "PG" ou "PG-13" e um custo de substituição maior que $20.

-- select * from sakila.film;

-- update sakila.film
-- set rental_rate = 25
-- where length = 100
-- and rating in ('G', 'PG', 'PG-13')
-- and replacement_cost > 20;

-- * Foi determinado pelo setor financeiro que haverá um reajuste em todos os preços dos filmes, com base em sua duração. Para todos os filmes com duração entre 0 e 100, o valor do aluguel passará a ser $10,00, e o aluguel dos filmes com duração acima de 100 passará a ser de $20,00.

-- SELECT * from sakila.film;

-- UPDATE sakila.film
-- SET rental_rate = (
--   CASE
--       WHEN length BETWEEN 0 AND 100 THEN 10
--       WHEN length > 100 THEN 20
--     ELSE rental_rate
-- END);

-- # ================================================

-- DELETE FROM sakila.actor
-- WHERE first_name = 'GRACE';

-- DELETE FROM sakila.film_actor
-- WHERE actor_id = 7; -- actor_id = 7 é o Id de GRACE

-- DELETE FROM sakila.actor
-- WHERE first_name = 'GRACE';

-- # ================================================

-- * Exclua do banco de dados o ator com o nome de "KARL".
-- select * from sakila.film_actor;
-- select * from sakila.actor;

-- DELETE from sakila.film_actor
-- WHERE actor_id = 12;

-- Delete from sakila.actor
-- WHERE first_name = 'KARL';

-- -- * Exclua do banco de dados os atores com o nome de "MATTHEW".
-- DELETE FROM sakila.film_actor
-- where actor_id in (8, 103, 181);

-- SELECT * from sakila.actor
-- where first_name = 'MATTHEW';

-- DELETE from sakila.actor
-- WHERE first_name = 'MATTHEW';

-- * Exclua da tabela film_text todos os registros que possuem a palavra "saga" em suas descrições.

-- Delete from sakila.film_text
-- where description like '%saga%';

-- * Apague da maneira mais performática possível todos os registros das tabelas film_actor e film_category .

-- TRUNCATE sakila.film_actor;
-- TRUNCATE sakila.film_category;

-- // Inspecione todas as tabelas do banco de dados sakila e analise quais restrições ON DELETE foram impostas em cada uma. Use o Table Inspector para fazer isso (aba DDL).

-- // Exclua o banco de dados e o recrie (use as instruções no início desta aula).




-- # ================================================
