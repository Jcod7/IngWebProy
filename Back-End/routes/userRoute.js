    const express = require('express');
    const coneccion = require('../connection');
    const router = express.Router();
    const jwt = require('jsonwebtoken');
    const nodemailer = require('nodemailer');
    require('dotenv').config();
    var auth = require('../services/authentication');
    var checkRole = require('../services/checkRole');

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
                    const response = { Cedula: results[0].Cedula, CorreoElectronico: results[0].CorreoElectronico,
                        Estado: results[0].Estado, Rol: results[0].RolID};
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

    router.get('/get', auth.authenticateToken, checkRole.checkRole, (req, res) => {
        var query = "select CEDULA, NOMBRE, CORREOELECTRONICO from USUARIOS where rolid=1";
        coneccion.query(query, (err, results) => {
            if (!err) {
                return res.status(200).json(results)
            } else {
                return res.status(500).json(err)
            }
        })
    })

    router.patch('/update', auth.authenticateToken, (req, res) => {
        let user = req.body;
        var query2 = "update USUARIOS set estado=? where cedula=?";
        coneccion.query(query2, [user.Estado, user.Cedula], (err, results) => {

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

    router.get('/checkToken', auth.authenticateToken, (req, res) => {
        return res.status(200).json({ message: "Activo" })
    })

    router.post('/changePassword', auth.authenticateToken, (req, res) => {
        const user = req.body;
        const email = res.locals.CorreoElectronico;
        var query = "select * from usuarios where CorreoElectronico=? and Contraseña=?";
        coneccion.query(query, [email, user.aContraseña], (err, results) => {
            if (!err) {
                if (results.length <= 0) {
                    return res.status(400).json({ message: "Contraseña incorrecta" })
                } else if (results[0].Contraseña == user.aContraseña) {
                    var updateQuery = "update usuarios set Contraseña=? where CorreoElectronico=?"
                    coneccion.query(updateQuery, [user.nContraseña, email], (err, results) => {
                        if (!err){
                            return res.status(200).json({ message: "Contraseña actualizada" })
                        } else {
                            return res.status(500).json(err)
                        }
                    })
                } else {
                    return res.status(400).json({ message: "Algo ha salido mal, inténtalo más tarde" })
                }
            } else {
                return res.status(500).json(err)
            }
        })
    })

    module.exports = router;
