var mongoose = require('mongoose');

const BookSchema=mongoose.Schema({
  name:{
    type:String,
    require:true,
  },
  id:{
    type:Number,
    require:true,
  },
  imageUrl:{
    type:String,
    require:true,
  },
  rating:{
    type:String,
    require:true,
  },
  pages:{
    type:String,
    require:true,
  }
})

module.exports=mongoose.model('Book',BookSchema)