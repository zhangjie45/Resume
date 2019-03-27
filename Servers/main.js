var db = require('./db.js');
var app = require('./app.js');


module.exports.start = function () {
    app.start();
};

module.exports.initAll = function () {
    return new Promise((resolve, reject) => {
        db.init();
    });

};