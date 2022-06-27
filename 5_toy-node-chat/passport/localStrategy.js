const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const { User } = require('../models');

module.exports = () => {
//local() 에 따라서 이 아래부분이 실행된다.
  passport.use(new LocalStrategy({//이메일 패스워드 체크 - from view
    usernameField: 'email', //req.body.email
    passwordField: 'password', //req.body.password
  }, async (email, password, done) => {
    try {

      //먼저 해당 이메일이 있는 사람을 찾는다. - DB에서 확인 
      const exUser = await User.findOne( { where: { email } } );
      /*미들웨어가서 세션체크, get /login, post auth/login/...css...jquery,,axios....의 과정을 거친다...그러다가 DB 도착해서 확인 */

      if(exUser){
        //해시화된 비밀번호와 비교
        console.log('-------------------------------------------------');
        console.log('비밀번호 비교 시작');//bycrypt 라이브러리를 이용하여 해싱된 패스워드(exUser.password)가 유효한지 확인(이미 해싱되어 저장) 
        console.log('-------------------------------------------------');
        const result = await bcrypt.compare(password, exUser.password);
        console.log('-------------------------------------------------');
        console.log('비밀번호 비교 완료');

        if (result) {
          console.log('result : ');
          console.log(result);//해싱된 키워드가 맞으면 true, 아니면 fasle 
          console.log('회원정보 일치:::');
          done(null, exUser); 
        } else {//done() : 인자를 세개 받는다, done(서버에러, 로그인 실패 유무, 메시지 )
          console.log("not")
          console.log(exUser.email);
          done(null, false, { message: '비밀번호가 일치하지 않습니다.' });
        }
      } else {
        done(null, false, { message: '가입되지 않은 회원입니다.' });
      } 
    } catch (error) {
      console.error(error);
      done(error);
    }
    //done함수가 됐다면 다시 auth.js로 가서 local 이후 부분인 곳을 실행한다. 
  }));
};