var dashboardModel = require("../models/dashboardModel");

function top3Lugares(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.top3Lugares().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir no tp3 lugares');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no Top3 lugares", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function top3Perso(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.top3Perso().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no Top3 perso", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
module.exports = {
    top3Lugares,
    top3Perso
}