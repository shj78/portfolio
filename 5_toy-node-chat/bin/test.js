const oracledb = require('oracledb');//npm
const dbConfig = require('./dbConfig.js');//경로로 module.exports 를 require

//oracledb는 async, promise 지원 → 비동기 제어 라이브러리 사용하지 않아도 연결 후 다음 쿼리문 작업 처리 
oracledb.getConnection({
  //①dbConfig의 정보를 불러와 연결을 시도
    user          : dbConfig.user,
    password      : dbConfig.password,
    connectString : dbConfig.connectString
  },
  //②연결
  function(err, connection){
    if (err) {
      console.error(err.message);
      return;
    }
    //③쿼리문 실행(Prepared Statement구조) - 오라클 서버로 쿼리를 날려 데이터를 가져온다.
    connection.execute(      
	  "SELECT ISSUE_YYMM, EPC_CODE, REMARK, TAG_LOCATION_SEQ,  REG_DATE FROM TAG_ISSUE WHERE ROWNUM < :DID"
    , [50]
    , function(err, result){
        //정상적 수행 아닐 시 
        if (err) {
          console.error(err.message);
          doRelease(connection);
          return;
        }
        //정상적 수행일 시 
        console.log(result.metaData);
        console.log(result.rows);
        doRelease(connection);
      }
    );
  }
);

function doRelease(connection){
  connection.release(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    }
  );
}