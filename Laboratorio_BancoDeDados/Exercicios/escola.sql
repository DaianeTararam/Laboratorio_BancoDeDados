CREATE DATABASE escola
GO
USE escola
GO
CREATE TABLE aluno(
ra					INT				NOT NULL,
nome				VARCHAR(50)		NOT NULL,
idade				INT				NOT NULL,
PRIMARY KEY(ra),
CONSTRAINT chk_idade CHECK  (idade > 0)
)
GO
INSERT INTO aluno(ra,nome, idade) VALUES
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA', 17),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI', 20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES', 29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI',	19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON',	22)
GO
CREATE TABLE disciplina (
codigo				INT				NOT NULL,
nome				VARCHAR(150)	NOT NULL,
carga_horaria		INT				NOT NULL,
PRIMARY KEY (codigo),
CONSTRAINT chk_carga CHECK (carga_horaria >= 32)
)
GO
INSERT INTO disciplina (codigo, nome, carga_horaria) VALUES
(1, 'Laboratório de Banco de Dados', 80),
(2, 'Laboratório de Engenharia de Software', 80),
(3, 'Programação Linear e Aplicações', 80),
(4, 'Redes de Computadores', 80),
(5, 'Segurança da Informação', 40),
(6, 'Teste de Software', 80),
(7, 'Custos e Tarifas Logísticas', 80),
(8, 'Gestão de Estoques', 40),
(9, 'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40)
GO
CREATE TABLE titulacao (
codigo				INT				NOT NULL,
titulo				VARCHAR(30)		NOT NULL,
PRIMARY KEY (codigo)
)
GO
INSERT INTO titulacao (codigo, titulo) VALUES
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor')
GO
CREATE TABLE professor (
registro			INT             NOT NULL,
nome				VARCHAR(100)    NOT NULL,
codigo_titulo		INT             NOT NULL,
PRIMARY KEY (registro),
FOREIGN KEY (codigo_titulo) REFERENCES titulacao(codigo)
)
GO
INSERT INTO professor (registro, nome, codigo_titulo) VALUES
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre', 3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar', 3),
(1121, 'Julio', 1)
GO
CREATE TABLE curso (
codigo				INT             NOT NULL,
nome				VARCHAR(50)     NOT NULL,
area				VARCHAR(100)    NOT NULL,
PRIMARY KEY (codigo)
)
GO
INSERT INTO curso (codigo, nome, area) VALUES
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil')
GO
CREATE TABLE aluno_disciplina (
aluno_ra             INT             NOT NULL,
disciplina_codigo    INT             NOT NULL,
PRIMARY KEY (aluno_ra, disciplina_codigo),
FOREIGN KEY (aluno_ra) REFERENCES aluno(ra),
FOREIGN KEY (disciplina_codigo) REFERENCES disciplina(codigo)
)
GO
INSERT INTO aluno_disciplina (aluno_ra, disciplina_codigo) VALUES
(1, 3416),
(4, 3416),
(1, 3423),
(2, 3423),
(5, 3423),
(6, 3423),
(2, 3434),
(5, 3434),
(6, 3434),
(1, 3440),
(5, 3443),
(6, 3443),
(4, 3448),
(5, 3448),
(6, 3448),
(2, 3457),
(4, 3457),
(5, 3457),
(6, 3457),
(1, 3459),
(6, 3459),
(7, 3465),
(11, 3465),
(8, 3466),
(11, 3466),
(8, 3467),
(12, 3467),
(8, 3470),
(9, 3470),
(11, 3470),
(12, 3470),
(7, 3471),
(7, 3472),
(12, 3472),
(9, 3482),
(11, 3482),
(8, 3483),
(11, 3483),
(12, 3483),
(8, 3499)
GO
CREATE TABLE curso_disciplina (
curso_codigo         INT             NOT NULL,
disciplina_codigo    INT             NOT NULL,
PRIMARY KEY (curso_codigo, disciplina_codigo),
FOREIGN KEY (curso_codigo) REFERENCES curso(codigo),
FOREIGN KEY (disciplina_codigo) REFERENCES disciplina(codigo)
)
GO
INSERT INTO curso_disciplina (disciplina_codigo, curso_codigo) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2)
GO
CREATE TABLE disciplina_professor (
disciplina_codigo    INT             NOT NULL,
professor_registro   INT             NOT NULL,
PRIMARY KEY (disciplina_codigo, professor_registro),
FOREIGN KEY (disciplina_codigo) REFERENCES disciplina(codigo),
FOREIGN KEY (professor_registro) REFERENCES professor(registro)
)
GO
INSERT INTO disciplina_professor (disciplina_codigo, professor_registro) VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1117),
(10, 1119),
(11, 1120),
(12, 1121)
GO
-- Fazer uma pesquisa que permita gerar as listas de chamadas, com RA e nome por disciplina ?	
SELECT aluno.ra,
		aluno.nome,
		disciplina.nome AS Disciplina
FROM aluno
JOIN aluno_disciplina ON aluno.ra = aluno_disciplina.aluno_ra
JOIN disciplina ON disciplina.codigo = aluno_disciplina.disciplina_codigo
ORDER BY aluno.nome

-- Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram
SELECT disciplina.nome,
		professor.nome AS Professor
FROM disciplina 
JOIN disciplina_professor ON disciplina.codigo = disciplina_professor.disciplina_codigo
JOIN professor ON professor.registro =disciplina_professor.professor_registro
ORDER BY disciplina.nome

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso	
SELECT disciplina.nome AS disciplina,
       curso.nome AS curso
FROM disciplina
JOIN curso_disciplina ON disciplina.codigo = curso_disciplina.disciplina_codigo
JOIN curso ON curso.codigo = curso_disciplina.curso_codigo
WHERE disciplina.nome = 'Laboratório de Banco de Dados'

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área	
SELECT d.nome AS disciplina,
       c.area AS area
FROM disciplina d
JOIN curso_disciplina cd ON d.codigo = cd.disciplina_codigo
JOIN curso c ON c.codigo = cd.curso_codigo
WHERE d.nome = 'Teste de Software'

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra			
SELECT d.nome AS disciplina,
       COUNT(ad.aluno_ra) AS quantidade_alunos
FROM disciplina d
LEFT JOIN aluno_disciplina ad ON d.codigo = ad.disciplina_codigo
GROUP BY d.nome
ORDER BY d.nome

-- Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas
SELECT d.nome AS disciplina,
       COUNT(ad.aluno_ra) AS quantidade_alunos
FROM disciplina d
LEFT JOIN aluno_disciplina ad ON d.codigo = ad.disciplina_codigo
GROUP BY d.nome
ORDER BY d.nome

-- Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados
SELECT d.nome AS disciplina,
       p.nome AS professor
FROM disciplina d
JOIN disciplina_professor dp ON d.codigo = dp.disciplina_codigo
JOIN professor p ON p.registro = dp.professor_registro
JOIN aluno_disciplina ad ON d.codigo = ad.disciplina_codigo
WHERE d.nome = 'Teste de Software'
GROUP BY d.nome, p.nome
HAVING COUNT(ad.aluno_ra) >= 5

-- Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. A coluna de ve se chamar quantidade													
SELECT c.nome AS curso,
       COUNT(DISTINCT dp.professor_registro) AS quantidade
FROM curso c
JOIN curso_disciplina cd ON c.codigo = cd.curso_codigo
JOIN disciplina d ON d.codigo = cd.disciplina_codigo
JOIN disciplina_professor dp ON d.codigo = dp.disciplina_codigo
GROUP BY c.nome
ORDER BY c.nome