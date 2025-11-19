create database projetoIndividual;
use projetoIndividual;

create table personagem(
idPersonagem int primary key auto_increment ,
nome varchar(45),
imagem varchar(200)
) auto_increment=10;

create table lugar(
idLugar int primary key auto_increment,
nome varchar(45),
imagem varchar(200)
) auto_increment=20;

create table usuario(
idUsuario int primary key auto_increment,
fkPersonagem int,
constraint fkPersonagemUsuario foreign key(fkPersonagem)
references personagem(idPersonagem),
fkLugar int,
constraint fkLugarUsuario foreign key(fkLugar)
	references lugar(idLugar),
nome varchar(100) not null,
dataNasc date not null,
genero char(1) not null,
constraint chkGenero
	check(genero in('F','M','O')),
email varchar(255) not null unique,
senha char(8)
);

create table mensagem(
idMensagem int primary key auto_increment,
conteudo varchar(200) not null,
fkUsuario int,
constraint fkMsgUser foreign key (fkUsuario)
	references usuario(idUsuario)
);

create table quiz(
idQuiz int,
fkUsuario int,
primary key(idQuiz,fkUsuario),
constraint fkQuizUsuario foreign key(fkUsuario)
	references usuario(idUsuario),
pontuacao int
);


insert into personagem values
(default,'Homer Simpson','.assets/imgs/img-select/img-homer'),
(default,'Marge Simpson','.assets/imgs/img-select/img-marge'),
(default,'Bart Simpson','.assets/imgs/img-select/img-bart'),
(default,'Lisa Simpson','.assets/imgs/img-select/img-lisa'),
(default,'Maggie Simpson','.assets/imgs/img-select/img-maggie'),
(default,'Sideshow Bob','.assets/imgs/img-select/img-side'),
(default,'Ned Flanders','.assets/imgs/img-select/img-ned'),
(default,'Milhouse Van Houten','.assets/imgs/img-select/img-mil'),
(default,'Krusty','.assets/imgs/img-select/img-krust'),
(default,'Moe Szyslak','.assets/imgs/img-select/img-moe'),
(default,'Chef Wiggum','.assets/imgs/img-select/img-wig'),
(default,'Ralph Wiggum','.assets/imgs/img-select/img-ralph'),
(default,'Apu Nahasapeemapetilon','.assets/imgs/img-select/img-apu'),
(default,'Montgomery Burns','.assets/imgs/img-select/img-burns'),
(default,'Smithers','.assets/imgs/img-select/img-smithers'),
(default,'Comic Book Guy','.assets/imgs/img-select/img-comic'),
(default,'Professor Frink','.assets/imgs/img-select/img-frink'),
(default,'Nelson Muntz','.assets/imgs/img-select/img-nelson'),
(default,'Edna Krabappel','.assets/imgs/img-select/img-edna'),
(default,'Skinner','.assets/imgs/img-select/img-skinner'),
(default,'Patty Bouvier','.assets/imgs/img-select/img-patty'),
(default,'Selma Bouvier','.assets/imgs/img-select/img-selma');



insert into lugar values
(default,'Bar do Moe','.assets/imgs/img-select/barMoe'),
(default,'A Casa dos Simpsons','.assets/imgs/img-select/casasSimp'),
(default,'Usina Nuclear de Springfield','.assets/imgs/img-select/usina'),
(default,'Escola Elementar de Springfield','.assets/imgs/img-select/escola'),
(default,'Kwik-E-Mart','.assets/imgs/img-select/kwik'),
(default,'Igreja de Springfield','.assets/imgs/img-select/igreja'),
(default,'Krusty Burger','.assets/imgs/img-select/img-krustyBurger'),
(default,'Springfield Mall','.assets/imgs/img-select/img-mall'),
(default,'Hospital Geral de Springfield','.assets/imgs/img-select/img-hospital'),
(default,'Prefeitura de Springfield','.assets/imgs/img-select/img-prefeitura'),
(default,'Departamento de Polícia de Springfield','.assets/imgs/img-select/img-police'),
(default,'Casa do Flanders','.assets/imgs/img-select/img-casaFlanders'),
(default,'Casa do Milhouse','.assets/imgs/img-select/img-casaMilhouse'),
(default,'Central de Televisão Canal 6','.assets/imgs/img-select/img-canal6'),
(default,'Incêndio de Pneus (Tire Fire)', '.assets/imgs/img-select/img-tireFire'),
(default,'Museu de Springfield','.assets/imgs/img-select/img-museu'),
(default,'Springfield Stadium','.assets/imgs/img-select/img-estadio'),
(default,'Springfield Ásilo','.assets/imgs/img-select/img-asilo');


select * from personagem;
select * from lugar;
select * from usuario;
select * from mensagem;
show tables;

/*Gráfico do top 3 personagens favoritos*/
select p.nome as personagem,
count(u.fkPersonagem) as total
from personagem as p join usuario as u
	on u.fkPersonagem = p.idPersonagem
group by p.nome
order by total desc
limit 3;

/*Gráfico top 3 lugares que as pessoas mais gostariam de visitar ou apenas gostam bastante*/
select l.nome as lugar,
count(u.fkLugar) as total
from lugar as l join usuario as u
	on u.fkLugar = l.idLugar
group by l.nome
order by total desc
limit 3;

/*Gráfico de distribuição de gênero*/

select genero, COUNT(genero) as total
from usuario
group by genero;

/*KPI personagem e foto do fav*/

select p.nome,p.imagem
from personagem as p join usuario as u
	on fkPersonagem = idPersonagem
group by p.nome
order by count(u.fkPersonagem) desc
limit 1;


/*KPI lugar e foto do fav*/

select l.nome
from lugar as l join usuario as u
	on fkLugar = idLugar
group by l.nome
order by count(u.fkLugar) desc
limit 1;

/*KPI genero*/
select genero
from usuario
group by genero
order by count(genero) desc
limit 1;