const express = require('express');
const book = require('../models/Book');
const User = require('../models/User');
const fs = require('fs');
const path = require('path');
const textToSpeech = require('@google-cloud/text-to-speech');
const PDFExtract = require('pdf.js-extract').PDFExtract;
const router = express.Router();
const bcrypt = require('bcrypt');
const axios = require('axios');
const PDFDocument = require('pdfkit');
const doc = new PDFDocument;
const request = require('request');

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


exports.sendtxt = (req, res) => {
  let s=req.query.isbn;

const pdfExtract = new PDFExtract();
const options = {}; /* see below */
console.log(s)
pdfExtract.extract("C:/Users/ali_q/Documents/GitHub/books1/books/"+s+".pdf", options, (err, data) => {
  if (err) return console.log(err);
  res.json(data);
  console.log(data);
});
 
}
exports.sendpdf = (req, res) => {
  let s=req.query.isbn;
<<<<<<< Updated upstream
  res.sendFile("C:/Users/user/Downloads/audiual/"+s+".pdf");
=======
  res.sendFile("C:/Users/ali_q/Documents/GitHub/books1/books/"+s+".pdf");
}
exports.addbook = (req, res1) => {
  let s=req.query.name;
  console.log(s)
  const requestq = request.get(
    'http://192.168.1.18:3000/books/someroute?isbn=0060801263',
    {},
  ).on('error', function(e) {
    console.log("Got error: " + e.message);
  }); 
  requestq.on('response', function (res) {
    res.pipe(fs.createWriteStream('./filename_to_save.pdf'));
  });
  res1.json('File is created successfully.');
}
exports.addmp3 = (req, res1) => {
  let s=req.query.name;
  console.log(s)
  const requestq = request.get(
    'http://localhost:3000/books/loadAudio?isbn=0060801263',
    {},
  ).on('error', function(e) {
    console.log("Got error: " + e.message);
  }); 
  requestq.on('response', function (res) {
    res.pipe(fs.createWriteStream('./'+s+'.mp3'));
  });
  res1.json('File is created successfully.');
>>>>>>> Stashed changes
}
exports.sendaudio = (req, res) => {
  let s=req.query.isbn;
<<<<<<< Updated upstream
  res.sendFile("C:/Users/user/Downloads/audiual/"+s+".mp3");
=======
  res.sendFile("C:/Users/ali_q/Documents/GitHub/books1/books/"+s+".mp3");
>>>>>>> Stashed changes
}
exports.getliked = async (req, res) => {
  try {
    let books;

    booksArray = [];

    const email = req.query.email;
    let user1;

    console.log(req.query.email);
    user1 = await User.findOne({ Email: email })


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

exports.getlater = async (req, res) => {
  try {
    let books;

    booksArray = [];

    const email = req.query.email;
    let user1;

    console.log(req.query.email);
    user1 = await User.findOne({ Email: email })

    console.log(user1);

    for (var i = 0; i < user1.later.length; i++) {
      books = await book.findOne({ "Book-Title": user1.later[i] });
      console.log(books);
      booksArray.push(books);
    }
    res.json(booksArray);
  } catch (err) {
    res.json({ message: err })
  }
}

exports.getrec = async (req, res) => {
  try {
    let books;
    booksArray = [];

    const email = req.query.email;
    let user1;

    console.log(req.query.email);
    user1 = await User.findOne({ Email: email })


    for (var i = 0; i < user1.genre.length; i++) {
      books = await book.find({ "catogery": user1.genre[i] });
      Array.prototype.push.apply(booksArray, books);
    }
    res.json(booksArray);
  } catch (err) {
    res.json({ message: err })
  }
}
exports.getloadBook = (req, res) => {

  var fs = require('fs');

  require.extensions['.txt'] = function (module, filename) {
    module.exports = fs.readFileSync(filename, 'utf8');
  };

  var words = require("../../../books1/epubtxt/1st-chance.epub.txt");

  console.log(typeof words);

}
exports.getaudiobook = (req, res) => {

  let audio = document.querySelector('audio');
  audio.src = base64str;
  audio.play();

}

exports.search = async (req, res) => {
  try {
  booksArray = [];

  books = await book.find( { "Book-Title" : { $regex : new RegExp(req.query.name, "i") } } );
  Array.prototype.push.apply(booksArray, books);
} catch (err) {
  res.json({ message: err })
}
res.json(booksArray);
}
