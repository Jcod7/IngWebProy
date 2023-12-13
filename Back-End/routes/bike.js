const express = require('express');
const coneccion = require('../connection');
const router = express.Router();

var auth = require('../services/authentication');
var checkRole = require('../services/checkRole');

router.post('/add', auth.authenticateToken, checkRole.checkRole, (req, res) => {

})

router.get('/get', auth.authenticateToken, checkRole.checkRole, (req, res) => {

})

router.get('/getByType/:Tipo', auth.authenticateToken, checkRole.checkRole, (req, res) => {

})

router.delete('/delete/:BikeID', auth.authenticateToken, checkRole.checkRole, (req, res) => {

})

router.patch('/update', auth.authenticateToken, checkRole.checkRole, (req, res) => {

})

module.exports = router