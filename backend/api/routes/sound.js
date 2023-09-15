const express = require('express');
const mysql = require('mysql');
const multer  = require('multer');
const upload = multer(
  multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'sounds/');
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + '-' + file.originalname);
    }
  }));

const router = express.Router();

let connection = mysql.createConnection({
  host     : 'localhost',
  user     : '',
  password : ''
});
connection.connect();
connection.query('use soundboard;')

router.get('/', (req, res, next) => {
      connection.query('SELECT * from sound;', (err, rows, fields) => {
        console.log(rows);
        res.send(rows);
      });
});

router.post("/", upload.single('file'), (req, res, next) => {
  let name = req.body.name;
  let length = req.body.length;
  let url = "sounds/" + req.file.name;
  let path = req.file.path;

  connection.query('INSERT INTO sound(name, path, length) VALUES(?,?,?);', [name, path, url, length], (result) => {
    res.send(result);
  });
});

router.put("/", (req, res, next) => {
  let id = req.body.id;
  let name = req.body.name;
  let length = req.body.length;

  connection.query('UPDATE sound SET name = ?, length = ? WHERE idsound = ? ) VALUES(?,?,?);', [name, length, id], (result) => {
    res.send(result);
  });
})

router.delete("/", (req, res, next) => {
  let id = req.body.id;

  connection.query("DELETE FROM sound WHERE idsound = ?" [id], (result) => {
    res.send(result);
  });
});

module.exports = router;
