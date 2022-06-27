
const express = require('express');
const router = express.Router();
const passport = require('passport');

const { isLoggedIn, isNotLoggedIn } = require('./middlewares');

router.post('/login', isNotLoggedIn, (req, res, next) => { 

    passport.authenticate('local', (authError, user, info) => {
      if (authError) {  //서버 에러 난 경우 
        console.log('auth error');
        console.error(authError);
        return next(authError);
      }
      if (!user) {  //로그인 실패 
        console.log('login fail');
        return res.redirect(`/?loginError=${info.message}`);
        
      }
      //로그인 성공시 - req.login 함수가 반환되며 실행
      //이 순간 passport폴더 index.js로 간다. 
      //그리고 serializeUser 가 실행된다. 
      
      //user객체 도착 
      return req.login(user, (loginError) => {  //여기서 serializer 호출이 된다. → passport/index.js 
        if (loginError) {
          console.error(loginError);
          return next(loginError);
        }

        //세션 쿠키를 브라우저로 보내준다. 
        res.send('1');

      });
    })(req, res, next); //미들웨어 내의 미들웨어에는 (req, res, next)
  });
  
  router.get('/logout', isLoggedIn, (req, res) => { //로그아웃도 로그아웃 한 사람만 할 수 있도록 한다. 
    req.logout();//이 때 세션쿠키가 사라진다. -> 서버에서 지워진다. -> 로그아웃 된다.
    req.session.destroy();
    res.redirect('/login');
  });

module.exports = router;