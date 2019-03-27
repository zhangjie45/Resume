let express = require('express');
let user = require('./db.js');
let http = require('http');
const bodyParser = require('body-parser');
var app = express();

const L10N = {
    "ERROR_PARAMETER": "参数不正确",
    "ERROR_USER_PASSWD": "用户名或密码错误",
    "ERROR_MAX_LOGIN_TIME": "登录次数过多",
    "ERROR_NOT_LOGIN": "用户未登录",
    "ERROR_INTERNAL_SERVER": "服务器错误",
    "ERROR_ACCOUNT_TIME_ZERO": "帐户使用时间为0，请联系管理员重新激活",

}

let appInit = function (app) {
    app.use(bodyParser.urlencoded({
        extended: false
    }));
    app.use(bodyParser.json());
}
// let appRest = function (app) {
//如果用户直接进入127.0.0.1:3000 则将url地址重定向为remove.html
app.get('/', function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.resirect("../web/web_index/resume.html")
});
app.get('/resume', function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    return new Promise((reslove, reject) => {
        user.findUser('张三').then(user => {
            console.log(user);
            if (!user) {
                res.status(200).send({
                    "code": 200,
                    "message": L10N.ERROR_USER_PASSWD
                });
            } else {
                res.status(200).send(user.username);
            }
        })
    })

});

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log("应用实例，访问地址为 http://%s:%s", host, port)

})
// }
let httpServerInit = function (app) {
    var httpsServer = http.createServer(app);

    httpsServer.listen((_config.EXPORT || 8081), function () {
        logger.info("example app is listening at " + (_config.EXPORT || 8081) + " port");
    });
}
module.exports.start = function () {
    const app = express();
    appInit(app);
    appRest(app);
    httpServerInit(app);

}