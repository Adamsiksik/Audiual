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
  const myPlaintextPassword = "generic";
  const hash = bcrypt.hashSync(req.body.Password, 5);
  console.log(hash);
    const user=new User({
      Email:req.body.Email,
      Password:hash,
    })
      
console.log(req.body.Email);

try{
const savedUser=await user.save();
res.json(savedUser);
sess.Email =req.body.Email;

  res.json({message:err})

}catch(error){
  console.log(error.message);
}
};
exports.postlogin = (req, res, next) => {

  sess = req.session;
  if(sess.email) {
    return res.redirect('/');
}
  const email = req.query.email;
  const password = req.query.password;
  console.log(req);
  User.findOne( {email : email})
  .then(user1 => {
  
    if(!user1){
      return res.redirect('login');
    }else{

      console.log(user1.Password);
      console.log(password);
      bcrypt.compare(password ,user1.Password)
      .then(doMatch => {
  
        if(doMatch){
          sess.email =email;
          console.log("done")
          return res.redirect('/');
        
  
        }
         res.redirect('login');
      })
      .catch(err => {
        console.log(err);
        res.redirect('login');
      })

    }
  })

  
};
