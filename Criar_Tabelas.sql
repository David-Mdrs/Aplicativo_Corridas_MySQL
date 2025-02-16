-- Banco de dados: app_corridas
-- Descrição: Armazena dados do aplicativo de corridas.
CREATE DATABASE IF NOT EXISTS app_corridas;


-- Tabela: Passageiro
CREATE TABLE IF NOT EXISTS passageiro(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(13)
);
DESC passageiro;

-- Tabela: Motorista
CREATE TABLE IF NOT EXISTS motorista(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(13),
    cnh VARCHAR(20) NOT NULL,
    avaliacao_media DECIMAL(2,1) NOT NULL CHECK (avaliacao_media BETWEEN 0 AND 5),
    status ENUM("Ativo", "Inativo") NOT NULL
);
DESC motorista;

-- Tabela: Veiculo
CREATE TABLE IF NOT EXISTS veiculo(
    renavam VARCHAR(11) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(10) NOT NULL,
    cor VARCHAR(20),
    capacidade INT NOT NULL
);
DESC veiculo;

-- Tabela: Avaliacao
CREATE TABLE IF NOT EXISTS avaliacao(
    id_avaliacao INT PRIMARY KEY,
    nota INT NOT NULL,
    comentario VARCHAR(100),
    data_avaliacao DATE NOT NULL
);
DESC avaliacao;

-- Tabela: Localizacao
CREATE TABLE IF NOT EXISTS localizacao(
    id_localizacao INT PRIMARY KEY,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    bairro VARCHAR(100),
    rua VARCHAR(100),
    numero INT
);
DESC localizacao;

-- Tabela: Pagamento
CREATE TABLE IF NOT EXISTS pagamento(
    id_pagamento INT PRIMARY KEY,
    valor DECIMAL(5,2) NOT NULL,
    forma_pagamento ENUM("Dinheiro", "Cartão de crédito", "Cartão de débito", "Pix") NOT NULL,
    status ENUM("Pendente", "Pago", "Cancelado") NOT NULL
);
DESC pagamento;

-- Tabela: Corrida
CREATE TABLE IF NOT EXISTS corrida(
    id_corrida INT PRIMARY KEY,
    distancia DECIMAL(5,2),
    valor DECIMAL(5,2),
    status ENUM("Solicitada", "Em andamento", "Finalizada", "Cancelada")
);
DESC corrida;

-- Tabela N:N da relação: Passageiro e Corrida
CREATE TABLE IF NOT EXISTS passageiro_corrida(
    cpf_passageiro_fk VARCHAR(11) NOT NULL,
    id_corrida_fk INT NOT NULL,
    PRIMARY KEY (cpf_passageiro_fk, id_corrida_fk)
);
DESC passageiro_corrida;
