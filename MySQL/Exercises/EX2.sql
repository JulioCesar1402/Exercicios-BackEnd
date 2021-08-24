SELECT * FROM sakila.actor
WHERE actor_id = 101;

SELECT * FROM sakila.film
WHERE length < 50
ORDER BY length;

SELECT * FROM sakila.film
WHERE title <> 'ALIEN CENTER'
AND replacement_cost > 20;

SELECT * FROM sakila.film
WHERE rating = 'G'
OR rating = 'PG'
OR rating = 'PG-13';

SELECT * FROM sakila.rental
WHERE return_date IS NULL;

SELECT * FROM sakila.staff
WHERE active IS TRUE;
-- ! TRUE = 1 FALSE = 0

SELECT * FROM sakila.address
WHERE address2 IS NOT NULL;

SELECT * FROM sakila.film
WHERE title NOT LIKE 'academy%';

-- # =========================================================

-- *Precisamos identificar os dados do cliente com o e-mail LEONARD.SCHOFIELD@sakilacustomer.org .

SELECT * FROM sakila.customer
WHERE email = 'LEONARD.SCHOFIELD@sakilacustomer.org';

-- *Precisamos de um relatório dos nomes dos clientes, em ordem alfabética , que não estão mais ativos no nosso sistema e pertencem à loja com o id = 2 , e não inclua o cliente KENNETH no resultado.

SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM sakila.customer WHERE active = 0
AND store_id = 2 AND first_name <> 'KENNETH'
ORDER BY first_name;

-- todo O setor financeiro quer saber título, descrição, ano de lançamento e valor do custo de substituição ( replacement_cost ), dos 100 filmes com o maior custo de substituição, do valor mais alto ao mais baixo, entre os filmes feitos para menores de idade e que têm o custo mínimo de substituição de $18,00 dólares. Em caso de empate, ordene em ordem alfabética pelo título.

SELECT title, description, release_year, replacement_cost
FROM sakila.film
WHERE rating IN ('G','PG', 'PG-13') AND
replacement_cost > 18
ORDER BY replacement_cost DESC
LIMIT 100;

-- * Quantos clientes estão ativos e na loja 1 ?

SELECT COUNT(active) FROM sakila.customer
WHERE active = true and store_id = 1;

-- *Mostre todos os detalhes dos clientes que não estão ativos na loja 1 .

SELECT * FROM sakila.customer
WHERE active = 0 AND store_id = 1;

-- *Precisamos descobrir quais são os 50 filmes feitos apenas para adultos com a menor taxa de aluguel, para que possamos fazer uma divulgação melhor desses filmes. Em caso de empate, ordene em ordem alfabética pelo título.

SELECT * FROM sakila.film WHERE rating = 'NC-17'
ORDER BY rental_duration
LIMIT 50

-- # =========================================================

-- ! Like ---- se o % for colocado no inicio vai ser para palavras que terminam com, se for no final vai ser para palavras que iniciam com, se for em ambos os lados vai ser palavras que possuem

-- # =========================================================

-- *Mostre todos os detalhes dos filmes que contêm a palavra ace no nome.

SELECT * from sakila.film where title like '%ace%';

-- *Mostre todos os detalhes dos filmes cujas descrições finalizam com china .

SELECT * from sakila.film
where description like '%china';

-- * Mostre todos os detalhes dos dois filmes cujas descrições contêm a palavra girl e o título finaliza com a palavra lord .

SELECT * FROM sakila.film
WHERE description LIKE '%girl%'
AND title LIKE '%lord';

-- * Mostre os dois casos em que, a partir do 4° caractere no título do filme, tem-se a palavra gon .

SELECT title FROM sakila.film
WHERE title LIKE '___gon%';

-- * Mostre o único caso em que, a partir do 4° caractere no título do filme, tem-se a palavra gon e a descrição contém a palavra Documentary .

SELECT * from sakila.film
WHERE title LIKE '___gon%'
AND description LIKE '%Documentary%';

-- * Mostre os dois filmes cujos títulos ou finalizam com academy ou iniciam com mosquito .

SELECT title FROM sakila.film
WHERE title LIKE '%academy'
OR title LIKE 'mosquito%';

--  * Mostre os seis filmes que contêm as palavras monkey e sumo em suas descrições.

SELECT * FROM sakila.film
WHERE description LIKE '%monkey%'
AND description LIKE '%sumo%';

-- # =========================================================

-- ? quem é mais performatica?
-- & 388ms
-- Encontra todos os pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE DATE(payment_date) = '2005-07-31';

-- & 47ms
-- Encontra todos pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-07-31%';

-- & 29ms
-- Encontra um pagamento com dia e hora exatos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-08-20 00:30:52';

-- & 50ms
-- Encontra pagamentos especificando um valor mínimo e um valor máximo para a data
SELECT *
FROM sakila.payment
WHERE payment_date BETWEEN '2005-05-26 00:00:00' AND '2005-05-27 23:59:59';

-- ? payment_date LIKE '2005-08-20 00:30:52' é a vencedora!!!

-- # =========================================================

-- !Teste cada um dos comandos a seguir:
SELECT DATE(payment_date) FROM sakila.payment; -- YYYY-MM-DD
SELECT YEAR(payment_date) FROM sakila.payment; -- Ano
SELECT MONTH(payment_date) FROM sakila.payment; -- Mês
SELECT DAY(payment_date) FROM sakila.payment; -- Dia
SELECT HOUR(payment_date) FROM sakila.payment; -- Hora
SELECT MINUTE(payment_date) FROM sakila.payment; -- Minuto
SELECT SECOND(payment_date) FROM sakila.payment; -- Segundo

-- # =========================================================

-- * Quantos pagamentos temos com a data de retorno 2005-05-25 ? Há múltiplas maneiras possíveis de encontrar a resposta.

SELECT COUNT(payment_id) FROM sakila.payment
WHERE payment_date LIKE '2005-05-25%';

-- * Quantos pagamentos foram feitos entre 01/07/2005 e 22/08/2005 ?

SELECT COUNT(payment_id) FROM sakila.payment
WHERE payment_date BETWEEN '2005-07-01%' AND '2005-08-22%';

-- * Usando a tabela rental , extraia data, ano, mês, dia, hora, minuto e segundo dos registros com rental_id = 10330. Utilize a coluna rental_date para extrair as informações.

SELECT DATE(rental_date),
YEAR(rental_date),
MONTH(rental_date),
DAY(rental_date),
HOUR(rental_date),
MINUTE(rental_date),
SECOND(rental_date)
FROM sakila.rental
WHERE rental_id = 10330;

-- * Monte uma query que retorne todos os dados do pagamento feito no dia 28/07/2005 a partir das 22 horas .

SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-07-28%'
AND HOUR(payment_date) = 22;

-- # =========================================================
