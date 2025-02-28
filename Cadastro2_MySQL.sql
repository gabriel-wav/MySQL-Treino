CREATE DATABASE Cadastro; #cria banco de dados
SHOW databases; #mostra todos banco de dados
USE Cadastro; #usa o banco de dados "cadastro"

create table clientes( 
nome varchar (40),
idade tinyint (3),
sexo char (1),
peso float,
altura float,
nacionalidade varchar (25)
);


drop database Cadastro; #exclui o banco de dados

CREATE DATABASE Cadastro;
USE Cadastro;
create table clientes(
nome varchar (40) not null,
nascimento date,
sexo enum ('M' , 'F'),
peso decimal (5,2),
altura decimal (3,2),
nacionalidade varchar (25) default 'Brasil'
);

desc clientes; #verificar tabelas

alter table clientes
add column id int not null auto_increment primary key; #cria um id para cada cliente

alter table clientes
drop column id; #exclui a coluna id

alter table clientes
add column id int not null auto_increment primary key first; #coloca o id como primeira coluna
desc clientes;

alter table clientes add column estado_civil varchar (40) after nascimento; #adiciona a coluna estado civil depois da coluna nascimento
desc clientes;

alter table clientes drop column estado_civil; #excluir coluna
desc clientes;

insert into clientes #adiciona registros a tabela
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Marcelo', '1968-11-15', 'M', '88.60', '1.85', ' ' );
select * from clientes; #verifica os registros

update clientes
set nacionalidade= 'Brasil' Where id='1'; #coloca a nacionalidade como brasil no id 1
desc clientes;


insert into clientes #adiciona registros a tabela
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Simone', '1970-10-28', 'F', '75', '1.67', default);
select * from clientes; #verifica os registros, o asterisco permite ver todos os campos


ALTER TABLE clientes
modify column nome varchar(60); #altera restrição da coluna
desc clientes;

alter table clientes
Change column sexo genero enum ('M','F'); #renomear nome de coluna
desc clientes;

alter table clientes rename to clientes1; #altera nome da tabela
Show tables; #mostrar todas as tabelas
alter table clientes1 rename to clientes; #altera nome da tabela

insert into clientes #adiciona registros a tabela
(nome, nascimento, genero, peso, altura, nacionalidade)
values
('Fernanda', '1978-10-28', 'F', '70.5', '1.58', default),
('Julio', '2010-08-26', 'M', '55.60', '1.69', default),
('Davi', '2014-06-30', 'M', '34.8', '1.48', default),
('Silvana', '1963-03-11', 'F', '64.5', '1.52', default);
select * from clientes; #verifica os registros, o asterisco permite ver todos os campos

delete from clientes where id = '2'; #deleta da tabela clientes o id selecionado
Select * from clientes;
describe clientes;

desc clientes; #verifica a estrutura tabela clientes
alter table clientes
add column profissao char (20) after nome; #adiciona a coluna profissao após a coluna nome
Select * from clientes; #visualiza os registros da tabela clientes
alter table clientes
Change column profissao cargo char (20); #altera o nome profissao para cargo
update clientes 
set cargo= 'TI' Where id='1'; #insere o cargo TI no id 1

drop table clientes;
create table if not exists cursos ( #cria uma tabela cursos se não existir ela
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
qtdaulas int unsigned,
ano year default '2024');
desc cursos;

alter table cursos
add column id int not null auto_increment primary key first; #coloca o id como primeira coluna
insert into cursos #adiciona registros a tabela
(nome, descricao, carga, qtdaulas, ano)
values
('Pacote officce', 'Nível Básico', '96', '24', '2000'),
('Exel básico', 'Nível Intermediário', '40', '10', '2012'),
('Excel avançado', 'Nível Avançado', '60', '15', '2014'),
('Operador de Microcomputador', 'Nível Intermediário', '160', '40', '2028'),
('SQL', 'Nível Avançado', '120', '30', '2004');

Select * from cursos;

update cursos #altera o registro no id selecionado
set nome= 'Pacote Office' Where id='1';
update cursos
set nome= 'Excel Básico' Where id='2';
update cursos
set ano= '2025' Where id='4';

delete from cursos where id = '3'; #deleta da tabela o id selecionado

update cursos
set nome='Excel Básico', ano = '2020', carga = '40'
where id = '2';


update cursos #várias alterações
set ano = '2040', carga = '500'
where ano = '2020';


update clientes
set cargo = 'Aux. Administrativo'
where cargo = 'Aux.ADM';
Select * from clientes;

create table new_table as select * from original_table; #criar cópia

create table clientes2 as select * from clientes; #criar cópia

Truncate table clientes2; #apaga as linhas da tabela
select * from clientes2;
drop table clientes2;


drop table cursos;
use Cadastro;
show tables;
desc cursos;


create table cursos2 as select * from cursos; #criar cópia
drop table cursos;


select * from cursos 
order by nome; #ordenar a coluna nome pela ordem crescente

select * from cursos 
order by nome desc; #ordenar a coluna nome pela ordem decrescente

select nome, carga, ano from cursos #importar antes
order by ano; #ordenar a coluna ano pela ordem crescente

select nome, carga, ano from cursos #importar antes
order by ano, nome; #ordenar a coluna ano e nome pela ordem crescente

select * from cursos #vai ordenar pelo nome somente no ano de 2016
Where ano = '2016'
Order by nome;

select nome, carga from cursos #vai ordenar pelo nome somente no ano de 2016
Where ano = '2016'
Order by nome;
select * from cursos;

select ano, nome, descricao from cursos #vai ordenar pelo nome somente no ano de 2015 para baixo
Where ano <= '2015'
Order by nome;
select * from cursos;

select ano, nome, descricao from cursos #vai ordenar pelo nome e ano excluindo 2016
Where ano != '2016'
Order by ano, nome;
select * from cursos;

select ano, nome from cursos #vai ordenar pelo ano e nome entre os anos de 2014 e 2016
where ano between '2014' and '2016'
order by nome;

select idcurso, ano, nome from cursos #vai ordenar pelo ano nos anos de 2014, 2016 e 2018
where ano in (2014, 2016, 2018)
order by ano;

select * from cursos #carga menor que 35 E/AND totaulas menor que 30
where carga > 35 and totaulas > 30
order by nome; 

select nome, carga, totaulas from cursos #carga maior que 35 OU/OR totaulas menor que 30 dos campos nomes, carga e totaulas
where carga > 35 or totaulas < 30
order by nome;

select * from cursos #mostra apenas os nomes que começam com P
where nome like 'P%';

select * from cursos #mostra apenas os nomes que terminam com A
where nome like '%a';

select * from cursos #mostra apenas os nomes que apareça letra A independente do lugar
where nome like '%a%';

select * from cursos #mostra apenas os nomes que não aparece letra A independente do lugar
where nome not like '%a%';

select * from cursos #mostra apenas os nomes que começam com PH e termina com P
where nome like 'PH%P';

select * from cursos #mostra apenas os nomes que começam com PH e tenham P
where nome like 'PH%P%';

select * from cursos #mostra apenas os nomes que começam com PH e tenham alguma informação após o P
where nome like 'PH%P_';

select count(*) from cursos; #conta todos os cursos da tabela cursos

select * from cursos where carga > 40; #visualizar todos os cursos com carga horária maior que 40h

select count(*) from cursos where carga > 40; #conta todos os cursos da tabela cursos onde a carga horária é maior que 40

select max(carga) from cursos; #exibe a maior carga horária dos cursos da tabela cursos

select max(totaulas) from cursos where ano = 2016; #exibe o maior número de aulas que tenho entre os cursos no ano de 2016

select min(totaulas) from cursos; #exibe o menor número de aulas que tenho entre os cursos

select sum(totaulas) from cursos; #somatória do total de aulas

select avg(totaulas) from cursos; #média do total de aulas


#ativiade
select * from alunos where sexo = "F" #Faça uma lista com o nome de todas as alunas em ordem alfabética de nomes
order by nome; #ordenar a coluna nome pela ordem crescente

select * from alunos #Faça uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015.
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

select * from alunos where sexo = "M" and profissao = "Programador" #Faça uma lista com o nome de todos os homens que trabalham como  Programadores, em ordem alfabética de nomes.
order by nome; #ordenar a coluna nome pela ordem crescente

select * from alunos where sexo = "F" and nacionalidade = "Brasil" and nome like "J%" #Faça uma lista com os dados de todas as mulheres que nasceram no Brasil  e que tem seu nome iniciado com a letra J
order by nome; #ordenar a coluna nome pela ordem crescente

select * from alunos where sexo = "M" and nacionalidade = "Brasil" and nome like "%Silva" and peso <= 80 #Faça uma lista com o nome e nacionalidade de todos os homens que têm  Silva no nome, nasceram no Brasil e pesam menos de 80 Kg
order by nome; #ordenar a coluna nome pela ordem crescente

select max(altura) from alunos where sexo = "M" and nacionalidade = "Portugal"; #Qual é a maior altura entre os alunos homens que moram em Portugal?

select avg(peso) from alunos; #Qual é a média de peso dos alunos cadastrados?

select * from alunos where sexo = "M" and nacionalidade != "Brasil" and nascimento between "1990-01-01" and "2000-12-31" #Quem são os homens da lista de alunos, que nasceram fora do Brasil entre 01/01/1990 e 31/12/2000, classifique em ordem decrescente de nome
order by nome desc; #ordenar a coluna nome pela ordem crescente

select min(peso) from alunos where sexo = "F" and nacionalidade != "Brasil" and nascimento between "1990-01-01" and "2000-12-31"
order by nome; #Qual é o menor peso entre as mulheres que nasceram fora do Brasil, entre 01/01/1990 e 31/12/2000?

select count(altura) from alunos where sexo = "F" and altura >= "1.90" ; #Quantas mulheres tem mais de 1.90m de altura

#####
select carga from cursos #agrupa os cursos pela carga
group by carga;

select carga, count(nome) from cursos #agrupa os cursos pela carga e conta quantos tem
group by carga;

select distinct totaulas from cursos #listar valores distintos da coluna totaulas
group by totaulas;

select totaulas, count(*) from cursos #contar quantos cursos existem para cada valor de totaulas e ordenar pelo número total de aulas
group by totaulas
order by totaulas;

select carga, totaulas from cursos #agrupa os cursos que tiverem total de aulas igual a 30
where totaulas = 30
group by carga;

select carga, count(nome) from cursos #conta quantos cursos tem total de aulas igual a 30
where totaulas = 30
group by carga;

select ano, count(nome) from cursos #conta quantos cursos tem o mesmo ano
group by ano;

select ano, count(nome) from cursos #conta quantos cursos tem o mesmo ano ordenado por quantidade crescente
group by ano
order by count(*);

select ano, count(nome) from cursos #conta quantos cursos tem o mesmo ano ordenado por quantidade decrescente
group by ano
order by count(*) desc;

select ano, count(nome) from cursos #conta quantos tem tem o mesmo ano ordenado por quantidade decrescente e que tenha mais de 5 cursos com o mesmo ano
group by ano
having count(ano) >= 5
order by count(*) desc;

select ano, count(nome) from cursos 
where totaulas > 30
group by ano
having ano > 2013
order by count(*); 
 
select carga, count(*) from cursos #selecionar carga e o total de horas dos cursos, onde o ano seja acima de 2015, agrupado por carga, somente para carga acima da média
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

select * from cursos; 
select nome, carga, ano from cursos
group by nome, carga, ano
order by idcurso;

select carga, count(carga) as qtd_cursos from cursos
group by carga
order by qtd_cursos;


USE Cadastro;
CREATE TABLE Vendas (
ID Smallint auto_increment Primary Key,
Nome_Vendedor Varchar(80),
Quantidade Int,
Produto Varchar(60),
Cidade Varchar(50),
UF Varchar (2)
);

INSERT INTO Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade, UF)
VALUES
(default,'Luana',1800,'Celular','São Paulo', 'SP'),
(default,'Carla',2300,'Webcam','Recife', 'PE'),
(default,'Joao',1900,'Mouse','São Paulo', 'SP'),
(default,'Jorge',1700,'Webcam','Rio de Janeiro','RJ'),
(default,'Pedro',2120,'Celular','Recife', 'PE'),
(default,'andre',3980,'Mouse','São Paulo','SP'),
(default,'Fabiana',2120,'Webcam','Recife', 'PE'),
(default,'Rosana',1480,'Mouse','Rio de Janeiro','RJ'),
(default,'Roberto',4150,'Celular','Minas Gerais','MG'),
(default,'Rose',2100,'Celular','São Paulo','SP'),
(default,'Marcos',3200,'Mouse','Minas Gerais','MG'),
(default,'Davi',1500,'Webcam','Recife', 'PE'),
(default,'Marcelo',3010,'Mouse','Rio de Janeiro','RJ'),
(default,'Roberto',5620,'Celular','São Paulo','SP');

desc vendas;
select * from vendas;

select sum(quantidade) as total_celular
from vendas
where produto = "celular";

select cidade, sum(quantidade) as total
from vendas
group by cidade;

select cidade, sum(quantidade) as total
from vendas
group by cidade
having cidade = "Recife";

select cidade, sum(quantidade) as total
from vendas
group by cidade
having cidade = "São Paulo";

select * from alunos;

select profissao, count(profissao) as total # Crie uma lista com as profissões dos alunos e seus respectivos quantitativos. Ou seja, quantos são programadores e assim sucessivamente
from alunos
group by profissao;

select profissao, count(profissao) as total #Crie uma lista com as profissões dos alunos e seus respectivos quantitativos em ordem crescente. Ou seja, quantos são programadores e assim sucessivamente
from alunos
group by profissao
order by total;

SELECT sexo, COUNT(*) AS total #Quantos alunos homens e quantas mulheres nasceram após 01/jan/2005, agrupar por sexo?
FROM alunos
WHERE nascimento > '2005-01-01'
GROUP BY sexo
ORDER BY total;

SELECT nacionalidade, COUNT(*) AS total FROM alunos #Criar uma lista com os alunos e alunas que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nos interessam os países que tiverem mais de 3 alunos com essa nacionalidade. “Ou seja, saber quantas pessoas moram em cada um dos países que não seja o Brasil e só nos interessa os que tem mais de três alunos.
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING total > 3
ORDER BY total DESC;

SELECT altura, COUNT(*) FROM alunos #Uma lista agrupada pela altura dos alunos, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastrados. 1º) Qual é a média de altura de todos os alunos, 2º) Todas as pessoas que pesam mais de 100kg, vai agrupar por altura e mostrar somente pessoas com peso acima de 100kg e está acima da média de altura
WHERE peso > "100"
GROUP BY altura
having altura > (select avg(altura) from alunos)
order by altura;

alter table alunos add column cursopreferido int;
desc alunos;

alter table alunos
add foreign key (cursopreferido)
references cursos (idcurso);

desc alunos;
select * from alunos;

update alunos
set cursopreferido= '6' Where id='1'; #coloca o curso preferido como 6 já que é o id do curso na tabela cursos, verificar na linha abaixo
select * from cursos;

update alunos set cursopreferido = '6' where id = '1';

update alunos set cursopreferido = '22' where id = '2';

update alunos set cursopreferido = '12' where id = '3';

update alunos set cursopreferido = '7' where id = '4';

update alunos set cursopreferido = '1' where id = '5';

update alunos set cursopreferido = '8' where id = '6';

update alunos set cursopreferido = '4' where id = '7';

update alunos set cursopreferido = '5' where id = '8';

update alunos set cursopreferido = '3' where id = '9';

update alunos set cursopreferido = '30' where id = '10';

update alunos set cursopreferido = '22' where id = '11';

delete from cursos where idcurso = "9";
delete from cursos where idcurso = "28";

select * from cursos;

delete from cursos where idcurso= "6";

select nome, cursopreferido from alunos; 

select * from cursos;
select * from ALUNOS;


select ALUNOS.NOME, ALUNOS.CURSOPREFERIDO, CURSOS.NOME, CURSOS.ANO
FROM ALUNOS JOIN CURSOS; #JUNÇÃO DE DUAS TABELAS


select ALUNOS.NOME, ALUNOS.CURSOPREFERIDO, CURSOS.NOME, CURSOS.ANO
FROM ALUNOS JOIN CURSOS
ON CURSOS.IDCURSO = ALUNOS.CURSOPREFERIDO #JUNÇÃO DE DUAS TABELAS COM FILTRO ONDE ID CURSO = CURSOPREFERIDO
ORDER BY ALUNOS.NOME;

select A.NOME, A.CURSOPREFERIDO, C.NOME, C.ANO
FROM ALUNOS AS A JOIN CURSOS AS C
ON C.IDCURSO = A.CURSOPREFERIDO #JUNÇÃO DE DUAS TABELAS COM FILTRO ONDE ID CURSO = CURSOPREFERIDO E APELIDA AS TABELAS COMO "A" E "C"
ORDER BY A.NOME;

CREATE TABLE ALUNO_ASSISTE_CURSO (
ID INT NOT NULL AUTO_INCREMENT,
DATA DATE,
IDALUNOS INT,
IDCURSO INT,
PRIMARY KEY (ID),
foreign key (IDALUNOS) REFERENCES ALUNOS (ID), 
foreign key (IDCURSO) REFERENCES CURSOS (IDCURSO));

SELECT * FROM ALUNO_ASSISTE_CURSO;

insert into ALUNO_ASSISTE_CURSO #adiciona registros a tabela
(ID, DATA, IDALUNOS, IDCURSO)
values
(default, "2014-03-01", '1', '2'),
(default, "2015-12-22", '3', '6'),
(default, "2014-01-01", '22', '12'),
(default, "2016-05-12", '1', '19');


select * from cursos;
select * from ALUNOS;

select * FROM ALUNOS
JOIN ALUNO_ASSISTE_CURSO
ON ALUNOS.ID = ALUNO_ASSISTE_CURSO.IDALUNOS; #JUNÇÃO DE DUAS TABELAS

select * FROM ALUNOS a
JOIN ALUNO_ASSISTE_CURSO ac
ON a.ID = ac.IDALUNOS; #JUNÇÃO DE DUAS TABELAS com apelido

select * FROM ALUNOS a
JOIN ALUNO_ASSISTE_CURSO ac ON a.ID = ac.IDALUNOS
join cursos c on ac.IDAlunos = c.Id; #JUNÇÃO DE DUAS TABELAS com apelido

SELECT a.nome, c.nome FROM ALUNOS a
JOIN ALUNO_ASSISTE_CURSO ac ON a.ID = ac.IDALUNOS
JOIN CURSOS c ON c.IDCURSO = ac.idcurso
order by a.nome;

DESC ALUNOS;
DESC ALUNO_ASSISTE_CURSO;
DESC CURSOS;

SELECT * FROM ALUNO_ASSISTE_CURSO;
select * from cursos;
select * from ALUNOS;

SELECT a.nome, c.nome FROM ALUNOS a # exibe tds os nomes da tabela alunos mesmo que não esteja relacionado a algum curso
left JOIN ALUNO_ASSISTE_CURSO ac ON a.ID = ac.IDcurso
left JOIN CURSOS c ON c.IDCURSO = ac.idcurso;
	
SELECT a.nome, c.nome FROM ALUNOS a # exibe tds os cursos da tabela cursos mesmo que não esteja relacionado a algum nome
right JOIN ALUNO_ASSISTE_CURSO ac ON a.ID = ac.IDcurso
right JOIN CURSOS c ON c.IDCURSO = ac.idcurso;


#--função
delimiter $
create function fn_BoasVindas(nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Bem-vindo', nome,', tudo bem?');
end $
delimiter ;

select fn_BoasVindas(' Gabriel') as 'Bom dia!';

delimiter $
create function fn_Faturamento(preco decimal(10, 2),quantidade int)
returns decimal (10, 2) deterministic
begin
return preco * quantidade;
end $
delimiter ;

select fn_Faturamento(133, 7) as 'Faturamento';

drop function fn_RemoveAcentos;
delimiter $
create function fn_RemoveAcentos(texto varchar(100))
returns varchar(100) deterministic
begin
set 
texto = replace(texto,'à', 'a'),
texto = replace(texto,'á', 'a'),
texto = replace(texto,'ã', 'a'),
texto = replace(texto,'â', 'a'),
texto = replace(texto,'ä', 'a'),
texto = replace(texto,'é', 'e'),
texto = replace(texto,'è', 'e'),
texto = replace(texto,'ê', 'e'),
texto = replace(texto,'ë', 'e'),
texto = replace(texto,'í', 'i'),
texto = replace(texto,'ì', 'i'),
texto = replace(texto,'î', 'i'),
texto = replace(texto,'ï', 'i'),
texto = replace(texto,'ó', 'o'),
texto = replace(texto,'ò', 'o'),
texto = replace(texto,'ô', 'o'),
texto = replace(texto,'ö', 'o'),
texto = replace(texto,'õ', 'o'),
texto = replace(texto,'ú', 'u'),
texto = replace(texto,'ù', 'u'),
texto = replace(texto,'û', 'u'),
texto = replace(texto,'ü', 'u'),
texto = replace(texto,'ç', 'c');
return texto;
end $
delimiter ;

select fn_RemoveAcentos ('á aliança da discípula alemã.') as Remove_Acento;
select fn_RemoveAcentos ('Olá, você está bem Müller?') as Remove_Acento;
select fn_RemoveAcentos ('João entrou no ônibus com carrinho de rolemã.') as Remove_Acento;

delimiter $
create function data_hoje()
returns date
deterministic
begin
return curdate();
end $
delimiter ;
select data_hoje();


delimiter $
create function data_mais_20_dias()
returns date
deterministic
begin
return date_add(curdate(), interval 20 day);
end $
delimiter ;
select data_mais_20_dias();

delimiter $
create function data_mais_2_anos_5_meses_18_dias()
returns date
deterministic
begin
return date_add(curdate(), interval 2 year) + interval 5 month + interval 18 day;
end $
delimiter ;

select data_mais_2_anos_5_meses_18_dias();

select * from funcionarios; 

delimiter $
create function tempo_servico (Data_inicio date)
returns int
deterministic
begin
declare data_atual date;
select current_date () into data_atual;
return year (data_atual) - year (data_inicio);
end $
delimiter ;

select id_funcionario, nome, sobrenome, tempo_servico(data_contratacao) as 'Tempo de serviço' from funcionarios; 

#exercicio de functions
#--ex 1
delimiter $
create function fn_BoasVindasBD(nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Seja bem-vindo(a)', nome,' ao curso de Bnaco de Dados!');
end $
delimiter ;

select fn_BoasVindasBD(' Gabriel') as 'Bem-vindo!';

#--ex 2
 
delimiter $
create function fn_TotalDeVendas(preco decimal(10, 2),quantidade int)
returns decimal (10, 2) deterministic
begin
return preco * quantidade;
end $
delimiter ;

select fn_TotalDeVendas(133, 7) as 'Total de Vendas';

#--ex 3

delimiter $
create function fn_RemoveAcentosTabela(texto varchar(100))
returns varchar(100) deterministic
begin
set 
texto = replace(texto,'à', 'a'),
texto = replace(texto,'á', 'a'),
texto = replace(texto,'ã', 'a'),
texto = replace(texto,'â', 'a'),
texto = replace(texto,'ä', 'a'),
texto = replace(texto,'é', 'e'),
texto = replace(texto,'è', 'e'),
texto = replace(texto,'ê', 'e'),
texto = replace(texto,'ë', 'e'),
texto = replace(texto,'í', 'i'),
texto = replace(texto,'ì', 'i'),
texto = replace(texto,'î', 'i'),
texto = replace(texto,'ï', 'i'),
texto = replace(texto,'ó', 'o'),
texto = replace(texto,'ò', 'o'),
texto = replace(texto,'ô', 'o'),
texto = replace(texto,'ö', 'o'),
texto = replace(texto,'õ', 'o'),
texto = replace(texto,'ú', 'u'),
texto = replace(texto,'ù', 'u'),
texto = replace(texto,'û', 'u'),
texto = replace(texto,'ü', 'u'),
texto = replace(texto,'ç', 'c');
return texto;
end $
delimiter ;

SELECT loja, endereco, fn_RemoveAcentosTabela(endereco) AS Endereco_sem_acento
FROM diversas_tabelas.lojas;

select * from diversas_tabelas.lojas;

#-- ex 4
delimiter $
create function data_mais_5_anos()
returns date
deterministic
begin
return date_add(curdate(), interval 5 year);
end $
delimiter ;
select data_mais_5_anos();

#--ex 5
 
drop function data_menos_2_anos_11_meses_29_dias;

delimiter $
create function data_menos_2_anos_11_meses_29_dias()
returns date
deterministic
begin
return date_sub(curdate(),  interval 2 year) - interval 11 month - interval 29 day;
end $
delimiter ;

select data_menos_2_anos_11_meses_29_dias();



-- Commit e Rollback
create database tcl;
use tcl;

create table dados (
id int not null primary key auto_increment,
nome varchar (100),
endereco varchar (100),
cpf varchar (12),
sexo enum ('M','F')
);

insert into dados value
(null, 'Daniel', 'Rua Magalhães, 51', '12349528978', 'M'),
(null, 'Mariana', 'Rua Fortaleza, 30', '92882878978', 'F'),
(null, 'Mario', 'Rua da Feira, 457', '12301398978', 'M');

update dados
set nome = 'Naldo'
where id = '1';

select * from dados;

start transaction;

delete from dados
where id = 3;

rollback;

select * from dados;

start transaction;

delete from dados
where id = 2;

commit;

rollback;

select * from dados;

-------
use diversas_tabelas;

select * from pedidos;

select * from lojas;

select * from pedidos
where id_loja = 3;

select id_loja from lojas where gerente = 'Pedro Martins';

set @varNomeGerente = 'PEDRO MARTINS';

SELECT * FROM pedidos WHERE ID_LOJA =  (SELECT ID_LOJA FROM LOJAS WHERE GERENTE = @varNomeGerente);


set @varNomeGerente2 = 'CARLOS HENRIQUE';
SELECT * FROM pedidos WHERE ID_LOJA =  (SELECT ID_LOJA FROM LOJAS WHERE GERENTE = @varNomeGerente2);


set @varNomeGerente3 = 'AMANDA LIMA';
SELECT * FROM pedidos WHERE ID_LOJA =  (SELECT ID_LOJA FROM LOJAS WHERE GERENTE = @varNomeGerente3);


SELECT * FROM PRODUTOS;

SELECT AVG(PRECO_UNIT) FROM PRODUTOS;

SELECT * FROM produtos WHERE PRECO_UNIT > 1788.1250;

SELECT * FROM produtos WHERE PRECO_UNIT > (SELECT AVG(PRECO_UNIT) FROM PRODUTOS);

SELECT * FROM CATEGORIAS;
SELECT ID_CATEGORIA FROM CATEGORIAS WHERE CATEGORIA = 'Notebook';

select * from produtos where id_categoria = '6';

select * from produtos where id_categoria = (SELECT ID_CATEGORIA FROM CATEGORIAS WHERE CATEGORIA = 'Notebook');

select * from categorias;
select * from pedidos;

select * from produtos where marca_produto = 'Dell';

select id_produto from produtos where marca_produto = 'Dell';

select * from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

select sum(receita_venda) as 'Receita Marca Dell' from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

select concat('R$', replace(format(sum(receita_venda), 2), ',' , '.')) as 'Receita Marca Dell' from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

select concat('R$', format(sum(receita_venda), 2, 'de_DE')) as 'Receita Marca Dell' from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

#exercicio 1

SET @varCategoriaprodutos = NULL;

set @varCategoriaProdutos = 'Microfone';
SELECT * FROM produtos WHERE id_categoria =  (SELECT id_categoria FROM categorias WHERE categoria = @varCategoriaProdutos);

select * from produtos;
select * from categorias;

#exercicio 2

select * from pedidos;

select id_produto, count(*) as qtd_vendas from pedidos
group by id_produto
order by qtd_vendas;

SELECT 
    MAX(qtd_vendas) AS qtd_maxima,
    MIN(qtd_vendas) AS qtd_minima,
    AVG(qtd_vendas) AS qtd_media
FROM (
    SELECT id_produto, COUNT(*) AS qtd_vendas
    FROM pedidos
    GROUP BY id_produto
) AS vendas_por_produto;

#EXERCICIO 3

select * from clientes;
select * from pedidos;

select id_cliente, sum(receita_venda) as total_receita from pedidos
group by ID_Cliente
order by sum(receita_venda) desc ;

select id_cliente, sum(receita_venda) as total_receita from pedidos
group by ID_Cliente
order by sum(receita_venda) desc 
limit 1;

#exercicio 4

select * from clientes;
select * from pedidos;
select * from locais;
select * from lojas;

select * from pedidos where id_loja in (select id_loja from lojas where loja in (select cidade from locais where região = 'sudeste'));


#--operadores exists e not exists

select * from categorias;
select * from produtos;
select id_categoria from categorias;
select id_categoria from produtos;

select id_categoria from categorias where exists (select id_categoria from produtos
where categorias.ID_Categoria = produtos.ID_Categoria);

select id_categoria from categorias where not exists (select id_categoria from produtos
where categorias.ID_Categoria = produtos.ID_Categoria);

select * from categorias where id_categoria = '7';

#---loop, repeat, while

delimiter $
create procedure acumula (limite int)
begin
declare contador int default 0;
declare soma int default 0;
loop_teste: loop
set contador = contador + 1;
set soma = soma + contador;
if contador >= limite then 
leave loop_teste;
end if;
end loop loop_teste;
select soma;
end $
delimiter ;

call acumula(15);

delimiter $
create procedure contadorl (limite int)
begin
declare x int default 0;
teste: loop
set x = x + 1;
select x;
if x = limite then
leave teste;
end if;
end loop teste;
end$
delimiter ;

call contadorl (6);

delimiter $
create procedure contadorw(limite int)
begin
declare x int default 0;
while x < limite do
select x;
set x = x + 1;
end while;
end $
delimiter ;

call contadorw (6);

delimiter $
create procedure contadorr (limite int)
begin
declare x int default 0;
repeat 
set x = x + 1;
select x;
until x = limite
end repeat;
end $
delimiter ;

call contadorr (2);

#---- ex 1
drop procedure acumulawhile;

DELIMITER $
CREATE PROCEDURE acumulawhile (IN limite TINYINT UNSIGNED)
BEGIN
DECLARE contador INT DEFAULT 0;
DECLARE soma INT DEFAULT 0;
WHILE contador < limite DO
SET contador = contador + 1;
SET soma = soma + contador;
END WHILE;
SELECT soma AS Resultado;
END $
DELIMITER ;

call acumulawhile (5);

#--- ex 2
drop procedure contadorrepeat;

DELIMITER $
CREATE PROCEDURE contadorrepeat (IN limite INT)
BEGIN
DECLARE contador INT DEFAULT 0;
DECLARE soma INT DEFAULT 0;
REPEAT
SET contador = contador + 1;
SET soma = soma + contador;
UNTIL contador >= limite
END REPEAT;
SELECT soma AS Resultado;
END $

DELIMITER ;

CALL contadorrepeat(5);


