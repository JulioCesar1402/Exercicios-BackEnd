-- Cria um banco de dados com o nome especificado.
CREATE DATABASE nome_do_banco_de_dados;

-- Sinônimo de CREATE DATABASE, também cria um banco de dados.
CREATE SCHEMA nome_do_banco_de_dados;

-- Verifica se o banco de dados ainda não existe.
-- Essa verificação é comumente utilizada junto ao CREATE DATABASE para evitar
-- a tentativa de criar um banco de dados duplicado, o que ocasionaria um erro.
IF NOT EXISTS nome_do_banco_de_dados;

-- * CREATE DATABASE IF NOT EXISTS nome_do_banco_de_dados;

-- Lista todos os bancos de dados existentes.
SHOW DATABASES;

-- Define o banco de dados ativo para uso no momento.
USE nome_do_banco_de_dados;

-- ? Criando um banco de dados chamado albuns
CREATE DATABASE IF NOT EXISTS albuns;

DROP SCHEMA IF EXISTS Brasil;
CREATE SCHEMA Brasil;
USE Brasil;

-- Apagar a versão antiga da tabela
DROP TABLE cidades;
CREATE TABLE cidades(
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(10) NOT NULL,
  populacao INTEGER
);
INSERT INTO cidades(cidade, estado, populacao)
VALUES('Rio Claro','SP',185421),
      ('Rio Claro','RJ',17216);

INSERT INTO cidades(id, cidade, estado, populacao)
VALUES(7,'Rio Doce','RJ',896345);

-- # ==============================================================
CREATE DATABASE IF NOT EXISTS albuns;
USE albuns;

CREATE TABLE IF NOT EXISTS albuns.music(
  music_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  music_name VARCHAR(100) NOT NULL,
  music_style VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS albuns.author(
  author_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_name INT(100) NOT NULL,
  record_company INT(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS albuns.album(
  album_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(100) NOT NULL,
  author_id INT,
  music_id INT,
  price INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author(author_id),
  FOREIGN KEY (music_id) REFERENCES music(music_id)
);

-- # ==================================================================

CREATE DATABASE IF NOT EXISTS Zoo;
USE Zoo;

CREATE TABLE IF NOT EXISTS Zoo.Manager(
  manager_id INT PRIMARY KEY AUTO_INCREMENT,
  manager_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Zoo.Carer(
  carer_id INT PRIMARY KEY AUTO_INCREMENT,
  carer_name VARCHAR(100) NOT NULL,
  manager_id INT NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES Manager(manager_id)
);

CREATE TABLE IF NOT EXISTS Zoo.Animal(
  animal_id INT PRIMARY KEY AUTO_INCREMENT,
  animal_name VARCHAR(100) NOT NULL,
  animal_species VARCHAR(100) NOT NULL,
  animal_gender VARCHAR(100) NOT NULL,
  animal_age INT NOT NULL,
  animal_locate VARCHAR(100) NOT NULL,
  carer_id INT NOT NULL,
  FOREIGN KEY (carer_id) REFERENCES Carer(carer_id)
);
