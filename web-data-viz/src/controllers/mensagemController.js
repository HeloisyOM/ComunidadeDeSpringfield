function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var conteudo = req.body.msgServer;
    var fkUsuario = req.body.idUsuario;
 
    var mensagemModel = require("../models/mensagemModel");

    // Faça as validações dos valores
    if (fkUsuario == undefined) {
        res.status(400).send("Seu id está undefined!");
    } else if (conteudo == undefined) {
        res.status(400).send("Sua mensagem está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo mensagemModel.js
        mensagemModel.cadastrar(conteudo,fkUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    cadastrar
}