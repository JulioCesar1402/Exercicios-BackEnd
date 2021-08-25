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