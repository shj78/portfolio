const express = require('express');
const router = express.Router();
//const User = require('./user');
//const Comment = require('./comment');

const middlewares = require('../passport/middlewares');

//로그인 엔드포인트 
router.get('/', (req, res, next) => {
	res.render('chat', { 
    title: 'toy node chat',
    user: req.user,
  });
});

//회원가입
router.get('/join', function(req, res, next) {
  res.render('join');
});

//로그인 
router.get('/login', function(req, res, next) {

  //세션 체크
  middlewares.sessionChk(req, res, next);

  res.render('index');
});


module.exports = router;