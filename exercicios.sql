-- # 1 - Criar um banco de dados chamado "assistencia_tecnica"
DROP DATABASE IF EXISTS assistencia_tecnica;
CREATE DATABASE assistencia_tecnica;
USE assistencia_tecnica;

-- # 2 - Criar uma tabela chamada "pecas_reposicao" com os campos: id, nome
CREATE TABLE pecas_reposicao(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);

-- # 3 - Inserir 10 registros de peças de computador
INSERT INTO pecas_reposicao (nome) VALUES ("Memória RAM 16GB"),
("Processador AMD Ryzen 7 5700X3D"),
("Memória RAM 32GB"),
("SSD Samsung 256GB"),
("Placa de Vídeo NVIDIA RTX 3060"),
("Placa de Vídeo AMD Radeon RX 6500XT"),
("HD Seagate 1TB"),
("Processador AMD Ryzen 5 5500"),
("Placa Mãe AM4 MSI A520M-A PRO"),
("Fonte MSI MAG A600DN 600W 80 Plus White"),
("Placa Mãe Gigabyte B550M Aorus Elite");

-- # 04 - Consultar as peças de reposição
SELECT id, nome FROM pecas_reposicao;

-- # 05 - Consultar as peças de reposição ordenando por nome em ordem crescente
SELECT id, nome FROM pecas_reposicao ORDER BY nome ASC;

-- # 06 - Consultar as peças de reposição ordenando por nome em ordem decrescente
SELECT id, nome FROM pecas_reposicao ORDER BY nome DESC;

-- # 07 - Consultar as peças de reposição limitando a 5 registros
SELECT id, nome FROM pecas_reposicao LIMIT 5;

-- # 08 - Consultar as peças filtrando por id maior que 3
SELECT id, nome FROM pecas_reposicao WHERE id > 3;

-- # 09 - Consultar as peças filtrando por nome que contenha a palavra "Memória" no começo
SELECT id, nome FROM pecas_reposicao WHERE nome LIKE "Memória%";

-- # 10 - Consultar as peças filtrando por nome que termine com "HD"
SELECT id, nome FROM pecas_reposicao WHERE nome LIKE "%HD";

-- # 11 - Consultar as peças filtrando por nome que contenha a palavra "Placa"
SELECT id, nome FROM pecas_reposicao WHERE nome LIKE "%Placa%";

-- # 12 - Consultar as peças filtrando por id entre 2 e 7
SELECT id, nome FROM pecas_reposicao WHERE id >= 2 AND id <=7;

-- # 13 - Consultar a quantidade total de peças cadastradas
SELECT SUM(quantidade) AS "Quantidade Total de Peças" FROM pecas_reposicao; 

-- # 14 - Consultar as peças filtrando por nome que contenha a palavra "HD" ou "SSD"
SELECT nome FROM pecas_reposicao WHERE nome LIKE "%HD%" OR nome LIKE "%SSD%";

-- # 15 - Consultar as peças exibindo apenas o nome sem o id
SELECT nome FROM pecas_reposicao;

-- # 16 - Consultar as peças onde o nome tenha mais de 10 caracteres
SELECT nome , CHAR_LENGTH(nome) AS "Quantidade de Caractéres" FROM pecas_reposicao WHERE CHAR_LENGTH(nome) > 10;

-- # 17 - Consultar as peças com o nome em letras maiúsculas
SELECT UPPER(nome) FROM pecas_reposicao;

-- # 18 - Consultar as peças substituindo espaços por hífens no nome (usar REPLACE)
SELECT nome, REPLACE(nome, " ", "-") AS "Nomes Modificados" FROM pecas_reposicao;

-- # 19 - Consultar as peças mostrando apenas as três primeiras letras do nome (SUBSTRING)
SELECT nome , SUBSTRING(nome, "1", "3") AS "3 Primeiras Letras" FROM pecas_reposicao;

-- # 20 - Consultar as peças que não contenham a palavra "Placa"
SELECT nome FROM pecas_reposicao WHERE nome NOT LIKE "%Placa%";

-- # 22 - Consultar as peças com o nome em letras minúsculas
SELECT LOWER(nome) FROM pecas_reposicao;

-- # 23 - Consultar as peças onde o id seja diferente de 5
SELECT id, nome FROM pecas_reposicao WHERE id != 5;

-- # 24 - Consultar as peças e ordenar por tamanho do nome (LENGTH)
SELECT id, nome FROM pecas_reposicao ORDER BY LENGTH(nome);

-- # 25 - Adicionar uma coluna chamada "tipo" na tabela "pecas_reposicao"
ALTER TABLE pecas_reposicao ADD COLUMN tipo VARCHAR(50);

-- # 26 - Atualizar todos os registros classificando nas de acordo com os seguintes tipos: "Memória", "Processador", "Placa de Vídeo", "SSD", "Fonte", "Placa Mãe"
SELECT id, nome, quantidade, tipo FROM pecas_reposicao;
UPDATE pecas_reposicao SET tipo = "Memória" WHERE id = 1;
UPDATE pecas_reposicao SET tipo = "Processador" WHERE id = 2;
UPDATE pecas_reposicao SET tipo = "Memória" WHERE id = 3;
UPDATE pecas_reposicao SET tipo = "SSD" WHERE id = 4;
UPDATE pecas_reposicao SET tipo = "Placa de Vídeo" WHERE id = 5;
UPDATE pecas_reposicao SET tipo = "Placa de Vídeo" WHERE id = 6;
UPDATE pecas_reposicao SET tipo = "HD" WHERE id = 7;
UPDATE pecas_reposicao SET tipo = "Processador" WHERE id  = 8;
UPDATE pecas_reposicao SET tipo = "Placa Mãe" WHERE id = 9;
UPDATE pecas_reposicao SET tipo = "Fonte" WHERE id = 10;
UPDATE pecas_reposicao SET tipo = "Placa Mãe" WHERE id = 11;

-- # 27 - Consultar as peças filtrando por tipo cada um dos tipos "Memória", "Processador"... Serão 6 consultas
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "Memória";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "Processador";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "Placa de Vídeo";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "Placa Mãe";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "SSD";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "HD";
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE tipo = "Fonte";

-- # 31 - Adicionar uma coluna chamada "quantidade" na tabela "pecas_reposicao"
ALTER TABLE pecas_reposicao ADD COLUMN quantidade DOUBLE;

-- # 32 - Atualizar a quantidade de todas as peças para 10
UPDATE pecas_reposicao SET quantidade = 10;

-- # 33 - Consultar as peças com quantidade maior que 10
SELECT id, nome, quantidade FROM pecas_reposicao WHERE quantidade > 10;

-- # 34 - Atualizar registro por registro definindo as seguintes quantidades: 
-- #       5 para id 1
UPDATE pecas_reposicao SET quantidade = 5 WHERE id = 1;

-- #       20 para id 2
UPDATE pecas_reposicao SET quantidade = 20 WHERE id = 2;

-- #       39 para id 3
UPDATE pecas_reposicao SET quantidade = 39 WHERE id = 3;

-- #       1 para id 4
UPDATE pecas_reposicao SET quantidade = 1 WHERE id = 4;

-- #       24 para id 5
UPDATE pecas_reposicao SET quantidade = 24 WHERE id = 24;

-- #       39 para id 6
UPDATE pecas_reposicao SET quantidade = 39 WHERE id = 39;

-- #       12 para id 7
UPDATE pecas_reposicao SET quantidade = 12 WHERE id = 7;

-- #       34 para id 8
UPDATE pecas_reposicao SET quantidade = 34 WHERE id = 8;

-- #       12 para id 9
UPDATE pecas_reposicao SET quantidade = 12 WHERE id = 9;

-- #       0 para id 10
UPDATE pecas_reposicao SET quantidade = 0 WHERE id = 10;

-- #       1 para id 11
UPDATE pecas_reposicao SET quantidade = 1 WHERE id = 11;

-- # 35 - Consultar as peças cujo nome contenha a letra "e"
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE nome LIKE "%e%";

-- # 36 - Consultar as peças cujo nome contenha a letra "a"
SELECT id, nome, quantidade, tipo FROM pecas_reposicao WHERE nome LIKE "%a%";

-- # 37 - Adicionar uma coluna chamada "preco" na tabela "pecas_reposicao"
ALTER TABLE pecas_reposicao ADD COLUMN preco DOUBLE;

-- # 38 - Atualizar o preço das peças definindo os seguintes valores:
-- #       R$ 13,39 para id 1
UPDATE pecas_reposicao SET preco = 13.99 WHERE id = 1;

-- #       R$ 24,99 para id 2
UPDATE pecas_reposicao SET preco = 24.99 WHERE id = 2;

-- #       R$ 12,99 para id 3
UPDATE pecas_reposicao SET preco = 12.99 WHERE id = 3;

-- #       R$ 19,99 para id 4
UPDATE pecas_reposicao SET preco = 19.99 WHERE id = 4;

-- #       R$ 29,99 para id 5
UPDATE pecas_reposicao SET preco = 29.99 WHERE id = 5;

-- #       R$ 39,99 para id 6
UPDATE pecas_reposicao SET preco = 39.99 WHERE id = 6;

-- #       R$ 49,99 para id 7
UPDATE pecas_reposicao SET preco = 49.99 WHERE id = 7;

-- #       R$ 59,99 para id 8
UPDATE pecas_reposicao SET preco = 59.99 WHERE id = 8;

-- #       R$ 69,99 para id 9
UPDATE pecas_reposicao SET preco = 69.99 WHERE id = 9;

-- #       R$ 79,99 para id 10
UPDATE pecas_reposicao SET preco = 79.99 WHERE id = 10;

-- #       R$ 89,99 para id 11
UPDATE pecas_reposicao SET preco = 89.99 WHERE id = 11;

SELECT nome, preco FROM pecas_reposicao;

-- # 39 - Consultar o valor total de todas as peças
SELECT FORMAT(SUM(preco), 2) AS "Valor Total(Compra Única)" FROM pecas_reposicao;
SELECT SUM(quantidade) AS "Quantidade Total de Pecas", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao;

-- # 40 - Consultar o valor total de todas as peças filtrando por tipo cada um dos tipos "Memória", "Processador"... Serão 6 consultas
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "Memória";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "Processador";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "Placa de Vídeo";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "Placa Mãe";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "SSD";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "HD";
SELECT tipo, SUM(quantidade) AS "Quantidade de peças", FORMAT((SUM(quantidade) * SUM(preco)), 2) AS "Valor Total" FROM pecas_reposicao WHERE tipo = "Fonte";

-- # 41 - Consultar o menor valor de todas as peças
SELECT MIN(preco) AS "Menor Preço" FROM pecas_reposicao;

-- # 42 - Consultar o maior valor de todas as peças
SELECT MAX(preco) AS "Maior Preço" FROM pecas_reposicao;

-- # 43 - Consultar a média de todos os valores
SELECT FORMAT(AVG(preco), 2) AS "Média de preço" FROM pecas_reposicao;

-- # 44 - Alterar a tabela e adicionar uma coluna de date chamada "data_pedido"
ALTER TABLE pecas_reposicao ADD COLUMN data_pedido DATE;

-- # 45 - Inserir uma nova peça de reposição com os seguintes valores:
-- #       nome: "Processador Intel Core i7"
-- #       tipo: "Processador"
-- #       quantidade: 10
-- #       preco: 19,99
-- #       data_pedido: 2023-01-01
INSERT INTO pecas_reposicao (nome, tipo, quantidade, preco, data_pedido) VALUE ("Processador Intel Core i7", "Processador", 10, 19.99, "2023-01-01");

-- # 46 - Atualizar todos as peças definindo a data de pedido para as seguintes datas abaixo:
-- #       01/11/2025 para id 1
UPDATE pecas_reposicao SET data_pedido = "2025-11-01" WHERE id = 1;

-- #       28/10/2025 para id 2
UPDATE pecas_reposicao SET data_pedido = "2025-10-28" WHERE id = 2;

-- #       15/09/2025 para id 3
UPDATE pecas_reposicao SET data_pedido = "2025-09-15" WHERE id = 3;

-- #       22/08/2025 para id 4
UPDATE pecas_reposicao SET data_pedido = "2025-08-22" WHERE id = 4;

-- #       29/07/2025 para id 5
UPDATE pecas_reposicao SET data_pedido = "2025-07-29" WHERE id = 5;

-- #        6/06/2025 para id 6
UPDATE pecas_reposicao SET data_pedido = "2025-6-6" WHERE id = 6;

-- #        4/05/2025 para id 7
UPDATE pecas_reposicao SET data_pedido = "2025-5-4" WHERE id = 7;

-- #        5/04/2025 para id 8
UPDATE pecas_reposicao SET data_pedido = "2025-4-5" WHERE id = 8;

-- #        7/03/2025 para id 9
UPDATE pecas_reposicao SET data_pedido = "2025-3-7" WHERE id = 9;

-- #        4/02/2025 para id 10
UPDATE pecas_reposicao SET data_pedido = "2025-2-4" WHERE id = 10;

-- #        7/01/2025 para id 11
UPDATE pecas_reposicao SET data_pedido = "2025-1-7" WHERE id = 11;

-- # 47 - Consultar todas as colunas ordenando por valor, não utilizar wildcard (procurar no google)
SELECT id, nome, tipo, quantidade, preco, DATE_FORMAT(data_pedido, "%d/%m/%Y") FROM pecas_reposicao ORDER BY preco DESC;

-- # TABELA CLIENTES

-- # 48 - Criar uma tabela chamada "clientes" com os campos: id, nome
CREATE TABLE clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100)
);

-- # 49 - Inserir 10 registros de clientes com os seguintes nomes:
-- #       Ana Paula Silva
-- #       João Carlos Santos
-- #       Maria Oliveira
-- #       Pedro Henrique Costa
-- #       Juliana Alves
-- #       Roberto Ferreira
-- #       Carla Souza
-- #       Lucas Rodrigues
-- #       Fernanda Lima
-- #       Marcos Antônio Pereira
INSERT INTO clientes (nome) VALUES ("Ana Paula Silva"),
("João Carlos Santos"),
("Maria Oliveira"),
("Pedro Henrique Costa"),
("Juliana ALves"),
("Roberto Ferreira"),
("Carla Souza"),
("Lucas Rodrigues"),
("Fernanda Lima"),
("Marcos Antônio Pereira");

-- # 50 - Consultar todos os clientes
SELECT id, nome FROM clientes;

-- # 51 - Consultar os clientes ordenando por nome em ordem crescente
SELECT id, nome FROM clientes ORDER BY nome ASC;

-- # 52 - Consultar os clientes ordenando por nome em ordem decrescente
SELECT id, nome FROM clientes ORDER BY nome DESC;

-- # 53 - Consultar os clientes limitando a 3 registros
SELECT id, nome FROM clientes LIMIT 3;

-- # 54 - Consultar os clientes filtrando por id maior que 5
SELECT id, nome FROM clientes WHERE id > 5;

-- # 55 - Consultar os clientes filtrando por nome que comece com a letra "A"
SELECT id, nome FROM clientes WHERE nome LIKE "A%";

-- # 56 - Consultar os clientes filtrando por nome que termine com a letra "a"
SELECT id, nome FROM clientes WHERE nome LIKE "%a";

-- # 57 - Consultar os clientes filtrando por nome que contenha a palavra "Silva"
SELECT id, nome FROM clientes WHERE nome LIKE "%Silva%";

-- # 58 - Consultar os clientes filtrando por id entre 3 e 8
SELECT id, nome FROM clientes WHERE id >= 3 AND id <= 8;

-- # 59 - Consultar a quantidade total de clientes cadastrados
SELECT COUNT(*) AS "Quantidade de clientes" FROM clientes;

-- # 60 - Consultar os clientes filtrando por nome que contenha "Maria" ou "João"
SELECT id, nome FROM clientes WHERE nome LIKE "%Maria%" OR nome LIKE "%João%";

-- # 61 - Consultar os clientes exibindo apenas o nome sem o id
SELECT nome FROM clientes;

-- # 62 - Consultar os clientes onde o nome tenha mais de 15 caracteres
SELECT id, nome, CHAR_LENGTH(nome) AS "Quantidade de caractéres" FROM clientes WHERE CHAR_LENGTH(nome) > 15;

-- # 63 - Consultar os clientes com o nome em letras maiúsculas
SELECT id, UPPER(nome) FROM clientes;

-- # 64 - Consultar os clientes substituindo espaços por underline no nome (usar REPLACE)
SELECT id, REPLACE(nome, " ", "_") FROM clientes;

-- # 65 - Consultar os clientes mostrando apenas as cinco primeiras letras do nome (SUBSTRING)
SELECT id, nome, SUBSTRING(nome, 1, 5) AS "Primeiras 5 letras" FROM clientes;

-- # 66 - Consultar os clientes que não contenham a palavra "Santos"
SELECT id, nome FROM clientes WHERE nome NOT LIKE "%Santos%";

-- # 67 - Consultar os clientes com o nome em letras minúsculas
SELECT id, LOWER(nome) FROM clientes;

-- # 68 - Consultar os clientes onde o id seja diferente de 7
SELECT id, nome FROM clientes WHERE id != 7;

-- # 69 - Consultar os clientes e ordenar por tamanho do nome (LENGTH)
SELECT id, nome FROM clientes ORDER BY LENGTH(nome);

-- # 70 - Adicionar uma coluna chamada "telefone" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(100);

-- # 71 - Atualizar todos os clientes definindo os seguintes telefones:
-- #       (11) 98765-4321 para id 1
UPDATE clientes SET telefone = "(11) 98765-4321" WHERE id = 1;

-- #       (21) 91234-5678 para id 2
UPDATE clientes SET telefone = "(21) 91234-5678" WHERE id = 2;

-- #       (31) 99876-5432 para id 3
UPDATE clientes SET telefone = "(31) 99876-5432" WHERE id = 3;

-- #       (41) 92345-6789 para id 4
UPDATE clientes SET telefone = "(41) 92345-6789" WHERE id = 4;

-- #       (51) 93456-7890 para id 5
UPDATE clientes SET telefone = "(51) 93456-7890" WHERE id = 5;

-- #       (61) 94567-8901 para id 6
UPDATE clientes SET telefone = "(61) 94567-8901" WHERE id = 6;

-- #       (71) 95678-9012 para id 7
UPDATE clientes SET telefone = "(71) 95678-9012" WHERE id = 7;

-- #       (81) 96789-0123 para id 8
UPDATE clientes SET telefone = "(81) 96789-0123" WHERE id = 8;

-- #       (91) 97890-1234 para id 9
UPDATE clientes SET telefone = "(91) 97890-1234" WHERE id = 9;

-- #       (11) 98901-2345 para id 10
UPDATE clientes SET telefone = "(11) 98901-2345" WHERE id = 10;

-- # 72 - Consultar os clientes filtrando por telefone que comece com "(11)"
SELECT id, nome, telefone FROM clientes WHERE telefone LIKE "(11)%";

-- # 73 - Consultar os clientes filtrando por telefone que contenha "9876"
SELECT id, nome, telefone FROM clientes WHERE telefone LIKE "%9876%";

-- # 74 - Adicionar uma coluna chamada "email" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN email VARCHAR(100);

-- # 75 - Atualizar todos os clientes definindo os seguintes emails:
-- #       ana.silva@gmail.com para id 1
UPDATE clientes SET email = "ana.silva@gmail.com" WHERE id = 1;

-- #       joao.santos@hotmail.com para id 2
UPDATE clientes SET email = "joao.santos@hotmail.com" WHERE id = 2;

-- #       maria.oliveira@yahoo.com.br para id 3
UPDATE clientes SET email = "maria.oliveira@yahoo.com.br" WHERE id = 3;

-- #       pedro.costa@gmail.com para id 4
UPDATE clientes SET email = "pedro.costa@gmail.com" WHERE id = 4;

-- #       juliana.alves@outlook.com para id 5
UPDATE clientes SET email = "juliana.alves@outlook.com" WHERE id = 5;

-- #       roberto.ferreira@gmail.com para id 6
UPDATE clientes SET email = "roberto.ferreira@gmail.com" WHERE id = 6;

-- #       carla.souza@hotmail.com para id 7
UPDATE clientes SET email = "carla.souza@hotmail.com" WHERE id = 7;

-- #       lucas.rodrigues@gmail.com para id 8
UPDATE clientes SET email = "lucas.rodrigues@gmail.com" WHERE id = 8;

-- #       fernanda.lima@yahoo.com.br para id 9
UPDATE clientes SET email = "fernanda.lima@yahoo.com.br" WHERE id = 9;

-- #       marcos.pereira@outlook.com para id 10
UPDATE clientes SET email = "marcos.pereira@outlook.com" WHERE id = 10;

-- # 76 - Consultar os clientes filtrando por email que contenha "@gmail.com"
SELECT id, nome, email FROM clientes WHERE email LIKE "%@gmail.com%";

-- # 77 - Consultar os clientes filtrando por email que termine com ".com.br"
SELECT id, nome, email FROM clientes WHERE email LIKE "%.com.br";

-- # 78 - Adicionar uma coluna chamada "cidade" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN cidade VARCHAR(100);

-- # 79 - Atualizar todos os clientes definindo as seguintes cidades:
-- #       São Paulo para id 1
UPDATE clientes SET cidade = "São Paulo" WHERE id = 1;

-- #       Rio de Janeiro para id 2
UPDATE clientes SET cidade = "Rio de Janeiro" WHERE id = 2;

-- #       Belo Horizonte para id 3
UPDATE clientes SET cidade = "Belo Horizonte" WHERE id = 3;

-- #       Curitiba para id 4
UPDATE clientes SET cidade = "Curitiba" WHERE id = 4;

-- #       Porto Alegre para id 5
UPDATE clientes SET cidade = "Porto Alegre" WHERE id = 5;

-- #       Brasília para id 6
UPDATE clientes SET cidade = "Brasília" WHERE id = 6;

-- #       Salvador para id 7
UPDATE clientes SET cidade = "Salvador" WHERE id = 7;

-- #       Recife para id 8
UPDATE clientes SET cidade = "Recife" WHERE id = 8;

-- #       Belém para id 9
UPDATE clientes SET cidade = "Belém" WHERE id = 9;

-- #       São Paulo para id 10
UPDATE clientes SET cidade = "São Paulo" WHERE id = 10;

-- # 80 - Consultar os clientes filtrando por cidade "São Paulo"
SELECT id, nome FROM clientes WHERE cidade = "São Paulo";

-- # 81 - Adicionar uma coluna chamada "data_cadastro" do tipo date na tabela "clientes"
ALTER TABLE clientes ADD COLUMN data_cadastro DATE;

-- # 82 - Atualizar todos os clientes definindo as seguintes datas de cadastro:
-- #       15/11/2024 para id 1
UPDATE clientes SET data_cadastro = "2024-11-15" WHERE id = 1;

-- #       20/10/2024 para id 2
UPDATE clientes SET data_cadastro = "2024-10-20" WHERE id = 2;

-- #       10/09/2024 para id 3
UPDATE clientes SET data_cadastro = "2024-09-10" WHERE id = 3;

-- #       25/08/2024 para id 4
UPDATE clientes SET data_cadastro = "2024-08-25" WHERE id = 4;

-- #       30/07/2024 para id 5
UPDATE clientes SET data_cadastro = "2024-07-30" WHERE id = 5;

-- #       12/06/2024 para id 6
UPDATE clientes SET data_cadastro = "2024-6-12" WHERE id = 6;

-- #       18/05/2024 para id 7
UPDATE clientes SET data_cadastro = "2024-5-18" WHERE id = 7;

-- #       22/04/2024 para id 8
UPDATE clientes SET data_cadastro = "2024-4-22" WHERE id = 8;

-- #       14/03/2024 para id 9
UPDATE clientes SET data_cadastro = "2024-3-14" WHERE id = 9;

-- #       28/02/2024 para id 10
UPDATE clientes SET data_cadastro = "2024-2-28" WHERE id = 10;

-- # 83 - Consultar os clientes cadastrados no mês de novembro
SELECT id, nome FROM clientes WHERE MONTH(data_cadastro) = 11;

-- # 84 - Consultar os clientes cadastrados entre 01/03/2024 e 30/06/2024
SELECT id, nome FROM clientes WHERE data_cadastro >= "2024-3-1" AND data_cadastro <= "2024-6-30";

-- # 85 - Consultar os clientes ordenando pela data de cadastro mais recente primeiro
SELECT id, nome, DATE_FORMAT(data_cadastro, "%d/%m/%Y") AS "Data de Cadastro" FROM clientes ORDER BY data_cadastro DESC;

-- # 86 - Consultar o ano da data de cadastro de todos os clientes (usar YEAR)
SELECT id, nome, YEAR(data_cadastro) AS "Ano do Cadastro" FROM clientes;

-- # 87 - Consultar o mês da data de cadastro de todos os clientes (usar MONTH)
SELECT id, nome, MONTH(data_cadastro) AS "Mês do Cadastro" FROM clientes;

-- # 88 - Consultar o dia da data de cadastro de todos os clientes (usar DAY)
SELECT id, nome, DAY(data_cadastro) AS "Dia do Cadastro" FROM clientes;

-- # 89 - Consultar o nome do mês da data de cadastro em português (usar DATE_FORMAT com %M)
SET lc_time_names = "pt_BR";
SELECT id, nome, DATE_FORMAT(data_cadastro, "%M") AS "Mês do Cadastro" FROM clientes;
	
-- # 90 - Consultar o nome do dia da semana da data de cadastro (usar DATE_FORMAT com %W)
SELECT id, nome, DATE_FORMAT(data_cadastro, "%W") AS "Dia do Cadastro" FROM clientes;

-- # 91 - Consultar a data de cadastro formatada como DD/MM/YYYY (usar DATE_FORMAT)
SELECT id, nome, DATE_FORMAT(data_cadastro, "%d/%m/%Y") AS "Data do Cadastro" FROM clientes;

-- # 92 - Consultar quantos dias se passaram desde o cadastro de cada cliente (usar DATEDIFF com data atual)
SELECT id, nome, DATE_FORMAT(data_cadastro, "%d/%m/%Y") AS "Data do Cadastro", DATEDIFF(CURRENT_DATE(), data_cadastro) AS "Dias desde o Cadastro" FROM clientes;
 
-- # 93 - Consultar os clientes cadastrados há mais de 180 dias
SELECT id, nome, DATE_FORMAT(data_cadastro, "%d/%m/%Y") AS "Data do Cadastro", DATEDIFF(CURRENT_DATE(), data_cadastro) AS "Dias desde o Cadastro" FROM clientes WHERE DATEDIFF(CURRENT_DATE(), data_cadastro) > 180;

-- # 94 - Consultar os clientes cadastrados há menos de 90 dias
SELECT id, nome, DATE_FORMAT(data_cadastro, "%d/%m/%Y") AS "Data do Cadastro", DATEDIFF(CURRENT_DATE(), data_cadastro) AS "Dias desde o Cadastro" FROM clientes WHERE DATEDIFF(CURRENT_DATE(), data_cadastro) < 90;

-- # 95 - Consultar a data de cadastro adicionando 30 dias (usar DATE_ADD)
SELECT id, nome, data_cadastro, DATE_ADD(data_cadastro, INTERVAL 30 DAY) AS "Depois de 30 dias" FROM clientes;

-- # 96 - Consultar a data de cadastro subtraindo 15 dias (usar DATE_SUB)
SELECT id, nome, data_cadastro, DATE_SUB(data_cadastro, INTERVAL 15 DAY) AS "Retrocedendo 15 dias" FROM clientes;

-- # 97 - Consultar os clientes que se cadastraram em dias pares do mês
SELECT id, nome, data_cadastro, DAY(data_cadastro) AS "Dia" FROM clientes WHERE MOD(DAY(data_cadastro), 2) = 0;

-- # 98 - Consultar os clientes que se cadastraram em dias ímpares do mês
SELECT id, nome, data_cadastro, DAY(data_cadastro) AS "Dia" FROM clientes WHERE MOD(DAY(data_cadastro), 2) != 0;

-- # 99 - Consultar os clientes formatando a data como "Mês Ano" exemplo: "Novembro 2024" (usar DATE_FORMAT)
SELECT id, nome, DATE_FORMAT(data_cadastro, "%M %Y") FROM clientes;

-- # 100 - Adicionar uma coluna chamada "status" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN status VARCHAR(100);

-- # 101 - Atualizar todos os clientes definindo os seguintes status:
-- #       Ativo para id 1
UPDATE clientes SET status = "Ativo" WHERE id = 1;

-- #       Ativo para id 2
UPDATE clientes SET status = "Ativo" WHERE id = 2;

-- #       Pendente para id 3
UPDATE clientes SET status = "Pendente" WHERE id = 3;

-- #       Ativo para id 4
UPDATE clientes SET status = "Ativo" WHERE id = 4;

-- #       Inativo para id 5
UPDATE clientes SET status = "Inativo" WHERE id = 5;

-- #       Ativo para id 6
UPDATE clientes SET status = "Ativo" WHERE id = 6;

-- #       Ativo para id 7
UPDATE clientes SET status = "Ativo" WHERE id = 7;

-- #       Pendente para id 8
UPDATE clientes SET status = "Pendente" WHERE id = 8;

-- #       Ativo para id 9
UPDATE clientes SET status = "Ativo" WHERE id = 9;

-- #       Inativo para id 10
UPDATE clientes SET status = "Inativo" WHERE id = 10;

-- # 102 - Consultar os clientes filtrando por status "Ativo"
SELECT id, nome, status FROM clientes WHERE status = "Ativo";

-- # 103 - Consultar os clientes filtrando por status "Inativo" ou "Pendente"
SELECT id, nome, status FROM clientes WHERE status = "Inativo" OR status = "Pendente";

-- # 104 - Adicionar uma coluna chamada "cpf" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN cpf VARCHAR(100);

-- # 105 - Atualizar todos os clientes definindo os seguintes CPFs:
-- #       123.456.789-01 para id 1
UPDATE clientes SET cpf = "123.456.789-01" WHERE id = 1;

-- #       234.567.890-12 para id 2
UPDATE clientes SET cpf = "234.567.890-12" WHERE id = 2;

-- #       345.678.901-23 para id 3
UPDATE clientes SET cpf = "345.678.901-23" WHERE id = 3;

-- #       456.789.012-34 para id 4
UPDATE clientes SET cpf = "456.789.012-34" WHERE id = 4;

-- #       567.890.123-45 para id 5
UPDATE clientes SET cpf = "567.890.123-45" WHERE id = 5;

-- #       678.901.234-56 para id 6
UPDATE clientes SET cpf = "678.901.234-56" WHERE id = 6;

-- #       789.012.345-67 para id 7
UPDATE clientes SET cpf = "789.012.345-67" WHERE id = 7;

-- #       890.123.456-78 para id 8
UPDATE clientes SET cpf = "890.123.456-78" WHERE id = 8;

-- #       901.234.567-89 para id 9
UPDATE clientes SET cpf = "901.234.567-89" WHERE id = 9;

-- #       012.345.678-90 para id 10
UPDATE clientes SET cpf = "012.345.678-90" WHERE id = 10;

-- # 106 - Consultar os clientes filtrando por CPF que comece com "123"
SELECT id, nome, cpf FROM clientes WHERE cpf LIKE "123%";

-- # 107 - Consultar os clientes onde o CPF contenha "456"
SELECT id,nome, cpf FROM clientes WHERE cpf LIKE "%456%";

-- # 108 - Adicionar uma coluna chamada "total_gasto" do tipo decimal na tabela "clientes"
ALTER TABLE clientes ADD COLUMN total_gasto DOUBLE;

-- # 109 - Atualizar o total gasto dos clientes definindo os seguintes valores:
-- #       R$ 1.250,00 para id 1
UPDATE clientes SET total_gasto = 1250.00 WHERE id = 1;

-- #       R$ 890,50 para id 2
UPDATE clientes SET total_gasto = 890.50 WHERE id = 2;

-- #       R$ 2.340,00 para id 3
UPDATE clientes SET total_gasto = 2340.00 WHERE id = 3;

-- #       R$ 560,00 para id 4
UPDATE clientes SET total_gasto = 560.00 WHERE id = 4;

-- #       R$ 3.120,75 para id 5
UPDATE clientes SET total_gasto = 3120.75 WHERE id = 5;

-- #       R$ 780,00 para id 6
UPDATE clientes SET total_gasto = 780.00 WHERE id = 6;

-- #       R$ 1.890,00 para id 7
UPDATE clientes SET total_gasto = 1890.00 WHERE id = 7;

-- #       R$ 450,00 para id 8
UPDATE clientes SET total_gasto = 450.00 WHERE id = 8;

-- #       R$ 2.670,00 para id 9
UPDATE clientes SET total_gasto = 2670.00 WHERE id = 9;

-- #       R$ 1.100,00 para id 10
UPDATE clientes SET total_gasto = 1100.00 WHERE id = 10;

-- # 110 - Consultar o valor total gasto por todos os clientes
SELECT SUM(total_gasto) AS "Total gasto dos clientes" FROM clientes;

-- # 111 - Consultar o menor valor gasto entre todos os clientes
SELECT MIN(total_gasto) AS "Menor valor gasto" FROM clientes;

-- # 112 - Consultar o maior valor gasto entre todos os clientes
SELECT MAX(total_gasto) AS "Maior valor gasto" FROM clientes;

-- # 113 - Consultar a média de valores gastos por todos os clientes
SELECT FORMAT(AVG(total_gasto), 2) AS "Média de valor gasto" FROM clientes;

-- # 114 - Consultar os clientes com total gasto maior que R$ 1.000,00
SELECT id, nome, total_gasto FROM clientes WHERE total_gasto > 1000.00;

-- # 115 - Consultar os clientes com total gasto menor que R$ 1.000,00
SELECT id, nome, total_gasto FROM clientes WHERE total_gasto < 1000.00;

-- # 116 - Consultar os clientes ordenando pelo total gasto em ordem decrescente
SELECT id, nome, total_gasto FROM clientes ORDER BY total_gasto DESC;

-- # 117 - Consultar os 5 clientes que mais gastaram
SELECT id, nome, total_gasto FROM clientes ORDER BY total_gasto DESC LIMIT 5;

-- # 118 - Adicionar uma coluna chamada "data_ultima_compra" do tipo date na tabela "clientes"
-- # 119 - Atualizar a data da última compra dos clientes definindo as seguintes datas:
-- #       10/11/2024 para id 1
-- #       15/11/2024 para id 2
-- #       20/10/2024 para id 3
-- #       05/09/2024 para id 4
-- #       18/08/2024 para id 5
-- #       22/07/2024 para id 6
-- #       30/06/2024 para id 7
-- #       12/05/2024 para id 8
-- #       08/04/2024 para id 9
-- #       25/03/2024 para id 10
-- # 120 - Consultar os clientes que fizeram a última compra há mais de 120 dias
-- # 121 - Consultar os clientes que fizeram a última compra no mesmo mês do cadastro
-- # 122 - Consultar a diferença em dias entre a data de cadastro e a última compra de cada cliente
-- # 123 - Consultar os clientes cadastrados em 2024
-- # 124 - Consultar os clientes cadastrados no primeiro semestre (janeiro a junho)
-- # 125 - Consultar os clientes cadastrados no segundo semestre (julho a dezembro)
-- # 126 - Consultar a data da última compra formatada como "DD de Mês de YYYY" exemplo: "10 de Novembro de 2024"
-- # 127 - Consultar os clientes onde o mês da última compra seja igual ao mês atual
-- # 128 - Consultar os clientes ordenando pela diferença entre cadastro e última compra (do maior para o menor)
-- # 129 - Consultar o trimestre da data de cadastro (usar QUARTER)
-- # 130 - Consultar os clientes cadastrados no mesmo trimestre
-- # 131 - Atualizar a data_ultima_compra para NULL do cliente com id 10 (simulando cliente que nunca comprou)
-- # 132 - Consultar os clientes que nunca compraram (data_ultima_compra NULL)
-- # 133 - Consultar a semana do ano em que cada cliente se cadastrou (usar WEEK)
-- # 134 - Consultar os clientes cujo nome contenha a letra "e"
-- # 135 - Consultar os clientes cujo email contenha "gmail" ou "hotmail"
-- # 136 - Atualizar o status para "Inativo" dos clientes com total gasto igual a zero
-- # 137 - Consultar os clientes filtrando por cidade ordenando por total gasto decrescente
-- # 138 - Consultar o dia do ano em que cada cliente se cadastrou (usar DAYOFYEAR)
-- # 139 - Consultar os clientes que se cadastraram em finais de semana (usar DAYOFWEEK)
-- # 140 - Consultar a data de cadastro no formato "AAAA-MM" para agrupar visualmente por mês/ano
-- # 141 - Consultar os clientes adicionando 1 ano à data de cadastro (aniversário de cliente)
-- # 142 - Consultar os clientes onde o ano da última compra seja diferente do ano de cadastro
-- # 143 - Consultar a data e hora atual do sistema (usar NOW)
-- # 144 - Consultar apenas a data atual do sistema (usar CURDATE)
-- # 145 - Consultar apenas o horário atual do sistema (usar CURTIME)
-- # 146 - Consultar todas as colunas dos clientes ordenando por data de cadastro, não utilizar wildcard
-- # 147 - Inserir um novo cliente com os seguintes valores:
-- #       nome: "Carlos Alberto Mendes"
-- #       telefone: "(85) 99123-4567"
-- #       email: "carlos.mendes@email.com"
-- #       cidade: "Fortaleza"
-- #       data_cadastro: 2024-12-01
-- #       status: "Ativo"
-- #       cpf: "987.654.321-00"
-- #       total_gasto: 1500.00
-- #       data_ultima_compra: 2024-12-15
-- # 148 - Consultar o último dia do mês de cadastro de cada cliente (usar LAST_DAY)
-- # 149 - Consultar os clientes convertendo a data de cadastro para timestamp (usar UNIX_TIMESTAMP)
-- # 150 - Consultar os clientes exibindo há quantos meses cada um se cadastrou (usar TIMESTAMPDIFF)
-- # 151 - Consultar os clientes que se cadastraram em meses com 31 dias
-- # 152 - Consultar os clientes exibindo a idade do cadastro em anos completos (usar TIMESTAMPDIFF com YEAR)
-- # 153 - Consultar a data de cadastro adicionando 6 meses (usar DATE_ADD com MONTH)
-- # 154 - Consultar os clientes onde a diferença entre cadastro e última compra seja menor que 30 dias
-- # 155 - Consultar os clientes formatando a data de cadastro como "Nome_do_Dia, DD/MM/YYYY"