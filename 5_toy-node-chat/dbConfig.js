//오라클 서버에 접근하기 위한 계정 정보 
module.exports = {
    user          : process.env.NODE_ORACLEDB_USER || "ECS_TRANING",
    password      : process.env.NODE_ORACLEDB_PASSWORD || "Ecstel1!",
    connectString : process.env.NODE_ORACLEDB_CONNECTIONSTRING || "10.0.55.122/ECSDB",
    externalAuth  : process.env.NODE_ORACLEDB_EXTERNALAUTH ? true : false
  };
//다른 파일에서 exports 객체를 사용하기를 원하고 있음. - require로 사용할 수 있도록 해주었음

