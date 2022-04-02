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

exports.postlike = async (req, res) => {
    sess = req.body.Email;
    

}

exports.postsignup2 = async (req, res) => {
  console.log(req.body);
  console.log(req.json);
  const  DoBReq = req.body.DOB;
  const email = req.body.Email;
  const genderReq = req.body.Gender;
  const userNameReq = req.body.Username;
  const update = {userName :userNameReq, DoB :  DoBReq , gender:genderReq ,}
  console.log(update)
  const updated = User.findOneAndUpdate( {Email : email} ,update ,(err, doc) => {
    if (err) console.log(err);
    console.log("jkhjhkj");
})
// console.log(updated)
res.json("dsasd")
  
  
  

}
exports.postlogin = async (req, res, next) => {
  sess = req.session;
  if(sess.email) {
    return res.json({URL:"/main",
    session:true});
  }
  const password = req.body.Password;
  const email = req.body.Email;
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
