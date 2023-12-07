const express = require('express');
const coneccion = require('../connection');
const router = express.Router();
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const { query } = require('express');
require('dotenv').config();

router.post('/signup', (req, res) => {
    const user = req.body;
    const selectQuery = "SELECT * FROM Usuarios WHERE CorreoElectronico=?";

    coneccion.query(selectQuery, [user.CorreoElectronico], (selectErr, selectResults) => {
        if (!selectErr) {
            if (selectResults.length <= 0) {
                const insertQuery = "INSERT INTO Usuarios (Cedula, Nombre, Apellido, CorreoElectronico, Contraseña, Direccion, Telefono) VALUES (?, ?, ?, ?, ?, ?, ?)";

                coneccion.query(insertQuery, [user.Cedula, user.Nombre, user.Apellido, user.CorreoElectronico, user.Contraseña, user.Direccion, user.Telefono], (insertErr, insertResults) => {
                    if (!insertErr) {
                        return res.status(200).json({ message: "success" });
                    } else {
                        return res.status(500).json(insertErr);
                    }
                });
            } else {
                return res.status(400).json({ message: "E-mail ya registrado" });
            }
        } else {
            return res.status(500).json(selectErr);
        }
    });
});

router.post('/login', (req, res) => {
    const user = req.body;
    const query = "SELECT * FROM Usuarios WHERE CorreoElectronico=?";
    coneccion.query(query, [user.CorreoElectronico], (err, results) => {
        if (!err) {
            if (results.length <= 0 || results[0].Contraseña != user.Contraseña) {
                return res.status(401).json({ message: "Correo Electronico o Contraseña incorrectos" });
            } else if (results[0].Estado === 0) {
                return res.status(401).json({ message: "Espere aprovacion del administrador" });
            } else if (results[0].Contraseña == user.Contraseña) {
                const response = { Cedula: results[0].Cedula, CorreoElectronico: results[0].CorreoElectronico, Rol: results[0].Estado };
                const accessToken = jwt.sign(response, process.env.ACCESS_TOKEN, {
                    expiresIn: "8h",
                });
                return res.status(200).json({ token: accessToken });
            } else {
                return res.status(400).json({ message: "Algo ha salido mal ..." });
            }
        } else {
            return res.status(500).json(err);
        }
    })
})

router.get('/get', (req, res) => {
    var query = "select CEDULA, NOMBRE, CORREOELECTRONICO from USUARIOS where rolid=1";
    coneccion.query(query, (err, results) => {
        if (!err) {
            return res.status(200).json(results)
        } else {
            return res.status(500).json(err)
        }
    })
})

router.patch('/update', (req, res) => {
    let user = req.body;
    var query2 = "update USUARIOS set estado=? where cedula=?";
    coneccion.query(query2, [user.estado, user.Cedula], (err, results) => {

        if (!err) {
            if (results.affectedRows == 0) {
                return res.status(404).json({ message: "Error updating" });
            }
            return res.status(200).json({ message: "User update successfully" });
        } else {
            return res.status(500).json(err);
        }
    });
});

router.get('/checkToken', (req, res) => {
    return res.status(200).json({ message: "Activo" })
})

module.exports = router;
