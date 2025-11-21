-- Criar o banco de dados
CREATE DATABASE locadora;

-- Seleciona o banco de dados
USE locadora;

-- Consultar tabelas
SHOW TABLES;

-- Criar tabela
CREATE TABLE usuarios(
	id INT,
    nome VARCHAR(30) -- nome pode conter no máximo até 30 caracteres
);

-- Inserir registro
INSERT INTO usuarios(id, nome) VALUE (1, "Carlos");

-- Consultar registros
SELECT id, nome FROM usuarios;

-- Criar os outros inserts
INSERT INTO usuarios(id, nome) VALUE (2, "Leidiane");

INSERT INTO usuarios(id, nome) VALUE (3, "Vand");

INSERT INTO usuarios(id, nome) VALUE (4, "João Vitor");

INSERT INTO usuarios(id, nome) VALUE (5, "Felipe");

INSERT INTO usuarios(id, nome) VALUE (6, "John");

INSERT INTO usuarios(id, nome) VALUE (7, "Vitor");

INSERT INTO usuarios(id, nome) VALUE (8, "Joshua");

INSERT INTO usuarios(id, nome) VALUE (9, "Gustavo");
-- Consultar os registros

-- Apagar o registro do Carlos
DELETE FROM usuarios WHERE id = 1;

-- Consultar os registros
SELECT id, nome FROM usuarios;

-- Alterar o nome de um registro
UPDATE usuarios SET nome = "Carlos da Silva" WHERE id = 1;

CREATE TABLE filmes(
	id INT,
    titulo VARCHAR(50),
    autor VARCHAR(50),
    classificacao INT,
    genero VARCHAR(30)
);

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (1, "A Lagoa Azul", "Randal Kleiser", 16, "Drama");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (2, "Exterminador do Futuro", "James Cameron", 18, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (3, "Vingadores: Ultimato", "Anthony e Joe Russo", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (4, "Homem de Ferro", "Jon Favreu", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (5, "Pantera Negra", "Ryan Coogler", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (6, "Capitão America: O Soldado Invernal", "Anthony e Joe Russo", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (7, "Liga da Justiça", "Zack Snyder", 14, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (8, "Mulher-Maravilha", "Patty Jenkins", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (9, "Batman: O Cavaleiro das Trevas", "Christopher Nolan", 14, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (10, "Aquaman", "James Wan", 12, "Ação");

INSERT INTO filmes(id, titulo, autor, classificacao, genero) VALUE (11, "Shazam!", "David F. Sandberg", 12, "Comédia/Ação");

INSERT INTO filmes(id, titulo, autor, classficacao, genero) VALUE (12, "Thor: Ragnarok", "Taika Waititi", 12, "Ação");

SELECT id, titulo, autor, classificacao, genero FROM filmes;

CREATE TABLE jogos(
	id INT,
    nome VARCHAR(50),
    preco_unidade DOUBLE(10, 2),
    data_lancamento DATE,
    produtora VARChAR(50),
    distribuidora VARCHAR(50),
    xbox BIT,
    ps BIT,
    pc BIT,
    switch BIT
);

INSERT INTO jogos(id, nome, preco_unidade, data_lancamento, produtora, distribuidora, xbox, ps, pc, switch) VALUE (1, "Pokemon Red", 75.00, "1996-02-27", "Game Freak, Creatures Inc.", "Nintendo", 0, 0, 0, 0);

INSERT INTO jogos(id, nome, preco_unidade, data_lancamento, produtora, distribuidora, xbox, ps, pc, switch) VALUE (2, "Elden Ring", 259.99, "2022-02-25", "FromSoftware", "Bandai Namco Entertainment", 1, 1, 1, 0);

INSERT INTO jogos(id, nome, preco_unidade, data_lancamento, produtora, distribuidora, xbox, ps, pc, switch) VALUE (3, "Darksiders II", 70.00, "2012-08-14", "Vigil Games", "THQ Nordic", 1, 1, 1, 1);

SELECT id, nome, preco_unidade, data_lancamento, produtora, distribuidora, xbox, ps, pc, switch FROM jogos;

CREATE TABLE cds (
    id INT,
    nome VARCHAR(255),
    banda VARCHAR(255),
    duracao VARCHAR(50),
    quantidade_musicas INT,
    ano_lancamento VARCHAR(10),
    genero VARCHAR(100)
);

INSERT INTO cds VALUES (1, 'Sundowning', 'Sleep T0ken', '52:31', 12, 2019, 'Alternativ');
UPDATE cds SET banda = "Sleep Token" WHERE id = 1;

INSERT INTO cds VALUES (2, 'Take Me Back To Eden', 'Sleep Token', '', 12, '2023', 'Alt Metal');
UPDATE cds SET duracao = "63:26" WHERE id = 2;

INSERT INTO cds VALUES (3, 'Eternal Blue', 'Sleep Token', 'not sure', NULL, '202?', 'Metal');
UPDATE cds SET ano_lancamento = "2021" WHERE id = 3;
UPDATE cds SET banda = "Spiritbox" WHERE id = 3;
UPDATE cds SET duracao = "43:07" WHERE id = 3;

INSERT INTO cds VALUES (4, 'Meteora', 'Linkin Prak', '36:43', 13, 2003, 'N-U metal');
UPDATE cds SET banda = "Linkin Park" WHERE id = 4;

INSERT INTO cds VALUES (5, 'Hbrid Theory', 'Linkin Park', '37:??', 12, 2000, 'Nu-metal');
UPDATE cds SET nome = "Hybrid Theory" WHERE id = 5;
UPDATE cds SET duracao = "37:52" WHERE id = 5;

INSERT INTO cds VALUES (6, 'Minutes to Midnite', 'Lincon Park', '44:34', NULL, 2007, '');
UPDATE cds SET banda = "Linkin Park" WHERE id = 6;
UPDATE cds SET nome = "Minutes to Midnight" WHERE id = 6;
UPDATE cds SET quantidade_musicas = 12 WHERE id = 6;
UPDATE cds SET genero = "Nu-Metal" WHERE id = 6;

INSERT INTO cds VALUES (7, 'Holy Hell', 'Architects', '50:05', 11, '2018', 'Metalcore');
INSERT INTO cds VALUES (8, 'For Those That Wish to Exist', 'Architectts', NULL, 15, '2021', 'Metal core');
UPDATE cds SET nome = "Architects" WHERE id = 8;
UPDATE cds SET duracao = "58:21" WHERE id = 8;
UPDATE cds SET genero = "Metalcore" WHERE id = 8;

INSERT INTO cds VALUES (9, 'Lost Forever // Lost Togther', 'Architecs', '42:14', 10, '20X4', 'Metalcroe');
UPDATE cds SET nome = "Lost Forever // Lost Together" WHERE id = 9;
UPDATE cds SET genero = "Metalcore" WHERE id = 9;
UPDATE cds SET ano_lancamento = "2014" WHERE id = 9;
UPDATE cds SET banda = "Architects" WHERE id = 9;

INSERT INTO cds VALUES (10, 'Paranoid', 'Black Sabath', '42:06', 8, 1970, 'Heavy Metal');
UPDATE cds SET banda = "Black Sabbath" WHERE id = 10;

INSERT INTO cds VALUES (11, 'Black Sabbath', 'Black Sabbath', '38??', NULL, 1970, '');
UPDATE cds SET duracao = "38:08" WHERE id = 11;
UPDATE cds SET genero = "Heavy Metal" WHERE id = 11;

INSERT INTO cds VALUES (12, 'Master of Reality', 'Blk Sabbath', '', 8, '1971', 'Metal');
UPDATE cds SET banda = "Black Sabbath" WHERE id = 12;
UPDATE cds SET duracao = "34:29" WHERE id = 12;

INSERT INTO cds VALUES (13, 'The Death of Peace of Mind', 'Bad Omens', '53:44', 15, 2022, 'Metalcor');
UPDATE cds SET genero = "Metalcore" WHERE id = 13;

INSERT INTO cds VALUES (14, 'Finding God Before God Finds Me', 'Bad Omens', NULL, 10, '2019', 'Meta core');
UPDATE cds SET duracao = "42:02" WHERE id = 14;
UPDATE cds SET genero = "Metalcore" WHERE id = 14;

INSERT INTO cds VALUES (15, 'B A D O M E N S', 'Bad Omns', '??:??', 10, '2016', 'Rock?');
UPDATE cds SET banda = "Bad Omens" WHERE id = 15;
UPDATE cds SET duracao = "43:25" WHERE id = 15;

INSERT INTO cds VALUES (16, 'Inhuman Rampage', 'Dragon Force', '55:??', 8, 2005, 'Power metal');
UPDATE cds SET duracao = "56:05" WHERE id = 16;

INSERT INTO cds VALUES (17, 'Ultra Beatdown', 'DragonForce', '59:30', NULL, '', 'Power-Metal');
UPDATE cds SET quantidade_musicas = 8 WHERE id = 17;
UPDATE cds SET ano_lancamento = "2008" WHERE id = 17;

INSERT INTO cds VALUES (18, 'Valley of the Damed', 'Dragon F0rce', '40:12', 8, 2003, 'Powr metal');
UPDATE cds SET banda = "DragonForce" WHERE id = 18;
UPDATE cds SET nome = "Valley of the Damned" WHERE id = 18;
UPDATE cds SET genero = "Power Metal" WHERE id = 18;

INSERT INTO cds VALUES (19, 'The Black Parade', 'My Chemical Romnace', '51:53', 14, 2006, 'Emo rock');
UPDATE cds SET banda = "My Chemical Romance" WHERE id = 19;

INSERT INTO cds VALUES (20, 'Three Cheers for Sweet Revenge', 'My Chemicl Romance', '', NULL, 2004, 'Punk/Emo');
UPDATE cds SET duracao = "39:36" WHERE id = 20;
UPDATE cds SET quantidade_musicas = 13 WHERE id = 20;
UPDATE cds SET banda = "My Chemical Romance" WHERE id = 20;

INSERT INTO cds VALUES (21, 'Danger Days', 'My Chemical Romance', '53min', 15, '2010', '');
UPDATE cds SET genero = "Punk/Emo" WHERE id = 21;

INSERT INTO cds VALUES (22, 'By the Way', 'Restart', '40:15', 10, 2010, 'Pop Rock');

INSERT INTO cds VALUES (23, 'R(e)start', 'Restar', NULL, 12, '2011', 'P0p rock');
UPDATE cds SET banda = "Restart" WHERE id = 23;
UPDATE cds SET genero = "Pop Rock" WHERE id = 23;
UPDATE cds SET duracao = "30:55" WHERE id = 23;

INSERT INTO cds VALUES (24, 'Renascer', 'Restart', '??', 9, '', 'Pop');
UPDATE cds SET ano_lancamento = "2013" WHERE id = 24;
UPDATE cds SET duracao = "12:00" WHERE id = 24;

INSERT INTO cds VALUES (25, 'Millenial Rhapsody', 'Oliver Malcom', NULL, NULL, '20??', 'Alt Pop');
UPDATE cds SET banda = "Oliver Malcolm" WHERE id = 25;
UPDATE cds SET ano_lancamento = "2020" WHERE id = 25;
UPDATE cds SET duracao = "03:14" WHERE id = 25;
UPDATE cds SET quantidade_musicas = 1 WHERE id = 25;

SELECT id, nome, banda, duracao, quantidade_musicas, ano_lancamento, genero FROM cds;