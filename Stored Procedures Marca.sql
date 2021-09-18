-----------------------------------------------
CREATE PROCEDURE InserirMarca
    @Descricao VARCHAR(50)
AS
BEGIN
    INSERT INTO Marca VALUES (@Descricao)
END

InserirMarca 'Honda'
InserirMarca 'Yamaha'
InserirMarca 'Ducati'
InserirMarca 'BMW'
-----------------------------------------------
CREATE PROCEDURE ObterMarcaPorCodigo
    @codigo INT
AS
BEGIN
    SELECT * FROM Marca 
    WHERE Codigo = @codigo
END

ObterMarcaPorCodigo 1
ObterMarcaPorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterMarcaParteDescricao
    @descricao VARCHAR(50)
AS
BEGIN
    SELECT * FROM Marca 
    WHERE Descricao LIKE '%'+@descricao+'%'
END

ObterMarcaParteDescricao 'Hond'
ObterMarcaParteDescricao 'Suzuki'
-----------------------------------------------
CREATE PROCEDURE ObterMarcas
AS
BEGIN
    SELECT * FROM Marca 
END

ObterMarcas
-----------------------------------------------
CREATE PROCEDURE AlterarMarca
    @codigo INT,
    @descricao VARCHAR(50)
AS
BEGIN
    UPDATE Marca
    SET Descricao = @descricao
    WHERE Codigo = @codigo
END

AlterarMarca 4, 'Outro'
-----------------------------------------------
CREATE PROCEDURE RemoverMarca
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Marca
    WHERE Codigo = @codigo
END

RemoverMarca 4
-----------------------------------------------