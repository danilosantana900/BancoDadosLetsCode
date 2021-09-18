-----------------------------------------------
CREATE PROCEDURE InserirFormaPagamentoVeiculo
    @codigoveiculo INT,
    @codigoformapagamento INT
AS
BEGIN
    INSERT 
    INTO FormaPagamentoVeiculo
    VALUES (@codigoveiculo, @codigoformapagamento)
END

InserirFormaPagamentoVeiculo 1, 1
InserirFormaPagamentoVeiculo 1, 2
InserirFormaPagamentoVeiculo 1, 3
InserirFormaPagamentoVeiculo 2, 1
InserirFormaPagamentoVeiculo 3, 1
InserirFormaPagamentoVeiculo 3, 5
InserirFormaPagamentoVeiculo 8, 1
InserirFormaPagamentoVeiculo 8, 2
InserirFormaPagamentoVeiculo 8, 3
InserirFormaPagamentoVeiculo 8, 5
-----------------------------------------------
CREATE PROCEDURE ObterFormaPagamentoVeiculoPorFormaPagamento
    @codigoformapagamento INT
AS
BEGIN
    SELECT Veiculo.Placa,
           FormaPagamento.Descricao
    FROM FormaPagamentoVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = FormaPagamentoVeiculo.CodigoVeiculo
      INNER JOIN FormaPagamento ON FormaPagamento.Codigo = FormaPagamentoVeiculo.CodigoFormaPagamento
    WHERE FormaPagamentoVeiculo.CodigoFormaPagamento = @codigoformapagamento
END

ObterFormaPagamentoVeiculoPorFormaPagamento 1
ObterFormaPagamentoVeiculoPorFormaPagamento 3
-----------------------------------------------
CREATE PROCEDURE ObterFormaPagamentoVeiculoPorVeiculo
    @codigoveiculo INT
AS
BEGIN
    SELECT Veiculo.Placa,
           FormaPagamento.Descricao
    FROM FormaPagamentoVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = FormaPagamentoVeiculo.CodigoVeiculo
      INNER JOIN FormaPagamento ON FormaPagamento.Codigo = FormaPagamentoVeiculo.CodigoFormaPagamento
    WHERE FormaPagamentoVeiculo.CodigoVeiculo = @codigoveiculo
END

ObterFormaPagamentoVeiculoPorVeiculo 1
ObterFormaPagamentoVeiculoPorVeiculo 3
-----------------------------------------------
CREATE PROCEDURE ObterFormasPagamentosVeiculos
AS
BEGIN
    SELECT Veiculo.Placa,
           FormaPagamento.Descricao
    FROM FormaPagamentoVeiculo
      INNER JOIN Veiculo ON Veiculo.Codigo = FormaPagamentoVeiculo.CodigoVeiculo
      INNER JOIN FormaPagamento ON FormaPagamento.Codigo = FormaPagamentoVeiculo.CodigoFormaPagamento
END

ObterFormasPagamentosVeiculos
-----------------------------------------------
CREATE PROCEDURE AlterarFormaPagamentoVeiculo
    @codigoveiculo INT,
    @codigoformapagamento INT
AS
BEGIN
    UPDATE FormaPagamentoVeiculo
    SET CodigoFormaPagamento = @codigoformapagamento
    WHERE CodigoVeiculo = @codigoveiculo
END

AlterarFormaPagamentoVeiculo 4, 5
-----------------------------------------------
CREATE PROCEDURE RemoverFormaPagamentoVeiculo
    @codigoveiculo INT,
    @codigoformapagamento INT
AS
BEGIN
    DELETE 
    FROM FormaPagamentoVeiculo
    WHERE CodigoVeiculo = @codigoveiculo
      AND CodigoFormaPagamento = @codigoformapagamento
END

RemoverFormaPagamentoVeiculo 1, 1
-----------------------------------------------