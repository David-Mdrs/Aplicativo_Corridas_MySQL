/*
    =======================================================
    Arquivo: Nova_Corrida.sql
    Descrição: Através de scripts, este arquivo simula o evento de uma corrida,
                    desde a criação do usuário, até a avaliação final.
               Scripts para inserção e manipulação de uma nova corrida.
               Inclui inserções, consultas e atualizações de dados.
    =======================================================
*/

-- Motorista está criando um novo cadastro
INSERT INTO motorista (cpf, nome, telefone, cnh) VALUES                                 -- Cadastrando usuário (motorista)
    ('12345678901', 'Fernando Souza', '13487654321', '12345678901234567890');
INSERT INTO veiculo (renavam, placa, modelo, cor, capacidade, cpf_motorista) VALUES     -- Cadastrando veículo
    ('62490162456', 'PQR-1234', 'Cruze', 'Cinza', 4, '12345678901');

-- Visualizando
SELECT m.nome AS "motorista", v.modelo, m.status, m.avaliacao_media FROM motorista m JOIN veiculo v
    ON m.cpf = v.cpf_motorista WHERE m.cpf = '12345678901';



-- Motorista inicia o aplicativo
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_motorista) VALUES    -- Iniciando localização (motorista)
    (7, -7.219200, -35.881700, 'Centro', 'Rua João Pessoa', 100, '12345678901');
UPDATE motorista SET status = 'Ativo' WHERE cpf = '12345678901';                                            -- Setando status para ativo

-- Visualizando
SELECT m.nome, v.modelo AS 'Carro', m.status, m.avaliacao_media, l.bairro, l.rua FROM motorista m JOIN veiculo v
    ON m.cpf = v.cpf_motorista JOIN localizacao l ON l.cpf_motorista = m.cpf
    WHERE m.cpf = '12345678901';



-- Usuário está iniciando um novo pedido de corrida
INSERT INTO corrida (id_corrida, distancia, status) VALUES (7, 3, 'Solicitada');                            -- Iniciando corrida

INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, cpf_passageiro, id_corrida) VALUES -- Iniciando localização (passageiro)
    (14, -7.219200, -35.881700, 'Centro', 'Rua João Pessoa', 100, '52998224725', 7);
INSERT INTO localizacao (id_localizacao, latitude, longitude, bairro, rua, numero, id_corrida) VALUES       -- Iniciando localização (destino)
    (15, -7.219000, -35.881000, 'Malvinas', 'Jamila', 50, 7);

INSERT INTO passageiro_corrida (cpf_passageiro, id_corrida) VALUES ('52998224725', 7);                      -- Relacionando passageiro e corrida
UPDATE corrida SET valor = 5 + (distancia * 2) WHERE id_corrida = 7;                                        -- Calculando valor da corrida

-- Visualizando
SELECT c.cpf_motorista AS 'motorista', p.nome AS 'passageiro', c.valor, c.status, c.id_pagamento FROM passageiro p
    JOIN passageiro_corrida pc ON p.cpf = pc.cpf_passageiro
    JOIN corrida c ON pc.id_corrida = c.id_corrida
    WHERE c.id_corrida = 7;



-- Motorista aceita corrida
UPDATE corrida SET cpf_motorista = '12345678901' WHERE id_corrida = 7;      -- Corrida se relaciona com motorista
UPDATE localizacao SET id_corrida = 7 WHERE cpf_motorista = '12345678901';  -- Relacionando localização da corrida e motorista
UPDATE corrida SET status = 'Em andamento' WHERE id_corrida = 7;            -- Passageiro entrou no carro

-- Visualizando
SELECT m.nome AS 'motorista', p.nome AS 'passageiro', c.valor, c.status, c.id_pagamento FROM passageiro p
    JOIN passageiro_corrida pc ON p.cpf = pc.cpf_passageiro
    JOIN corrida c ON pc.id_corrida = c.id_corrida
    JOIN motorista m ON c.cpf_motorista = m.cpf
    WHERE c.id_corrida = 7;



-- Passageiro chegou no seu destino
INSERT INTO pagamento (id_pagamento, forma_pagamento, status, cpf_passageiro) VALUES                    -- Inicializando pagamento         
    (7, 'Pix', 'Pendente', '52998224725');
UPDATE pagamento SET valor = (SELECT valor FROM corrida WHERE id_pagamento = 7) WHERE id_pagamento = 7; -- Setando valor com base na corrida
UPDATE corrida SET id_pagamento = 7 WHERE id_corrida = 7;                                               -- Relacionando corrida e pagamento

-- Visualizando
SELECT m.nome AS 'motorista', p.nome AS 'passageiro', c.status AS 'corrida', c.valor, pag.forma_pagamento,
pag.status AS 'pagamento', c.id_pagamento 
    FROM motorista m
    JOIN corrida c ON m.cpf = c.cpf_motorista
    JOIN pagamento pag ON c.id_pagamento = pag.id_pagamento
    JOIN passageiro_corrida pc ON c.id_corrida = pc.id_corrida
    JOIN passageiro p ON pc.cpf_passageiro = p.cpf
    WHERE c.id_corrida = 7;



-- Passageiro fez o pagamento
UPDATE pagamento SET status = 'Pago' WHERE id_pagamento = 7;        -- Atualizando status do pagamento
UPDATE corrida SET status = 'Finalizada' WHERE id_corrida = 7;      -- Atualizando status da corrida

-- Visualizando
SELECT m.nome AS 'motorista', p.nome AS 'passageiro', c.status AS 'corrida', pag.valor, pag.forma_pagamento,
pag.status AS 'pagamento', c.id_pagamento 
    FROM motorista m
    JOIN corrida c ON m.cpf = c.cpf_motorista
    JOIN pagamento pag ON c.id_pagamento = pag.id_pagamento
    JOIN passageiro_corrida pc ON c.id_corrida = pc.id_corrida
    JOIN passageiro p ON pc.cpf_passageiro = p.cpf
    WHERE c.id_corrida = 7;



-- Passageiro faz avaliação
INSERT INTO avaliacao (id_avaliacao, nota, comentario, data_avaliacao, cpf_motorista, cpf_passageiro) VALUES
    (7, 5, 'Excelente.', '2025-03-06', '12345678901', '52998224725');

-- Sistema atualiza avaliação média do motorista com base na média
UPDATE motorista m SET m.avaliacao_media = (
    SELECT AVG(nota) FROM avaliacao a WHERE a.cpf_motorista = m.cpf
    ) WHERE m.cpf = '12345678901';

-- Visualizando
SELECT nome, avaliacao_media FROM motorista WHERE cpf = '12345678901';


-- Visualizando todos os dados inseridos nas tabelas
SELECT * FROM passageiro;
SELECT * FROM motorista;
SELECT * FROM veiculo;
SELECT * FROM avaliacao;
SELECT * FROM localizacao;
SELECT * FROM pagamento;
SELECT * FROM corrida;
SELECT * FROM passageiro_corrida;