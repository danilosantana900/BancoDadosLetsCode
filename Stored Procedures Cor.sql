-----------------------------------------------
CREATE PROCEDURE InserirCor
    @descricao VARCHAR(50)
AS
BEGIN
    INSERT 
    INTO Cor 
    VALUES (@descricao)
END

InserirCor 'Azul'
InserirCor 'Vermelha'
InserirCor 'Prata'
InserirCor 'Cinza'
-----------------------------------------------
CREATE PROCEDURE ObterCorPorCodigo
    @codigo INT
AS
BEGIN
    SELECT * 
    FROM Cor
    WHERE Codigo = @codigo
END

ObterCorPorCodigo 1
ObterCorPorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterCorParteDescricao
    @descricao VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Cor
    WHERE Descricao LIKE '%'+@descricao+'%'
END

ObterCorParteDescricao 'A'
ObterCorParteDescricao 'Preto'
-----------------------------------------------
CREATE PROCEDURE ObterCores
AS
BEGIN
    SELECT * 
    FROM Cor
END

ObterCores
-----------------------------------------------
CREATE PROCEDURE AlterarCor
    @codigo INT,
    @descricao VARCHAR(50)
AS
BEGIN
    UPDATE Cor
    SET Descricao = @descricao
    WHERE Codigo = @codigo
END

AlterarCor 2, 'Verde'
-----------------------------------------------
CREATE PROCEDURE RemoverCor
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Cor
    WHERE Codigo = @codigo
END

RemoverCor 4
-----------------------------------------------