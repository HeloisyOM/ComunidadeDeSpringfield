var dashboardModel = require("../models/dashboardModel");

function top3Lugares( req, res) {
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

function top3Perso( req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.top3Perso().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no Top3 personagem", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function distGenero(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.distGenero().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
function faixaEtaria(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.faixaEtaria().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

/*KPIS*/
function kpi_persoNome(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.kpi_persoNome().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function kpi_lugar(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.kpi_lugar().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function kpi_genero(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.kpi_genero().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
function kpi_idadeM(req, res) {
        // Passe os valores como parâmetro e vá para o arquivo dashboardModel.js
        dashboardModel.kpi_idadeM().then(function (resultado) {
                    if(resultado.length>0){
                        res.status(200).json(resultado);
                }else{
                    res.status(204).send('Nenhum resultado a exibir');
                }
            }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro no distibuição por genero", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
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