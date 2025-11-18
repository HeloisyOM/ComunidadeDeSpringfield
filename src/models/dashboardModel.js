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


module.exports = {
    top3Lugares,
    top3Perso
}