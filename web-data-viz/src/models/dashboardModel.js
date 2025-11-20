var database = require("../database/config");

function top3Lugares() {

        var instrucaoSql = `select l.nome as lugar,
        count(u.fkLugar) as total
        from lugar as l join usuario as u
            on u.fkLugar = l.idLugar
        group by l.nome
        order by total desc
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
        group by genero;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function faixaEtaria() {

    var instrucaoSql = `
    select
    case 
    when timestampdiff(year,dataNasc, curdate()) between 0 and 12 then '0-12'
    when timestampdiff(year,dataNasc, curdate()) between 13 and 17 then '13-17'
    when timestampdiff(year,dataNasc, curdate()) between 18 and 25 then '18-25'
    when timestampdiff(year,dataNasc, curdate()) between 26 and 40 then '26-40'
    else '41+'
    end as faixa,
        count(*) as quantidade
        from usuario
        group by faixa
            order by quantidade desc;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

/*KPIS */
function kpi_persoNome() {

    var instrucaoSql = `
            select p.nome as nomePersonagem
        from personagem as p join usuario as u
            on fkPersonagem = idPersonagem
        group by p.nome
        order by count(u.fkPersonagem) desc
        limit 1;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

function kpi_lugar() {

    var instrucaoSql = `
                    select l.nome as nomeLugar
        from lugar as l join usuario as u
            on fkLugar = idLugar
        group by l.nome
        order by count(u.fkLugar) desc
        limit 1;`;
    
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
            select ROUND(AVG(timestampdiff(year,dataNasc, curdate())) as idade from usuario;`;
    
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}
module.exports = {
    top3Lugares,
    top3Perso,
    distGenero,
    faixaEtaria,
    kpi_persoNome,
    kpi_lugar,
    kpi_genero,
    kpi_idadeM
}