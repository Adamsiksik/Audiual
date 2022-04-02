var mongoose = require('mongoose');
const book=require('../models/Book');

const UserSchema=mongoose.Schema({
  Email:{
    type:String,
    require:true,
  },
  Password:{
    type:String,
    require:true,
  },
  age:     { type: Number, min: 18, max: 65 },
  likeBooks :[{
    type: Number,
    unique: true
  }]

  ,DoB :{
    type : Date
  }
 , userName:{
    type:String,
    require:true,
  },
  DoB :{
    type : String,
    require:true,
  }
  ,genre:{
    type : String
  }
  ,gender:{
    type: String

  }
})

module.exports=mongoose.model('User',UserSchema)