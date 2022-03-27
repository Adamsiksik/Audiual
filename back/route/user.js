const path = require('path');

const express = require('express');

const userController = require('../controllers/user');

const router = express.Router();

// // /admin/add-product => GET

 router.post('/signup', userController.postAddUser);
 router.post('/login', userController.postlogin);
 module.exports=router;