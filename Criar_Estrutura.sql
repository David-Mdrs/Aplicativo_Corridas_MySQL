/*
  =======================================================
  Banco de dados: app_corridas
  Descrição: Sistema de gerenciamento de corridas para um aplicativo de transporte.
             Armazena dados de passageiros, motoristas, veículos, corridas, pagamentos,
             avaliações e localizações.
  Autor: David Medeiros
  Data de Criação: 14/02/2025
  Versão: 1.0
  =======================================================
*/

/*
  =======================================================
  Arquivo: Criar_Estrutura.sql
  Descrição: Scripts para criação das tabelas e definição de chaves primárias,
             estrangeiras e restrições do banco de dados app_corridas.
  =======================================================
*/

-- Excluindo banco de dados
-- DROP DATABASE app_corridas;

-- Criando novo banco de dados
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
    avaliacao_media DECIMAL(2,1) CHECK (avaliacao_media BETWEEN 0 AND 5),
    status VARCHAR(11) NOT NULL DEFAULT 'Inativo',
    CHECK (status IN ('Ativo', 'Inativo'))
);
DESC motorista;

-- Tabela: Veiculo
CREATE TABLE IF NOT EXISTS veiculo(
    renavam VARCHAR(11) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(10) NOT NULL,
    cor VARCHAR(20),
    capacidade INT NOT NULL,
    cpf_motorista VARCHAR(11)
);
DESC veiculo;

-- Tabela: Avaliacao
CREATE TABLE IF NOT EXISTS avaliacao(
    id_avaliacao INT PRIMARY KEY,
    nota INT,
    comentario VARCHAR(100),
    data_avaliacao DATE NOT NULL,
    cpf_motorista VARCHAR(11),
    cpf_passageiro VARCHAR(11)
);
DESC avaliacao;

-- Tabela: Localizacao
CREATE TABLE IF NOT EXISTS localizacao(
    id_localizacao INT PRIMARY KEY,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    bairro VARCHAR(100),
    rua VARCHAR(100),
    numero INT,
    cpf_motorista VARCHAR(11),
    cpf_passageiro VARCHAR(11),
    id_corrida INT
);
DESC localizacao;

-- Tabela: Pagamento
CREATE TABLE IF NOT EXISTS pagamento(
    id_pagamento INT PRIMARY KEY,
    valor DECIMAL(5,2),
    forma_pagamento VARCHAR(20),
    status VARCHAR(10) NOT NULL,
    cpf_passageiro VARCHAR(11),
    CHECK (forma_pagamento IN ('Dinheiro', 'Cartão de crédito', 'Cartão de débito', 'Pix')),
    CHECK (status IN ('Pendente', 'Pago', 'Cancelado'))
);
DESC pagamento;

-- Tabela: Corrida
CREATE TABLE IF NOT EXISTS corrida(
    id_corrida INT PRIMARY KEY,
    distancia DECIMAL(5,2),
    valor DECIMAL(5,2),
    status VARCHAR(11),
    cpf_motorista VARCHAR(11),
    id_pagamento INT,
    CHECK (status IN ('Solicitada', 'Em andamento', 'Finalizada', 'Cancelada'))
);
DESC corrida;

-- Tabela N:N da relação: Passageiro e Corrida
CREATE TABLE IF NOT EXISTS passageiro_corrida (
    cpf_passageiro VARCHAR(11) NOT NULL,
    id_corrida INT NOT NULL,
    PRIMARY KEY (cpf_passageiro, id_corrida)
);
DESC passageiro_corrida;



-- Chave estrangeira Veiculo
ALTER TABLE veiculo ADD CONSTRAINT veiculo_motorista_fk FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf);

-- Chaves estrangeiras Avaliacao
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_passageiro_fk FOREIGN KEY (cpf_passageiro) REFERENCES passageiro(cpf);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_motorista_fk FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf);

-- Chaves estrangeiras Localizacao
ALTER TABLE localizacao ADD CONSTRAINT localizacao_passageiro_fk FOREIGN KEY (cpf_passageiro) REFERENCES passageiro(cpf);
ALTER TABLE localizacao ADD CONSTRAINT localizacao_motorista_fk FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf);
ALTER TABLE localizacao ADD CONSTRAINT localizacao_corrida_fk FOREIGN KEY (id_corrida) REFERENCES corrida(id_corrida);

-- Chave estrangeira Pagamento
ALTER TABLE pagamento ADD CONSTRAINT pagamento_passageiro_fk FOREIGN KEY (cpf_passageiro) REFERENCES passageiro(cpf);

-- Chaves estrangeiras Corrida
ALTER TABLE corrida ADD CONSTRAINT corrida_motorista_fk FOREIGN KEY (cpf_motorista) REFERENCES motorista(cpf);
ALTER TABLE corrida ADD CONSTRAINT corrida_pagamento_fk FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento);

-- Chaves estrangeiras N:N Passageiro e Corrida
ALTER TABLE passageiro_corrida ADD CONSTRAINT pc_passageiro_fk FOREIGN KEY (cpf_passageiro) REFERENCES passageiro(cpf);
ALTER TABLE passageiro_corrida ADD CONSTRAINT pc_corrida_fk FOREIGN KEY (id_corrida) REFERENCES corrida(id_corrida);
