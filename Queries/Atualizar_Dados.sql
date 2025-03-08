/*
  =======================================================
  Arquivo: Atualizar_Dados.sql
  Descrição: Scripts para deletar e atualizar dados do banco de dados.
             DELETE e UPDATE.
  =======================================================
*/

-- Deletando todos os dados do motorista
DELETE FROM avaliacao WHERE cpf_motorista = '78901234567';
DELETE FROM localizacao WHERE cpf_motorista = '78901234567';
DELETE FROM corrida WHERE cpf_motorista = '78901234567';
DELETE FROM veiculo WHERE cpf_motorista = '78901234567';

-- Deletando motorista
DELETE FROM motorista WHERE cpf = '78901234567';

-- Atualizando avaliacao do motorista com base na média das avaliações
UPDATE motorista m SET m.avaliacao_media = (
    SELECT AVG(nota) FROM avaliacao a WHERE a.cpf_motorista = m.cpf
    ) WHERE m.cpf = '56789012345';
    
-- Atualizando veículo do motorista
UPDATE veiculo SET modelo = 'Civic' WHERE cpf_motorista = '56789012345';

-- Atualizando número de telefone do passageiro
UPDATE passageiro SET telefone = '83927486920' WHERE cpf = '45678912345';

-- Visualizando todos os dados das tabelas
SELECT * FROM passageiro;
SELECT * FROM motorista;
SELECT * FROM veiculo;
SELECT * FROM avaliacao;
SELECT * FROM localizacao;
SELECT * FROM pagamento;
SELECT * FROM corrida;
SELECT * FROM passageiro_corrida;