-----------------------------------------------
CREATE PROCEDURE InserirAdicionalVeiculo
    @codigoveiculo INT,
    @codigoadicional INT
AS
BEGIN
    INSERT 
    INTO AdicionalVeiculo
    VALUES (@codigoveiculo, @codigoadicional)
END

InserirAdicionalVeiculo 1, 1
InserirAdicionalVeiculo 1, 2
InserirAdicionalVeiculo 1, 3
InserirAdicionalVeiculo 2, 1
InserirAdicionalVeiculo 3, 1
InserirAdicionalVeiculo 3, 5
InserirAdicionalVeiculo 8, 1
InserirAdicionalVeiculo 8, 2
InserirAdicionalVeiculo 8, 3
InserirAdicionalVeiculo 8, 5
-----------------------------------------------
CREATE PROCEDURE ObterAdicionalVeiculoPorAdicional
    @codigoadicional INT
AS
BEGIN
    SELECT Veiculo.Placa,
           Adicional.Descricao
    FROM AdicionalVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = AdicionalVeiculo.CodigoVeiculo
      INNER JOIN Adicional ON Adicional.Codigo = AdicionalVeiculo.CodigoAdicional
    WHERE AdicionalVeiculo.CodigoAdicional = @codigoadicional
END

ObterAdicionalVeiculoPorAdicional 1
ObterAdicionalVeiculoPorAdicional 3
-----------------------------------------------
CREATE PROCEDURE ObterAdicionalVeiculoPorVeiculo
    @codigoveiculo INT
AS
BEGIN
    SELECT Veiculo.Placa,
           Adicional.Descricao
    FROM AdicionalVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = AdicionalVeiculo.CodigoVeiculo
      INNER JOIN Adicional ON Adicional.Codigo = AdicionalVeiculo.CodigoAdicional
    WHERE AdicionalVeiculo.CodigoVeiculo = @codigoveiculo
END

ObterAdicionalVeiculoPorVeiculo 1
ObterAdicionalVeiculoPorVeiculo 3
-----------------------------------------------
CREATE PROCEDURE ObterAdicionaisVeiculos
AS
BEGIN
    SELECT Veiculo.Placa,
           Adicional.Descricao
    FROM AdicionalVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = AdicionalVeiculo.CodigoVeiculo
      INNER JOIN Adicional ON Adicional.Codigo = AdicionalVeiculo.CodigoAdicional
END

ObterAdicionaisVeiculos
-----------------------------------------------
CREATE PROCEDURE AlterarAdicionalVeiculo
    @codigoveiculo INT,
    @codigoadicional INT
AS
BEGIN
    UPDATE AdicionalVeiculo
    SET CodigoAdicional = @codigoadicional
    WHERE CodigoVeiculo = @codigoveiculo
END

AlterarAdicionalVeiculo 4, 5
-----------------------------------------------
CREATE PROCEDURE RemoverAdicionalVeiculo
    @codigoveiculo INT,
    @codigoadicional INT
AS
BEGIN
    DELETE 
    FROM AdicionalVeiculo
    WHERE CodigoVeiculo = @codigoveiculo
      AND CodigoAdicional = @codigoadicional
END

RemoverAdicionalVeiculo 1, 1
-----------------------------------------------