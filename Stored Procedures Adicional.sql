-----------------------------------------------
CREATE PROCEDURE InserirAdicional
    @descricao VARCHAR(50)
AS
BEGIN
    INSERT 
    INTO Adicional
    VALUES (@descricao)
END

InserirAdicional 'Freio a Disco'
InserirAdicional 'ABS'
InserirAdicional 'Partida Eletrica'
InserirAdicional 'Banco Bi-Partido'
-----------------------------------------------
CREATE PROCEDURE ObterAdicionalPorCodigo
    @codigo INT
AS
BEGIN
    SELECT * 
    FROM Adicional
    WHERE Codigo = @codigo
END

ObterAdicionalPorCodigo 1
ObterAdicionalPorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterAdicionalParteDescricao
    @descricao VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Adicional
    WHERE Descricao LIKE '%'+@descricao+'%'
END

ObterAdicionalParteDescricao 'Bolha'
ObterAdicionalParteDescricao 'ABS'
-----------------------------------------------
CREATE PROCEDURE ObterAdicionais
AS
BEGIN
    SELECT * 
    FROM Adicional
END

ObterAdicionais
-----------------------------------------------
CREATE PROCEDURE AlterarAdicional
    @codigo INT,
    @descricao VARCHAR(50)
AS
BEGIN
    UPDATE Adicional
    SET Descricao = @descricao
    WHERE Codigo = @codigo
END

AlterarAdicional 2, 'CBS'
-----------------------------------------------
CREATE PROCEDURE RemoverAdicional
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Adicional
    WHERE Codigo = @codigo
END

RemoverAdicional 4
-----------------------------------------------