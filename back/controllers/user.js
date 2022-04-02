const express = require('express');
const User = require('../models/User');
const recordReset = require('../models/recordReset');
var rand = require("random-key");
var nodemailer = require('nodemailer');
const router = express.Router();
const bcrypt = require('bcrypt');
const session = require('express-session');
const { redirect } = require('express/lib/response');
exports.postAddUser = async (req, res) => {
  sess = req.session;
  if (sess.email) {
    return res.redirect('/');
  }

  const hash = bcrypt.hashSync(req.body.Password, 5);
  console.log(hash);
  const user = new User({
    Email: req.body.Email,
    Password: hash,
  })
  try {
    const savedUser = await user.save();
    res.json(savedUser);
    sess.Email = req.body.Email;

    res.json({ message: err })

  } catch (error) {
    console.log(error.message);
  }
};

exports.postlike = async (req, res) => {
  email = req.query.Email;
  const likedbook = req.query.likedbook;
  const user = User.findOne({ Email: email }).select('likeBooks');
  console.log(user[1])
  if (user.includes(likedbook)) {
    res.json("this book is add befor")
  }
  const update = { $push: { likeBooks: likedbook } }
  const updated = User.findOneAndUpdate({ Email: email }, update, { upsert: true }, (err) => {
    if (err) console.log(err);
    else
      console.log("Successfully added");
  })

  res.json("dsasdddsa")

}

exports.postsignup2 = async (req, res) => {
  const DoBReq = req.query.DoB;
  const genreReq = req.query.genre;
  const ageReq = req.query.age;
  const email = req.query.Email;
  const genderReq = req.query.gender;
  const userNameReq = req.query.username;
  const update = { DoB: DoBReq, genre: genreReq, age: ageReq, gender: genderReq, userName: userNameReq }
  console.log(update)
  const updated = User.findOneAndUpdate({ Email: email }, update, (err, doc) => {
    if (err) console.log(err);
    console.log("jkhjhkj");
  })
  // console.log(updated)
  res.json("dsasd")




}
exports.postlogin = async (req, res, next) => {
  sess = req.session;
  if (sess.email) {
    return res.json({
      URL: "/main",
      session: true
    });
  }
  const password = req.body.Password;
  const email = req.body.Email;
  await User.findOne({ Email: email })
    .then(user1 => {

      if (!user1) {
        return res.json({
          URL: "/login"
          , message: "no user with such email"
        });
      } else {
        console.log(user1.Password);
        console.log(user1.Email);
        bcrypt.compare(password, user1.Password)
          .then(doMatch => {

            if (doMatch) {
              sess.email = email;
              return res.json({
                URL: "/main"
                , message: "Succeful"
              });
            }
            return res.json({
              URL: "/login"
              , message: "bad password"
            });
          })
          .catch(err => {
            console.log(err);
            return res.json({
              URL: "/login"
              , message: "error22"
            });
          })

      }
    })


};
exports.postreset1 = async (req, res, next) => {

  const email = req.query.Email;
  await User.findOne({ Email: email })
    .then(user1 => {

      if (!user1) {
        console.log('not found');

        return res.json({
          URL: "/login"
          , message: "no user with such email"
        });
      } else {
        console.log(user1.Email);
        mykey = rand.generate(8)
        record = new recordReset({
          Email: email,
          key: mykey
        });
        console.log(record);
        record.save()

        var transporter = nodemailer.createTransport({
          service: 'gmail',
          auth: {
            user: 'oday.qr.2001@gmail.com',
            pass: 'KILLTOHEALkito12'
          }
        });

        var mailOptions = {
          from: 'oday.qr.2001@gmail.com',
          to: email,
          subject: 'Sending Email to rest youer aduial passwor',
          text: 'localhost:3000/users/reset/?key=' + mykey
        };

        transporter.sendMail(mailOptions, function (error, info) {
          if (error) {
            console.log(error);
          } else {
            console.log('Email sent: ' + info.response);
          }
        });

        res.json('check your email to rest your password ');
      }
    })

}

exports.getreset = async (req, res, next) => {
  const keyreq = req.query.key
  const pass = req.query.password
  console.log(keyreq)
  await recordReset.findOne({ key: keyreq })
    .then( async record => {

      if (!record) {
        console.log('not found');

        return res.json({
          URL: "/login"
          , message: "your token has been expered "
        });
      } else {
        const hash = bcrypt.hashSync(pass, 5);
        console.log(hash);
        await User.findOneAndUpdate({ Email: record.Email }, { password: hash })

        res.json("your passwor has been updated ")


      }
    })
}

exports.getuser = async (req, res, next) => {
  const email = req.query.Email;
  await User.findOne({ Email: email })
    .then(user1 => {
        res.json(user1);
    })

}