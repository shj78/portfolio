
//-----선언 , 설정 시작 
const http = require('http');
const express = require('express');
const app = express();//express를 "실행한 내용"을 app에 저장 
const server = http.createServer(app); //express를 이용해서 http 서버 생성 - socket.io가 http를 통해 이용될 수 있도록 

const router  = express.Router();
const passport = require('passport'); 
const passportConfig = require('./passport')
const session = require("express-session");

const dotenv = require('dotenv');
dotenv.config();//CommonJS에서 환경변수 불러오는 방법 - ES6 버전이냐에 따라 다르다.
const indexRouter = require('./routes/index')
const usersRouter = require('./routes/users')
const authRouter = require('./passport/auth')
const path = require('path');
const ejs = require('ejs');
app.set('view engine', 'ejs'); //익스프레스 객체를 이용해 렌더링 엔진 모드를 ejs로 설정

//----------시퀄라이즈 관련 설정 시작 
const morgan = require('morgan');
const { sequelize } = require('./models'); 
const cookieParser = require('cookie-parser');
//----------시퀄라이즈 관련 설정 끝  

const socketIO = require('socket.io');
const moment = require("moment");
const io = socketIO(server); //express를 실행한 내용을 저장한 app로 생성한 http 서버 객체를 이용해서 소켓 서버 생성

//-----선언, 설정 끝
const port = process.env.PORT || '3000';
server.listen(port);

//-----웹서버 환경설정 시작 
app.set('views',  __dirname + '/views'); //익스프레스 객체를 이용해 ejs이 있는 폴더를 지정
//-----웹서버 환경설정 끝

//시퀄라이즈 sync()로 DB연결  
sequelize.sync();//DB연결

passportConfig(passport);

//morgan - 로그 라이브러리 
app.use(morgan('dev'));

//-----서버가 실행이 되면 서버가 보여줄 폴더 지정 시작 - express에 static폴더를 생성 
app.use(express.static(path.join(__dirname, "public")));
app.use('/node_modules', express.static(path.join(__dirname,'/node_modules')));
//-----서버가 실행이 되면 서버가 보여줄 폴더 지정 끝 

//데이터 파싱 설정 관련 
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(cookieParser(process.env.COOKIE_SECRET));

//세션 생성
const sessionMiddleware = session({
  resave: false,
  saveUninitialize: false,
  secret: process.env.COOKIE_SECRET,  //.env 파일에서 암호화하여 생성(쿠키 파서의 쿠키와 같게 해줌)
  name: 'session1234',  // default : connect.sid
  cookie: {
    secure: false,  // HTTPS를 통해서만 쿠키를 전송하도록
    httpOnly: true, //클라이언트 JavaScript가 아닌 HTTP(S)를 통해서만 전송되도록
    //domain: '', //쿠키의 도메인을 표시
    //path : '',  //쿠키의 경로를 표시
    //expires: expiryDate //만기 날짜를 설정
    //maxAge: 1000 * 60 // would expire after 1 minute
    maxAge: 1000 * 60 * 60, // would expire after 1 hours
    
  }
});
app.use(sessionMiddleware);
app.use(passport.initialize());
app.use(passport.session()); //내부에 세션을 쓰겠다 선언

//-----분기된 라우터로 갈 수 있도록 미들웨어 생성 시작  
//로그인 메인 페이지, 채팅 페이지
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use("/auth", authRouter);
//-----분기된 라우터로 갈 수 있도록 미들웨어 생성 끝

app.use((req, res, next) => {
    const error =  new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
    error.status = 404;
    next(error);
  });
  
app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = process.env.NODE_ENV !== 'production' ? err : {};
  res.status(err.status || 500);
  res.render('error');
});


//----- 소켓 설정 시작 
io.on('connection', (socket) => {   // 연결이 들어오면 실행되는 이벤트 - 연결이 되면 들어오는 모든 정보를 socket에 담는다.
    //클라이언트로부터 데이터를 받음 // socket 변수에는 실행 시점에 연결한 상대와 연결된 소켓의 객체가 들어있다.
    //클라이언트가 보낸 채널명과 내용 -> socket ! 
    socket.on("chatting", (data)=>{
      //console.log(data);
      const { name, msg } = data;
      //클라이언트에게 되돌려줌  
      io.emit("chatting", {
        name
        , msg
        , time : moment(new Date()).format("YYYY-MM-DD HH:MM:SS A") 
      });
    })
    
   //console.log('연결');
    
});
//----- 소켓 설정 끝  


module.exports = app;




