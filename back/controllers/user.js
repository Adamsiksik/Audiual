const express=require('express');
const User=require('../models/User');
const router=express.Router();
const bcrypt = require('bcrypt');


router.get('/',async(req,res)=>{
 try{
const users=await User.find().limit(1);
res.json(users);
 }catch(err){
  res.json({message:err})

 }
}
)
router.post('/', async(req,res)=>{

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

}catch(err){
  res.json({message:err})
}

})
router.get('/:id',async(req,res)=>{

 const id=req.params.id;
 try{
   const user=await User.findOne({_id:id});
   res.send(user);
 }catch(error){
   console.log(error.message);
 }
}
 )

module.exports=router;