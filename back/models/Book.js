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
  "Book-Author":{
    type:String,
    require:true,
  },
  "Year-Of-Publication":{
    type:String,
    require:true,
  },
  "Book-Title":{
    type:String,
    require:true,
  },
  "Image-URL-L":{
    type:String,
    require:true,
  },
})
module.exports=mongoose.model('Book',BookSchema)