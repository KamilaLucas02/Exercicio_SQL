CREATE DATABASE bd_universidade;

USE bd_universidade;


CREATE TABLE Alunos
(
  MAT int unsigned not null,
  nome varchar(45) not null,
  endereço varchar(45) not null,
  cidade varchar(45) not null,
  PRIMARY KEY (MAT)
 );

CREATE TABLE Disciplina
(
  COD_DISC varchar(10) not null,
  nome_disc varchar(45) not null,
  carga_hor time,
  PRIMARY KEY (COD_DISC)
 );


CREATE TABLE Professores
(
  COD_PROF int unsigned not null,
  nome varchar(45) not null,
  endereço varchar(45) not null,
  cidade varchar(45) not null,
  PRIMARY KEY (COD_PROF)
 );

CREATE TABLE Turma
(
  COD_DISC varchar(10) not null,
  COD_TURMA int unsigned not null,
  COD_PROF int unsigned not null,
  ANO int unsigned not null,
  horario varchar(10),
  FOREIGN KEY(COD_DISC) REFERENCES Disciplina (COD_DISC),
  FOREIGN KEY(COD_PROF) REFERENCES Professores (COD_PROF)
 );

CREATE TABLE Historico
(
  MAT int unsigned not null,
  COD_DISC varchar(10) not null,
  COD_TURMA int unsigned not null,
  COD_PROF int unsigned not null,
  ANO int unsigned not null,
  frequencia integer not null,
  nota float,
   FOREIGN KEY(MAT) REFERENCES Alunos(MAT),
    FOREIGN KEY(COD_DISC) REFERENCES Turma(COD_DISC),
     FOREIGN KEY(COD_PROF) REFERENCES Turma(COD_PROF)
      
          
);
 

INSERT INTO Alunos VALUES(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS',  'NATAL');
INSERT INTO Alunos VALUES(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');
INSERT INTO Alunos VALUES(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE');
INSERT INTO Alunos VALUES(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA');
INSERT INTO Alunos VALUES(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
INSERT INTO Alunos VALUES(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');


INSERT INTO Disciplina VALUES('BD', 'BANCO DE DADOS', '100:00:00');
INSERT INTO Disciplina VALUES('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS','100:00:00');
INSERT INTO Disciplina VALUES('WEB', 'AUTORIA WEB', '50:00:00');
INSERT INTO Disciplina VALUES('ENG', 'ENGENHARIA DE SOFTWARE', '80:00:00');

INSERT INTO Professores VALUES(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA');
INSERT INTO Professores VALUES(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');
INSERT INTO Professores VALUES(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

INSERT INTO Turma VALUES('BD', 1, 212131, 2015, '11H-12H');
INSERT INTO Turma VALUES('BD', 2, 212131, 2015, '13H-14H');
INSERT INTO Turma VALUES('POO', 1, 192011, 2015, '08H-09H');
INSERT INTO Turma VALUES('WEB', 1, 192011, 2015, '07H-08H');
INSERT INTO Turma VALUES('ENG', 1, 122135, 2015, '10H-11H');

INSERT INTO Historico VALUES(2015010101, 'BD', 1, 212131, 2015, 10, 5.74);
INSERT INTO Historico VALUES(2015010102, 'POO', 1, 192011, 2015, 4, 10);
INSERT INTO Historico VALUES(2015010103, 'WEB', 1, 192011, 2015, 5, 5);
INSERT INTO Historico VALUES(2015010104, 'ENG',1, 122135, 2015, 5, 6.2);
INSERT INTO Historico VALUES(2015010105, 'BD', 2, 212131, 2015, 4, 4.5);
INSERT INTO Historico VALUES(2015010106, 'WEB', 1, 192011, 2015, 8, 5.5);

ALTER TABLE Disciplina MODIFY COLUMN COD_DISC varchar(10);



DROP database bd_universidade;
drop table Historico;

SELECT * FROM Alunos;
SELECT * FROM Disciplina;
SELECT * FROM Turma;
SELECT * FROM Historico;

SELECT A.MAT as Matricula, A.nome FROM Alunos A JOIN Historico H ON H.MAT=A.MAT
WHERE H.COD_DISC='BD' AND H.nota < 5;

SELECT A.MAT AS Matricula, A.Nome, AVG( H.Nota) FROM Alunos A JOIN Historico H ON H.MAT=A.MAT
WHERE H.COD_DISC='POO';

SELECT A.MAT AS Matricula, A.Nome, H.Nota FROM Alunos A JOIN Historico H ON H.MAT = A.MAT
WHERE H.COD_DISC='POO' GROUP BY H.nota HAVING AVG(H.nota) > 6;

SELECT*FROM Alunos WHERE cidade = 'Natal';











