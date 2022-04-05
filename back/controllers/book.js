const express=require('express');
const book=require('../models/Book');

const router=express.Router();
const bcrypt = require('bcrypt');

exports.getAll  =async(req,res)=>{
  try{
 const books=await book.find().limit(100);
 res.json(books);
  }catch(err){
   res.json({message:err})
  }
 }
 

 exports.getOne =async(req,res)=>{
  try{
  console.log(req.query);
  isbnreq =req.query.isbn;

  const books=await book.findOne({ISBN:isbnreq});
   console.log(books);
   res.json(books);
    }catch(err){
     res.json({message:err})
    }
   }
   
