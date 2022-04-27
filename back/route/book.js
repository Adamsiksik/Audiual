const path = require('path');

const express = require('express');

const bookController = require('../controllers/book');

const router = express.Router();

// // /admin/add-product => GET

 router.get('/all', bookController.getAll);
 router.get('/book', bookController.getOne);
 router.get('/liked', bookController.getliked);
 router.get('/rec', bookController.getrec);

 router.get('/loadBook', bookController.getloadBook )
 router.get( '/someroute', bookController.sendpdf )
 router.get('/getaudiobook', bookController.getaudiobook )
 router.get('/search', bookController.search )
 router.get('/loadAudio', bookController.sendaudio )

 
 module.exports=router;