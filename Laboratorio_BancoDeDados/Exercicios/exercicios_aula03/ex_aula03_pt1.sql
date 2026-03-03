CREATE DATABASE exercicios_aula03
GO
USE exercicios_aula03
--Exercicios Lista 1
--a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
DECLARE		@inteiro	INT,
			@result		INT
SET   @inteiro = 3
SET @result = 1
WHILE (@inteiro > 1 )
BEGIN
	SET @result = @result * @inteiro	
	SET @inteiro = @inteiro - 1
END
PRINT (@result)

--Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
--existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
DECLARE @a				REAL,
		@b				REAL,
		@c				REAL,
		@X1				FLOAT,
		@X2				FLOAT,
		@resultado		REAL,
		@delta			REAL
SET @a = 3
SET @b = -2
SET @c = 4
IF (@a = 0)
BEGIN
	PRINT ('A não pode ser zero!')
END
ELSE
BEGIN
	SET @delta = (@b * @b) - (4 * @a *@c)
	IF (@delta < 0)
	BEGIN
		PRINT ('Não exiteM duas raízes reais!')
	END
	ELSE
	BEGIN
		SET @X1 = (-@b + SQRT(@delta))/(2 *@a)
		SET @X2 = (-@b - SQRT(@delta))/(1 *@a)
		PRINT ('X1 = ' + CAST(@x1 AS VARCHAR(20)))
		PRINT ('X2 = ' + CAST(@x2 AS VARCHAR(20)))
	END
END

--c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
--que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.
DECLARE @altAna			REAL,
		@altMaria		REAL,
		@ano			INT
SET @altAna = 1.10
SET @altMaria = 1.50
SET @ano = 0
WHILE (@altAna < @altMaria)
BEGIN
	SET @altAna = @altAna + 0.03
	SET @altMaria = @altMaria + 0.02
	SET @ano = @ano + 1
	
END
PRINT ('Foram necessários ' + CAST(@ano AS VARCHAR) + ' anos para Ana ficar maior que Maria')

--d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
--Escreva uma aplicação que a escreva N termos
DECLARE @N INT, 
		@i INT, 
		@num INT, 
		@saida VARCHAR(200) 
SET @N = 15
SET @i = 0
SET @num = 1
SET @saida = '' 
WHILE @i < @N
BEGIN 
	SET @saida = @saida + CAST(@num AS VARCHAR) + ', '
	SET @i = @i + 1 
	IF @i >= @N BREAK
	BEGIN
		SET @saida = @saida + CAST(@num + 3 AS VARCHAR) + ', '
		SET @i = @i + 1 
		IF @i >= @N BREAK 
		BEGIN
			SET @saida = @saida + CAST(@num + 3 AS VARCHAR) + ', '
			SET @i = @i + 1
			SET @num = @num + 1
		END
	END
END 
PRINT @saida + '... '

