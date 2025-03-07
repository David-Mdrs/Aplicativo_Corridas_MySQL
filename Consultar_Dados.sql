/*
  =======================================================
  Arquivo: Consultar_Dados.sql
  Descrição: Scripts para consultas do banco de dados que simulam demandas reais.
             Inclui agregações (COUNT, SUM, AVG), junções (JOIN), e filtros com HAVING e GROUP BY.
  =======================================================
*/

-- Consultas utilizando JOIN e ORDER BY

-- 1) Corridas mais longas (maior distância percorrida)
SELECT c.id_corrida, m.nome AS 'motorista', p.nome AS 'passageiro', c.distancia FROM corrida c
    JOIN motorista m ON c.cpf_motorista = m.cpf
    JOIN passageiro_corrida pc ON c.id_corrida = pc.id_corrida
    JOIN passageiro p ON pc.cpf_passageiro = p.cpf
    ORDER BY distancia DESC;

-- 2) Detalhes de cada corrida finalizada
SELECT m.nome AS 'motorista', c.valor, p.forma_pagamento, p.status AS status_pagamento
    FROM motorista m
    JOIN corrida c ON m.cpf = c.cpf_motorista
    JOIN pagamento p ON c.id_pagamento = p.id_pagamento
    WHERE c.status = 'Finalizada' AND p.status = 'Pago';


-- Consultas utilizando SUM, JOIN, GROUP BY eORDER BY

-- 3) Ganho total por motorista
SELECT c.cpf_motorista, m.nome, SUM(c.valor) AS 'ganho_total' FROM corrida c
    JOIN motorista m ON c.cpf_motorista = m.cpf
    GROUP BY c.cpf_motorista, m.nome ORDER BY ganho_total DESC;

-- 4) Valor total movimentado no app
SELECT SUM(valor) AS 'valor_total' FROM corrida;

-- 5) Passageiros que gastaram mais dinheiro
SELECT p.cpf, p.nome, SUM(c.valor) AS 'total_gasto' FROM corrida c
    JOIN passageiro_corrida pc ON c.id_corrida = pc.id_corrida
    JOIN passageiro p ON pc.cpf_passageiro = p.cpf
    GROUP BY pc.cpf_passageiro ORDER BY total_gasto DESC;


-- Consultas utilizando COUNT, JOIN, GROUP BY eORDER BY

-- 6) Total de corridas por motorista
SELECT m.cpf, m.nome, COUNT(c.id_corrida) AS 'total_corridas' FROM motorista m
    JOIN corrida c ON m.cpf = c.cpf_motorista
    GROUP BY m.nome ORDER BY total_corridas DESC;

-- 7) Total de corridas por motorista com mais informações
SELECT m.cpf, m.nome AS 'motorista', v.modelo AS 'carro', v.placa, COUNT(c.id_corrida) AS 'total_corridas'
    FROM motorista m
    JOIN veiculo v ON m.cpf = v.cpf_motorista
    JOIN corrida c ON m.cpf = c.cpf_motorista
    GROUP BY m.nome ORDER BY total_corridas DESC;

-- 8) Número de corridas de cada passageiro
SELECT p.cpf, COUNT(pc.id_corrida) AS 'total_corridas' FROM passageiro p
    JOIN passageiro_corrida pc ON p.cpf = pc.cpf_passageiro
    GROUP BY pc.id_corrida ORDER BY total_corridas DESC;

-- 9) Quantidade de corridas por status
SELECT status, COUNT(*) AS 'total_corridas' FROM corrida
    GROUP BY status;

-- 10) Motoristas com maior número de avaliações baixas
SELECT m.cpf, m.nome AS 'motorista', COUNT(*) AS 'total_av_baixas' FROM motorista m
    JOIN avaliacao a ON m.cpf = a.cpf_motorista
    WHERE a.nota < 3
    GROUP BY m.cpf ORDER BY total_av_baixas DESC;

-- 11) Locais mais populares destino de corrida
SELECT l.bairro, l.rua, COUNT(*) AS 'total_corridas' FROM corrida c
    JOIN localizacao l ON c.id_corrida = l.id_corrida
    WHERE l.cpf_motorista IS NULL AND l.cpf_passageiro IS NULL
    GROUP BY l.bairro, l.rua ORDER BY total_corridas DESC;


-- Consultas utilizando AVG e MAX

-- 12) Média de avaliação dos motoristas
SELECT m.cpf, m.nome, ROUND(AVG(a.nota), 1) AS 'avaliacao_media' FROM motorista m
    JOIN avaliacao a ON m.cpf = a.cpf_motorista
    WHERE m.cpf IS NOT NULL
    GROUP BY m.cpf, m.nome ORDER BY avaliacao_media DESC;

-- 13) Última corrida do app
SELECT MAX(data_avaliacao) AS 'ultima_corrida' FROM avaliacao;


-- Consultas utilizando agregações (AVG, MIN) com agrupamento (GROUP BY) e HAVING.

-- 14) Média dos motoristas com média acima de 4
SELECT m.nome AS 'motorista', ROUND(AVG(a.nota), 1) AS avaliacao_media FROM motorista m 
    JOIN avaliacao a ON m.cpf = a.cpf_motorista
    GROUP BY m.cpf HAVING AVG(a.nota) > 4 ORDER BY avaliacao_media DESC;

-- 15) Corridas cujo valor mínimo é 15
SELECT m.nome AS 'motorista', MIN(c.valor) AS valor_minimo FROM motorista m 
    JOIN corrida c ON m.cpf = c.cpf_motorista GROUP BY m.cpf
    HAVING MIN(c.valor) > 15 ORDER BY valor_minimo ASC;