-- * Monte uma query que exiba o id do ator , nome do ator e id do filme em que ele já atuou usando as tabelas actor e film_actor .

SELECT A.actor_id, A.first_name, F.film_id
FROM sakila.actor A
INNER JOIN sakila.film_actor F
ON A.actor_id = F.actor_id;

-- * Use o JOIN para exibir o nome , sobrenome e endereço de cada um dos funcionários do banco. Use as tabelas staff e address .

SELECT S.first_name, S.last_name, A.address
from sakila.staff  S
INNER JOIN sakila.address A
ON S.address_id = A.address_id;

-- * Exiba o id do cliente , nome e email dos primeiros 100 clientes, ordenados pelo nome em ordem decrescente, juntamente com o id do endereço e o nome da rua onde o cliente mora. Essas informações podem ser encontradas nas tabelas customer e address .

Select C.customer_id, C.first_name, C.email, C.address_id, A.address
from sakila.customer C
INNER JOIN sakila.address A
ON C.address_id = A.address_id
ORDER BY C.first_name DESC
limit 100;
Select * from sakila.customer;
Select * from sakila.address;

-- * Exiba o nome , email , id do endereço , endereço e distrito dos clientes que moram no distrito da California e que contêm "rene" em seus nomes. As informações podem ser encontradas nas tabelas address e customer .

Select C.first_name, C.email, A.address, A.district
from sakila.address A
INNER JOIN sakila.customer C
On C.address_id = A.address_id
where A.district = 'California'
and C.first_name like '%rene%';
Select * from sakila.customer;
Select * from sakila.address;

-- * Exiba o nome e a quantidade de endereços dos clientes cadastrados. Ordene seus resultados por nomes de forma decrescente. Exiba somente os clientes ativos. As informações podem ser encontradas na tabela address e customer .

Select C.first_name, COUNT(A.address) AS `quantidade de endereço`
from sakila.customer C
INNER join sakila.address A
ON C.address_id = A.address_id
WHERE C.active = 1
GROUP BY C.first_name
ORDER BY C.first_name DESC;
Select * from sakila.address;
Select * from sakila.customer;


-- * Monte uma query que exiba o nome , sobrenome e a média de valor ( amount ) paga aos funcionários no ano de 2006. Use as tabelas payment e staff . Os resultados devem estar agrupados pelo nome e sobrenome do funcionário.

Select S.first_name, S.last_name, AVG(P.amount)
from sakila.payment P
INNER JOIN sakila.staff S
ON S.staff_id = P.staff_id
where year(P.payment_date) = 2006
GROUP BY S.first_name, S.last_name;
Select * from sakila.payment;
Select * from sakila.staff;


-- * Monte uma query que exiba o id do ator , nome , id do filme e título do filme , usando as tabelas actor , film_actor e film . Dica: você precisará fazer mais de um JOIN na mesma query .

Select
  A.actor_id, A.first_name, F.film_id, F.title
from
  sakila.actor A
    INNER JOIN
      sakila.film_actor FA ON A.actor_id = FA.actor_id
    INNER JOIN
      sakila.film F ON F.film_id = FA.film_id;
Select * from sakila.actor;
Select * from sakila.film_actor;
Select * from sakila.film;

-- # ====================================================================

  SELECT
      c.customer_id,
      c.first_name,
      c.last_name,
      a.actor_id,
      a.first_name,
      a.last_name
  FROM sakila.customer AS c
  LEFT JOIN sakila.actor AS a
  ON c.last_name = a.last_name
  ORDER BY c.last_name;

  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM sakila.customer AS c
RIGHT JOIN sakila.actor AS a
ON c.last_name = a.last_name
ORDER BY c.last_name;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM sakila.customer AS c
INNER JOIN sakila.actor AS a
ON c.last_name = a.last_name
ORDER BY c.last_name;

-- # ====================================================================

SELECT t1.title, t1.replacement_cost, t2.title, t2.replacement_cost
FROM sakila.film AS t1, sakila.film AS t2
WHERE t1.length = t2.length;

-- # ====================================================================

-- * Queremos saber os ids e custos de substituição dos filmes que possuem o mesmo custo de substituição.

Select t1.film_id, t1.replacement_cost, t2.film_id, t2.replacement_cost
from sakila.film as t1, sakila.film as t2
where t1.replacement_cost = t2.replacement_cost;

-- * Exiba o título e a duração de empréstimo dos filmes que possuem a mesma duração. Exiba apenas os filmes com a duração de empréstimo entre 2 e 4 dias.

select t1.title, t1.rental_duration, t2.title, t2.rental_duration
from sakila.film as t1, sakila.film as t2
where t1.rental_duration = t2.rental_duration
and t2.rental_duration between 2 and 4;

-- # ====================================================================

-- * Todos os funcionários foram promovidos a atores. Monte uma query que exiba a união da tabela staff com a tabela actor , exibindo apenas o nome e o sobrenome . Seu resultado não deve excluir nenhum funcionário ao unir as tabelas.

select first_name, last_name from sakila.staff
UNION ALL
select first_name, last_name from sakila.actor;

-- * Monte uma query que una os resultados das tabelas customer e actor , exibindo os nomes que contêm a palavra "tracy" na tabela customer e os que contêm "je" na tabela actor . Exiba apenas os resultados únicos.

Select first_name from sakila.customer
where first_name like '%tracy%'
UNION
Select first_name from sakila.actor
where first_name like '%je%';

-- * Monte uma query que exiba a união dos cinco últimos nomes da tabela actor , o primeiro nome da tabela staff e cinco nomes a partir da 15ª posição da tabela customer . Não permita que dados repetidos sejam exibidos. Ordene os resultados em ordem alfabética.

(SELECT first_name from sakila.actor
ORDER BY actor_id DESC
LIMIT 5)
UNION
(SELECT first_name from sakila.staff
LIMIT 1)
UNION
(SELECT first_name from sakila.customer
LIMIT 5 OFFSET 15)
ORDER BY first_name;

-- * Você quer exibir uma lista paginada com os nomes e sobrenomes de todos os clientes e atores do banco de dados, em ordem alfabética. Considere que a paginação está sendo feita de 15 em 15 resultados e que você está na 4ª página. Monte uma query que simule esse cenário.

(SELECT first_name, last_name FROM sakila.customer
ORDER BY first_name, last_name
LIMIT 60)
UNION
(SELECT first_name, last_name FROM sakila.actor
ORDER BY first_name, last_name
LIMIT 60)
ORDER BY first_name, last_name
LIMIT 15 OFFSET 45;

-- # ====================================================================

SELECT f.title, f.rating
FROM (
    SELECT *
    FROM sakila.film
    WHERE rating = 'R'
) AS f;

SELECT
    address,
    district,
    (
        SELECT city
        FROM sakila.city
        WHERE city.city_id = sakila.address.city_id
    ) AS city
FROM sakila.address;



















-- # ====================================================================
