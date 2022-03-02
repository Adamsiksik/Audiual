const express=require('express');
const book=require('../models/Book');
const router=express.Router();
const bcrypt = require('bcrypt');

router.get('/',async(req,res)=>{
  try{
 const books=await book.find();
 res.json(books);
  }catch(err){
   res.json({message:err})
  }
 }
 )
 module.exports=router;