const express = require('express');
const router = express.Router();
//----------암호화 시작
const bcrypt = require('bcrypt');
//----------암호화 끝 
const Sequelize = require('sequelize');
const { User, sequelize } = require('../models');

//router.use(passport.initialize());

/*
router.get('/join', function(req, res, next) {
  res.render('join');
});
*/

//유저 조회
router.get('/', async function(req, res, next) {
  //console.log(req)
 
    const user = await User.findAll(); //모든 유저 조회 -> 해당 유저 객체 반환 
    console.log(user);
    res.json(user);//json 응답

});

//회원가입 후 페이지 
router.post('/', async (req, res, next) => {

  try{
    const body = req.body;
    const name = body.name;
    const email = body.email;
    const password = body.password;

    const exUser = await User.findOne({ where : { email } });

    //계정 중복체크
    if(exUser){
      return res.json('exUser');
    }
    const encryptedPW = bcrypt.hashSync(password, 12);

    //INSERT - 순수 자바 / 편리
    sequelize.query(
      'INSERT INTO USERS(USER_ID, EMAIL, NAME, PASSWORD) VALUES(USERS_SEQ.NEXTVAL, ?, ?, ?);', {
        replacements : [email, name, encryptedPW],
        type : Sequelize.QueryTypes.INSERT
      } 
    ).then(rst => {
      res.json('success');
    })
    .catch(err => {
      console.log(err)
      res.json(err);
    });
  }catch(error){
    console.error(error);
    return next(error);
  }
});

module.exports = router;
