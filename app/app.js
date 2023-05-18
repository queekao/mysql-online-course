var express = require('express');
var mysql = require('mysql')
var app = express();

let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'a6413432456',
    database: 'ig_clone_user'
})

app.get("/", function (req, res) {
    // find count of users in DB
    var q = "SELECT COUNT(*) AS count FROM users;"
    var count
    connection.query(q, function (err, results) {
        if (err) throw err;
        count = results[0].count
        res.send(`HELLO FROM ${count} OUR WEB APP!`);
    })
});

app.listen(8080, function () {
    console.log('App listening on port 8080!');
});
