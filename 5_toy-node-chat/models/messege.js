const Sequelize = require('sequelize');

module.exports = class Messege extends Sequelize.Model {
  static init(sequelize) {
    return super.init({
      messege_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      room_id: {//삭제해도 될 것 같음 
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      participant_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      content: {
        type: Sequelize.TEXT, //코멘트테이블에서 코멘트 형을 TEXT로 했길래 해보았음 자세히 알아봐야함 
        allowNull: false, //널 허용 안됨 
      },
      transmission_time: {
        type: Sequelize.DATE,
        allowNull: true, //널 허용
      },
      unread_messege_count: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
    }, {
      sequelize,
      timestamps: false,
      modelName: 'Messege',
      tableName: 'messeges',
      paranoid: false,
      charset: 'utf8mb4',
      collate: 'utf8mb4_general_ci',
    });
  }

  static associate(db) {
    db.Messege.belongsTo(db.Participant, { foreignKey: 'participant_id', targetKey: 'participant_id' }); //Users테이블의 user_id를 Participants테이블에서 참조하고 있다(user_id로)
    db.Messege.belongsTo(db.Participant, { foreignKey: 'room_id', targetKey: 'room_id' }); //삭제예정 
  }
};

