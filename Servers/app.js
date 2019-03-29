let express = require('express');
let db = require('./db.js');
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

app.get('/', function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.resirect("../web/web_index/resume.html")
});
app.get('/resume', function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    return new Promise((reslove, reject) => {
        db.findUser('张三').then(user => {
            if (!user) {
                res.status(200).send({
                    "code": 200,
                    "message": L10N.ERROR_USER_PASSWD
                });
            } else {
                res.status(200).send(user);
            }
        })
    })

});
app.post('/addUser', function (req, res, next) {
    let name = req.body.username || null;
    let password = req.body.password || null;
    if (!name || !password) {
        res.send({
            "code": 200,
            "message": L10N.ERROR_PARAMETER
        });
        return next();
    }
    db.addUser(name, password);
    res.send({
        "code": 200,
        "message": "Success"
    })

})

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log(host, port)
})