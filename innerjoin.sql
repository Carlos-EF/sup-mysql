DROP DATABASE IF EXISTS mercado;
CREATE DATABASE mercado;
USE mercado;

CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

INSERT INTO categorias (nome) VALUES ("Hortifruti"); -- id gerado 1
INSERT INTO categorias (nome) VALUES ("Embutidos"); -- id gerado 2
SELECT * FROM categorias;

-- PK -> Primary Key (Chave Primária)
-- FK -> Foreign Key (Chave estrangeira) sempre está relacionada a outra Chave primária
-- FK tem que estar atrelada a um PK

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_categoria INT,
    
    FOREIGN KEY (id_categoria) REFERENCES categorias (id)
);

INSERT INTO produtos (nome, id_categoria) VALUES ("Batatinha", 1);
INSERT INTO produtos (nome, id_categoria) VALUES ("Calabresa", 2);
INSERT INTO produtos (nome, id_categoria) VALUES ("Bacon", 2);
INSERT INTO produtos (nome, id_categoria) VALUES ("Toddy", 3);

SELECT * FROM produtos;

-- Carregar os dados dos produtos e da sua categoria
SELECT categorias.nome, produtos.nome FROM produtos INNER JOIN categorias ON (produtos.id_categoria = categorias.id);

CREATE TABLE times_futebol(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    faturamento_anual DOUBLE
);

INSERT INTO times_futebol (nome, faturamento_anual) VALUES ("Flamengo", 1334000000.00);
INSERT INTO times_futebol (nome, faturamento_anual) VALUES ("Palmeiras", 1274000000.00);
INSERT INTO times_futebol (nome, faturamento_anual) VALUES ("Corinthians", 1115000000.00);
INSERT INTO times_futebol (nome, faturamento_anual) VALUES ("São Paulo", 731900000.00);
INSERT INTO times_futebol (nome, faturamento_anual) VALUES ("Botafogo", 719700000.00);

SELECT * FROM times_futebol;

CREATE TABLE jogadores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_time_futebol INT,
    
    FOREIGN KEY (id_time_futebol) REFERENCES times_futebol (id)
);

INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Jorge Santos", 1);
INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Bruno Silva", 1);

INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Carlinhos Maia", 2);
INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Douglas Kleber", 2);

INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Kleber Martins", 3);
INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Lucas do Santos", 3);

INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Pedro Alves", 4);
INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Marcio Felix", 4);

INSERT INTO jogadores (nome, id_time_futebol) VALUES ("William Brás", 5);
INSERT INTO jogadores (nome, id_time_futebol) VALUES ("Cleiton Jesus", 5);

SELECT * FROM jogadores;
SELECT jogadores.nome, times_futebol.nome FROM jogadores INNER JOIN times_futebol ON (jogadores.id_time_futebol = times_futebol.id);

CREATE TABLE categorias_financeiras(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

INSERT INTO categorias_financeiras (nome) VALUES ("Aluguel");
INSERT INTO categorias_financeiras (nome) VALUES ("Salário");
INSERT INTO categorias_financeiras (nome) VALUES ("Lazer");
INSERT INTO categorias_financeiras (nome) VALUES ("Alimentação");
INSERT INTO categorias_financeiras (nome) VALUES ("Viagens");
INSERT INTO categorias_financeiras (nome) VALUES ("Condomínio");
INSERT INTO categorias_financeiras (nome) VALUES ("Transporte");
INSERT INTO categorias_financeiras (nome) VALUES ("Emergência");
INSERT INTO categorias_financeiras (nome) VALUES ("Despesa Pessoal");
INSERT INTO categorias_financeiras (nome) VALUES ("Saúde");

SELECT * FROM categorias_financeiras;

CREATE TABLE entradas_financeiras(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    nome VARCHAR(100),
    valor DOUBLE,
    
    FOREIGN KEY (id_categoria) REFERENCES categorias_financeiras (id)
);

INSERT INTO entradas_financeiras (id_categoria, nome, valor) VALUES (2, "Empresa Anonymas LTDA", 2400.50);
INSERT INTO entradas_financeiras (id_categoria, nome, valor) VALUES (2, "ChoCO C.O", 1450.90);

INSERT INTO entradas_financeiras (id_categoria, nome, valor) VALUES (1, "Fachadas Imobiliaria Brasil", 3000.00);
INSERT INTO entradas_financeiras (id_categoria, nome, valor) VALUES (7, "InterBra Trajetos", 100.00);

SELECT * FROM entradas_financeiras;
SELECT categorias_financeiras.nome, entradas_financeiras.nome, entradas_financeiras.valor FROM entradas_financeiras INNER JOIN categorias_financeiras ON (entradas_financeiras.id_categoria = categorias_financeiras.id);

CREATE TABLE saidas_financeiras (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    nome VARCHAR(100),
    valor DOUBLE,
    data_vencimento DATE,
    status VARCHAR(100),
    
    FOREIGN KEY (id_categoria) REFERENCES categorias_financeiras (id)
);

INSERT INTO saidas_financeiras (id_categoria, nome, valor, data_vencimento, status) VALUES (1, "BluLock Corretagem", 2150.60, "2025-02-10", "Pendente");
UPDATE saidas_financeiras SET data_vencimento = "2026-02-10" WHERE id = 1;

INSERT INTO saidas_financeiras (id_categoria, nome, valor, data_vencimento, status) VALUES (3, "MacroHard Game-Not-Pass", 150.99, "2025-12-10", "Pago");
INSERT INTO saidas_financeiras (id_categoria, nome, valor, data_vencimento, status) VALUES (10, "Farmácia HP UP!", 250.00, "2025-12-29", "Pendente");
INSERT INTO saidas_financeiras (id_categoria, nome, valor, data_vencimento, status) VALUES (4, "Burguer Queen", 124.99, "2025-12-01", "Pago");
INSERT INTO saidas_financeiras (id_categoria, nome, valor, data_vencimento, status) VALUES (7, "100", 24.99, "2025-12-01", "Pago");

SELECT * FROM saidas_financeiras;

SELECT categorias_financeiras.nome, saidas_financeiras.nome, saidas_financeiras.valor, saidas_financeiras.data_vencimento, status FROM saidas_financeiras INNER JOIN categorias_financeiras ON (saidas_financeiras.id_categoria = categorias_financeiras.id);

CREATE TABLE estados(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    Sigla VARCHAR(2)
);

INSERT INTO estados (nome, sigla) VALUES ("São Paulo", "SP");
INSERT INTO estados (nome, sigla) VALUES ("Santa Catarina", "SC");

SELECT * FROM estados;

CREATE TABLE cidades (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_estado INT,
    
    FOREIGN KEY (id_estado) REFERENCES estados (id)
);

INSERT INTO cidades (nome, id_estado) VALUE ("São Paulo", 1);
INSERT INTO cidades (nome, id_estado) VALUE ("Osasco", 1);
INSERT INTO cidades (nome, id_estado) VALUE ("BLumenau", 2);
UPDATE cidades SET nome = "Blumenau" WHERE id = 2;
INSERT INTO cidades (nome, id_estado) VALUE ("Joinville", 2);

SELECT * FROM cidades;
SELECT cidades.id, cidades.nome, estados.nome AS "Estado" FROM cidades INNER JOIN estados ON (cidades.id_estado = estados.id);

CREATE TABLE bairros (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_cidade INT,
    
    FOREIGN KEY (id_cidade) REFERENCES cidades (id)
);

INSERT INTO bairros (nome, id_cidade) VALUES ("Vila Madalena", 1); 
INSERT INTO bairros (nome, id_cidade) VALUES ("Presidente Altino", 3); 
INSERT INTO bairros (nome, id_cidade) VALUES ("Velha", 2);
INSERT INTO bairros (nome, id_cidade) VALUES ("Vila nova", 4);
UPDATE bairros SET nome = "Vila Nova" WHERE id = 4;

SELECT * FROM bairros;
SELECT bairros.id, bairros.nome, cidades.nome AS "Cidade" FROM bairros INNER JOIN cidades ON (bairros.id_cidade = cidades.id);

CREATE TABLE enderecos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    logradouro VARCHAR(100),
    complemento VARCHAR(100),
    id_bairro INT,
    
    FOREIGN KEY (id_bairro) REFERENCES bairros (id)
);

INSERT INTO  enderecos (numero, logradouro, complemento, id_bairro) VALUES (201, "Rua dos Caçadores", "Apartamento 505", 2);
INSERT INTO  enderecos (numero, logradouro, complemento, id_bairro) VALUES (151, "Rua Alex kricheldorf", "Perto do Bar do Zé", 4);
UPDATE enderecos SET logradouro = "Rua Alex Kricheldorf" WHERE id = 2;
INSERT INTO  enderecos (numero, logradouro, complemento, id_bairro) VALUES (79, "Rua Agostinho Bezerra", "Casa verde-musgo", 1);
INSERT INTO  enderecos (numero, logradouro, complemento, id_bairro) VALUES (277, "Rua Arnaldo de Oliveira Barreto", "Apartamento 110", 3);

SELECT * FROM enderecos;
SELECT enderecos.id, enderecos.numero, enderecos.logradouro, enderecos.complemento, bairros.nome AS "Bairro", cidades.nome AS "Cidade", estados.nome AS "Estado", estados.sigla AS "Sigla" FROM enderecos INNER JOIN bairros ON (enderecos.id_bairro = bairros.id) INNER JOIN cidades ON (bairros.id_cidade = cidades.id) INNER JOIN estados ON (cidades.id_estado = estados.id);

 



