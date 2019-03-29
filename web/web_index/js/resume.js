window.onload = function () {
    showName();
}
$(function () {
    var mySwiper = new Swiper('.swiper-container', {
        mousewheel: true,
        keyboardControl: false, //不能使用键盘进行控制
        direction: 'vertical',
        loop: false,
        longSwipesRatio: 0.5,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });
})

function showName() {
    $.ajax({
        url: 'http://127.0.0.1:8080/resume',
        type: 'get',
        success: function (data, request) {
            $("#user_name").text(data.username);
            $("#user_age").text(data.age);
            $("#user_sex").text(data.sex);
            console.log(JSON.stringify(data));
        },
        error: function (err) {
            alert(err.message || "服务器错误");
        }
    })

}