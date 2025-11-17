var express = require("express");
var router = express.Router();

var personagemController = require("../controllers/personagemController");

//Recebendo os dados do html e direcionando para a função cadastrar de personagemController.js
router.get("/top3", function (req, res) {
    personagemController.procurarTop3(req, res);
});



module.exports = router;