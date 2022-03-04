var mongoose = require('mongoose');

const BookSchema=mongoose.Schema({
  name:{
    type:String,
    require:true,
  },
  SBN:{
    type:Number,
    require:true,
  },
  cover:{
    type:String,
    require:true,
  },
  rating:{
    type:String,
    require:true,
  },
  numberOfPages:{
    type:String,
    require:true,
  },
  description :{
    type:String,
    require:true,
  }
  ,authors:{
    type:String,
    require:true,
  },dateOfPublish:{
    type:String,
    require:true,
  },

})

module.exports=mongoose.model('Book',BookSchema)