const express=require('express');
const User=require('../models/User');
const router=express.Router();
const bcrypt = require('bcrypt');
const session = require('express-session');
const { redirect } = require('express/lib/response');
exports.postAddUser =  async(req,res)=>{
  sess = req.session;
  if(sess.email) {
    return res.redirect('/');
}

  const hash = bcrypt.hashSync(req.body.Password, 5);
  console.log(hash);
    const user=new User({
      Email:req.body.Email,
      Password:hash,
    })
try{
const savedUser=await user.save();
res.json(savedUser);
sess.Email =req.body.Email;

  res.json({message:err})

}catch(error){
  console.log(error.message);
}
};
exports.postlogin = async (req, res, next) => {
  sess = req.session;
  if(sess.email) {
    return res.redirect('/');
}

  const email = req.body.Email;
  console.log(req.body.Password);
  const hash2 = bcrypt.hashSync(req.body.Password, 5);
  const password = hash2;
  console.log(password);
  console.log(email);
  await User.findOne( {Email : email})
  .then(user1 => {

    if(!user1){
      return res.json({URL:"/login"
    ,message:"no user with such email"});
    }else{
      console.log(user1.Password);
      console.log(user1.Email);
      bcrypt.compare(password ,user1.Password)
      .then(doMatch => {
  
        if(doMatch){
        sess.email =email;
        return res.json({URL:"/main"
        ,message:"Succeful"});
        }
        return res.json({URL:"/login"
        ,message:"bad password"});
      })
      .catch(err => {
        console.log(err);
        return res.json({URL:"/login"
        ,message:"error22"});
      })

    }
  })

  
};
