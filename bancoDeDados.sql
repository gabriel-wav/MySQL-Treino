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


CREATE DATABASE TI; #cria banco de dados
USE TI; #usa o banco de dados "ti"

create table clientes( #cria tabela "clientes"
cpf char (11) primary key not null,
nome varchar (300), 
data_de_nascimento date,
endereço varchar (60),
cep varchar (8),
bairro varchar (30),
cidade varchar (30),
UF varchar (2)
);
drop table clientes;
desc clientes;

alter table clientes add column data_da_compra date after uf; #adiciona a coluna data da compra na tabela clientes

insert into clientes #adiciona registros a tabela
(cpf, nome, data_de_nascimento, endereço, cep, bairro, cidade, uf, data_da_compra)
values
('02296332780', 'Marcos da Silva', '1970-11-25', 'Rua Pedro Marques', '88045968', 'Santana', 'São Paulo', "SP", "2024-06-16"),
('08285031490', 'Ana Julia', '1985-10-21', 'Rua Paradigma Novais', '99078923', 'Leblon', 'Rio de Janeiro', "RJ", "2024-06-17"),
('05550314905', 'Jorge Soares', '1989-03-05', 'Rua das Banguelas', '77048917', 'Copacabana', 'Rio de Janeiro', "RJ", "2024-06-18"),
('01150314905', 'Juvenal Soares', '1989-04-15', 'Rua das Tabuinhas', '69048917', 'Minerva', 'Minas Gerais', "MG", "2024-06-19");

select * from clientes; #verifica os registros, o asterisco permite ver todos os campos

select * from clientes
where cidade = 'Rio de Janeiro'; #seleciona apenas os clientes do RJ

alter table clientes add column produtos varchar(300); #cria a coluna produtos

update clientes set produtos = 'TV' where bairro = 'Santana'; #adiciona resgistros na coluna produtos
update clientes set produtos = 'Gerladeira' where bairro = 'Leblon';
update clientes set produtos = 'Notebook' where bairro = 'Copacabana';
update clientes set produtos = 'Celular' where bairro = 'minerva';

select * from clientes;

delete from clientes where UF = 'SP' #deleta os clientes de são paulo 

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

CREATE DATABASE  IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cadastro`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cadastro
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int NOT NULL DEFAULT '0',
  `nome` varchar(30) NOT NULL,
  `descricao` text,
  `carga` int unsigned DEFAULT NULL,
  `totaulas` int unsigned DEFAULT NULL,
  `ano` year DEFAULT '2016',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'HTML5','Curso de HTML5',40,37,2014),(2,'Algoritmos','Lógica de Programação',20,15,2014),(3,'Photoshop5','Dicas de Photoshop CC',10,8,2014),(4,'PHP','Curso de PHP para iniciantes',40,20,2015),(5,'Java','Introdução à Linguagem Java',40,29,2015),(6,'MySQL','Bancos de Dados MySQL',30,15,2016),(7,'Word','Curso completo de Word',40,30,2016),(8,'Python','Curso de Python',40,18,2017),(9,'POO','Curso de Programação Orientada a Objetos',60,35,2016),(10,'Excel','Curso completo de Excel',40,30,2017),(11,'Responsividade','Curso de Responsividade',30,15,2018),(12,'C++','Curso de C++ com Orientação a Objetos',40,25,2017),(13,'C#','Curso de C#',30,12,2017),(14,'Android','Curso de Desenvolvimento de Aplicativos para Android',60,30,2018),(15,'JavaScript','Curso de JavaScript',35,18,2017),(16,'PowerPoint','Curso completo de PowerPoint',30,12,2018),(17,'Swift','Curso de Desenvolvimento de Aplicativos para iOS',60,30,2019),(18,'Hardware','Curso de Montagem e Manutenção de PCs',30,12,2017),(19,'Redes','Curso de Redes para Iniciantes',40,15,2016),(20,'Segurança','Curso de Segurança',15,8,2018),(21,'SEO','Curso de Otimização de Sites',30,12,2017),(22,'Premiere','Curso de Edição de Vídeos com Premiere',20,10,2017),(23,'After Effects','Curso de Efeitos em Vídeos com After Effects',20,10,2018),(24,'WordPress','Curso de Criação de Sites com WordPress',60,30,2019),(25,'Joomla','Curso de Criação de Sites com Joomla',60,30,2019),(26,'Magento','Curso de Criação de Lojas Virtuais com Magento',50,25,2019),(27,'Modelagem de Dados','Curso de Modelagem de Dados',30,12,2020),(28,'HTML4','Curso Básico de HTML, versão 4.0',20,9,2010),(29,'PHP7','Curso de PHP, versão 7.0',40,20,2020),(30,'PHP4','Curso de PHP, versão 4.0',30,11,2010);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 14:48:10


CREATE DATABASE OFICINA;
USE OFICINA;

drop table cliente;

CREATE TABLE CLIENTE (
ID_CLIENTE INT PRIMARY KEY auto_increment,
ID_CARRO INT UNIQUE,
NOME VARCHAR(30) NOT NULL,
SEXO ENUM ("M", "F") NOT NULL);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARROS
FOREIGN KEY (ID_CARRO) 
REFERENCES CARROS(ID_CARRO);

select * FROM CLIENTE;

CREATE TABLE TELEFONES_CLIENTES (
ID_TELEFONE INT primary KEY AUTO_INCREMENT ,
ID_CLIENTE INT,
TIPO ENUM("CEL", "RES", "COM") NOT NULL,
NUMERO VARCHAR(30));

ALTER TABLE TELEFONES_CLIENTES
ADD CONSTRAINT FK_TELEFONES_CLIENTES
FOREIGN KEY (ID_CLIENTE) 
REFERENCES CLIENTE(ID_CLIENTE);

select * FROM TELEFONES_CLIENTES;

CREATE TABLE CARROS (
ID_CARRO INT UNIQUE primary KEY AUTO_INCREMENT ,
ID_MARCA INT,
MODELO VARCHAR(30),
PLACA VARCHAR(15));

ALTER TABLE CARROS
ADD CONSTRAINT FK_CARROS
FOREIGN KEY (ID_MARCA) 
REFERENCES MARCA(ID_MARCA);

select * FROM CARROS;

CREATE TABLE MARCA (
ID_MARCA INT PRIMARY KEY AUTO_INCREMENT,
MARCA VARCHAR(30) UNIQUE);

select * FROM MARCA;

CREATE TABLE CARRO_COR (
ID_CARRO INT,
ID_COR INT);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO_COR
FOREIGN KEY (ID_CARRO) REFERENCES CARROS(ID_CARRO);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO_COR2
FOREIGN KEY (ID_COR) REFERENCES CORES(ID_COR);

SELECT * FROM CARRO_COR;

CREATE TABLE CORES (
ID_COR INT primary KEY auto_increment,
COR VARCHAR (40));

SELECT * FROM CORES;

CREATE DATABASE JOINS2;
USE JOINS2;

CREATE TABLE CLIENTE (
IDCLIENTE INT PRIMARY KEY auto_increment,
NOME VARCHAR(30) NOT NULL,
SEXO ENUM ('M', 'F') NOT NULL,
EMAIL VARCHAR(50) UNIQUE,
CPF VARCHAR (15) UNIQUE);

INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF)
VALUES
('Joao', 'M', 'joao@bol.com', '76984352456'),
('Carla', 'F', 'carla@bol.com', '76984356699'),
('Ana', 'F', 'ana@bol.com', '76984357755'),
('Clara', 'F', 'clara@bol.com', '76984353344'),
('Jorge', 'M', 'jorge@bol.com', '76984352211'),
('Celia', 'F', 'celia@bol.com', '76984359988');


SELECT * FROM CLIENTE;

CREATE TABLE ENDERECO (
IDENDERECO INT PRIMARY KEY auto_increment,
RUA VARCHAR(30) NOT NULL,
BAIRRO VARCHAR(30) NOT NULL,
CIDADE VARCHAR(30) NOT NULL,
ESTADO VARCHAR(2) NOT NULL,
ID_CLIENTE INT UNIQUE,
foreign key (ID_CLIENTE) REFERENCES cliente(IDCLIENTE));

SELECT * FROM ENDERECO;

INSERT INTO ENDERECO (RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES
('Rua Antonio SA', 'Centro', 'B. Horizonte', 'MG', 4),
('Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1),
('Rua Pres Vargas', 'Jardins', 'Sao Paulo', 'SP', 3),
('Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2),
('Rua do Ouvidor', 'Flamengo', 'Rio de Janeiro', 'RJ', 6),
('Rua Uruguaiana', 'Centro', 'Vitoria', 'ES', 5);

CREATE TABLE TELEFONE (
IDTELEFONE INT PRIMARY KEY auto_increment,
TIPO ENUM ('RES', 'COM', 'CEL') NOT NULL,
NUMERO VARCHAR(10) NOT NULL,
ID_CLIENTE INT,
foreign key (ID_CLIENTE) REFERENCES cliente(IDCLIENTE));

INSERT INTO TELEFONE (TIPO, NUMERO, ID_CLIENTE)
VALUES
('cel', '78458743', 5),
('res', '56576876', 5),
('cel', '87666898', 1),
('com', '54768899', 2),
('res', '78989765', 1),
('cel', '99766676', 3),
('cel', '78458743', 3),
('com', '66687899', 1),
('res', '89986668', 5),
('cel', '88687909', 2);

SELECT * FROM TELEFONE;

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE FROM CLIENTE
JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
WHERE CLIENTE.SEXO = 'F'
GROUP BY CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE;

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO FROM CLIENTE
JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
ORDER BY NOME;

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.CIDADE, TELEFONE.NUMERO FROM cliente
JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE SEXO = 'M'
ORDER BY CLIENTE.NOME;

SELECT CLIENTE.IDcliente, CLIENTE.EMAIL, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.NUMERO FROM cliente
JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE CIDADE = 'Rio de Janeiro' and bairro = "centro"
ORDER BY TELEFONE.NUMERO;

desc cliente;
desc telefone;
desc endereco;

CREATE VIEW V_RELATORIO AS
SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO FROM CLIENTE C
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM V_RELATORIO;

SHOW DATABASES;

SELECT NOME, NUMERO, ESTADO FROM V_RELATORIO;

DELETE FROM V_RELATORIO
WHERE NOME = Jorge;

INSERT INTO V_RELATORIO
values
("Cida", "F", "cida@bol.com", "Cel", "77994457", "Centro", "Vitoria", "ES");

INSERT INTO V_RELATORIO(NOME, SEXO, EMAIL, TIPO, NUMERO, BAIRRO, CIDADE, ESTADO)
values
("Cida", "F", "cida@bol.com", "Cel", "77994457", "Centro", "Vitoria", "ES");

UPDATE V_RELATORIO
SET NOME = "Jose"
WHERE NOME = "Jorge";

SELECT * FROM V_RELATORIO
WHERE SEXO = "F"
ORDER BY "NOME";

ALTER TABLE CLIENTE
ADD COLUMN DATA_ULT_COMPRA DATE;

UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-01" WHERE IDCLIENTE= "1";
UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-02" WHERE IDCLIENTE= "2";
UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-03" WHERE IDCLIENTE= "3";
UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-04" WHERE IDCLIENTE= "4";
UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-05" WHERE IDCLIENTE= "5";
UPDATE CLIENTE SET DATA_ULT_COMPRA = "2024-08-06" WHERE IDCLIENTE= "6";

SELECT * FROM CLIENTE;

ALTER TABLE CLIENTE
ADD COLUMN VALOR_COMPRA DECIMAL;

UPDATE CLIENTE SET VALOR_COMPRA = "1000" WHERE IDCLIENTE= "1";
UPDATE CLIENTE SET VALOR_COMPRA = "2000" WHERE IDCLIENTE= "2";
UPDATE CLIENTE SET VALOR_COMPRA = "3000" WHERE IDCLIENTE= "3";
UPDATE CLIENTE SET VALOR_COMPRA = "4000" WHERE IDCLIENTE= "4";
UPDATE CLIENTE SET VALOR_COMPRA = "5000" WHERE IDCLIENTE= "5";
UPDATE CLIENTE SET VALOR_COMPRA = "6000" WHERE IDCLIENTE= "6";

ALTER VIEW V_RELATORIO AS
SELECT C.DATA_ULT_COMPRA, C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, C.VALOR_COMPRA FROM CLIENTE C
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE;

CREATE VIEW V_CompraAcima3000 AS
SELECT C.DATA_ULT_COMPRA, C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, C.VALOR_COMPRA FROM CLIENTE C
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE VALOR_COMPRA >= 3000;

SELECT * FROM V_COMPRAACIMA3000;

DROP VIEW V_COMPRATOTAL;
#1 Crie uma View para mostrar o valor total das compras efetuadas pelos clientes.
CREATE VIEW V_CompraTotal AS
SELECT SUM(C.VALOR_COMPRA) AS TOTAL_COMPRAS
FROM CLIENTE C;

SELECT * FROM V_COMPRAtotal;

#2 Crie uma View para mostrar o menor valor de compras efetuadas pelos clientes.
CREATE VIEW V_CompraMin AS
SELECT MIN(C.VALOR_COMPRA) AS MINIMO_COMPRA
FROM CLIENTE C;

SELECT * FROM V_COMPRAMIN;

#3 Crie uma View para mostrar a média do valor de compras efetuadas pelos clientes.
CREATE VIEW V_CompraMedia AS
SELECT AVG(C.VALOR_COMPRA) AS MEDIA_COMPRA
FROM CLIENTE C;

SELECT * FROM V_COMPRAMEDIA;

#4 Crie uma View para mostrar o maior valor de compras efetuadas pelos clientes. 
CREATE VIEW V_CompraMax AS
SELECT MAX(C.VALOR_COMPRA) AS MAXIMA_COMPRA
FROM CLIENTE C;

SELECT * FROM V_COMPRAMAX;

DROP VIEW V_COMPRAMAXCLIENTE;
#5 Crie uma View para mostrar o maior valor de compras efetuadas pelos clientes e o nome do cliente.
CREATE VIEW V_CompraMaxCliente AS
SELECT C.IDCLIENTE, C.NOME, C.VALOR_COMPRA AS MAIOR_COMPRA
FROM CLIENTE C
WHERE C.VALOR_COMPRA = (SELECT MAX(C.VALOR_COMPRA) FROM CLIENTE)
ORDER BY MAIOR_COMPRA DESC
LIMIT 1;

SELECT * FROM V_COMPRAMAXCLIENTE;


	create database exemplo;
	drop database exemplo;
	use exemplo;

	create table p_curso (
	id_curso int primary key auto_increment,
	nome_curso varchar (100),
	preco_curso decimal (10,2));

	insert into p_curso values
	(null, 'Excel', '500.00'),
	(null, 'VBA', '280.00'),
	(null, 'Power BI', '150.00');

	drop table p_curso;

	select * from p_curso;

	delimiter $
	create procedure p_atualiza_preco (
	novo_preco decimal (10,2),
	id int)
	begin
	update p_curso
	set preco_curso = novo_preco
	where id_curso = id;
	select 'Preço atualizado com sucesso!';
	end $
	delimiter ;

	call p_atualiza_preco (600, 1);
	call p_atualiza_preco (330, 2);

	select * from p_curso;

	delimiter $
	create procedure p_cadastrar_cursos (
	id int,
	nome varchar (100),
	preco decimal (10,2)
	)
	begin
	insert into p_curso values
	(null, nome, preco);
	end $
	delimiter ;

	select * from p_curso;

	call p_cadastrar_cursos
	(null,'Banco de dados',1000);

	call p_cadastrar_cursos
	(null,'Python',2000);

	select * from p_curso;

	delimiter $
	create procedure p_acrescimo_geral
	(acrescimo decimal (10,2))
	begin
	update p_curso
	set preco_curso = preco_curso * (1+acrescimo/100);
	select 'Acrescimo atualizado com sucesso!' as situacao;
	end $
	delimiter ;

	select * from p_curso;

	call p_acrescimo_geral (10.00);

	delimiter $
	create procedure p_excluir_cursos(
	id int)
	begin
	delete from p_curso
	where id_curso = id;
	end $
	delimiter ;

	call p_excluir_cursos (6);

	call p_excluir_cursos (5);

	select * from p_curso;

	delimiter $
	create procedure p_excluir_curso_por_nome (
	nome varchar (100))
	begin
	delete from p_curso
	where nome_curso = nome;
	end $
	delimiter ;

	call p_excluir_curso_por_nome ('VBA');

	select * from p_curso;

	-- Exercicios procedure
	CREATE DATABASE PROJETO;
	DROP database projeto;
	USE PROJETO;
	CREATE TABLE NEW_CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(100) NOT NULL,
	HORAS INT NOT NULL,
	PRECO DECIMAL(10,2) NOT NULL
	);
	INSERT INTO NEW_CURSOS VALUES
	(NULL, 'JAVA', 30, 500.00),
	(NULL, 'BANCO DE DADOS', 30, 700.00);
	SELECT * FROM NEW_CURSOS;

	-- 1

	delimiter $
	create procedure cadastro_cursos(
	id int,
	nome varchar (100),
	horas int,
	precos decimal (10,2)
	)
	begin
	insert into new_cursos values
	(null, nome, horas, precos);
	end $
	delimiter ;

	select * from new_cursos;

	call cadastro_cursos
	(null, 'MySQL', '30', '100.00');

	call cadastro_cursos
	(null, 'Microsoft SQL Server', '35', '150.00');

	call cadastro_cursos
	(null, 'PostgreSQL', '40', '200.00');

	call cadastro_cursos
	(null, 'Oracle Database ', '50', '250.00');

	select * from new_cursos;

	-- 2
	delimiter $
	create procedure acrescimo
	(id int, acrescimo decimal (10,2))
	begin
	update new_cursos
	set preco = preco * (1+acrescimo/100)
	where idcurso = id;
	select 'Acrescimo atualizado com sucesso!' as situacao;
	end $
	delimiter ;

	call acrescimo (1, 15);
	call acrescimo (2, 18);
	call acrescimo (3, 20);
	call acrescimo (4, 22);
	call acrescimo (5, 25);
	call acrescimo (6, 28);

	select * from new_cursos;

	--3
	delimiter $
	create procedure atualizar_cursos_preco
	(novo_preco decimal (10,2), id int)
	begin 
	update new_cursos
	set preco = novo_preco
	where idcurso = id;
	select "Preço atualizado com sucesso!" as situação;
	end$
	delimiter ;

	call atualizar_cursos_preco (600, 1);
	call atualizar_cursos_preco (800, 2);
	call atualizar_cursos_preco (200, 3);
	call atualizar_cursos_preco (250, 4);
	call atualizar_cursos_preco (300, 5);
	call atualizar_cursos_preco (350, 6);

	select * from new_cursos;

	--4
	delimiter $
	create procedure desconto_cursos_preco
	(desconto_preco decimal (10,2), id int)
	begin 
	update new_cursos
	set preco = preco * (1-desconto_preco/100)
	where idcurso = id;
	select "Preço atualizado com sucesso!" as situação;
	end$
	delimiter ;

	drop procedure desconto_cursos_preco;

	call desconto_cursos_preco (35, 1);
	call desconto_cursos_preco (35, 2);
	call desconto_cursos_preco (35, 3);
	call desconto_cursos_preco (35, 4);
	call desconto_cursos_preco (35, 5);
	call desconto_cursos_preco (35, 6);

	select * from new_cursos;

	--5
	delimiter $
	create procedure excluir_cursos
	(id int)
	begin 
	delete from new_cursos
	where idcurso = id;
	select "Curso exluído com sucesso!" as situação;
	end$
	delimiter ;

	call excluir_cursos (1);
	select * from new_cursos;

	drop procedure excluir_cursos_por_nome;
	--6
	delimiter $
	create procedure excluir_cursos_por_nome
	(nomecurso varchar(100))
	begin 
	delete from new_cursos
	where nomecurso = nome;
	select "Curso exluído com sucesso!" as situação;
	end$
	delimiter ;

	desc new_cursos;

	call excluir_cursos_por_nome ("Banco de dados");
	select * from new_cursos;

	SET@varQuantidade = 10;
	SET@varPreco = 10.9;
	select (@varQuantidade * @varPreco) as 'Receita Total';
	select round(@varQuantidade * @varPreco, 2) as 'Receita Total';

	select 
	if (10 > 5, "Verdadeiro", "Falso") as Situação;

	select 
	if (10 > 12, "Verdadeiro", "Falso") as Situação;

	SET@varNotaDesempenho= 8.5;
	select 
	if (@varNotaDesempenho >= 7, 0.1, "Sem bõnus") as Bonus;

	SET@varNotaDesempenho= 5;
	select 
	if (@varNotaDesempenho >= 7, 0.1, "Sem bõnus") as Bonus;

	SET@varNotaDesempenho= 9;
	SET@varNotaDesempenho= 6;
	SET@varNotaDesempenho= 2;

	SET@varNotaDesempenho= 9;
	SELECT
	IF(@varNotaDesempenho >= 7, 'Recebe bônus de 10%',
	if (@varNotaDesempenho >= 5, 'Recebe bônus de 5%', 'Não recebe bônus')) as 'Resultado';

	select * from lojas;

	select *, 
	if (Num_Funcionarios >= 20, 'Recebe reforma', 'Não recebe reforma')
	as 'Status' from lojas;

	select 
	ifnull(null, 'Valor alternativo') as Tipo;

	select 
	ifnull(100, 'Valor alternativo') as Tipo;

	select *, 
	ifnull(Telefone, "0800-999-9999") as 'Telefone corrigido' from lojas;
	 
	select *, 
	isnull(Telefone) as 'Check' from clientes;

	select *, 
	if(isnull(Telefone), 'Verificar', 'Ok') as 'status' from clientes;

	set @var1 = 100;
	set @var2 = 100;

	select nullif (@var1, @var2) as tipo;

	SET @varNota = 9;
	SELECT 
		IF(@varNota >= 6, 'Aprovado', 'Reprovado') AS 'Resultado';
		
	SET @varNota = 3;   
	   SELECT 
		IF(@varNota >= 6, 'Aprovado',
			IF(@varNota BETWEEN 4 AND 5, 'Recuperação', 
				'Reprovado')) AS 'Resultado';

	SET @varPreco = 39999;
	SELECT 
		IF(@varPreco >= 40000, 'Luxo',
		if(@varPreco >= 10000, 'Econômico', 'Básico')) AS 'Resultado';
	  
	  select
	   *,
		case
		when sexo = 'M' then 'Masculino'
		else 'Feminino'
		end
		as 'Sexo 2'
		from clientes;
		
		
		select
	   *,
		case
		when Receita_Venda >= 3000 then 'Faturamento Alto'
		when Receita_Venda >= 1000 then 'Faturamento Médio'
		else "Faturamento Baixo"
		end 
		as 'Nível de Faturamento' 
		from pedidos;

	select * from pedidos;

		select
	   *,
		case
		when sexo = "F" and Qtd_Filhos != 0 then 'Dia das Mães!'
		when sexo = "M" and Qtd_Filhos != 0 then 'Dia dos Pais!'
		else "Sem desconto."
		end 
		as 'Desconto Festividades' 
		from clientes;

	select * from clientes;

		select
	   *,
		case
		when marca_produto = "Samsung" or marca_produto = "Dell" then 'Receba 15% de desconto!'
		else "Sem desconto."
		end 
		as 'Desconto Marcas' 
		from produtos;


	select * from produtos;
		
	 SELECT 
		*, 
		CASE 
			WHEN marca_produto in ('Samsung', 'Dell') THEN custo_unit * (1 - 0.15)  -- Aplicando 15% de desconto
			ELSE custo_unit 
		END AS preco_com_desconto
	FROM produtos;


	--- ex 1
	SET @varData = '2023-06-09';
	SELECT 
		IF(@varData <= '2023-06-10' ,'Dentro da validade', 'Fora da validade.') AS 'Resultado';

	#---ex 2
	 SELECT 
		id_cliente, nome, estado_civil, renda_anual,
		CASE 
			WHEN renda_anual >= 80000 and Estado_Civil = 'C' THEN '0.07'
			WHEN renda_anual >= 80000 THEN '0.05'
			 WHEN renda_anual >= 60000 THEN '0.1'
			  WHEN renda_anual >= 40000 THEN '0.15'
			ELSE '0.2'
		END 
		AS Bonificação
	FROM clientes;

	 SELECT 
		id_cliente, nome, estado_civil, renda_anual,
		CASE 
			WHEN renda_anual >= 80000 and Estado_Civil = 'C' THEN renda_anual * 0.7
			WHEN renda_anual >= 80000 and Estado_Civil = 'S' THEN renda_anual * 0.5
			 WHEN renda_anual >= 60000 THEN renda_anual * 1.10
			  WHEN renda_anual >= 40000 THEN renda_anual * 1.15
			ELSE renda_anual * 1.20
		END 
		AS Bonificação
	FROM clientes;

	select * from clientes; 

	-- ex 3
	SELECT 
	   *,
		CASE 
		when Renda_Anual >= 80000 then 
		case 
		when Estado_Civil = 'C' then (1 + 0.07)
		else (1 + 0.05)
		end
			WHEN renda_anual >= 60000 THEN (1 + 0.07)
		   WHEN renda_anual >= 40000 THEN (1 + 0.15) 
		   WHEN renda_anual < 40000 THEN (1 + 0.20)
		END 
		AS 'Preço com Bõnus'
	FROM clientes;

	-- ex 4
	SELECT 
	   *,
		CASE 
		when Renda_Anual >= 80000 then 
		case 
		when Estado_Civil = 'C' then (1 + 0.07) * Renda_Anual
		else (1 + 0.05) * Renda_Anual
		end
			WHEN renda_anual >= 60000 THEN (1 + 0.07) * Renda_Anual
		   WHEN renda_anual >= 40000 THEN (1 + 0.15) * Renda_Anual
		   WHEN renda_anual < 40000 THEN (1 + 0.20) * Renda_Anual
		END 
		AS 'Preço com Bõnus'
	FROM clientes;

    