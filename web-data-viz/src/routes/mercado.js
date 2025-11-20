var express = require("express");
var router = express.Router();

var mercadoController = require("../controllers/mercadoController");

//Recebendo os dados do html e direcionando para a função cadastrar de mercadoController.js
router.post("/cadastrar", function (req, res) {
    mercadoController.cadastrar(req, res);
})

module.exports = router;