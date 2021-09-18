-----------------------------------------------
CREATE PROCEDURE InserirCliente
    @nome VARCHAR(100),
    @cpf INT,
    @rg INT,
    @telefone INT
AS
BEGIN
    INSERT 
    INTO Cliente
    VALUES (@nome, @cpf, @rg, telefone)
END

InserirCliente 'José', 111, 11, 111111
InserirCliente 'João', 222, 222, 222222
InserirCliente 'Maria', 333, 33, 333333
InserirCliente 'Joana', 444, 44, 444444
-----------------------------------------------
CREATE PROCEDURE ObterClientePorCodigo
    @codigo INT
AS
BEGIN
    SELECT * 
    FROM Cliente
    WHERE Codigo = @codigo
END

ObterClientePorCodigo 1
ObterClientePorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterClienteParteNome
    @nome VARCHAR(100)
AS
BEGIN
    SELECT * 
    FROM Cliente
    WHERE Nome LIKE '%'+@nome+'%'
END

ObterClienteParteNome 'Paulo'
ObterClienteParteNome 'Jo'
-----------------------------------------------
CREATE PROCEDURE ObterClientes
AS
BEGIN
    SELECT * 
    FROM Cliente
END

ObterClientes
-----------------------------------------------
CREATE PROCEDURE AlterarCliente
    @codigo INT,
    @nome VARCHAR(100),
    @cpf INT,
    @rg INT,
    @telefone INT
AS
BEGIN
    UPDATE Cliente
    SET Nome = @nome,
        CPF = @cpf,
        RG = @rg,
        Telefone = @telefone
    WHERE Codigo = @codigo
END

AlterarCliente 4, 'Joana Silva', 555, 55, 555555
-----------------------------------------------
CREATE PROCEDURE RemoverCliente
    @codigo INT
AS
BEGIN
    DELETE 
    FROM Cliente
    WHERE Codigo = @codigo
END

RemoverCliente 4
-----------------------------------------------