let path = require('path');
let Sequelize = require('sequelize');
let sequelize = null;
let User = null;
let ResumeInfo = null;
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
    // sequelize.sync().then();
    //账号表
    User = sequelize.define('user', {
        username: Sequelize.STRING,
        password: Sequelize.STRING,
    }, {
        freezeTableName: true
    });
    //账号简历信息表
    ResumeInfo = sequelize.define('resumeinfo', {
        resume_account: Sequelize.STRING,
        resume_phonenum: Sequelize.INTEGER,
        resume_mail: Sequelize.STRING,
        resume_url: Sequelize.STRING,
        resume_address: Sequelize.STRING,
        resume_introduce_title: Sequelize.STRING,
        resume_introduce_start: Sequelize.STRING,
        resume_introduce_content: Sequelize.STRING,
    }, {
        freezeTableName: true
    })

}

//获取用户信息
module.exports.findUser = function (username) {
    return User.findOne({
        where: {
            username: username
        }
    })
}
//注册
module.exports.addUser = function (username, password) {
    User.findOrCreate({
        where: {
            username: username
        },
        defaults: {
            password: password
        }
    })
}
//获取账号简历信息
module.exports.showResume = function (username) {
    return ResumeInfo.findOne({
        where: {
            resume_account: username
        }
    })
}