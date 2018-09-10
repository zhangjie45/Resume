;(function () {
    'use strict';
    var pieChart = function () {
        $('.chart').easyPieChart({
            scaleColor: false,
            lineWidth: 4,
            lineCup: 'butt',
            barColor: '#99ccff',
            trackColor: "#f5f5f5",
            size: 160,
            animate: 1000
        });
    };
    //Parallax
    var parallax = function () {
        $(window).stellar();
    };
    var contentWayPoint = function () {
        var i = 0;
        $('.animate-box').waypoint(function (direction) {
            if (direction === 'down' && !$(this.element).hasClass('animated-fast')) {
                i++;
                $(this.element).addClass('item-animate');
                setTimeout(function () {
                    $('body .animate-box.item-animate').each(function (k) {
                        var el = $(this);
                        setTimeout(function () {
                            var effect = el.data('animate-effect');
                            if (effect === 'fadeIn') {
                                el.addClass('fadeIn animated-fast');
                            } else if (effect === 'fadeInLeft') {
                                el.addClass('fadeInLeft animated-fast');
                            } else if (effect === 'fadeInRight') {
                                el.addClass('fadeInRight animated-fast');
                            } else {
                                el.addClass('fadeInUp animated-fast');
                            }
                            el.removeClass('item-animate');

                        }, k * 100, 'easeInOutExpo');
                    });

                }, 50);
            }
        }, {offset: '85%'});
    };
    var skillsWayPoint = function () {
        if ($('#resume-skills').length > 0) {
            $('#resume-skills').waypoint(function (direction) {
                if (direction === 'down' && !$(this.element).hasClass('animated')) {
                    setTimeout(pieChart, 400);
                    $(this.element).addClass('animated')
                }
            }, {offset: '90%'});
        }
    };
    $(function () {
        contentWayPoint();
        parallax();
        skillsWayPoint();
    });
}());