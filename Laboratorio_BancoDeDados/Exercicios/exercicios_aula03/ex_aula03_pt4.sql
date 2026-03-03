CREATE DATABASE ex_aula03_pt4
GO
USE ex_aula03_pt4
GO
--a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
DECLARE @num	INT 
SET @num = 600
IF (@num % 2 = 0 AND @num % 3 = 0 AND @num % 5 = 0 )
BEGIN
	PRINT ('O número ' + CAST(@num AS VARCHAR) + ' é múltiplo de 2, 3 e 5')
END
ELSE
BEGIN
	IF (@num % 2 = 0 OR @num % 3 = 0 OR @num % 5 = 0 )
	BEGIN 
		PRINT ('O número ' + CAST(@num AS VARCHAR) + ' é múltiplo de um dos números: 2, 3 e 5')
	END
ELSE
BEGIN
	PRINT ('O número ' + CAST(@num AS VARCHAR) + ' não é múltiplo de nenhum dos números')
END
END

--b) Fazer um algoritmo que leia 3 números e mostre o maior e o menor
DECLARE @num1  INT,
		@num2  INT,
		@num3  INT,
		@maior INT
SET @num1 = 6
SET @num2 = 23
SET @num3 = 3
SET @maior = 0
IF (@num1 > @num2 AND @num1 > @num3)
BEGIN
	SET @maior = @num1
	PRINT ('O maior número é o ' + CAST(@maior AS VARCHAR))
END
IF (@num2 > @num1 AND @num2 > @num3)
BEGIN
	SET @maior = @num2
	PRINT ('O maior número é o ' + CAST(@maior AS VARCHAR))
END
IF (@num3 > @num2 AND @num3 > @num1)
BEGIN
	SET @maior = @num3
	PRINT ('O maior número é o ' + CAST(@maior AS VARCHAR))
END

--c) Fazer um algoritmo que calcule os 15 primeiros termos da série
--1,1,2,3,5,8,13,21,...
--E calcule a soma dos 15 termos
DECLARE @a INT,
		@b INT,
		@contador INT,
		@resul VARCHAR(200),
		@temp INT,
		@soma INT
SET @a = 1
SET @b = 1
SET @contador = 2
SET @soma = 2
SET @resul = '1, 1'
WHILE (@contador < 15) 
BEGIN 
	SET @temp = @a + @b
	SET @resul = @resul + ', ' + CAST(@temp AS VARCHAR)
	SET @soma = @soma + @temp
	SET @a = @b
	SET @b = @temp
	SET @contador = @contador + 1
END 
PRINT (@resul + ',...')
PRINT ('Soma dos 15 termos: ' + CAST(@soma AS VARCHAR))

-- d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em
-- minúsculo (Usar funções UPPER e LOWER)
DECLARE @frase VARCHAR(50)
SET @frase = 'Reveja seus conceitos!'
PRINT (UPPER(@frase))
PRINT (LOWER(@frase))

--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
DECLARE @palavra VARCHAR(30),
		@palavraNova VARCHAR(30),
		@tamanho INT
SET @palavra = 'Sol e Lua'
SET @tamanho = LEN(@palavra)
SET @palavraNova = ''
WHILE(@tamanho > 0)
BEGIN
	SET @palavraNova = @palavraNova + SUBSTRING(@palavra, @tamanho,1)
	SET @tamanho = @tamanho - 1
END
PRINT @palavraNova

//*f) Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste
com as regras estabelecidas (Não usar constraints na criação da tabela)
Computador
ID Marca QtdRAM TipoHD QtdHD FreqCPU
INT (PK) VARCHAR(40) INT VARCHAR(10) INT DECIMAL(7,2)

• ID incremental a iniciar de 10001
• Marca segue o padrão simples, Marca 1, Marca 2, Marca 3, etc.
• QtdRAM é um número aleatório* dentre os valores permitidos (2, 4, 8, 16)
• TipoHD segue o padrão:
o Se o ID dividido por 3 der resto 0, é HDD
o Se o ID dividido por 3 der resto 1, é SSD
o Se o ID dividido por 3 der resto 2, é M2 NVME
• QtdHD segue o padrão:
o Se o TipoHD for HDD, um valor aleatório* dentre os valores permitidos (500, 1000 ou 2000)
o Se o TipoHD for SSD, um valor aleatório* dentre os valores permitidos (128, 256, 512)
• FreqHD é um número aleatório* entre 1.70 e 3.20

* Função RAND() gera números aleatórios entre 0 e 0,9999...*//

CREATE TABLE computador(
id			INT						NOT NULL,
marca		VARCHAR(40)				NOT NULL,
qtd_ram		INT						NOT NULL,
tipo_hd		VARCHAR(10)				NOT NULL,
qtd_hd		INT,
freqCPU		DECIMAL(7,2)			NOT NULL
PRIMARY KEY(id)
)
DECLARE @id		INT,
		@marca VARCHAR(40),
		@qtd_ram INT,
		@tipo_hd	VARCHAR(10),
		@qtd_hd	INT,
		@freqCPU DECIMAL(7,2),
		@i	INT
SET @id = 10001
SET @i = 1
WHILE (@i <= 100)
BEGIN
	SET @qtd_ram = CASE CAST(RAND()* 4 AS INT) 
						WHEN 0 THEN 2
						WHEN 1 THEN 4
						WHEN 2 THEN 8
						WHEN 3 THEN 16
						ELSE 2
					END
	IF (@id % 3 = 0)
	BEGIN
		SET @tipo_hd = 'HDD'
	END
	IF (@id % 3 = 1)
	BEGIN
		SET @tipo_hd = 'SSD'
	END
	IF (@id % 3 = 2)
	BEGIN
		SET @tipo_hd = 'M2 NVME'
	END
	IF (@tipo_hd = 'HDD')
	BEGIN 
		SET @qtd_hd = CASE CAST(RAND()* 3 AS INT) 
						WHEN 0 THEN 500
						WHEN 1 THEN 1000
						WHEN 2 THEN 2000
					  END
	END
	IF (@tipo_hd = 'SSD')
	BEGIN 
		SET @qtd_hd = CASE CAST(RAND()* 3 AS INT) 
						WHEN 0 THEN 128
						WHEN 1 THEN 256
						WHEN 2 THEN 512
					  END
	END
	SET @freqCPU = 1.70 + (RAND() * (3.20 - 1.70))
	INSERT INTO computador(id, marca, qtd_ram, tipo_hd, qtd_hd, freqCPU) VALUES
	(@id, 'Marca '+ CAST(@i AS VARCHAR), @qtd_ram, @tipo_hd, @qtd_hd, @freqCPU)
	SET @i = @i + 1
	SET @id = @id + 1
END
SELECT * from computador
delete from computador