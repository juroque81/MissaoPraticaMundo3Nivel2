-- Criar a tabela Pessoa
CREATE TABLE Pessoa (
  id_pessoa INT NOT NULL PRIMARY KEY,
  nome VARCHAR(100),
  endereco VARCHAR(200),
  telefone VARCHAR(20),
  email VARCHAR(100),
  tipo CHAR(1) CHECK (tipo IN ('F', 'J')),
  cpf VARCHAR(14),
  cnpj VARCHAR(18)
);

CREATE SEQUENCE seq_id_pessoa
    START WITH 1
    INCREMENT BY 1;

-- Criar a tabela Usuario
CREATE TABLE Usuario (
  id_usuario INT NOT NULL PRIMARY KEY,
  Pessoa_id_pessoa INT NOT NULL,
  login VARCHAR(50) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  FOREIGN KEY (Pessoa_id_pessoa) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Compra (
  id_compra INT NOT NULL PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_produto INT,
  id_fornecedor INT,
  data_compra DATE,
  quantidade INT,
  preco_unitario DECIMAL(10, 2),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Produto (
  id_produto INT NOT NULL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  quantidade INT,
  preco_venda DECIMAL(10, 2)
);

CREATE TABLE Venda (
  id_venda INT NOT NULL PRIMARY KEY,
  id_usuario INT NOT NULL,         -- vendedor
  id_cliente INT NOT NULL,         -- cliente (referência a Pessoa)
  id_produto INT NOT NULL,         -- produto vendido
  data_venda DATE,
  quantidade INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_cliente) REFERENCES Pessoa(id_pessoa),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);



