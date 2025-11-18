var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/top3Lugares", function (req, res) {
    dashboardController.top3Lugares(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.get("/top3Perso", function (req, res) {
    dashboardController.top3Perso(req, res);
});



module.exports = router;