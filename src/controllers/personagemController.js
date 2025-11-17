var personagemModel = require("../models/personagemModel");

function procurarTop3(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo personagemModel.js
        personagemModel.procurarTop3().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no Top3", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    procurarTop3
}