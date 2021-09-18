-----------------------------------------------
CREATE DATABASE LetsCar
USE LetsCar
-----------------------------------------------
CREATE TABLE Marca
(
    Codigo INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(50) NOT NULL
)
-----------------------------------------------
CREATE TABLE Modelo
(
    Codigo INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(50) NOT NULL
)
-----------------------------------------------
CREATE TABLE Cor
(
    Codigo INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(50) NOT NULL
)
-----------------------------------------------
CREATE TABLE Adicional
(
    Codigo INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(50) NOT NULL
)
-----------------------------------------------
CREATE TABLE FormaPagamento
(
    Codigo INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(50) NOT NULL,
    AVista BIT NOT NULL
)
-----------------------------------------------
CREATE TABLE Cliente
(
    Codigo INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL,
    CPF INT NOT NULL,
    RG INT NOT NULL,
    Telefone INT NOT NULL,
)
-----------------------------------------------
CREATE TABLE Veiculo
(
    Codigo INT PRIMARY KEY IDENTITY,
    CodigoMarca INT NOT NULL,
    CodigoModelo INT NOT NULL,
    CodigoCor INT NOT NULL,
    Placa VARCHAR(7) NOT NULL,
    Ano SMALLINT NOT NULL,
    Preco MONEY NOT NULL,
    Vendido BIT NOT NULL,
    CONSTRAINT FK_Veiculo_Marca FOREIGN KEY (CodigoMarca) REFERENCES Marca(Codigo),
    CONSTRAINT FK_Veiculo_Modelo FOREIGN KEY (CodigoModelo) REFERENCES Modelo(Codigo),
    CONSTRAINT FK_Veiculo_Cor FOREIGN KEY (CodigoCor) REFERENCES Cor(Codigo)
)
-----------------------------------------------
CREATE TABLE AdicionalVeiculo select * from AdicionalVeiculo
(
    CodigoVeiculo INT NOT NULL,
    CodigoAdicional INT NOT NULL,
    CONSTRAINT FK_AdicionalVeiculo_Veiculo FOREIGN KEY (CodigoVeiculo) REFERENCES Veiculo(Codigo),
    CONSTRAINT FK_AdicionalVeiculo_Adicional FOREIGN KEY (CodigoAdicional) REFERENCES Adicional(Codigo)
)
ALTER TABLE AdicionalVeiculo
ADD CONSTRAINT PK_Composta_Veiculo_Adicional
PRIMARY KEY(CodigoVeiculo, CodigoAdicional)
-----------------------------------------------
CREATE TABLE FormaPagamentoVeiculo
(
    CodigoVeiculo INT NOT NULL,
    CodigoFormaPagamento INT NOT NULL,
    CONSTRAINT FK_FormaPagementoVeiculo_Veiculo FOREIGN KEY (CodigoVeiculo) REFERENCES Veiculo(Codigo),
    CONSTRAINT FK_FormaPagamentoVeiculo_FormaPagamento FOREIGN KEY (CodigoFormaPagamento) REFERENCES FormaPagamento(Codigo)
)
ALTER TABLE FormaPagamentoVeiculo
ADD CONSTRAINT PK_Composta_Veiculo_FormaPagamento
PRIMARY KEY(CodigoVeiculo, CodigoFormaPagamento)
-----------------------------------------------
CREATE TABLE Favorito
(
    CodigoVeiculo INT NOT NULL,
    CodigoCliente INT NOT NULL,
    CONSTRAINT FK_Favorito_Veiculo FOREIGN KEY (CodigoVeiculo) REFERENCES Veiculo(Codigo),
    CONSTRAINT FK_Favorito_Cliente FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
)
ALTER TABLE Favorito
ADD CONSTRAINT PK_Composta_Veiculo_Cliente
PRIMARY KEY(CodigoVeiculo, CodigoCliente)
-----------------------------------------------
CREATE TABLE Contato
(
    Codigo INT PRIMARY KEY IDENTITY,
    CodigoVeiculo INT,
    CodigoCliente INT,
    NomeUsuario VARCHAR(100) NOT NULL,
    TelefoneUsuario INT NOT NULL,
    CONSTRAINT FK_Contato_Veiculo FOREIGN KEY (CodigoVeiculo) REFERENCES Veiculo(Codigo),
    CONSTRAINT FK_Contato_Cliente FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
)
-----------------------------------------------