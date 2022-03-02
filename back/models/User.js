var mongoose = require('mongoose');

const UserSchema=mongoose.Schema({
  Email:{
    type:String,
    require:true,
  },
  Password:{
    type:String,
    require:true,
  }
})

module.exports=mongoose.model('User',UserSchema)