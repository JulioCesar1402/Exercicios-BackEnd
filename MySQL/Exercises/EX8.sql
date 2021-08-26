USE sakila;
DELIMITER $$

CREATE PROCEDURE ShowDescriptionMovie(
    IN film_name VARCHAR(300),
    OUT media_aluguel_em_dias DOUBLE
)
BEGIN
    SELECT release_year INTO media_aluguel_em_dias
    FROM sakila.film
    WHERE title = film_name;
END $$

DELIMITER ;

-- Como usar:

CALL ShowDescriptionMovie('ACADEMY DINOSAUR', @media_de_dias);
SELECT @media_de_dias;

-- # ==========================================================

USE sakila;
DELIMITER $$

CREATE PROCEDURE NameCostumerGenerator(INOUT film_name VARCHAR(300))
BEGIN
    SELECT CONCAT(first_name, ' ', film_name, ' ', last_name)
    INTO film_name
    from sakila.customer
    limit 1;
END $$

DELIMITER ;

-- Como usar:

SELECT 'Pereira' INTO @movie_title;
CALL NameCostumerGenerator(@movie_title);
SELECT @movie_title;

-- # ==============================================


-- * Monte uma procedure que exiba os 10 atores mais populares, baseado em sua quantidade de filmes. Essa procedure não deve receber parâmetros de entrada ou saída e, quando chamada, deve exibir o id do ator ou atriz e a quantidade de filmes em que atuaram.

Use sakila;
Delimiter $$

create PROCEDURE ExibaOs10AtoresMaisPopulares()
BEGIN
  Select actor_id, count(film_id) as qty
  from sakila.film_actor
  GROUP BY actor_id
  ORDER BY qty DESC
  limit 10;
end $$

Delimiter;

 USE sakila;
DELIMITER $$

CREATE PROCEDURE ShowTop10Actors()
BEGIN
    SELECT actor_id, COUNT(*) AS 'quantidade de filmes'
    FROM film_actor
    GROUP BY actor_id
    ORDER BY COUNT(*) DESC
    LIMIT 10;
END $$

DELIMITER ;

-- Como usar:

CALL ShowTop10Actors();

-- * Monte uma procedure que receba como parâmetro de entrada o nome da categoria desejada em uma string e que exiba o id do filme , seu titulo , o id de sua categoria e o nome da categoria selecionada. Use as tabelas film , film_category e category para montar essa procedure.


-- * Monte uma procedure que receba o email de um cliente como parâmetro de entrada e diga se o cliente está ou não ativo, através de um parâmetro de saída.




























-- # ==============================================