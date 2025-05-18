-- Inserir pessoas 
INSERT INTO Pessoa (id_pessoa, nome, endereco, telefone, email, tipo, cpf, cnpj)
VALUES
(NEXT VALUE FOR seq_id_pessoa, 'Maria Silva', 'Rua A, 123', '11999999999', 'maria@email.com', 'F', '123.456.789-00', NULL),
(NEXT VALUE FOR seq_id_pessoa, 'João Souza', 'Rua B, 456', '11888888888', 'joao@email.com', 'F', '987.654.321-00', NULL),
(NEXT VALUE FOR seq_id_pessoa, 'Ana Lima', 'Rua C, 789', '11777777777', 'ana@email.com', 'F', '111.222.333-44', NULL),
(NEXT VALUE FOR seq_id_pessoa, 'Ana Carolina', 'Rua D, 123', '11666666666', 'ana@email.com', 'F', '333.555.666-55', NULL),
(NEXT VALUE FOR seq_id_pessoa, 'Empresa X', 'Av. Central, 1000', '1133333333', 'contato@empresax.com', 'J', NULL, '12.345.678/0001-99'),
(NEXT VALUE FOR seq_id_pessoa, 'Empresa Y', 'Av. Paulista, 2000', '1144444444', 'vendas@empresay.com', 'J', NULL, '98.765.432/0001-88');

-- Inserir usuários vinculados às pessoas físicas 
INSERT INTO Usuario (id_usuario, Pessoa_id_pessoa, login, nome, senha)
VALUES
(1, 1, 'maria', 'Maria Silva', '1234'),
(2, 2, 'joao', 'João Souza', '1234'),
(4, 4, 'carolina', 'Ana Carolina', '1234'),
(3, 3, 'ana', 'Ana Lima', '1234');

-- Inserir produtos
INSERT INTO Produto (id_produto, nome, quantidade, preco_venda)
VALUES
(1, 'Teclado', 100, 80.00),
(2, 'Mouse', 200, 40.00),
(3, 'Monitor', 50, 500.00),
(4, 'Notebook', 30, 3000.00),
(5, 'Cabo HDMI', 150, 25.00);

-- Inserir compras feitas por usuários 
INSERT INTO Compra (id_compra, id_usuario, id_produto, id_fornecedor, data_compra, quantidade, preco_unitario)
VALUES
(1, 1, 1, 4, '2025-04-01', 10, 70.00),
(2, 2, 2, 4, '2025-04-02', 20, 35.00),
(3, 3, 3, 5, '2025-04-03', 5, 450.00),
(4, 3, 4, 5, '2025-04-03', 5, 450.00),
(5, 3, 5, 5, '2025-04-03', 5, 450.00);


-- Inserir vendas feitas para pessoas
INSERT INTO Venda (id_venda, id_usuario, id_cliente, id_produto, data_venda, quantidade)
VALUES
(1, 1, 2, 1,  '2025-04-05', 2),
(2, 2, 3, 3, '2025-04-06', 1),
(3, 3, 1, 5, '2025-04-07', 3),
(4, 3, 1, 4, '2025-04-07', 3);
