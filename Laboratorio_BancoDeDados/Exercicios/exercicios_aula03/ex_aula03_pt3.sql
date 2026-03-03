//*f) Considerando a tabela abaixo, gere uma database, a tabela e crie um algoritmo para inserir
uma massa de dados, com 50 registros, para fins de teste, com as regras estabelecidas (Não
usar constraints na criação da tabela)
Livro
ID Título Qtd_Páginas Qtd_Estoque
INT (PK) VARCHAR(30) INT INT

• Código inicia em 981101 e incrementa de 1 em 1
• Título segue padrão simples: Livro 981101, Livro 981102, Livro 981103, etc.
• Qtd_paginas deve ser um número aleatório entre 100 e 400
• Qtd_Estoque deve ser um número aleatório entre 2 e 20*//
CREATE DATABASE ex_aula03_pt3
GO 
USE ex_aula03_pt3
GO
CREATE TABLE livro(
id				INT			NOT NULL,
titulo			VARCHAR(30)	NOT NULL,	
qtd_paginas		INT			NOT NULL,
qtd_estoque		INT			NOT NULL
PRIMARY KEY(id))
GO
DECLARE @i INT,
		@ID INT
SET @i = 1
SET @ID = 981101
WHILE (@i < 51)
BEGIN
	INSERT INTO livro(id, titulo, qtd_paginas, qtd_estoque) VALUES (
    @ID,
    'Livro ' + CAST(@ID AS VARCHAR),
    CAST((100 + (RAND() * 300)) AS INT), 
    CAST((2 + (RAND() * 18)) AS INT) 
	)
	SET @ID = @ID + 1
	SET @i = @i + 1
END
GO
SELECT * FROM livro
