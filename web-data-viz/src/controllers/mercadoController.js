var mercadoModel = require("../models/mercadoModel");


function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
       var totalGasto = req.body.totalServer 
       var rosquinha = req.body.rosqServer  
       var duff = req.body.duffServer 
       var panqueca = req.body.panqServer 
       var pizzaLuigi = req.body.pizzServer  
       var buzzCola= req.body.buzzServer 
       var taco = req.body.tacoServer 
       var hamburguer= req.body.burgServer 
       var hotdog = req.body.hotServer 
       var fkUsuario = req.body.idUserServer 
     
    // Faça as validações dos valores
    if (totalGasto == undefined) {
        res.status(400).send("Seu totalGasto está undefined!");
    } else if (rosquinha == undefined) {
        res.status(400).send("Seu rosquinha está undefined!");
    }else if (duff == undefined) {
        res.status(400).send("Seu duff está undefined!");
    } else if (panqueca == undefined) {
        res.status(400).send("Sua panqueca está undefined!");
    }else if (pizzaLuigi == undefined) {
        res.status(400).send("Seu pizzaLuigi está undefined!");
    } else if (buzzCola == undefined) {
        res.status(400).send("Seu buzzCola está undefined!");
    } else if (taco == undefined) {
        res.status(400).send("Sua taco está undefined!");
    } else if (hamburguer == undefined) {
        res.status(400).send("Seu hamburguer está undefined!");
    } else if (hotdog == undefined) {
        res.status(400).send("Seu hotdog está undefined!");
    } else if (fkUsuario == undefined) {
        res.status(400).send("Sua fkUsuario está undefined!");
    }else {

        // Passe os valores como parâmetro e vá para o arquivo mercadoModel.js
        mercadoModel.cadastrar(totalGasto,rosquinha,duff, panqueca, pizzaLuigi,buzzCola,taco, hamburguer, hotdog, fkUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro da compra! Erro: ",
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