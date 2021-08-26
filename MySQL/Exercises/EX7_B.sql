-- * Exercício 1: Utilizando o INNER JOIN , encontre as vendas nacionais ( domestic_sales ) e internacionais ( international_sales ) de cada filme.

SELECT M.title, BO.international_sales, BO.domestic_sales
FROM Pixar.BoxOffice as BO
INNER JOIN Pixar.Movies as M
ON movie_id = id;

-- * Exercício 2: Utilizando o INNER JOIN , faça uma busca que retorne o número de vendas para cada filme que possui um número maior de vendas internacionais ( international_sales ) do que vendas nacionais ( domestic_sales ).

SELECT M.title, BO.international_sales, BO.domestic_sales
FROM Pixar.BoxOffice BO
INNER JOIN Pixar.Movies M
ON movie_id = id
WHERE BO.international_sales > BO.domestic_sales;

-- * Exercício 3: Utilizando o INNER JOIN , faça uma busca que retorne os filmes e sua avaliação ( rating ) em ordem decrescente.

SELECT m.title, bo.rating
FROM Pixar.BoxOffice AS bo
INNER JOIN Pixar.Movies AS m
ON bo.movie_id = m.id
ORDER BY bo.rating DESC;


-- * Exercício 4: Utilizando o LEFT JOIN , faça uma busca que retorne todos os dados dos cinemas, mesmo os que não possuem filmes em cartaz e, adicionalmente, os dados dos filmes que estão em cartaz nestes cinemas. Retorne os nomes dos cinemas em ordem alfabética.

SELECT TH.*, M.* FROM Pixar.Theater TH
LEFT JOIN Pixar.Movies M
ON TH.id = M.theater_id;

-- * Exercício 5: Utilizando o RIGHT JOIN , faça uma busca que retorne todos os dados dos filmes, mesmo os que não estão em cartaz e, adicionalmente, os dados dos cinemas que possuem estes filmes em cartaz. Retorne os nomes dos cinemas em ordem alfabética.

SELECT M.*, TH.* FROM Pixar.Theater TH
RIGHT JOIN Pixar.Movies M
ON TH.id = M.theater_id
ORDER BY TH.name;

-- * Exercício 6: Faça duas buscas, uma utilizando SUBQUERY e outra utilizando INNER JOIN , que retornem os títulos dos filmes que possuem avaliação maior que 7.5.

-- SELECT * FROM Pixar.BoxOffice BO;
-- BO.movie_id, BO.rating
-- SELECT * FROM Pixar.Movies M;
-- M.id, M.title


SELECT title
FROM Pixar.Movies
WHERE ID IN (
  SELECT MOVIE_ID FROM Pixar.BoxOffice
  WHERE rating > 7.5
);

SELECT M.title, BO.rating
FROM Pixar.BoxOffice BO
INNER JOIN Pixar.Movies M
ON M.id = BO.movie_id
WHERE BO.rating > 7.5;

-- * Exercício 7: Faça duas buscas, uma utilizando SUBQUERY e outra utilizando INNER JOIN , que retornem as avaliações dos filmes lançados depois de 2009.

SELECT rating
FROM Pixar.BoxOffice
WHERE movie_id IN (
  SELECT id FROM Pixar.Movies
  WHERE year > 2009
);

SELECT M.title, B.rating
FROM Pixar.Movies M
INNER JOIN Pixar.BoxOffice B
ON M.id = B.movie_id
WHERE M.year > 2009;

-- * Exercício 8: Utilizando o EXISTS , selecione o nome e localização dos cinemas que possuem filmes em cartaz.

SELECT name, location FROM Pixar.Theater as T
WHERE EXISTS (
  SELECT * FROM Pixar.Movies
  WHERE theater_id = T.id
);

-- * Exercício 9: Utilizando o EXISTS , selecione o nome e localização dos cinemas que não possuem filmes em cartaz.


SELECT name, location FROM Pixar.Theater as T
WHERE NOT EXISTS (
  SELECT * FROM Pixar.Movies
  WHERE theater_id = T.id
);