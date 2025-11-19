var express = require("express");
var router = express.Router();

var mensagemController = require("../controllers/mensagemController");

//Recebendo os dados do html e direcionando para a função cadastrar de mensagemController.js
router.post("/cadastrar", function (req, res) {
    mensagemController.cadastrar(req, res);
});

module.exports = router;