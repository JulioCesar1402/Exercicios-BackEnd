CREATE DATABASE beTrybe;

CREATE TABLE beTrybe.funcionarios(
  funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL
);

CREATE TABLE beTrybe.contato(
  funcionario_id INT NOT NULL,
  email VARCHAR(200) NOT NULL,
  telefone INT NOT NULL,
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE beTrybe.cadastro(
  funcionario_id INT NOT NULL,
  data_cadastro INT NOT NULL,
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE beTrybe.setor(
  funcionario_id INT NOT NULL,
  setor VARCHAR(10) NOT NULL,
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

-- # ===================================================

-- & mysql -u root -p
SHOW databases;
USE w3schools;
SHOW tables;
SELECT * FROM orders;

-- & mysqldump -u root -p w3schools > w3schools.sql
-- & mysql -u root -p
CREATE DATABASE w3schools2;
exit;

-- na pasta com o arquivo de backoup
-- & mysql -u root -p w3schools2 < w3schools.sql