var database = require("../database/config");

function procurarTop3() {

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
    procurarTop3
}