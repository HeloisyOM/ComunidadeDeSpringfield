var database = require("../database/config");

function top3Lugares() {

        var instrucaoSql = `select l.nome as lugar, 
        count(u.fkLugar) as total,l.caminhoImg as imgL
        from lugar as l join usuario as u 
            on u.fkLugar = l.idLugar
        group by l.nome, imgL
order by count(fkLugar) desc        
        limit 3;
        `;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function top3Perso() {

    var instrucaoSql = `select p.nome as personagem,
        count(u.fkPersonagem) as total
        from personagem as p join usuario as u
            on u.fkPersonagem = p.idPersonagem
        group by p.nome
        order by total desc
        limit 3;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function distGenero() {

    var instrucaoSql = `
    select genero, COUNT(genero) as total
        from usuario
        group by genero
        order by COUNT(genero)desc;
        `;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function faixaEtaria() {

    var instrucaoSql = `
        select
        case 
        when timestampdiff(year,dataNasc, now()) between 12 and 17 then '12-17'
        when timestampdiff(year,dataNasc, now()) between 18 and 25 then '18-25'
        when timestampdiff(year,dataNasc, now()) between 26 and 40 then '26-40'
        else '41+'
        end as faixa,
        count(*) as quantidade
        from usuario
        group by faixa
            order by quantidade desc;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function faixaGasto() {

    var instrucaoSql = `
        select 
        case
        when totalGasto<=20 then 'Até 20 reais'
        when totalGasto>20 and totalGasto<=40 then 'Até R$40,00 reais'
        when totalGasto>40 and totalGasto<=70 then 'Até R$70,00 reais'
        when totalGasto>70 and totalGasto<=100 then 'Até R$100,00 reais'
        when totalGasto>100 and totalGasto<=150 then 'Até R$150,00 reais'
        when totalGasto>150 and totalGasto<=200 then 'Até R$200,00'
        else '+R$200,00'
        end as faixaGasto,
        count(*) as valores
            from compra
            group by faixaGasto
                order by valores desc;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function ranking() {

    var instrucaoSql = `
        select SUM(rosquinha) as rosquinha, SUM(duff) as duff , SUM(panqueca) as panqueca , SUM(pizzaLuigi) as pizza  , 
SUM(BuzzCola) as bzzCola, SUM(taco) as taco , SUM(hamburguer) as burguer  , SUM(hotdog) as hotdog 
from compra;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}
/*KPIS */
function kpi_personagem() {

    var instrucaoSql = `
            select p.nome as nomePersonagem,p.caminhoKPI as kpiP
        from personagem as p join usuario as u
            on fkPersonagem = idPersonagem
        group by p.nome, caminhoKPI
        order by count(u.fkPersonagem) desc
        limit 1;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function kpi_lugar() {

    var instrucaoSql = `
                select l.nome as nomeLugar, l.caminhoImg as imgL
        from lugar as l join usuario as u
            on fkLugar = idLugar
        group by l.nome, imgL
order by count(fkLugar) desc    `;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function kpi_genero() {

    var instrucaoSql = `
            select genero
            from usuario
            group by genero
            order by count(genero) desc
            limit 1;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}
function kpi_idadeM() {

    var instrucaoSql = `
            	select ROUND(AVG(timestampdiff(year,dataNasc, curdate()))) as idade from usuario;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}
function kpi_mediaVendas() {

    var instrucaoSql = `
            select ROUND(AVG(totalGasto),2) as media from compra
order by totalGasto desc;
`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

module.exports = {
    top3Lugares,
    top3Perso,
    distGenero,
    faixaEtaria,
    faixaGasto,
    ranking,
    kpi_personagem,
    kpi_lugar,
    kpi_genero,
    kpi_idadeM,
    kpi_mediaVendas
}