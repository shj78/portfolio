const passport = require('passport');
const local = require('./localStrategy');
const { User } = require('../models');


//USER를 세션에 저장 
module.exports = () => {
    //(로그인 최초 성공 시) 호출되는 serializeUser, serializerUser메소드를 이용해서 done으로 정보를 넘겨준다.  
    //사용자 정보를 session에 저장할 수 있다. 
    passport.serializeUser((user, done) => {
      console.log("serializeUser:::");
      console.log(user.user_id);
      done(null, user.user_id); // req.login이 user가 된 상태, 세션에 user의 email만 저장 
    });                      
    //{ email : nooodle31@naver.com , 'connect_email : s%234454543534'}
    //s%~~ 는 세션쿠키, 브라우저는 세션쿠키를 보고 로그인 상태를 안다.
    //만약 email 필요하면 세션 쿠키를 보고 deserializerUser 보고 복구한다.
    //이 위에 done이 되는 순간 auth.js로 가서 req.login~이 실행된다. 
    
    //화면 전환 시 실행되는 deserializer 
    passport.deserializeUser((user_id, done) => {
      console.log("deserializeUser:::");
      User.findOne({ where: { user_id} })
        .then(user => {
          console.log('user:::');
          console.log(user);
          done(null, user)
        })
        .catch(err => done(err));
        
    });
  
    //이거 때문에 local을 보고 localStrategy를 찾는다. 
    local();
  };
