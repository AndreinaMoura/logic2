drop database if exists duplicatas;
create database duplicatas charset=UTF8 collate utf8_general_ci;
use duplicatas;

create table clientes(
    cod_cli integer not null primary key auto_increment,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    bairro varchar(30) not null,
    cidade varchar(30) not null,
    uf varchar(2) not null
);

create table telefones(
    cod_cli integer not null,
    tipo varchar(10) not null,
    numero varchar(15) not null,
    foreign key (cod_cli) references clientes(cod_cli)
);

create table duplicatas(
    num_dupli integer not null primary key auto_increment,
    cod_cli integer not null,
    data_compra date not null,
    vencimento date not null,
    pagamento date not null,
    valor float(10,2) not null,
    diferenca float(9,2) not null,
    foreign key (cod_cli) references clientes(cod_cli)
);

describe clientes;
describe telefones;
describe duplicatas;

show tables;

-- DML Importação dos dados via Concatenação no Excel
insert into clientes values(1,"Janaína Costa","Rua do Mel, 25  ","Zambom","Jaguariúna","SP");
insert into clientes values(2,"Jurema Andrade","Rua do Açúcar, 45  ","Centro","Jaguariúna","SP");
insert into clientes values(3,"Márcio Garcia","Rua do Milho, 45  ","Santa Cruz","Jaguariúna","SP");
insert into clientes values(4,"Estevão Marques","Rua dos Amores Pe rdidos , 21","Vargeão","Jaguariúna","SP");
insert into clientes values(5,"Mariana Silva","Rua do Sentido da Vida, 42","Zambom","Jaguariúna","SP");
insert into clientes values(6,"João Silva","Rua da sorte, 13  ","Centro","Jaguariúna","SP");
insert into clientes values(7,"José Aldo","Rua das Azaléias, 25 ","Santa Cruz","Jaguariúna","SP");

insert into telefones values
(1,"telefone","(19)98798-7987"),
(1,"celular","(19)98798-1587"),
(2,"telefone","(19)98798-0198"),
(2,"celular","(19)98798-8798"),
(3,"telefone","(19)95465-7059"),
(3,"celular","(19)95465-7409"),
(3,"telefone","(19)65466-7891"),
(3,"celular","(19)65466-7817"),
(4,"telefone","(19)98457-1779"),
(4,"celular","(19)98457-3779"),
(5,"telefone","(19)35465-8365"),
(5,"celular","(19)35465-8535"),
(6,"telefone","(19)54654-4614"),
(6,"celular","(19)54654-4655"),
(6,"telefone","(19)65465-7887"),
(6,"celular","(19)65465-7867"),
(7,"telefone","(19)35464-4515"),
(7,"celular","(19)35464-4560");

insert into duplicatas values
(NULL,1,curdate()-0,DATE_ADD(CURDATE(), INTERVAL 30 DAY),NULL,150,NULL),
(NULL,1,curdate()-0,DATE_ADD(CURDATE(), INTERVAL 60 DAY),NULL,150,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 30 DAY),NULL,200,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 60 DAY),NULL,200,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 90 DAY),NULL,200,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 120 DAY),NULL,120,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 150 DAY),NULL,120,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 180 DAY),NULL,120,NULL),
(NULL,2,curdate()-4,DATE_ADD(CURDATE()-4, INTERVAL 210 DAY),NULL,120,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 30 DAY),NULL,200,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 60 DAY),NULL,200,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 90 DAY),NULL,200,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 120 DAY),NULL,200,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 150 DAY),NULL,200,NULL),
(NULL,3,curdate()-5,DATE_ADD(CURDATE()-5, INTERVAL 180 DAY),NULL,200,NULL),
(NULL,4,curdate()-6,DATE_ADD(CURDATE()-6, INTERVAL 30 DAY),NULL,150,NULL),
(NULL,4,curdate()-6,DATE_ADD(CURDATE()-6, INTERVAL 60 DAY),NULL,150,NULL),
(NULL,4,curdate()-6,DATE_ADD(CURDATE()-6, INTERVAL 90 DAY),NULL,150,NULL),
(NULL,5,curdate()-2,DATE_ADD(CURDATE()-2, INTERVAL 30 DAY),NULL,125,NULL),
(NULL,5,curdate()-2,DATE_ADD(CURDATE()-2, INTERVAL 60 DAY),NULL,125,NULL),
(NULL,5,curdate()-2,DATE_ADD(CURDATE()-2, INTERVAL 90 DAY),NULL,125,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),CURDATE(),CURDATE(),180,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),DATE_ADD(CURDATE(), INTERVAL 30 DAY),NULL,180,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),DATE_ADD(CURDATE(), INTERVAL 60 DAY),NULL,180,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),DATE_ADD(CURDATE(), INTERVAL 90 DAY),NULL,180,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),DATE_ADD(CURDATE(), INTERVAL 120 DAY),NULL,180,NULL),
(NULL,6,DATE_SUB(CURDATE(), INTERVAL 30 DAY),DATE_ADD(CURDATE(), INTERVAL 150 DAY),NULL,180,NULL),
(NULL,7,curdate()-3,DATE_ADD(CURDATE()-3, INTERVAL 30 DAY),NULL,500,NULL),
(NULL,7,curdate()-3,DATE_ADD(CURDATE()-3, INTERVAL 60 DAY),NULL,500,NULL),
(NULL,7,curdate()-3,DATE_ADD(CURDATE()-3, INTERVAL 90 DAY),NULL,500,NULL);

select * from clientes;
select * from telefones;
select * from duplicatas;

-- DQL Consultas Salvas
create view vw_clientes as
select c.cod_cli, c.nome, c.endereco, c.bairro, c.cidade, c.uf, t.tipo, t.numero as telefone from clientes c
inner join telefones t
on c.cod_cli = t.cod_cli;

create view vw_duplicatas_aberto as
select * from duplicatas where pagamento = "0000-00-00"; 

update duplicatas set diferenca = -10 where num_dupli = 22;

create view vw_duplicatas_pagas as
select *, (valor + diferenca) as v_final from duplicatas where pagamento <> "0000-00-00"; 

select * from vw_clientes;
select * from vw_duplicatas_pagas;
select * from vw_duplicatas_aberto;