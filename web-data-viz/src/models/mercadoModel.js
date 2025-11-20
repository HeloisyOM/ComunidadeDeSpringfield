var database = require("../database/config")

function cadastrar(totalGasto,rosquinha,duff, panqueca, pizzaLuigi,buzzCola,taco, hamburguer, hotdog, fkUsuario) {
    console.log("ACESSEI O MERCADO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", totalGasto,rosquinha,duff, panqueca, pizzaLuigi,buzzCola,taco, hamburguer, hotdog, fkUsuario);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO compra (totalGasto,rosquinha,duff, panqueca, pizzaLuigi,buzzCola,taco, hamburguer, hotdog, fkUsuario)   VALUES ('${totalGasto}','${rosquinha}','${duff}', '${panqueca}', '${pizzaLuigi}','${buzzCola}','${taco}', '${hamburguer}', '${hotdog}', '${fkUsuario}');

        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar
}