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
senha char(8)
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
(default,'Apu Nahasapeemapetilon','"./assets/imgs/personagens/img_apu.png"'),
(default,'Bart Simpson','"./assets/imgs/personagens/img_bart.png"'),
(default,'Carl Carlson','"./assets/imgs/personagens/img_karl.png"'),
(default,'Cara dos Quadrinhos','"./assets/imgs/personagens/img_comic.png"'),
(default,'Chief Wiggum','./assets/imgs/personagens/img_chef.png"'),
(default,'Homer Simpson','"./assets/imgs/personagens/img_homer.png"'),
(default,'Krusty, o Palhaço','"./assets/imgs/personagens/img_krusty.png"'),
(default,'Lenny Leonard','"./assets/imgs/personagens/img_lenny.png"'),
(default,'Lisa Simpson','"./assets/imgs/personagens/img_lisa.png"'),
(default,'Maggie Simpson','"./assets/imgs/personagens/img_maggie.png"'),
(default,'Marge Simpson','"./assets/imgs/personagens/img_mage.png"'),
(default,'Milhouse Van Houten','"./assets/imgs/personagens/img_mil.png"'),
(default,'Moe Szyslak','"./assets/imgs/personagens/img_moe.png"'),
(default,'Montgomery Burns','"./assets/imgs/personagens/img_burns.png"'),
(default,'Ned Flanders','"./assets/imgs/personagens/img_ned.png"'),
(default,'Nelson Muntz','"./assets/imgs/personagens/img_nelson.png" '),
(default,'Vovó Simpson','"./assets/imgs/personagens/img_vovo.png" '),
(default,'Seymour Skinner','"./assets/imgs/personagens/img_skner.png"'),
(default,'Waylon Smithers','"./assets/imgs/personagens/img_smithers.png"');



insert into lugar values
(default,'A Casa dos Simpsons','".assets/imgs/lugares/casasSimp"'),
(default,'Bar do Moe','".assets/imgs/lugares/barMoe"'),
(default,'Casa do Flanders','".assets/imgs/lugares/img-casaFlanders"'),
(default,'Central de Televisão Canal 6','".assets/imgs/lugares/img-canal6"'),
(default,'Departamento de Polícia de Springfield','".assets/imgs/lugares/img-police"'),
(default,'Escola Elementar de Springfield','".assets/imgs/lugares/escola"'),
(default,'Estádio de Springfield','".assets/imgs/lugares/img-esadio"'),
(default,'Hospital Geral de Springfield','".assets/imgs/lugares/img-hospital"'),
(default,'Incêndio de Pneus (Tire Fire)','".assets/imgs/lugares/img-tireFire"'),
(default,'Igreja de Springfield','".assets/imgs/lugares/igreja"'),
(default,'Krusty Burger','".assets/imgs/lugares/img-krusyBurger"'),
(default,'Kwik-E-Mart','".assets/imgs/lugares/kwik"'),
(default,'Museu de Springfield','".assets/imgs/lugares/img-museu"'),
(default,'Prefeitura de Springfield','".assets/imgs/lugares/img-prefeitura"'),
(default,'Springfield Asilo','".assets/imgs/lugares/img-asilo"'),
(default,'Springfield Mall','".assets/imgs/lugares/img-mall"'),
(default,'Usina Nuclear de Springfield','".assets/imgs/lugares/usina"');



select * from personagem;
select * from lugar;
select * from usuario;
select * from mensagem;
select * from compra;
show tables;

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

select ROUND(avg(totalGasto),2) as MediaGeral from compra;

/*Idade*/
	select ROUND(AVG(timestampdiff(year,dataNasc, curdate()))) as idade from usuario;

/*grafico de distribuicao de faixa etária */
select
case 
when timestampdiff(year,dataNasc, curdate()) between 12 and 17 then '12-17'
when timestampdiff(year,dataNasc, curdate()) between 18 and 25 then '18-25'
when timestampdiff(year,dataNasc, curdate()) between 26 and 40 then '26-40'
else '+41'
end as faixa,
	count(*) as valores
    from usuario
    group by faixa
		order by valores desc;

select DISTINCT(totalGasto) from compra
order by totalGasto desc
limit 1;

select ROUND(AVG(totalGasto),2) from compra
order by totalGasto desc;

           select SUM(totalGasto) as totalGeral from compra order by totalGasto desc;

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
end as faixaGasto,
count(*) as valores
    from compra
    group by faixaGasto
		order by valores desc;


 select (select SUM(rosquinha) as rosquinha, SUM(duff) as duff , SUM(panqueca) as panqueca , SUM(pizzaLuigi) as pizza  , 
SUM(BuzzCola) as bzzCola, SUM(taco) as taco , SUM(hamburguer) as burguer  , SUM(hotdog) as hotdog ) as venda
from compra
order by venda desc;



select SUM(rosquinha) as rosquinha, SUM(duff) as duff , SUM(panqueca) as panqueca , SUM(pizzaLuigi) as pizza  , 
SUM(BuzzCola) as bzzCola, SUM(taco) as taco , SUM(hamburguer) as burguer  , SUM(hotdog) as hotdog 
from compra; 

select idUsuario,fkPersonagem,fkLugar, u.nome, email,p.nome as personagem, p.caminhoImg as imgP, l.nome as lugar, l.caminhoImg as imgL,conteudo
from usuario as u join personagem as p
	on u.fkPersonagem = p.idPersonagem
		join mensagem
        on idUsuario = fkUsuario
		join lugar as l
			on u.fkLugar = l.idLugar;