CREATE DATABASE db_cursores
go
USE db_cursores
go
CREATE TABLE Vendedor (
id_vendedor INT NOT NULL,
nome VARCHAR(100) NOT NULL,
total_vendas_ano DECIMAL(10,2) NOT NULL,
categoria VARCHAR(20) NOT NULL
PRIMARY KEY (id_vendedor)
)
go
CREATE TABLE Historico_Bonus (
id_bonus INT NOT NULL,
id_vendedor INT NOT NULL,
valor_bonus DECIMAL(7,2) NOT NULL,
data_processamento DATE NOT NULL
PRIMARY KEY (id_bonus)
FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
)
go
INSERT INTO Vendedor VALUES 
(1, 'Ana Silva', 50000.00, 'Junior'),
(2, 'Bruno Costa', 120000.00, 'Pleno'),
(3, 'Carla Souza', 250000.00, 'Senior'),
(4, 'Diego Lima', 80000.00, 'Pleno')
GO
CREATE PROCEDURE sp_gerar_vendedores
AS
BEGIN
	DECLARE @i INT,@c INT
	SET @i = 5
	SET @c = 1
	WHILE (@c <= 15)
	BEGIN
		INSERT INTO Vendedor VALUES
		(@i, 'Vendedor Junior ' + CAST(@c AS VARCHAR(2)), 30000.00, 'Junior')
		INSERT INTO Vendedor VALUES 
		(@i + 1, 'Vendedor Pleno' + CAST(@c AS VARCHAR(2)), 80000.00, 'Pleno')
		INSERT INTO Vendedor VALUES 
		(@i + 2, 'Vendedor Senior' + CAST(@c AS VARCHAR(2)),150000.00, 'Senior')
		SET @i = @i + 3
		SET @c = @c + 1
	END
END
GO
EXEC sp_gerar_vendedores
GO

CREATE PROCEDURE sp_bonus 
AS
BEGIN
	DECLARE @id INT,
			@vendas DECIMAL(10, 2),
			@cat VARCHAR(20),
			@bonus DECIMAL(10,2),
			@c INT
	SET @c = 1
	DECLARE cursor_bonus CURSOR 
		FOR SELECT id_vendedor, total_vendas_ano, categoria FROM Vendedor
		OPEN cursor_bonus
		FETCH NEXT FROM cursor_bonus INTO @id,@vendas, @cat
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (@cat = 'Senior')
			BEGIN
				SET @bonus = @vendas * 0.15
			END
			IF (@cat = 'Pleno')
			BEGIN
				SET @bonus = @vendas * 0.10
			END
			IF (@cat = 'Junior')
			BEGIN
				SET @bonus = @vendas * 0.05
			END
			INSERT INTO Historico_Bonus VALUES
			(@c, @id, @bonus, GETDATE())

			FETCH NEXT FROM cursor_bonus INTO @id, @bonus, @cat

			SET @c = @c + 1
		END
		CLOSE cursor_bonus
		DEALLOCATE cursor_bonus
END
GO
EXEC sp_bonus
--use master
go
--drop database db_cursores
select * from Vendedor
select * from Historico_Bonus