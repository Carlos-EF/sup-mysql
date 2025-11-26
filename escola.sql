-- Primary Key => chave primária
-- AUTO_INCREMENT => gerar os ids automaticamente
DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;
USE escola;

CREATE TABLE alunos(
id INT PRIMARY KEY AUTO_INCREMENT
);

-- Mostrar create da table
SHOW CREATE TABLE alunos;

-- Consultar como está a tabela
DESCRIBE alunos;

-- Adicionar nova coluna na tabela
ALTER TABLE alunos ADD COLUMN nome VARCHAR(50);

-- Adicionar um registro (cad aluno)
INSERT INTO alunos (nome) VALUE ("Pedrinho");
INSERT INTO alunos (nome) VALUE ("Aninha");
INSERT INTO alunos (nome) VALUE ("Mariazinha");
INSERT INTO alunos (nome) VALUE ("Clebinho");
INSERT INTO alunos (nome) VALUE ("Luiza");
INSERT INTO alunos (nome) VALUE ("Fabiana");
INSERT INTO alunos (nome) VALUE ("Thaiz");
INSERT INTO alunos (nome) VALUE ("Du Dudu e Edu");

-- Consultar o nome dos alunos em órdem alfabética
SELECT nome FROM alunos ORDER BY nome;

ALTER TABLE alunos ADD COLUMN nota1 DOUBLE;
ALTER TABLE alunos ADD COLUMN nota2 DOUBLE;
ALTER TABLE alunos ADD COLUMN nota3 DOUBLE;

SELECT * FROM alunos;

SELECT id FROM alunos WHERE nome = "Pedrinho";

UPDATE alunos SET nota1 = 9 WHERE id = 1;
UPDATE alunos SET nota2 = 8.5 WHERE id = 1;
UPDATE alunos SET nota3 = 6.5 WHERE id = 1;

UPDATE alunos SET nota1 = 5, nota2 = 8, nota3 = 1.5 WHERE id = 2;

UPDATE alunos SET nota1 = 7.5, nota2 = 8, nota3 = 6.5 WHERE id = 4;

UPDATE alunos SET nota1 = 9, nota3 = 9.5 WHERE id = 5;

UPDATE alunos SET nota2 = 7.9, nota3 = 8.8 WHERE id = 6;

UPDATE alunos SET nota1 = 6.8, nota2 = 7.3 WHERE id = 7;

UPDATE alunos SET nota1 = 5.5, nota2 = 6.2, nota3 = 7.1 WHERE id = 8;

-- Consultar a menor nota1
SELECT MIN(nota1) AS "Menor Nota 1" FROM alunos;

-- Consultar a maior nota1
SELECT MAX(nota1) AS "Maior nota 1" FROM alunos;

-- Consultar a média das notas 1
SELECT FORMAT(AVG(nota1), 2) AS "Média das notas 1" FROM alunos;

-- Consultar a soma das notas 1
SELECT SUM(nota1) AS "Soma das notas 1" FROM alunos;

-- Consultar dados dos alunos com nota1 nula
SELECT id, nome, nota1 FROM alunos WHERE nota1 IS NULL;
UPDATE alunos SET nota1 = 0 WHERE id = 3;
UPDATE alunos SET nota1 = 2.0 WHERE id = 6;

SELECT id, nome, nota2 FROM alunos WHERE nota2 IS NULL;
UPDATE alunos SET nota2 = 1.4 WHERE id = 3;
UPDATE alunos SET nota2 = 10 WHERE id = 5;

SELECT id, nome, nota3 FROM alunos WHERE nota3 IS NULL;
UPDATE alunos SET nota3 = 0 WHERE id = 3;
UPDATE alunos SET nota3 = 6.8 WHERE id = 7;

-- SELECT calcular média 
SELECT nome, FORMAT((nota1 + nota2 + nota3) / 3, 2) AS "Média das notas" FROM alunos;

-- Consultar os aprovados acima ou igual 7
SELECT nome, FORMAT((nota1 + nota2 + nota3) / 3, 2) AS "Aprovados!" FROM alunos WHERE (nota1 + nota2 + nota3) / 3 >= 7;

-- Consultar os em exame acima ou igual a 6
SELECT nome, FORMAT((nota1 + nota2 + nota3) / 3, 2) AS "Em exame" FROM alunos WHERE (nota1 + nota2 + nota3) / 3 < 7 AND (nota1 + nota2 + nota3) / 3 >= 6;

-- Consultar os reprovados
SELECT nome, FORMAT((nota1 + nota2 + nota3) / 3, 2) AS "Reprovados" FROM alunos WHERE (nota1 + nota2 + nota3) / 3 < 6;

CREATE TABLE jogos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    UNIQUE(nome)
);

INSERT INTO jogos(nome) VALUES
("Metal Gear Solid"),
("Medal of Honor"),
("Twisted Metal"),
("The Riftbreaker: Metal Terror"),
("Metal Slug");

-- Consultar os jogos filtrando por uma busca parcial no começo de "Me"
SELECT * FROM jogos WHERE nome LIKE "Me%";

-- Consultar os jogos que terminam com "Metal"
SELECT * FROM jogos WHERE nome LIKE "%Metal";

-- Consultar os jogos que contém
SELECT * FROM jogos WHERE nome LIKE "%Me%";

-- Consultar os jogos em órdem crescente
SELECT id, nome FROM jogos ORDER BY nome ASC;

-- Consultar os jogos em órdem decrescente
SELECT id, nome FROM jogos ORDER BY nome DESC;

-- Adicionar uma coluna de data de nascimento na tabela de alunos
ALTER TABLE alunos ADD COLUMN data_nascimento DATE;

-- Definir data de nascimento para Thaiz (id 7)
UPDATE alunos SET data_nascimento = "2000-11-24" WHERE id = 7;
UPDATE alunos SET data_nascimento = "1994-07-03" WHERE id = 4;
UPDATE alunos SET data_nascimento = "2001-12-7" WHERE id = 1;
UPDATE alunos SET data_nascimento = "1990-08-09" WHERE id = 2;
UPDATE alunos SET data_nascimento = "1980-12-25" WHERE id = 3;
UPDATE alunos SET data_nascimento = "1975-11-30" WHERE id = 5;
UPDATE alunos SET data_nascimento = "2009-2-9" WHERE id = 6;
UPDATE alunos SET data_nascimento = "2001-8-20" WHERE id = 8;

-- Consultar a data de nascimento formatada o padrão pt-BR
SELECT id, nome, DATE_FORMAT(data_nascimento, "%d/%m/%Y") FROM alunos;

-- Consultar mês de uma data
SELECT MONTH(data_nascimento) FROM alunos;

-- Comsultar ano de uma data
SELECT YEAR(data_nascimento) FROM alunos;

-- Consultar dia de uma data
SELECT DAY(data_nascimento) FROM alunos;

-- Consultar hora
SELECT HOUR("2020-12-31 22:59:01");

-- Consultar minutos
SELECT MINUTE("2020-12-31 22:59:01");

-- Consultar segundos
SELECT SECOND("2020-12-31 22:59:01");

-- Consultar os alunos da década de 70 até 90
SELECT nome, data_nascimento, YEAR(data_nascimento) AS "Ano" FROM alunos WHERE YEAR(data_nascimento) >= 1970 AND YEAR(data_nascimento) <= 1999 ORDER BY data_nascimento ASC;

-- Operadores relacionais
-- Maior			>
-- Maior ou igual 	>=
-- Menor			<
-- Menor ou igual 	<=
-- Diferente		!=
-- Igual			=

-- Operadores lógicos
-- E			AND
-- Ou   		OR

-- Consultar o nome dos alunos em maiúscula
SELECT UPPER(nome) FROM alunos;

-- Consultar o nome dos alunos em minúsculo
SELECT LOWER(nome) FROM alunos;

-- TAREFA:
-- Substring
-- Consultar uma parte específica de string
SELECT SUBSTRING("Batatinha Supreme", 1, 9);

-- Replace
-- Substituir uma parte de string por outra
SELECT REPLACE("Batatinha Supreme", "Supreme", "Ultimate");

-- Length
-- Mostra o tamanho de uma string em Bytes
SELECT LENGTH("Batatinha Sensação");

-- Char_Length => Mostra a quantidade de caractéres
SELECT CHAR_LENGTH("Batatinha Sensação");

-- Concat
-- Combina registros na ordem que foi passado em uma só string
SELECT CONCAT(nome, " ", FORMAT((nota1 + nota2 + nota3) / 3, 2)) AS "Nome e média" FROM alunos;

-- LTrim
-- Remove os espaços do começo da string
SELECT LTRIM("           .Batatinha Supreme");

-- RTrim
-- Remove os espaços do final da string
SELECT RTRIM("Batatinha Supreme.               ");

-- Trim
-- Remove os espaços do começo e final da string
SELECT TRIM("            .Batatinha Supreme.               ");

-- Green Field => novo projeto
-- Brown Field => projeto existente