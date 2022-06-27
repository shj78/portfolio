const express = require('express');
//라우터 객체 생성 
const router = express.Router();

//로그인 됐다고 판단할 때 
router.isLoggedIn = (req, res, next) => {
  if (req.isAuthenticated()) { //req.isAuthenticated() 이게 true면 로그인 되어있는 것 
    next();//로그인 되어있으면 다음 행을 진행한다. 
  } else {
    res.status(403).send('로그인 필요!');//next() 미들웨어가 없어 다음 으로 진행되지 못한다. //로그인 안했으면 여기서 응답보내고 끝
  }
};

//로그인 안됐다고 판단할 떄 
router.isNotLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {//로그인을 안한 상태여야 통과 
    next();
  } else {
    const message = encodeURIComponent('로그인한 상태입니다.');
    res.send('test1');
  }
};

/*** session 체크 ***/
router.sessionChk = (req, res, next) => {
  if( !req.user ){
      console.log('-----세션없음-----');
      req.logout();
      res.clearCookie('sessionID123');
      req.session.destroy();
  }else{
      console.log('-----세션있음-----');
  }
}

//라우터 객체에 함수를 정의하고 다른 파일에서 라우터 객체를 쓸 수 있도록 
module.exports = router;