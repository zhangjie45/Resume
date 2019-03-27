let path = require('path');
let Sequelize = require('sequelize');
let sequelize = null;
let User = null;

module.exports.init = function () {

    sequelize = new Sequelize('main', null, null, {
        host: 'localhost',
        dialect: 'sqlite',
        storage: path.join(__dirname, './db/user.sqlite'),
        pool: {
            max: 5,
            min: 0,
            acquire: 30000,
            idle: 10000
        },

    });
    // sequelize.sync().then(function () {
    //     return User.create({
    //         username: "张三",
    //         password: "123456",
    //         age: 18,
    //     })
    // });
    User = sequelize.define('user', {
        username: Sequelize.STRING,
        password: Sequelize.STRING,
        age: Sequelize.INTEGER,

    }, {
        freezeTableName: true
    });

}

//获取用户信息
module.exports.findUser = function (username) {
    return User.findOne({
        where: {
            username: username
        }
    })
}