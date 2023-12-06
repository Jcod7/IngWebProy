const mysql = require('mysql');
require('dotenv').config(); 

var coneccion = mysql.createConnection({
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
});

coneccion.connect((err) => {
    if (!err) {
        console.log("Connected");
    } else {
        console.log(err);
    }
});

module.exports = coneccion;
