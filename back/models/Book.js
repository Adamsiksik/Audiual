var mongoose = require('mongoose');

const BookSchema=mongoose.Schema({
  ISBN:{
    type:String,
    require:true,
  },
  Publisher:{
    type:String,
    require:true,
  },
  BookAuthor:{
    type:String,
    require:true,
  },
  YearOfPublication:{
    type:String,
    require:true,
  },
  ImageURLS:{
    type:String,
    require:true,
  },
})
module.exports=mongoose.model('Book',BookSchema)