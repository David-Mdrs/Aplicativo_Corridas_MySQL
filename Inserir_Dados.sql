-- Banco de dados: app_corridas
-- Descrição: Armazena dados do aplicativo de corridas.

-- Inserindo dados na tabela Passageiro
INSERT INTO passageiro (cpf, nome, telefone) VALUES
('529.982.247-25', 'João Silva', '11987654321'),
('398.456.123-87', 'Maria Oliveira', '21987654321'),
('123.456.789-09', 'Carlos Souza', '31987654321'),
('987.654.321-00', 'Ana Costa', '41987654321'),
('456.789.123-45', 'Pedro Santos', '51987654321'),
('654.321.987-12', 'Juliana Lima', '61987654321');

-- Verificando os dados inseridos
SELECT * FROM passageiro;