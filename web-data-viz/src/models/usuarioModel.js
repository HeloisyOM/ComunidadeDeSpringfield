var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
      select idUsuario,fkPersonagem,fkLugar, u.nome, email,p.nome as personagem, p.caminhoImg as imgP, l.nome as lugar, l.caminhoImg as imgL,conteudo as msg
from usuario as u join personagem as p
	on u.fkPersonagem = p.idPersonagem
		join mensagem
        on idUsuario = fkUsuario
		join lugar as l
			on u.fkLugar = l.idLugar where email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(fkPersonagem,fkLugar, nome,dataNasc,genero, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", fkPersonagem,fkLugar, nome,dataNasc,genero, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (fkPersonagem,fkLugar, nome,dataNasc,genero, email, senha) VALUES ('${fkPersonagem}','${fkLugar}', '${nome}','${dataNasc}','${genero}', '${email}', '${senha}');

        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function preferencias(idUsuario){

    var instrucaoSql=`
     select idUsuario,fkPersonagem,fkLugar, u.nome, email,p.nome as personagem, p.caminhoImg as imgP, l.nome as lugar, l.caminhoImg as imgL
from usuario as u join personagem as p
	on u.fkPersonagem = p.idPersonagem
		join lugar as l
			on u.fkLugar = l.idLugar
            where u.idUsuario = ${idUsuario};

    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    preferencias
};