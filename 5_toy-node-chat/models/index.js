'use strict';

const path = require('path');
const Sequelize = require('sequelize-oracle');
const User = require('./user');
const Message = require('./messege');
const Participant = require('./participant');
const Room = require('./room');

const env = process.env.NODE_ENV || 'development';
const db = {};
const basename = path.basename(__filename);
const config = require(__dirname + '/../config/config.json')[env];

let sequelize;

//sequalize 객체 생성
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

//db객체에 생성한객체를 넣어줌
db.sequelize = sequelize;

//다른곳에서도 같은 Sequalize 객체를 사용하도록
db.Sequelize = Sequelize;

db.User = User(sequelize, Sequelize);      
//db.Message = Message(sequelize, Sequelize);      
//db.Participant = Participant(sequelize, Sequelize);      
//db.Room = Room(sequelize, Sequelize);      

module.exports = db;//이로써 다른 파일에서도 sequalize와 User에 접근이 가능하다. 
