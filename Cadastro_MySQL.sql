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


















