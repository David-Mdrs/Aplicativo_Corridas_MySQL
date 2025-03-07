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
    ('23456789012', 'Mariana Lima', '22587654321', '23456789012345678901', 4.0, 'Ativo'),
    ('34567890123', 'Ricardo Oliveira', '35787654321', '34567890123456789012', 3.0, 'Inativo'),
    ('45678901234', 'Camila Santos', '46887654321', '45678901234567890123', 4.0, 'Ativo'),
    ('56789012345', 'Lucas Costa', '57987654321', '56789012345678901234', 5.0, 'Ativo'),
    ('67890123456', 'Paulo Almeida', '68123456789', '67890123456789012345', 4.5, 'Ativo'),
    ('78901234567', 'Beatriz Costa', '79234567890', '78901234567890123456', 5.0, 'Ativo');
SELECT * FROM motorista;

-- Inserindo dados na tabela Veiculo
INSERT INTO veiculo (renavam, placa, modelo, cor, capacidade, cpf_motorista) VALUES
    ('45345678901', 'DEF-5678', 'Civic', 'Branco', 5, '23456789012'),
    ('68456789012', 'GHI-9012', 'Corolla', 'Prata', 5, '34567890123'),
    ('37567890123', 'JKL-3456', 'Onix', 'Vermelho', 4, '45678901234'),
    ('69678901234', 'MNO-7890', 'HB20', 'Azul', 5, '56789012345'),
    ('70789012345', 'PQR-5678', 'Fusca', 'Amarelo', 4, '67890123456'),
    ('62890123456', 'STU-9012', 'Jetta', 'Preto', 5, '78901234567');
SELECT * FROM veiculo;

-- Inserindo dados na tabela Pagamento
INSERT INTO pagamento (id_pagamento, valor, forma_pagamento, status, cpf_passageiro) VALUES
    (1, 17.00, 'Pix', 'Pago', '39845612387'),
    (2, 14.75, 'Dinheiro', 'Pago', '12345678909'),
    (3, 11.00, 'Cartão de débito', 'Pago', '98765432100'),
    (4, 21.00, 'Cartão de crédito', 'Cancelado', '45678912345'),
    (5, 17.00, 'Dinheiro', 'Cancelado', '45678912345'),
    (6, 14.00, 'Pix', 'Pago', '39845612387');
SELECT * FROM pagamento;

-- Inserindo dados na tabela Corrida
INSERT INTO corrida (id_corrida, distancia, valor, status, cpf_motorista, id_pagamento) VALUES
    (1, 6.0, 17.00, 'Finalizada', '23456789012', 1),
    (2, 4.5, 14.00, 'Finalizada', '34567890123', 2),
    (3, 3.0, 11.00, 'Finalizada', '45678901234', 3),
    (4, 8.0, 21.00, 'Cancelada', '56789012345', 4),
    (5, 6.0, 17.00, 'Cancelada', '23456789012', 5),
    (6, 4.5, 14.00, 'Finalizada', '34567890123', 6);
SELECT * FROM corrida;

-- Inserindo dados na tabela Avaliacao
INSERT INTO avaliacao (id_avaliacao, nota, comentario, data_avaliacao, cpf_motorista, cpf_passageiro) VALUES
    (1, 4, 'Bom serviço.', '2023-10-02', '23456789012', '39845612387'),
    (2, 3, 'Poderia ser melhor.', '2023-10-03', '34567890123', '12345678909'),
    (3, 4, 'Boa viagem.', '2023-10-04', '45678901234', '98765432100'),
    (4, 5, 'Ótima viagem.', '2023-10-05', '56789012345', '45678912345'),
    (5, 5, 'Excelente experiência!', '2023-10-06', '23456789012', '45678912345'),
    (6, 2, 'Viagem ruim.', '2023-10-07', '34567890123', '39845612387');
SELECT * FROM avaliacao;

-- Inserindo as localizações dos motoristas
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_motorista, id_corrida) VALUES
    (1, -7.217000, -35.876000, 'Bairro das Cidades', 'Rua das Nacoes Unidas', 200, '23456789012', 1),
    (2, -7.240000, -35.860000, 'Vila Cabral', 'Avenida Severino Cabral', 300, '34567890123', 2),
    (3, -7.210000, -35.868000, 'Bodocongo', 'Avenida Liberdade', 400, '45678901234', 3),
    (4, -7.205000, -35.890000, 'Catole', 'Rua Jose de Alencar', 500, '56789012345', 4),
    (5, -7.220000, -35.875000, 'Centro', 'Rua Nova', 150, '23456789012', 5),
    (6, -7.245000, -35.865000, 'Vila Cabral', 'Avenida Severino Cabral', 350, '34567890123', 6);
SELECT * FROM localizacao;

-- Inserindo as localizações dos passageiros
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_passageiro, id_corrida) VALUES
    (8, -7.240000, -35.860000, 'Vila Cabral', 'Avenida Severino Cabral', 300, '39845612387', 1),
    (9, -7.210000, -35.868000, 'Bodocongo', 'Avenida Liberdade', 400, '12345678909', 2),
    (10, -7.205000, -35.890000, 'Catole', 'Rua Jose de Alencar', 500, '98765432100', 3),
    (11, -7.222000, -35.882000, 'Jardim Tavares', 'Rua Tavares', 600, '45678912345', 4),
    (12, -7.220000, -35.875000, 'Centro', 'Rua Nova', 160, '45678912345', 5),
    (13, -7.240000, -35.860000, 'Bairro das Cidades', 'Rua das Nacoes Unidas', 220, '39845612387', 6);
SELECT * FROM localizacao;

-- Inserindo dados na tabela N:N Passageiro e Corrida
INSERT INTO passageiro_corrida (cpf_passageiro, id_corrida) VALUES
    ('39845612387', 1),
    ('12345678909', 2),
    ('98765432100', 3),
    ('45678912345', 4),
    ('45678912345', 5),
    ('39845612387', 6);
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