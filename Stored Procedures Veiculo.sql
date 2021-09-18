-----------------------------------------------
CREATE PROCEDURE InserirVeiculo
    @codigomarca INT,
    @codigomedelo INT,
    @codigocor INT,
    @placa VARCHAR(7),
    @ano SMALLINT,
    @preco MONEY,
    @vendido BIT
AS
BEGIN
    INSERT 
    INTO Veiculo
    VALUES (@codigomarca, @codigomedelo, @codigocor, @placa, @ano, @preco, @vendido)
END

InserirVeiculo 1, 1, 1, 'AAA9A99', 2020, 20000.00, 0
InserirVeiculo 2, 2, 2, 'BBB1B11', 2021, 35000.00, 0
InserirVeiculo 3, 3, 3, 'CCC5ACC', 2022, 68000.00, 0
InserirVeiculo 5, 5, 5, 'WWW6A77', 2019, 55000.00, 0
-----------------------------------------------
CREATE PROCEDURE ObterVeiculoPorCodigo
    @codigo INT
AS
BEGIN
    SELECT Marca.Descricao,
           Modelo.Descricao,
           Cor.Descricao,
           Placa,
           Ano,
           Preco,
           Vendido
    FROM Veiculo
      INNER JOIN Marca ON Marca.Codigo = Veiculo.CodigoMarca
      INNER JOIN Modelo ON Modelo.Codigo = Veiculo.CodigoModelo
      INNER JOIN Cor ON Cor.Codigo = Veiculo.CodigoCor
    WHERE Veiculo.Codigo = @codigo
END

ObterVeiculoPorCodigo 1
ObterVeiculoPorCodigo 9
-----------------------------------------------
CREATE PROCEDURE ObterVeiculoPorCampos
    @codigomarca INT = NULL,
    @codigomodelo INT = NULL,
    @codigocor INT = NULL,
    @placa VARCHAR(7) = NULL,
    @ano SMALLINT = NULL,
    @preco MONEY = NULL,
    @vendido BIT = NULL
AS
BEGIN
    SELECT Marca.Descricao,
           Modelo.Descricao,
           Cor.Descricao,
           Placa,
           Ano,
           Preco,
           Vendido
    FROM Veiculo
      INNER JOIN Marca ON Marca.Codigo = Veiculo.CodigoMarca
      INNER JOIN Modelo ON Modelo.Codigo = Veiculo.CodigoModelo
      INNER JOIN Cor ON Cor.Codigo = Veiculo.CodigoCor
    WHERE (@codigomarca IS NULL OR CodigoMarca = @codigomarca)
      AND (@codigomodelo IS NULL OR CodigoModelo = @codigomodelo)
      AND (@codigocor IS NULL OR CodigoCor = @codigocor)
      AND (@placa IS NULL OR Placa = @placa)
      AND (@ano IS NULL OR Ano = @ano)
      AND (@preco IS NULL OR Preco = @preco)
      AND (@vendido IS NULL OR Vendido = @vendido)
END

ObterVeiculoPorCampos @codigomarca = 1
ObterVeiculoPorCampos 
-----------------------------------------------
CREATE PROCEDURE ObterVeiculos
AS
BEGIN
    SELECT Marca.Descricao,
           Modelo.Descricao,
           Cor.Descricao,
           Placa,
           Ano,
           Preco,
           Vendido
    FROM Veiculo
      INNER JOIN Marca ON Marca.Codigo = Veiculo.CodigoMarca
      INNER JOIN Modelo ON Modelo.Codigo = Veiculo.CodigoModelo
      INNER JOIN Cor ON Cor.Codigo = Veiculo.CodigoCor
END

ObterVeiculos
-----------------------------------------------
CREATE PROCEDURE AlterarVeiculo
    @codigo INT,
    @codigomarca INT = NULL,
    @codigomodelo INT = NULL,
    @codigocor INT = NULL,
    @placa VARCHAR(7) = NULL,
    @ano SMALLINT = NULL,
    @preco MONEY = NULL,
    @vendido BIT = NULL
AS
BEGIN
    UPDATE Veiculo
    SET CodigoMarca = @codigomarca,
        CodigoModelo = @codigomodelo,
        CodigoCor = @codigocor,
        Placa = @placa,
        Ano = @ano,
        Preco = @preco,
        Vendido = @vendido
    WHERE Codigo = @codigo
END

AlterarVeiculo 8, 5, 5, 5, 'WWW7A77', 2018, 55060.00, 1
-----------------------------------------------
CREATE PROCEDURE RemoverVeiculo
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Veiculo
    WHERE Codigo = @codigo
END

RemoverVeiculo 8
-----------------------------------------------
CREATE PROCEDURE ValorTotalEmEstoque
AS
BEGIN
    SELECT SUM(Veiculo.Preco) AS Total 
    FROM Veiculo
    WHERE Vendido = 0
END

ValorTotalEmEstoque
----------------------------------------------
CREATE PROCEDURE ValorTotalVendido
AS
BEGIN
    SELECT SUM(Veiculo.Preco) AS Total 
    FROM Veiculo
    WHERE Vendido = 1
END

ValorTotalVendido
----------------------------------------------