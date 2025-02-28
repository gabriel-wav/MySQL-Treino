create database joins; 
use joins;

create table autor (
ID_AUTOR INT PRIMARY KEY NOT NULL auto_increment,
NOME_AUTOR VARCHAR (30));

CREATE TABLE LIVRO (
ID_LIVRO INT AUTO_INCREMENT PRIMARY KEY, 
NOME_LIVRO VARCHAR(60),
FK_A INT,
FOREIGN KEY(FK_A) REFERENCES AUTOR (ID_AUTOR)
);

DESC livro;
select * from livro;

INSERT INTO AUTOR (ID_AUTOR, NOME_AUTOR)
VALUES
(default, 'Luana Farias'),
(default,'Ronaldo Fenomeno'),
(default, 'Marcos Cunha'),
(default, 'Alessandra Farias'),
(default, 'Fabiano Soares');

INSERT INTO livro (ID_LIVRO, NOME_LIVRO, FK_A)
VALUES
(default, 'CSS', '5'),
(default,'HTML', '1'),
(default, 'C++', '3'),
(default, 'Python', null),
(default, 'PHP', '2');

select * from autor;
select * from livro;

/*8 Faça um INNER JOIN para mostrar as informações que estão em comum
nas duas tabelas referente ao NOME_AUTOR e o NOME_LIVRO*/
SELECT a.NOME_AUTOR, l.NOME_LIVRO 
FROM AUTOR a
JOIN LIVRO l ON a.ID_AUTOR = l.FK_A;

/*9 Faça um INNER JOIN para mostrar todos os nomes de autores e o
NOME_LIVRO*/
SELECT a.NOME_AUTOR, l.NOME_LIVRO 
FROM AUTOR a
left JOIN LIVRO l ON a.ID_AUTOR = l.FK_A;

/*10 Faça um INNER JOIN para mostrar todos os nomes dos Livros e o
NOME_AUTOR*/
SELECT a.NOME_AUTOR, l.NOME_LIVRO 
FROM AUTOR a
right JOIN LIVRO l ON a.ID_AUTOR = l.FK_A;

/*11 Faça um INNER JOIN para mostrar todos os nomes dos Livros e dos 
autores */
SELECT a.NOME_AUTOR, l.NOME_LIVRO
FROM AUTOR a
LEFT JOIN LIVRO l ON a.ID_AUTOR = l.FK_A

UNION

SELECT a.NOME_AUTOR, l.NOME_LIVRO
FROM LIVRO l
RIGHT JOIN AUTOR a ON a.ID_AUTOR = l.FK_A;

