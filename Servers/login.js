const main = require('./main.js');

main.initAll().then(res => {
    main.start();
}).catch(err => {
    if (err) {
        console.log(err);
    }
})