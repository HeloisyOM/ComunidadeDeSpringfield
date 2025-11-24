create database projetoIndividual;
use projetoIndividual;


create table personagem(
idPersonagem int primary key auto_increment ,
nome varchar(45),
caminhoImg varchar(200)
);

create table lugar(
idLugar int primary key auto_increment,
nome varchar(45),
caminhoImg varchar(200)
);

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
genero varchar(9) not null,
constraint chkGenero
	check(genero in('Feminino','Masculino','Outros')),
email varchar(255) not null unique,
senha varchar(40) not null
);

create table mensagem(
idMensagem int primary key auto_increment,
conteudo varchar(200) not null,
fkUsuario int,
constraint fkMsgUser foreign key (fkUsuario)
	references usuario(idUsuario)
);

create table compra(
idCompra int primary key auto_increment,
totalGasto decimal(10,2),
rosquinha int,
duff int,
panqueca int,
pizzaLuigi int,
buzzCola int,
taco int,
hamburguer int,
hotdog int,
fkUsuario int,
constraint fkComUser foreign key (fkUsuario) 
	references usuario(idUsuario)
);

show tables;

insert into personagem values
(default,'Homer Simpson','.assets/imgs/personagens/img-homer'),
(default,'Marge Simpson','.assets/imgs/personagens/img-marge'),
(default,'Bart Simpson','.assets/imgs/personagens/img-bart'),
(default,'Lisa Simpson','.assets/imgs/personagens/img-lisa'),
(default,'Maggie Simpson','.assets/imgs/personagens/img-maggie'),
(default,'Sideshow Bob','.assets/imgs/personagens/img-side'),
(default,'Ned Flanders','.assets/imgs/personagens/img-ned'),
(default,'Milhouse Van Houten','.assets/imgs/personagens/img-mil'),
(default,'Krusy','.assets/imgs/personagens/img-krus'),
(default,'Moe Szyslak','.assets/imgs/personagens/img-moe'),
(default,'Chef Wiggum','.assets/imgs/personagens/img-wig'),
(default,'Ralph Wiggum','.assets/imgs/personagens/img-ralph'),
(default,'Apu Nahasapeemapetilon','.assets/imgs/personagens/img-apu'),
(default,'Montgomery Burns','.assets/imgs/personagens/img-burns'),
(default,'Smithers','.assets/imgs/personagens/img-smithers'),
(default,'Cara dos Quadrinhos','.assets/imgs/personagens/img-comic'),
(default,'Nelson Muntz','.assets/imgs/personagens/img-nelson'),
(default,'Skinner','.assets/imgs/personagens/img-skinner'),
(default,'Patty Bouvier','.assets/imgs/personagens/img-patty'),
(default,'Selma Bouvier','.assets/imgs/personagens/img-selma');


insert into lugar values
(default,'Bar do Moe','.assets/imgs/lugares/barMoe'),
(default,'A Casa dos Simpsons','.assets/imgs/lugares/casasSimp'),
(default,'Usina Nuclear de Springfield','.assets/imgs/lugares/usina'),
(default,'Escola Elementar de Springfield','.assets/imgs/lugares/escola'),
(default,'Kwik-E-Mart','.assets/imgs/lugares/kwik'),
(default,'Igreja de Springfield','.assets/imgs/lugares/igreja'),
(default,'Krusy Burger','.assets/imgs/lugares/img-krusyBurger'),
(default,'Springfield Mall','.assets/imgs/lugares/img-mall'),
(default,'Hospital Geral de Springfield','.assets/imgs/lugares/img-hospital'),
(default,'Prefeitura de Springfield','.assets/imgs/lugares/img-prefeitura'),
(default,'Departamento de Polícia de Springfield','.assets/imgs/lugares/img-police'),
(default,'Casa do Flanders','.assets/imgs/lugares/img-casaFlanders'),
(default,'Central de Televisão Canal 6','.assets/imgs/lugares/img-canal6'),
(default,'Incêndio de Pneus (Tire Fire)', '.assets/imgs/lugares/img-tireFire'),
(default,'Museu de Springfield','.assets/imgs/lugares//img-museu'),
(default,'Esádio de Springfield ','.assets/imgs/lugares/img-esadio'),
(default,'Springfield Ásilo','.assets/imgs/lugares/img-asilo');


select * from personagem;
select * from lugar;
select * from usuario;
select * from mensagem;
select * from compra;
show tables;

select idUsuario,fkPersonagem,fkLugar, u.nome, email,p.nome as personagem, p.caminhoImg, l.nome as lugar, l.caminhoImg 
from usuario as u join personagem as p
	on u.fkPersonagem = p.idPersonagem
		join lugar as l
			on u.fkLugar = l.idLugar;
        
        
        
/*Gráfico do top 3 personagens favoritos*/
select p.nome as personagem,
count(u.fkPersonagem) as total
from personagem as p join usuario as u
	on u.fkPersonagem = p.idPersonagem
group by p.nome
order by total desc
limit 3;

/*Gráfico top 3 lugares que as pessoas mais gosariam de visitar ou apenas gosam basante*/
select l.nome as lugar,
count(u.fkLugar) as total
from lugar as l join usuario as u
	on u.fkLugar = l.idLugar
group by l.nome
order by total desc
limit 3;

/*Gráfico de disribuição de gênero*/

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

/*KPI média de compra da Comunidade*/

select ROUND(avg(totalGasto)) as MediaGeral from compra;

/*Idade*/
	select AVG(timestampdiff(year,dataNasc, now())) as idade from usuario;
select timestampdiff(year,dataNasc, now()) as idade from usuario;

/*grafico de distribuicao de faixa etária */
select
case 
when timestampdiff(year,dataNasc, curdate()) between 0 and 12 then '0-12'
when timestampdiff(year,dataNasc, curdate()) between 13 and 	17 then '13-17'
when timestampdiff(year,dataNasc, curdate()) between 18 and 25 then '18-25'
when timestampdiff(year,dataNasc, curdate()) between 26 and 40 then '26-40'
else '41+'
end as faixa,
	count(*) as valores
    from usuario
    group by faixa
		order by valores desc;

select DISTINCT(totalGasto) from compra
order by totalGasto desc
limit 1;

select SUM(totalGasto) from compra
order by totalGasto desc;

/*Gŕafico de faixa de total gasto no mercadinh*/
select 
case
when totalGasto<=20 then 'Até 20 reais'
when totalGasto>20 and totalGasto<=40 then 'Até R$40,00 reais'
when totalGasto>40 and totalGasto<=70 then 'Até R$70,00 reais'
when totalGasto>70 and totalGasto<=100 then 'Até R$100,00 reais'
when totalGasto>100 and totalGasto<=150 then 'Até R$150,00 reais'
when totalGasto>150 and totalGasto<=200 then 'Até R$200,00'
else 'Maior que R$200,00'
end as faixaGasto
from compra;