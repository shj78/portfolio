const Sequelize = require('sequelize');

module.exports = class Participant extends Sequelize.Model {
  static init(sequelize) {
    return super.init({
      participant_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      user_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      room_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false, //널 허용 안됨 
      },
      entry_time: {
        type: Sequelize.DATE,
        allowNull: false, //널 허용 안됨 
      },
      exit_time: {
        type: Sequelize.DATE,
        allowNull: true, //널 허용
      }
    }, {
      sequelize,
      timestamps: false,
      modelName: 'Participant',
      tableName: 'participantS',
      paranoid: false,
      charset: 'utf8mb4',
      collate: 'utf8mb4_general_ci',
    });
  }

  static associate(db) {
    db.Participant.belongsTo(db.User, { foreignKey: 'user_id', targetKey: 'user_id' }); //Users테이블의 user_id를 Participants테이블에서 참조하고 있다(user_id로)
    db.Participant.hasMany(db.Messege, { foreignKey: 'participant_id', sourceKey: 'participant_id' });
    db.Participant.hasMany(db.Messege, { foreignKey: 'room_id', sourceKey: 'room_id' });

  }
};

