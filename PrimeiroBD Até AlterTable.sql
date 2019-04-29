/*Criar Banco de Dados*/
create database cadastro;

/*Selecionar o Banco de Dados a ser utilizado || Ou dar um clique duplo no banco de dados*/
use cadastro;

/*Criar uma Tabela*/
create table pessoas (
	nome varchar(20),
	idade tinyint(3),
	sexo char(1),
	peso float,
	altura float,
	nacionalidade varchar(20)
);

/*Exibir dados da tabela*/
describe pessoas;

/*Aula 2 Aprimorando o Código*/

/*Apagar Banco de Dados*/
drop database cadastro;

/*Constraints*/
create database cadastro
default character set utf8
default collate utf8_general_ci;


/*Aprimorando a Tabela*/

/*Create Table é uma DDL - Data Definition Language*/

create table pessoas (
	id int not null auto_increment,
    nome varchar(30) not null, /*not null - este campo deverá ser obrigatóriamente preenchido, ou seja, não pode ser nulo*/
	nascimento date,
	sexo enum('M','F'), /*Somente poderá ser escolhido M ou F*/
	peso decimal(5,2), /*5 - Total de caraceres || 2 - Casas após a vírgula*/
	altura decimal(3,2),
	nacionalidade varchar(20) default 'Brasil', /*Constraint DEFAULT - Na nacionalidade se ninguém digitar nada, por padrão, é Brasil*/
    primary key (id) 
)default charset = utf8;



/*Aula 3 - Insert InTo*/
/*Insert InTo é DML - Data Manipulation Language*/


/*----------------Inserindo dados na tabela pessoas*/
insert into pessoas
	(nome, nascimento, sexo, peso, altura, nacionalidade)
values
	('Creuza','1920-12-30','F','55','1.85','Brasil');



/*----------------Com Constraints*/
insert into pessoas
	(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
	(default,'Creuza','1920-12-30','F','55','1.85',default);


/*----------------Se a ordem dos campos forem exatamente a ordem em que foi definida no banco:*/
insert into pessoas values
	(default,'Joao','1950-05-20','M','97','1.95','Russia');


/*----------------Adicionando vários valores ao mesmo tempo*/
insert into pessoas
	(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
	(default,'Diogenes','1982-07-23','M','65','1.75','EUA'),
    (default,'Mario','1995-02-12','M','53','1.65','Marrocos'),
    (default,'Fernanda','1976-05-04','F','50','1.15','Arábia Saudita');


/*Selecione *(tudo) de Pessoas*/
select * from pessoas;

/*Aula 06*/
/*Alterar a Extrutura de uma tabela*/

/*Adicionar uma coluna na tabela*/
alter table pessoas 
add column profissao varchar(10);

/*Excluir uma coluna da tabela*/
alter table pessoas
drop column profissao;

/*Adicionar coluna depois do nome*/
alter table pessoas
add column profissao varchar(10) after nome;


/*Adicionar uma coluna como primeira coluna da tabela*/
alter table pessoas
add column codigo int first;


/*Alterar a estrutura de um registro EX Varchar(10) para Varchar(20)*/
alter table pessoas
modify column profissao varchar(20) not null default '';


/*Alterar o Nome da coluna em si*/
alter table pessoas
change column profissao prof varchar(20);

/*Alterar o nome da TABELA*/
alter table pessoas
rename to gafanhotos;


/*--------------------------------------Nova Tabela para Testes--------------------------------------------*/



create table if not exists cursos (
    nome varchar(30) not null unique, /*unique não deixa colocar dois cursos com o mesmo nome*/
	descricao text,
	carga int unsigned, /*unsigned não aceita números negativos*/
	totaulas int unsigned,
	ano year default '2019'
)default charset = utf8;

/*Adicionar Primary Key depois de criar a tabela*/

alter table cursos
add column id int first;

alter table cursos
add primary key (id);


/*Apagar a tabela Cursos*/
drop table if exists cursos;

/*ALTER TABLE E DROPTABLE são comandos DDL - Data Definition Language*/
/*Alteram a estrutura do banco de dados, drop table apaga a tabela 
	inclusive com os dados, mas isso é uma consequência de apagar a tabela em si*/












