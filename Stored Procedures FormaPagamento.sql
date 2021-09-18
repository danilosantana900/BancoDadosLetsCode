-----------------------------------------------
CREATE PROCEDURE InserirFormaPagamento
    @descricao VARCHAR(50),
    @avista BIT
AS
BEGIN
    INSERT 
    INTO FormaPagamento
    VALUES (@descricao, @avista)
END

InserirFormaPagamento 'Dinheiro', 1
InserirFormaPagamento 'Cheque', 1
InserirFormaPagamento 'Cartão Debito', 0
InserirFormaPagamento 'Cartão Credito', 0
-----------------------------------------------
CREATE PROCEDURE ObterFormaPagamentoPorCodigo
    @codigo INT
AS
BEGIN
    SELECT * 
    FROM FormaPagamento
    WHERE Codigo = @codigo
END

ObterFormaPagamentoPorCodigo 1
ObterFormaPagamentoPorCodigo 3
-----------------------------------------------
CREATE PROCEDURE ObterFormaPagamentoParteDescricao
    @descricao VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM FormaPagamento
    WHERE Descricao LIKE '%'+@descricao+'%'
END

ObterFormaPagamentoParteDescricao 'Financiamento'
ObterFormaPagamentoParteDescricao 'que'
-----------------------------------------------
CREATE PROCEDURE ObterFormasPagamentos
AS
BEGIN
    SELECT * 
    FROM FormaPagamento
END

ObterFormasPagamentos
-----------------------------------------------
CREATE PROCEDURE AlterarFormaPagamento
    @codigo INT,
    @descricao VARCHAR(50),
    @avista BIT
AS
BEGIN
    UPDATE FormaPagamento
    SET Descricao = @descricao,
        AVista = @avista
    WHERE Codigo = @codigo
END

AlterarFormaPagamento 3, 'Financiamento', 0
-----------------------------------------------
CREATE PROCEDURE RemoverFormaPagamento
    @codigo INT
AS
BEGIN
    DELETE 
    FROM FormaPagamento
    WHERE Codigo = @codigo
END

RemoverFormaPagamento 4
-----------------------------------------------