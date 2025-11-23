var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//GRÁFICOS

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/top3Lugares", function (req, res) {
    dashboardController.top3Lugares(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/top3Perso", function (req, res) {
    dashboardController.top3Perso(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/distGenero", function (req, res) {
    dashboardController.distGenero(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/faixaEtaria", function (req, res) {
    dashboardController.faixaEtaria(req, res);
});

router.get("/faixaGasto", function (req, res) {
    dashboardController.faixaGasto(req, res);
});
router.get("/ranking", function (req, res) {
    dashboardController.ranking(req, res);
});

//KPIs

router.get("/kpi_persoNome", function (req, res) {
    dashboardController.kpi_persoNome(req, res);
});
router.get("/kpi_lugar", function (req, res) {
    dashboardController.kpi_lugar(req, res);
});
router.get("/kpi_genero", function (req, res) {
    dashboardController.kpi_genero(req, res);
});
router.get("/kpi_idadeM", function (req, res) {
    dashboardController.kpi_idadeM(req, res);
});
router.get("/kpi_mediaVendas", function (req, res) {
    dashboardController.kpi_mediaVendas(req, res);
});

module.exports = router;