const Sequelize = require('sequelize');

module.exports = class Room extends Sequelize.Model {
  static init(sequelize) {
    return super.init({
      room_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      room_name: {
        type: Sequelize.STRING(30),
        allowNull: false, //널 허용 안됨 
      },
      room_created_time: {
        type: Sequelize.DATE,
        allowNull: true, //널 허용
      },
    }, {
      sequelize,
      timestamps: false,
      modelName: 'room',//대소문자 구별하는 지 ?
      tableName: 'room',
      paranoid: false,
      charset: 'utf8mb4',
      collate: 'utf8mb4_general_ci',
    });
  }

  static associate(db) {
    db.Messege.hasMany(db.Participant, { foreignKey: 'participant_id', sourceKey: 'participant_id' }); //Users테이블의 user_id를 Participants테이블에서 참조하고 있다(user_id로)
    db.Messege.hasMany(db.Messege, { foreignKey: 'room_id', sourceKey: 'room_id' }); //삭제예정 
  }
};

