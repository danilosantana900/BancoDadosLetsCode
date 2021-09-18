-----------------------------------------------
CREATE PROCEDURE InserirContatoCliente
    @codigoveiculo INT,
    @codigocliente INT
AS
BEGIN
    DECLARE @nome VARCHAR(100)
    DECLARE @telefone INT
    
    SELECT @nome = Cliente.Nome 
    FROM Cliente 
    WHERE Codigo = @codigocliente
    
    SELECT @telefone = Cliente.Telefone 
    FROM Cliente 
    WHERE Codigo = @codigocliente

    INSERT 
    INTO Contato
    VALUES (@codigoveiculo, 
            @codigocliente,
            @nome,
            @telefone)
END

EXEC InserirContatoCliente 1, 1 
EXEC InserirContatoCliente 1, 2
EXEC InserirContatoCliente 3, 3
-----------------------------------------------
CREATE PROCEDURE InserirContatoUsuario
    @codigoveiculo INT,
    @nomeusuario VARCHAR(100),
    @telefoneusuario INT
AS
BEGIN
    INSERT 
    INTO Contato
    VALUES (@codigoveiculo, 
            NULL,
            @nomeusuario,
            @telefoneusuario)
END

EXEC InserirContatoUsuario 2, 'Danilo', '123123' 
EXEC InserirContatoUsuario 2, 'Natasha', '456456' 
EXEC InserirContatoUsuario 2, 'Michele', '789789' 
-----------------------------------------------
CREATE PROCEDURE ObterContatosPorVeiculo
    @codigoveiculo INT
AS
BEGIN
    SELECT IIF(CodigoCliente IS NULL, 'Cliente', 'Usuario') AS TipoContato,
           Veiculo.Placa,
           NomeUsuario,
           TelefoneUsuario
    FROM Contato
      INNER JOIN Veiculo ON Veiculo.Codigo = Contato.CodigoVeiculo
    WHERE Contato.CodigoVeiculo = @codigoveiculo
END

ObterContatosPorVeiculo 1
ObterContatosPorVeiculo 2
-----------------------------------------------
CREATE PROCEDURE ObterContatos
AS
BEGIN
    SELECT IIF(CodigoCliente IS NULL, 'Usuario', 'Cliente') AS TipoContato,
           Veiculo.Placa,
           NomeUsuario,
           TelefoneUsuario
    FROM Contato
      INNER JOIN Veiculo ON Veiculo.Codigo = Contato.CodigoVeiculo
END

ObterContatos
-----------------------------------------------
CREATE PROCEDURE RemoverContato
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Contato
    WHERE Codigo = @codigo
END

RemoverContato 5
-----------------------------------------------