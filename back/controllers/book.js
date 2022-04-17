const express = require('express');
const book = require('../models/Book');
const User = require('../models/User');
const fs = require('fs');
const path = require('path');

const router = express.Router();
const bcrypt = require('bcrypt');

exports.getAll = async (req, res) => {
  try {
    const books = await book.find().limit(100);
    res.json(books);
  } catch (err) {
    res.json({ message: err })
  }
}


exports.getOne = async (req, res) => {
  try {
    console.log(req.query);
    isbnreq = req.query.isbn;

    const books = await book.findOne({ ISBN: isbnreq });
    console.log(books);
    res.json(books);
  } catch (err) {
    res.json({ message: err })
  }
}

exports.sendpdf = (req, res) => {

  console.log("Getting PDF file from the server! (streaming version)");

  const filePath = './example.pdf';
  const stream = fs.createReadStream(filePath);
  res.writeHead(200, {
      'Content-disposition': 'attachment; filename="' + encodeURIComponent(path.basename(filePath))  + '"',
      'Content-type': 'application/pdf',
  });
  stream.pipe(res);
}
exports.getliked = async (req, res) => {
  try {
    let books;

    booksArray = [];

    const email = req.query.email;
    let user1;

    console.log(req.query.email);
    user1=await User.findOne({ Email: email })
 
 
    for (var i = 0; i < user1.liked.length; i++) {
    books = await book.findOne({ "Book-Title": user1.liked[i] });
    console.log(books);
    booksArray.push(books);
    }
    res.json(booksArray);
  } catch (err) {
    res.json({ message: err })
  }
}

<<<<<<< Updated upstream
exports.getrec = async (req, res) => {
  try {
    let books;
    booksArray = [];

    const email = req.query.email;
    let user1;

    console.log(req.query.email);
    user1=await User.findOne({ Email: email })
 
 
    for (var i = 0; i < user1.genre.length; i++) {
    books = await book.find({ "catogery": user1.genre[i] });
    Array.prototype.push.apply(booksArray, books);
    }
    res.json(booksArray);
  } catch (err) {
    res.json({ message: err })
  }
=======
exports.getloadBook =  (req,res) => {

  var fs = require('fs');

require.extensions['.txt'] = function (module, filename) {
    module.exports = fs.readFileSync(filename, 'utf8');
};

var words = require("../../../books1/epubtxt/1st-chance.epub.txt");

console.log(typeof words);
  
>>>>>>> Stashed changes
}