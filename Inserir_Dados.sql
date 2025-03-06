/*
    =======================================================
    Arquivo: Inserir_Dados.sql
    Descrição: Scripts para inserção de dados iniciais nas tabelas do banco de dados app_corridas.
                Inclui dados com valores NULL e melhorias para maior compreensão.
    =======================================================
*/

-- Inserindo dados na tabela Passageiro
INSERT INTO passageiro (cpf, nome, telefone) VALUES
    ('52998224725', 'Joao Silva', '11987654321'),
    ('39845612387', 'Maria Oliveira', '21987654321'),
    ('12345678909', 'Carlos Souza', '31987654321'),
    ('98765432100', 'Ana Costa', '41987654321'),
    ('45678912345', 'Pedro Santos', '51987654321'),
    ('65432198712', 'Juliana Lima', '61987654321');
SELECT * FROM passageiro;

-- Inserindo dados na tabela Motorista
INSERT INTO motorista (cpf, nome, telefone, cnh, avaliacao_media, status) VALUES
    ('12345678901', 'Fernando Souza', '11987654321', '12345678901234567890', NULL, 'Ativo'),
    ('23456789012', 'Mariana Lima', '21987654321', '23456789012345678901', 4.0, 'Ativo'),
    ('34567890123', 'Ricardo Oliveira', '31987654321', '34567890123456789012', 3.0, 'Inativo'),
    ('45678901234', 'Camila Santos', '41987654321', '45678901234567890123', 4.0, 'Ativo'),
    ('56789012345', 'Lucas Costa', '51987654321', '56789012345678901234', 5.0, 'Ativo'),
    ('67890123456', 'Patricia Almeida', '61987654321', '67890123456789012345',  NULL, 'Ativo');
SELECT * FROM motorista;

-- Inserindo dados na tabela Veiculo
INSERT INTO veiculo (renavam, placa, modelo, cor, capacidade, cpf_motorista) VALUES
    ('12345678901', 'ABC-1234', 'Fiesta', 'Preto', 4, '12345678901'),
    ('23456789012', 'DEF-5678', 'Civic', 'Branco', 5, '23456789012'),
    ('34567890123', 'GHI-9012', 'Corolla', 'Prata', 5, '34567890123'),
    ('45678901234', 'JKL-3456', 'Onix', 'Vermelho', 4, '45678901234'),
    ('56789012345', 'MNO-7890', 'HB20', 'Azul', 5, '56789012345'),
    ('67890123456', 'PQR-1234', 'Cruze', 'Cinza', 4, '67890123456');
SELECT * FROM veiculo;

-- Inserindo dados na tabela Pagamento
INSERT INTO pagamento (id_pagamento, valor, forma_pagamento, status, cpf_passageiro) VALUES
    (1, NULL, 'Cartão de crédito', 'Pendente', '52998224725'),
    (2, 17.00, 'Pix', 'Pago', '39845612387'),
    (3, 14.75, 'Dinheiro', 'Pago', '12345678909'),
    (4, 11.00, 'Cartão de débito', 'Pago', '98765432100'),
    (5, 21.00, 'Cartão de crédito', 'Cancelado', '45678912345'),
    (6, NULL, NULL, 'Pendente', '65432198712');
SELECT * FROM pagamento;

-- Inserindo dados na tabela Corrida
INSERT INTO corrida (id_corrida, distancia, valor, status, cpf_motorista, id_pagamento) VALUES
    (1, 5.2, NULL, 'Solicitada', '12345678901', 1),
    (2, 6.0, 17.00, 'Finalizada', '23456789012', 2),
    (3, 4.5, 14.00, 'Finalizada', '34567890123', 3),
    (4, 3.0, 11.00, 'Finalizada', '45678901234', 4),
    (5, 8.0, 21.00, 'Cancelada', '56789012345', 5);
    (6, 7.5, NULL, 'Solicitada', '67890123456', 6);
SELECT * FROM corrida;

-- Inserindo dados na tabela Avaliacao
INSERT INTO avaliacao (id_avaliacao, nota, comentario, data_avaliacao, cpf_motorista, cpf_passageiro) VALUES
    -- (1, 5, 'Ótimo motorista!', '2023-10-01', '12345678901', '52998224725'),
    (2, 4, 'Bom serviço.', '2023-10-02', '23456789012', '39845612387'),
    (3, 3, 'Poderia ser melhor.', '2023-10-03', '34567890123', '12345678909'),
    (4, 4, 'Boa viagem.', '2023-10-04', '45678901234', '98765432100'),
    (5, 5, 'Ótima viagem.', '2023-10-05', '56789012345', '45678912345');
    -- (6, 4, 'Boa viagem.', '2023-10-06', '67890123456', '65432198712');
SELECT * FROM avaliacao;

-- Inserindo as localizações dos motoristas
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_motorista, id_corrida) VALUES
    (1, -7.219200, -35.881700, 'Malvinas', 'Rua das Umburanas', 100, '12345678901', 1),
    (2, -7.217000, -35.876000, 'Bairro das Cidades', 'Rua das Nacoes Unidas', 200, '23456789012', 2),
    (3, -7.240000, -35.860000, 'Vila Cabral', 'Avenida Severino Cabral', 300, '34567890123', 3),
    (4, -7.210000, -35.868000, 'Bodocongo', 'Avenida Liberdade', 400, '45678901234', 4),
    (5, -7.205000, -35.890000, 'Catole', 'Rua Jose de Alencar', 500, '56789012345', 5),
    (6, -7.219200, -35.881700, 'Centro', 'Rua João Pessoa', 100, '67890123456', 6);

INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_passageiro, id_corrida) VALUES
    (7, -7.217000, -35.876000, 'Malvinas', 'Rua das Umburanas', 200, '52998224725', 1),
    (8, -7.240000, -35.860000, 'Vila Cabral', 'Avenida Severino Cabral', 300, '39845612387', 2),
    (9, -7.210000, -35.868000, 'Bodocongo', 'Avenida Liberdade', 400, '12345678909', 3),
    (10, -7.205000, -35.890000, 'Catole', 'Rua Jose de Alencar', 500, '98765432100', 4),
    (11, -7.222000, -35.882000, 'Jardim Tavares', 'Rua Tavares', 600, '45678912345', 5),
    (12, -7.219200, -35.881700, 'Centro', 'Rua João Pessoa', 100, '65432198712', 6);

-- Inserindo dados na tabela N:N Passageiro e Corrida
INSERT INTO passageiro_corrida (cpf_passageiro, id_corrida) VALUES
    ('52998224725', 1),
    ('39845612387', 2),
    ('12345678909', 3),
    ('98765432100', 4),
    ('45678912345', 5),
    ('65432198712', 6);
SELECT * FROM passageiro_corrida;


-- Visualizando todos os dados inseridos nas tabelas
SELECT * FROM passageiro;
SELECT * FROM motorista;
SELECT * FROM veiculo;
SELECT * FROM avaliacao;
SELECT * FROM localizacao;
SELECT * FROM pagamento;
SELECT * FROM corrida;
SELECT * FROM passageiro_corrida;