/*
  =======================================================
  Arquivo: Inserir_Dados.sql
  Descrição: Scripts para inserção de dados iniciais nas tabelas do banco de dados app_corridas.
             Inclui dados que se relacionam.
  =======================================================
*/

-- Inserindo dados na tabela Passageiro
INSERT INTO passageiro (cpf, nome, telefone) VALUES
  ('529.982.247-25', 'João Silva', '11987654321'),
  ('398.456.123-87', 'Maria Oliveira', '21987654321'),
  ('123.456.789-09', 'Carlos Souza', '31987654321'),
  ('987.654.321-00', 'Ana Costa', '41987654321'),
  ('456.789.123-45', 'Pedro Santos', '51987654321'),
  ('654.321.987-12', 'Juliana Lima', '61987654321');
SELECT * FROM passageiro;

-- Inserindo dados na tabela Motorista
INSERT INTO motorista (cpf, nome, telefone, cnh, avaliacao_media, status) VALUES
  ('123.456.789-01', 'Fernando Souza', '11987654321', '12345678901234567890', 4.5, 'Ativo'),
  ('234.567.890-12', 'Mariana Lima', '21987654321', '23456789012345678901', 4.8, 'Ativo'),
  ('345.678.901-23', 'Ricardo Oliveira', '31987654321', '34567890123456789012', 3.9, 'Inativo'),
  ('456.789.012-34', 'Camila Santos', '41987654321', '45678901234567890123', 4.2, 'Ativo'),
  ('567.890.123-45', 'Lucas Costa', '51987654321', '56789012345678901234', 4.7, 'Ativo'),
  ('678.901.234-56', 'Patrícia Almeida', '61987654321', '67890123456789012345', 4.0, 'Inativo');
SELECT * FROM motorista;

-- Inserindo dados na tabela Veiculo
INSERT INTO veiculo (renavam, placa, modelo, cor, capacidade, cpf_motorista) VALUES
  ('12345678901', 'ABC-1234', 'Fiesta', 'Preto', 4, '123.456.789-01'),
  ('23456789012', 'DEF-5678', 'Civic', 'Branco', 5, '234.567.890-12'),
  ('34567890123', 'GHI-9012', 'Corolla', 'Prata', 5, '345.678.901-23'),
  ('45678901234', 'JKL-3456', 'Onix', 'Vermelho', 4, '456.789.012-34'),
  ('56789012345', 'MNO-7890', 'HB20', 'Azul', 5, '567.890.123-45'),
  ('67890123456', 'PQR-1234', 'Cruze', 'Cinza', 4, '678.901.234-56');
SELECT * FROM veiculo;

-- Inserindo dados na tabela Avaliacao
INSERT INTO avaliacao (id_avaliacao, nota, comentario, data_avaliacao, cpf_motorista, cpf_passageiro) VALUES
  (1, 5, 'Ótimo motorista!', '2023-10-01', '123.456.789-01', '111.111.111-11'),
  (2, 4, 'Bom serviço.', '2023-10-02', '234.567.890-12', '222.222.222-22'),
  (3, 3, 'Poderia ser melhor.', '2023-10-03', '345.678.901-23', '333.333.333-33'),
  (4, 5, 'Excelente!', '2023-10-04', '456.789.012-34', '444.444.444-44'),
  (5, 2, 'Não gostei.', '2023-10-05', '567.890.123-45', '555.555.555-55'),
  (6, 4, 'Boa viagem.', '2023-10-06', '678.901.234-56', '666.666.666-66');
SELECT * FROM avaliacao;

-- Inserindo dados na tabela Localizacao
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_motorista, cpf_passageiro, id_corrida) VALUES
  (1, -23.550520, -46.633308, 'Centro', 'Rua Augusta', 100, '123.456.789-01', '111.111.111-11', 1),
  (2, -23.563000, -46.654000, 'Pinheiros', 'Rua dos Pinheiros', 200, '234.567.890-12', '222.222.222-22', 2),
  (3, -23.570000, -46.690000, 'Vila Madalena', 'Rua Aspicuelta', 300, '345.678.901-23', '333.333.333-33', 3),
  (4, -23.580000, -46.680000, 'Itaim Bibi', 'Avenida Brigadeiro Faria Lima', 400, '456.789.012-34', '444.444.444-44', 4),
  (5, -23.590000, -46.670000, 'Moema', 'Avenida Ibirapuera', 500, '567.890.123-45', '555.555.555-55', 5),
  (6, -23.600000, -46.660000, 'Jardins', 'Rua Oscar Freire', 600, '678.901.234-56', '666.666.666-66', 6);
SELECT * FROM localizacao;

-- Inserindo dados na tabela Pagamento
INSERT INTO pagamento (id_pagamento, valor, forma_pagamento, status, cpf_passageiro) VALUES
  (1, 25.50, 'Cartão de crédito', 'Pago', '111.111.111-11'),
  (2, 30.00, 'Pix', 'Pago', '222.222.222-22'),
  (3, 20.75, 'Dinheiro', 'Pendente', '333.333.333-33'),
  (4, 15.00, 'Cartão de débito', 'Pago', '444.444.444-44'),
  (5, 40.00, 'Cartão de crédito', 'Cancelado', '555.555.555-55'),
  (6, 35.25, 'Pix', 'Pago', '666.666.666-66');
SELECT * FROM pagamento;