create database Livraria;
use Livraria;

create table livros (
id INT AUTO_INCREMENT PRIMARY KEY,
nome_do_livro varchar (150) not null,
nome_do_autor varchar (200),
sexo_do_autor enum ('M' , 'F'),
num_paginas smallint ,
nome_editora varchar (100),
valor_livro decimal (10, 2),
UF char (2),
ano_publicado year
);

INSERT INTO livros (nome_do_livro, nome_do_autor, sexo_do_autor, num_paginas, nome_editora, valor_livro, UF, ano_publicado)
VALUES
('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.90, 'RJ', 2009),
('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98.00, 'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45.00, 'RJ', 2008),
('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018),
('Hábitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019),
('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60.00, 'MG', 2016),
('Estácio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100.00, 'ES', 2015),
('Pra Sempre Amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011),
('Copas Inesquecíveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018),
('O Poder da Mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);


select * from livros; #verifica os registros, o asterisco permite ver todos os campos

select nome_do_livro, nome_editora from livros;

select nome_do_livro, UF from livros where sexo_do_autor = "M";

select nome_do_livro, num_paginas from livros where sexo_do_autor = "F";

select nome_do_livro ,valor_livro from livros where uf = "SP";

select nome_do_autor, sexo_do_autor, UF from livros where sexo_do_autor = "M" and (uf = "SP" or uf = "RJ"); 
 