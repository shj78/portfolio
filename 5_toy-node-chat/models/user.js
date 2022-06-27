//const Sequelize = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  return sequelize.define('user', {
    user_id: {
      field: 'USER_ID',
      type: DataTypes.INTEGER,
      allowNull: false, //널 허용 안됨 
      primaryKey: true,
    },
    email: {
      field: 'EMAIL',
      type: DataTypes.STRING(20),
      allowNull: true,
    },
    password: {
      field: 'PASSWORD',
      type: DataTypes.STRING(100),
      allowNull: true,
    },
    name: {
      field: 'NAME',
      type: DataTypes.STRING(20), 
      allowNull: false,
    },
    join_date: {
      field: 'JOIN_DATE',
      type: DataTypes.DATE,
      allowNull: false,
    },
    login_time: {
      field: 'LOGIN_TIME',
      type: DataTypes.DATE,
      allowNull: false,
    },
    logout_time: {
      field: 'LOGOUT_TIME',
      type: DataTypes.DATE,
      allowNull: false
    },
    total_access_time: {
      field: 'TOTAL_ACCESS_TIME',
      type: DataTypes.DATE,
      allowNull: false
    },
    sns_id: {
      field: 'SNS_ID',
      type: DataTypes.STRING(30),
      allowNull: true,
    },
    
  }, { //super.init의 두번 째 인수 - 모델에 대한 설정 부분
    //sequelize,
    timestamps: false, //default는 true -> createdAt, updatedAt 만든시간, 수정시간 자동으로 됨 
    underscored : false, //카멜케이스 ``
    modelName: 'User', //기본적으로 모델이름은 소문자로 바꾸고, 복수형으로 만든걸 table 명으로 한다. 
    tableName: 'USERS',
    paranoid: false, //delete시 soft(deleteAt을 만들어줌(제거한 날짜), true)인지 hard(바로 지워버림, false)인지 정한다. -> DB의 유예기간(회원탈퇴 이후 정보 복구라던지) 
    charset: 'utf8mb4',
    collate: 'utf8mb4_general_ci',
  });
};

/* //관계 컬럼 부분 - 시퀄라이즈가 알아서 foreign key를 만들고 관계를 지어주는 부분 
static associate(db) {
  db.User.hasMany(db.Participant, { foreignKey: 'user_id', sourceKey: 'user_id' }); //User 모델의 user_id를 Participant 모델에서 참조하고 있다(user_id로)
} */