//*e) Considerando a tabela abaixo, gere uma database, a tabela e crie um algoritmo para inserir
uma massa de dados, com 50 registros, para fins de teste, com as regras estabelecidas (Não
usar constraints na criação da tabela)
Produto
Codigo Nome Valor Vencimento
INT (PK) VARCHAR(30) DECIMAL(7,2) DATE

• Código inicia em 50001 e incrementa de 1 em 1
• Nome segue padrão simples: Produto 1, Produto 2, Produto 3, etc.
• Valor, gerar um número aleatório* entre 10.00 e 100.00
• Vencimento, gerar um número aleatório* entre 3 e 7 e, usando a função específica para
soma de datas no SQL Server, somar o valor gerado à data de hoje.

* Função RAND() gera números aleatórios entre 0 e 0,9999...*//

CREATE DATABASE ex_aula03_pt2
GO
USE ex_aula03_pt2
GO 
CREATE TABLE massa_dados(
codigo			INT			NOT NULL,
nome			VARCHAR(30)	NOT NULL,	
valor			DECIMAL(7,2)	NOT NULL,
vencimento		DATE			NOT NULL
PRIMARY KEY(codigo))
GO
DECLARE @i INT,
		@cod INT
SET @i = 1
SET @cod = 50001
WHILE (@i < 51)
BEGIN
	INSERT INTO massa_dados(codigo, nome, valor, vencimento) VALUES (
    @cod,
    'Produto ' + CAST(@i AS VARCHAR),
    CAST((10 + (RAND() * 90)) AS DECIMAL(7,2)), 
    DATEADD(DAY, 3 + ABS(CAST(NEWID() AS BINARY(10)) % 5), GETDATE())
	)
	SET @cod = @cod + 1
	SET @i = @i + 1
END
GO
SELECT * FROM massa_dados

