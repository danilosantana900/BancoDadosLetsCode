-----------------------------------------------
CREATE PROCEDURE InserirModelo
    @descricao VARCHAR(50)
AS
BEGIN
    INSERT INTO Modelo VALUES (@descricao)
END

InserirModelo 'CB500F'
InserirModelo 'MT-3'
InserirModelo 'Panigale'
InserirModelo 'G310S'
-----------------------------------------------
CREATE PROCEDURE ObterModeloPorCodigo
    @codigo INT
AS
BEGIN
    SELECT * 
    FROM Modelo 
    WHERE Codigo = @codigo
END

ObterModeloPorCodigo 1
ObterModeloPorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterModeloParteDescricao
    @descricao VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Modelo
    WHERE Descricao LIKE '%'+@descricao+'%'
END

ObterModeloParteDescricao '500'
ObterModeloParteDescricao 'Gol'
-----------------------------------------------
CREATE PROCEDURE ObterModelos
AS
BEGIN
    SELECT * 
    FROM Modelo
END

ObterModelos
-----------------------------------------------
CREATE PROCEDURE AlterarModelo
    @codigo INT,
    @descricao VARCHAR(50)
AS
BEGIN
    UPDATE Modelo
    SET Descricao = @descricao
    WHERE Codigo = @codigo
END

AlterarModelo 4, 'G 310 S'
-----------------------------------------------
CREATE PROCEDURE RemoverModelo
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Modelo
    WHERE Codigo = @codigo
END

RemoverModelo 4
-----------------------------------------------