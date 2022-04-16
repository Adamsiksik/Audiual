const path = require('path');

const express = require('express');

const userController = require('../controllers/user');

const router = express.Router();

// // /admin/add-product => GET

 router.post('/signup', userController.postAddUser);
 router.post('/login', userController.postlogin);
 router.post('/like', userController.postlike);
 router.post('/signup2', userController.postsignup2);
 router.post('/reset', userController.postreset1);
 router.get('/reset', userController.getreset);
 router.get('/profile', userController.getuser);
 router.post('/update', userController.updateData);
 router.get('/ispress', userController.ispress);

 module.exports=router;