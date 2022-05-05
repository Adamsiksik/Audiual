const path = require('path');

const express = require('express');

const bookController = require('../controllers/book');

const router = express.Router();

// // /admin/add-product => GET

 router.get('/all', bookController.getAll);
 router.get('/book', bookController.getOne);
 router.get('/later', bookController.getlater);
 router.get('/liked', bookController.getliked);
 router.get('/rec', bookController.getrec);
 router.get('/loadBook', bookController.getloadBook )
 router.get( '/someroute', bookController.sendpdf )
 router.get('/search', bookController.s )
 router.get('/loadAudio', bookController.sendaudio )
 router.get('/gene', bookController.getgene )

 module.exports=router;