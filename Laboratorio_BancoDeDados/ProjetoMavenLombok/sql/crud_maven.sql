CREATE DATABASE crud_maven
GO
USE crud_maven
GO
CREATE TABLE carro(
placa					CHAR(7)			NOT NULL,
marca					VARCHAR(70)		NOT NULL,
modelo					VARCHAR(70)		NOT NULL,
ano						INT				NOT NULL,
cor						VARCHAR(30)		NOT NULL,
PRIMARY KEY (placa)
)

