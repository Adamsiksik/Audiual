const express =require('express');
const session =require('express-session');
const res = require('express/lib/response');
var mongoose = require('mongoose');
const bodyParser=require('body-parser');
const app=express();
const cors = require("cors");

app.use(cors());
app.use(session({
  secret:'secretadamobada',
  resave: false,
  saveUninitialized: false,
  
}))
app.use(bodyParser.json());
const userRoute=require('./route/user');
const bookRoute=require('./route/book');

app.use('/users',userRoute)
app.use('/books',bookRoute)


mongoose.connect('mongodb+srv://Adamsiksik:ebaa2009@cluster0.an1q8.mongodb.net/Project0?retryWrites=true&w=majority',()=>
  console.log("connected")
  );

app.listen(3000);
