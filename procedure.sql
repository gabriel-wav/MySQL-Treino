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