-- ! adicionando databases
-- DROP SCHEMA IF EXISTS PecasFornecedores;
-- CREATE SCHEMA PecasFornecedores;
-- USE PecasFornecedores;

-- CREATE TABLE Pecas (
--   code INTEGER PRIMARY KEY NOT NULL,
--   name TEXT NOT NULL
-- );

-- CREATE TABLE Fornecedores (
--   code VARCHAR(40) PRIMARY KEY NOT NULL,
--   name TEXT NOT NULL
-- );

-- CREATE TABLE Fornecimentos (
--   code INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
--   peca INTEGER,
--   FOREIGN KEY (peca) REFERENCES Pecas (code),
--   Fornecedor VARCHAR(40),
--   FOREIGN KEY (fornecedor) REFERENCES Fornecedores (code),
--   Preco INTEGER NOT NULL
-- );

-- CREATE TABLE Vendas (
--   code INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   fornecimento INTEGER,
--   quantity INTEGER,
--   order_date DATETIME,
--   FOREIGN KEY (fornecimento) REFERENCES Fornecimentos (code)
-- );

-- INSERT INTO Fornecedores(code, name)
--   VALUES ('ROB', 'Robauto SA'),
--     ('CNF', 'Confiauto LTDA'),
--     ('MAP', 'Malok Auto Peças'),
--     ('INF', 'Infinity Peças LTDA');

-- INSERT INTO Pecas(code, name)
--   VALUES (1, 'Rebimboca'),
--     (2, 'Parafuseta'),
--     (3, 'Grampola'),
--     (4, 'Grapeta');

-- INSERT INTO Fornecimentos(peca, fornecedor, preco)
--   VALUES (1, 'CNF', 10),
--     (1, 'ROB', 15),
--     (2, 'CNF', 20),
--     (2, 'ROB', 25),
--     (2, 'MAP', 14),
--     (3, 'INF', 50),
--     (3, 'MAP', 45),
--     (4, 'CNF', 5),
--     (4, 'ROB', 7);

-- INSERT INTO Vendas(fornecimento, quantity, order_date)
--   VALUES (1, 3, '2017-05-22 11:28:36'),
--     (2, 2, '2018-03-22 11:35:24'),
--     (3, 8, '2018-11-16 15:51:36'),
--     (3, 10, '2019-02-13 13:23:22'),
--     (8, 5, '2019-06-11 12:22:48'),
--     (6, 1, '2019-09-07 09:53:58'),
--     (7, 3, '2020-01-05 08:39:33'),
--     (9, 5, '2020-05-13 14:05:19');

-- # =======================================================================================

-- * Escreva uma query para exibir todas as peças que começam com GR .

-- SELECT * from PecasFornecedores.Pecas
-- where name like 'GR%';

-- * Escreva uma query para exibir todos os fornecimentos que contenham a peça com code 2 . Organize o resultado por ordem alfabética de fornecedor.

-- SELECT * from PecasFornecedores.Pecas;
-- SELECT Fornecedor from PecasFornecedores.Fornecimentos
-- where peca = 2 ORDER BY Fornecedor;

-- * Escreva uma query para exibir as peças, preço e fornecedor de todos os fornecimentos em que o código do fornecedor tenha a letra N .

-- SELECT peca, Fornecedor, Preco from PecasFornecedores.Fornecimentos
-- where Fornecedor like '%N%';

-- * Escreva uma query para exibir todas as informações dos fornecedores que são empresas limitadas (LTDA). Ordene os resultados em ordem alfabética decrescente.

-- Select * from PecasFornecedores.Fornecedores
-- where name like '%LTDA'
-- ORDER BY name DESC;

-- * Escreva uma query para exibir o número de empresas (fornecedores) que contém a letra F no código.

-- Select count(name) from PecasFornecedores.Fornecedores
-- where code like '%F%';

-- * Escreva uma query para exibir os fornecimentos onde as peças custam mais de R$15,00 e menos de $40,00 . Ordene os resultados por ordem crescente.

-- select peca from PecasFornecedores.Fornecimentos
-- where preco between 15 and 40
-- ORDER BY peca;

-- * Escreva uma query para exibir o número de vendas feitas entre o dia 15/04/2018 e o dia 30/07/2019 .

-- select COUNT(*) from PecasFornecedores.Vendas
-- where order_date BETWEEN DATE('2018-04-15') AND DATE('2019-07-30');

-- # =======================================================================================

--  ! ADICIONANDO DATABASE

DROP SCHEMA IF EXISTS Pixar;
CREATE SCHEMA Pixar;
USE Pixar;

CREATE TABLE Movies (
  id INTEGER auto_increment PRIMARY KEY NOT NULL,
  title VARCHAR(30) NOT NULL,
  director VARCHAR(30) NULL,
  year INT NOT NULL,
  length_minutes INT NOT NULL
);

CREATE TABLE BoxOffice (
  movie_id INTEGER,
  FOREIGN KEY (movie_id) REFERENCES Movies (id),
  rating DECIMAL(2,1) NOT NULL,
  domestic_sales INT NOT NULL,
  international_sales INT NOT NULL
);

INSERT INTO Movies(title, director, year, length_minutes)
  VALUES ('Toy Story', 'John Lasseter', 1995, 81),
         ('Vida de inseto', 'Andrew Staton', 1998, 95),
         ('ratatui', 'Brad Bird', 2010, 115),
         ('UP', 'Pete Docter', 2009, 101),
         ('Carros', 'John Lasseter', 2006, 117),
         ('Toy Story 2', 'John Lasseter', 1999, 93),
         ('Valente', 'Brenda Chapman', 2012, 98);


INSERT INTO BoxOffice(movie_id, rating, domestic_sales, international_sales)
  VALUES (1, 8.3, 190000000, 170000000),
         (2, 7.2, 160000000, 200600000),
         (3, 7.9, 245000000, 239000000),
         (4, 6.1, 330000000, 540000000),
         (5, 7.8, 140000000, 310000000),
         (6, 5.8, 540000000, 600000000),
         (7, 7.5, 250000000, 190000000);

-- # =======================================================================================

-- * Exercício 1 : Insira as produções da Pixar abaixo na tabela Movies :

-- & Monstros SA, de Pete Docter, lançado em 2001, com 92 minutos de duração.
-- & Procurando Nemo, de John Lasseter, lançado em 2003, com 107 minutos de duração.
-- & Os Incríveis, de Brad Bird, lançado em 2004, com 116 minutos de duração.
-- & WALL-E, de Pete Docter, lançada em 2008, com 104 minutos de duração.

-- select * from Pixar.Movies;

-- insert into Pixar.Movies
-- (title, director, year, length_minutes)
-- VALUES
-- ('Monstros SA', 'Pete Docter', 2001, 92),
-- ('Procurando Nemo', 'John Lasseter', 2003, 107),
-- ('POs Incríveis', 'Brad Bird', 2004, 116),
-- ('WALL-E', 'Pete Docter', 2008, 104);

-- * Exercício 2 : Procurando Nemo foi aclamado pela crítica! Foi classificado em 6.8, fez 450 milhões no mercado interno e 370 milhões no mercado internacional. Adicione as informações à tabela BoxOffice .

-- select * from Pixar.BoxOffice;
-- select * from Pixar.Movies;
-- insert into Pixar.BoxOffice
-- (movie_id, rating, domestic_sales, international_sales)
-- VALUES
-- (9, 6.8, 450000000, 370000000);

-- * Exercício 3 : O diretor do filme "Procurando Nemo" está incorreto, na verdade ele foi dirigido por Andrew Staton. Corrija esse dado utilizando o UPDATE .

-- select * from Pixar.Movies;
-- update Pixar.Movies
-- set director = 'Andrew Staton'
-- where title = 'Procurando Nemo';

-- * Exercício 4 : O título do filme "Ratatouille" esta escrito de forma incorreta na tabela Movies , além disso, o filme foi lançado em 2007 e não em 2010. Corrija esses dados utilizando o UPDATE .

--  update Pixar.Movies
--  set title = 'Ratatouille',
--  year = 2007
--  where year = 2010;

-- * Exercício 5 : Insira as novas classificações abaixo na tabela BoxOffice , lembre-se que a coluna movie_id é uma foreign key referente a coluna id da tabela Movies :

-- & Monsters SA, classificado em 8.5, lucrou 300 milhões no mercado interno e 250 milhões no mercado internacional.
-- & Os Incríveis, classificado em 7.4, lucrou 460 milhões no mercado interno e 510 milhões no mercado internacional.
-- -- & WALL-E, classificado em 9.9, lucrou 290 milhões no mercado interno e 280 milhões no mercado internacional.
-- select * from Pixar.BoxOffice;
-- select * from Pixar.Movies;
-- update Pixar.Movies
-- set title = 'Os Incríveis'
-- where id = 10;

-- insert ignore into Pixar.BoxOffice
-- (movie_id, rating, domestic_sales, international_sales)
-- values
-- (8, 8.5, 300000000, 250000000),
-- (9, 6.8, 450000000, 370000000),
-- (10, 7.4, 460000000, 510000000),
-- (11, 9.9, 290000000, 280000000);

-- delete from Pixar.BoxOffice
-- where movie_id in(8,9,10,11);

-- * Exclua da tabela Movies o filme "WALL-E".
-- delete from Pixar.Movies
-- where title = 'WALL-E';

-- delete from Pixar.BoxOffice
-- where movie_id = 11;

-- select * from Pixar.Movies;

-- * Exclua da tabela Movies todos os filmes dirigidos por "Andrew Staton".

-- delete from Pixar.Movies
-- where director = 'Andrew Staton';

-- select id from Pixar.Movies
-- where director = 'Andrew Staton';

-- delete from Pixar.BoxOffice
-- where movie_id in(2, 9);
-- select * from Pixar.Movies;

-- # =======================================================================================
-- ! adicionando database

-- DROP SCHEMA IF EXISTS Scientists;
-- CREATE SCHEMA Scientists;
-- USE Scientists;

-- CREATE TABLE Scientists (
--   SSN INT,
--   Name CHAR(30) NOT NULL,
--   PRIMARY KEY (SSN)
-- );

-- CREATE TABLE Projects (
--   Code CHAR(4),
--   Name CHAR(50) NOT NULL,
--   Hours INT,
--   PRIMARY KEY (Code)
-- );

-- CREATE TABLE AssignedTo (
--   Scientist INT NOT NULL,
--   Project CHAR(4) NOT NULL,
--   PRIMARY KEY (Scientist, Project),
--   FOREIGN KEY (Scientist) REFERENCES Scientists (SSN),
--   FOREIGN KEY (Project) REFERENCES Projects (Code)
-- );

-- INSERT INTO Scientists(SSN, Name)
--   VALUES(123234877, 'Michael Rogers'),
--     (152934485, 'Anand Manikutty'),
--     (222364883, 'Carol Smith'),
--     (326587417, 'Joe Stevens'),
--     (332154719, 'Mary-Anne Foster'),
--     (332569843, 'George ODonnell'),
--     (546523478, 'John Doe'),
--     (631231482, 'David Smith'),
--     (654873219, 'Zacary Efron'),
--     (745685214, 'Eric Goldsmith'),
--     (845657245, 'Elizabeth Doe'),
--     (845657246, 'Kumar Swamy');

--  INSERT INTO Projects (Code, Name, Hours)
--   VALUES ('AeH1' ,'Winds: Studying Bernoullis Principle', 156),
--     ('AeH2', 'Aerodynamics and Bridge Design', 189),
--     ('AeH3', 'Aerodynamics and Gas Mileage', 256),
--     ('AeH4', 'Aerodynamics and Ice Hockey', 789),
--     ('AeH5', 'Aerodynamics of a Football', 98),
--     ('AeH6', 'Aerodynamics of Air Hockey', 89),
--     ('Ast1', 'A Matter of Time', 112),
--     ('Ast2', 'A Puzzling Parallax', 299),
--     ('Ast3', 'Build Your Own Telescope', 6546),
--     ('Bte1', 'Juicy: Extracting Apple Juice with Pectinase', 321),
--     ('Bte2', 'A Magnetic Primer Designer', 9684),
--     ('Bte3', 'Bacterial Transformation Efficiency', 321),
--     ('Che1', 'A Silver-Cleaning Battery', 545),
--     ('Che2', 'A Soluble Separation Solution', 778);

--  INSERT INTO AssignedTo (Scientist, Project)
--   VALUES (123234877, 'AeH1'),
--     (152934485, 'AeH3'),
--     (222364883, 'Ast3'),
--     (326587417, 'Ast3'),
--     (332154719, 'Bte1'),
--     (546523478, 'Che1'),
--     (631231482, 'Ast3'),
--     (654873219, 'Che1'),
--     (745685214, 'AeH3'),
--     (845657245, 'Ast1'),
--     (845657246, 'Ast2'),
--     (332569843, 'AeH4');

-- # =======================================================================================

-- * Escreva uma query para exibir todas as informações de todos os cientistas que possuam a letra "e" em seu nome.

-- select * from Scientists.Scientists
-- where Name like '%e%';

-- * Escreva uma query para exibir o nome de todos os projetos cujo o código inicie com a letra A . Ordene o resultado em ordem alfabética.

-- select Name from Scientists.Projects
-- where Code like 'A%'
-- order by Name;

-- * Escreva uma query para exibir o código e nome de todos os projetos que possuam em seu código o número 3 . Ordene o resultado em ordem alfabética.

select Code, Name from Scientists.Projects
where Code like '%3%'
order by Code, Name;

-- * Escreva uma query para exibir todos os cientistas (valores numéricos) cujos projetos sejam AeH3 , Ast3 ou Che1 .

-- select Scientist from Scientists.AssignedTo
-- where Project in ('AeH3', 'Ast3', 'Che1');

-- * Escreva uma query para exibir todas as informações de todos os projetos com mais de 500 horas.

-- select * from Scientists.Projects
-- where Hours > 500;

-- * Escreva uma query para exibir todas as informações de todos os projetos cujas horas sejam maiores que 250 e menores 800.

-- select * from Scientists.Projects
-- where Hours BETWEEN 250 AND 800;

-- * Escreva uma query para exibir o nome e o código de todos os projetos cujo nome NÃO inicie com a letra A .

-- select Name, Code from Scientists.Projects
-- where Name not like 'A%';

-- * Escreva uma query para exibir o nome de todos os projetos cujo código contenha a letra H .

-- select Name from Scientists.Projects
-- where Code like '%H%';

-- # =======================================================================================


-- * Exercício 8 : Altere a classificação da tabela BoxOffice para 9.0 de todos os filmes que lucraram mais de 400 milhões no mercado interno.

-- Select * from Pixar.BoxOffice;

-- update Pixar.BoxOffice
-- set rating = 9.0
-- where domestic_sales > 400000000;

-- * Exercício 9 : Altere a classificação da tabela BoxOffice para 6.0 de todos os filmes que lucraram menos de 300 milhões no mercado internacional e mais de 200 milhões no mercado interno.

-- update Pixar.BoxOffice
-- set rating = 6.0
-- where domestic_sales > 200000000
-- and international_sales < 300000000;

-- * Exercício 10 : Exclua da tabela Movies todos os filmes com menos de 100 minutos de duração.

-- Select id from Pixar.Movies
-- where length_minutes < 100;

-- Delete from Pixar.Movies
-- where length_minutes < 100;

-- Delete from Pixar.BoxOffice
-- where movie_id in(1, 6, 7, 8);]

-- select * from Pixar.BoxOffice;

-- # =======================================================================================
