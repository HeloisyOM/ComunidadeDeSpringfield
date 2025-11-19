create database projetoIndividual;
use projetoIndividual;

drop database projetoIndividual;

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
email varchar(255),
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
(default,'Itchy','.assets/imgs/img-select/img-itchy'),
(default,'Scratchy','.assets/imgs/img-select/img-scratchy'),
(default,'Comic Book Guy','.assets/imgs/img-select/img-comic'),
(default,'Professor Frink','.assets/imgs/img-select/img-frink'),
(default,'Nelson Muntz','.assets/imgs/img-select/img-nelson'),
(default,'Edna Krabappel','.assets/imgs/img-select/img-edna'),
(default,'Skinner','.assets/imgs/img-select/img-skinner'),
(default,'Patty Bouvier','.assets/imgs/img-select/img-patty'),
(default,'Selma Bouvier','.assets/imgs/img-select/img-selma');



insert into lugar values
(default,'Bar do Moe','.assets/barMoe'),
(default,'A Casa dos Simpsons','.assets/casasSimp'),
(default,'Usina Nuclear de Springfield','.assets/usina'),
(default,'Escola Elementar de Springfield','.assets/escola'),
(default,'Kwik-E-Mart','.assets/kwik'),
(default,'Igreja de Springfield','.assets/igreja');

insert into lugar values
(default,'Krusty Burger','.assets/imgs/img-select/img-krustyBurger'),
(default,'Springfield Mall','.assets/imgs/img-select/img-mall'),
(default,'Hospital Geral de Springfield','.assets/imgs/img-select/img-hospital'),
(default,'Prefeitura de Springfield','.assets/imgs/img-select/img-prefeitura'),
(default,'Departamento de Polícia de Springfield','.assets/imgs/img-select/img-police'),
(default,'Casa do Flanders','.assets/imgs/img-select/img-casaFlanders'),
(default,'Casa do Milhouse','.assets/imgs/img-select/img-casaMilhouse'),
(default,'Central de Televisão Canal 6','.assets/imgs/img-select/img-canal6'),
(default,'Springfield Incêndio de Pneus', '.assets/imgs/img-select/img-tireFire'),
(default,'Museu de Springfield','.assets/imgs/img-select/img-museu'),
(default,'Springfield Stadium','.assets/imgs/img-select/img-estadio'),
(default,'Monorail Station','.assets/imgs/img-select/img-monorail'),
(default,'Springfield Retirement Castle','.assets/imgs/img-select/img-asilo');



show tables;

