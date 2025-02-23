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