-----------------------------------------------
CREATE PROCEDURE InserirFavorito
    @codigoveiculo INT,
    @codigocliente INT
AS
BEGIN
    INSERT 
    INTO Favorito
    VALUES (@codigoveiculo, @codigocliente)
END

InserirFavorito 1, 1
InserirFavorito 1, 2
InserirFavorito 1, 3
InserirFavorito 2, 1
InserirFavorito 3, 1
InserirFavorito 3, 5
InserirFavorito 8, 1
InserirFavorito 8, 2
InserirFavorito 8, 3
InserirFavorito 8, 5
-----------------------------------------------
CREATE PROCEDURE ObterFavoritoPorCliente
    @codigocliente INT
AS
BEGIN
    SELECT Veiculo.Placa,
           Cliente.Nome
    FROM Favorito
      INNER JOIN Veiculo ON Veiculo.Codigo = Favorito.CodigoVeiculo
      INNER JOIN Cliente ON Cliente.Codigo = Favorito.CodigoCliente
    WHERE Favorito.CodigoCliente = @codigocliente
END

ObterFavoritoPorCliente 1
ObterFavoritoPorCliente 3
-----------------------------------------------
CREATE PROCEDURE ObterFavoritoPorVeiculo
    @codigoveiculo INT
AS
BEGIN
    SELECT Veiculo.Placa,
           Cliente.Nome
    FROM Favorito
      INNER JOIN Veiculo ON Veiculo.Codigo = Favorito.CodigoVeiculo
      INNER JOIN Cliente ON Cliente.Codigo = Favorito.CodigoCliente
    WHERE Favorito.CodigoVeiculo = @codigoveiculo
END

ObterFavoritoPorVeiculo 1
ObterFavoritoPorVeiculo 3
-----------------------------------------------
CREATE PROCEDURE ObterFavoritos
AS
BEGIN
    SELECT Veiculo.Placa,
           Cliente.Nome
    FROM Favorito
      INNER JOIN Veiculo ON Veiculo.Codigo = Favorito.CodigoVeiculo
      INNER JOIN Cliente ON Cliente.Codigo = Favorito.CodigoCliente
END

ObterFavoritos
-----------------------------------------------
CREATE PROCEDURE AlterarFavorito
    @codigocliente INT,
    @codigoveiculo INT
AS
BEGIN
    UPDATE Favorito
    SET CodigoVeiculo = @codigoveiculo
    WHERE CodigoCliente = @codigocliente
END

AlterarFavorito 4, 5
-----------------------------------------------
CREATE PROCEDURE RemoverFavorito
    @codigoveiculo INT,
    @codigocliente INT
AS
BEGIN
    DELETE 
    FROM Favorito
    WHERE CodigoVeiculo = @codigoveiculo
      AND CodigoCliente = @codigocliente
END

RemoverFormaPagamentoVeiculo 1, 1
-----------------------------------------------