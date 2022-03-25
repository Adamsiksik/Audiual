const path = require('path');

const express = require('express');

const adminController = require('../controllers/admin');

const router = express.Router();

// // /admin/add-product => GET
 router.get('/login', adminController.getlogin);
 router.get('/signup', adminController.getsignup);
 
 
 router.post('/signup', adminController.postAddUser);
 router.post('/login', adminController.postlogin);
 
// // /admin/products => GET


// // /admin/add-product => POST
// router.post('/add-product', adminController.postAddProduct);

// router.get('/edit-product/:productId', adminController.getEditProduct);

// router.post('/edit-product', adminController.postEditProduct);

// router.post('/delete-product', adminController.postDeleteProduct);

module.exports = router;
