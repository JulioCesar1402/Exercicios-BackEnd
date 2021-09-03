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

use sakila;
DELIMITER $$

CREATE PROCEDURE ShowMovieDetailsFromCategory(IN film_category_string VARCHAR(100))
BEGIN
    SELECT f.film_id, f.title, fc.category_id, c.name
    FROM sakila.film f
    INNER JOIN sakila.film_category fc
    ON fc.film_id = f.film_id
    INNER JOIN sakila.category c
    ON c.category_id = fc.category_id
    WHERE c.name = film_category_string;
END $$

DELIMITER ;
use sakila;
CALL ShowMovieDetailsFromCategory('Action');


-- * Monte uma procedure que receba o email de um cliente como parâmetro de entrada e diga se o cliente está ou não ativo, através de um parâmetro de saída.

USE sakila;
DELIMITER $$

CREATE PROCEDURE ShowCustomerActive
(in email_customer VARCHAR(200), OUT active_customer INT)
BEGIN
    SELECT active INTO active_customer
    FROM sakila.customer
    WHERE email = email_customer;
END $$
DELIMITER;

CALL ShowCustomerActive('MARY.SMITH@sakilacustomer.org', @active);
SELECT @active;

-- # =========================================================================================

USE sakila;
DELIMITER $$

CREATE PROCEDURE ShouLengthWithInANDOut(
    IN film_name VARCHAR(300),
    OUT length1 DOUBLE
)
BEGIN
    SELECT LENGTH(film_name)
    INTO length1;
END $$

DELIMITER ;

-- Como usar:

CALL ShouLengthWithInANDOut('ACADEMY DINOSAUR', @length1);
SELECT @length1;

-- # ==========================================================================================

USE sakila;
DELIMITER $$

CREATE PROCEDURE ShouLengthWithInOut(INOUT film_name VARCHAR(300))
BEGIN
    SELECT LENGTH(film_name)
    INTO film_name;
END $$

DELIMITER ;

-- Como usar:

SELECT 'ACADEMY DINOSAUR' INTO @movie_title;
CALL ShouLengthWithInOut(@movie_title);
SELECT @movie_title;

-- # ==============================================

-- * Utilizando a tabela sakila.payment , monte uma function que retorna a quantidade total de pagamentos feitos até o momento por um determinado customer_id .

USE sakila;
DELIMITER $$

CREATE FUNCTION ReturnTotalPaymentQTY(customerId DOUBLE)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE totalPaymentQTY INT;
    SELECT COUNT(*) FROM sakila.payment
    WHERE customer_id = customerId
    INTO totalPaymentQTY;
    RETURN totalPaymentQTY;
END $$
DELIMITER ;

SELECT ReturnTotalPaymentQTY(5);


-- * Crie uma function que, dado o parâmetro de entrada inventory_id , retorna o nome do filme vinculado ao registro de inventário com esse id.

USE sakila;
DELIMITER $$

CREATE FUNCTION ReturnMovieTitle(InventoryId DOUBLE)
RETURNS VARCHAR(100) READS SQL DATA
BEGIN
    DECLARE MovieTitle VARCHAR(200);
    SELECT title FROM sakila.film
    WHERE film_id IN (
        SELECT film_id FROM sakila.inventory
        WHERE inventory_id = InventoryId
    ) INTO MovieTitle;
    RETURN MovieTitle;
END $$
DELIMITER ;

SELECT ReturnMovieTitle(9);

-- * Crie uma function que receba uma determinada categoria de filme em formato de texto (ex: 'Action' , 'Horror' ) e retorna a quantidade total de filmes registrados nessa categoria.

USE sakila;
DELIMITER $$

CREATE FUNCTION ReturnTotalMoviesQTYFunc(MovieCategory VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE TotalMovies INT;
    SELECT COUNT(*) FROM sakila.film_category
    WHERE category_id IN (
        SELECT category_id FROM sakila.category
        WHERE `name` = MovieCategory
    )
    INTO TotalMovies;
    RETURN TotalMovies;
END $$
DELIMITER ;

SELECT ReturnTotalMoviesQTYFunc('ACTION') AS QTY;

-- # =======================================================

USE rede_social;

DELIMITER $$
CREATE TRIGGER trigger_perfil_insert
    BEFORE INSERT ON perfil
    FOR EACH ROW
BEGIN
    SET NEW.ultima_atualizacao = NOW(),
        NEW.acao = 'INSERT';
END $$
DELIMITER ;

INSERT INTO perfil(saldo) VALUES (97800);

SELECT * FROM perfil;

-- & +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++======

USE rede_social;

DELIMITER $$
CREATE TRIGGER trigger_perfil_update
    BEFORE UPDATE ON perfil
    FOR EACH ROW
BEGIN
    SET NEW.ultima_atualizacao = NOW(),
        NEW.acao = 'UPDATE';
END $$
DELIMITER ;

UPDATE perfil
SET saldo = 0
WHERE perfil_id = 1;

SELECT * FROM perfil;

-- & +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

USE rede_social;

DELIMITER $$
CREATE TRIGGER trigger_perfil_delete
    AFTER DELETE ON perfil
    FOR EACH ROW
BEGIN
    INSERT INTO log_perfil(acao, data_acao)
    VALUES ('exclusão', NOW());
END $$
DELIMITER ;

DELETE FROM perfil WHERE perfil_id = 3;

SELECT * FROM log_perfil;

-- # =======================================================================

-- * Crie um TRIGGER que, a cada nova inserção feita na tabela carros , defina o valor da coluna data_atualizacao para o momento do ocorrido, a acao para 'INSERÇÃO' e a coluna disponivel_em_estoque para 1 .

USE betrybe_automoveis;
DELIMITER $$
CREATE TRIGGER trigger_add_car
    BEFORE INSERT ON carros
    FOR EACH ROW
BEGIN
    SET NEW.data_atualizacao = NOW(),
        NEW.acao = 'INSERÇÃO',
        NEW.disponivel_em_estoque = 1;
END $$
DELIMITER ;

INSERT INTO carros(preco) VALUES (0);

SELECT * FROM perfil;

-- * Crie um TRIGGER que, a cada atualização feita na tabela carros , defina o valor da coluna data_atualizacao para o momento do ocorrido e a acao para 'ATUALIZAÇÃO' .

USE betrybe_automoveis;
DELIMITER $$

CREATE TRIGGER trigger_update_car
    BEFORE UPDATE ON carros
    FOR EACH ROW
BEGIN
    SET NEW.data_atualizacao = NOW(),
    NEW.acao = 'ATUALIZAÇÃO';
END $$

DELIMITER ;

UPDATE carros
SET preco = 5
WHERE id_carro = 1;


-- * Crie um TRIGGER que, a cada exclusão feita na tabela carros , envie para a tabela log_operacoes as informações do tipo_operacao como 'EXCLUSÃO' e a data_ocorrido como o momento da operação.

USE betrybe_automoveis;
DELIMITER $$

CREATE TRIGGER trigger_delete_car
    AFTER DELETE ON carros
    FOR EACH ROW
BEGIN
    iNSERT INTO log_operacoes(tipo_operacao, data_ocorrido)
    VALUES('EXCLUSÃO', NOW());
END $$
DELIMITER ;


DELETE FROM carros WHERE id_carro = 1;
SELECT * FROM log_operacoes;

-- # =======================================================================
-- * Crie um Trigger para INSERT que deve definir o valor do campo release_year da tabela movies como o ano atual de forma dinâmica, sem haver a necessidade de digitar manualmente o valor do ano. Além disso, crie um outro Trigger para INSERT que adiciona um novo registro na tabela movies_logs , informando o movie_id do filme que acaba de ser inserido na tabela movies , a executed_action como 'INSERT' e a log_date como a data atual.

USE BeeMovies;
DELIMITER $$

CREATE TRIGGER trigger_insert_year
    BEFORE INSERT ON movies
    FOR EACH ROW
BEGIN
    SET NEW.release_year = YEAR(NOW());
END $$

CREATE TRIGGER trigger_insert_valor
    AFTER INSERT ON movies
    FOR EACH ROW
BEGIN
    INSERT INTO movies_logs(movie_id, executed_action, log_date)
    VALUES(NEW.movie_id, 'INSERT', NOW());
END $$
DELIMITER ;

INSERT INTO movies(ticket_price) VALUES (0);

-- * Crie um Trigger para UPDATE que, ao receber uma alteração na tabela movies , deve comparar o valor anterior de ticket_price com o valor sendo inserido nesta atualização. Caso o valor seja maior que o anterior, insira na coluna ticket_price_estimation o valor de 'Increasing' . Caso contrário, insira o valor 'Decreasing' . Adicionalmente, insira um novo registro na tabela movies_logs , contendo informações sobre o registro alterado ( movie_id , executed_action e log_date ).



-- * Crie um Trigger na tabela movies que, ao ter algum de seus registros excluídos, deve enviar uma informação para a tabela movies_logs , onde devem ser guardados a data da exclusão, a executed_action 'DELETE' e o id do filme excluído.










-- # =======================================================================