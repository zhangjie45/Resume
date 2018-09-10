<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2018/9/6
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="entity.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>


    <link rel="stylesheet" href="css/swiper.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/icomoon.css"/>
    <link rel="stylesheet" href="css/custom.popup-v1.2.css"/>
    <style>
        @font-face {
            font-family: 'icomoon';
            src: url("fonts/icomoon/icomoon/fonts/icomoon.eot");
            src: url("fonts/icomoon/icomoon/fonts/icomoon.eot#iefix") format("embedded-opentype"), url("fonts/icomoon/icomoon/fonts/icomoon.ttf?srf3rx") format("truetype"), url("fonts/icomoon/icomoon/fonts/icomoon.woff?srf3rx") format("woff"), url("fonts/icomoon/icomoon/fonts/icomoon.svg?srf3rx#icomoon") format("svg");
            font-weight: normal;
            font-style: normal;
        }

        html, body {
            position: relative;
            height: 100%;
        }

        body {
            font-family: "Space Mono", Arial, serif;
            font-weight: 400;
            font-size: 16px;
            line-height: 1.7;
            color: #4d4d4d;
            background: #eee;
            margin: 0;
            padding: 0;
        }

        a, h1, h2, h3, h4, h5, h6, figure {
            color: #000;
            font-family: "Space Mono", Arial, serif;
            font-weight: 400;
            margin: 0 0 20px 0;

        }

        .swiper-container {
            width: 100%;
            height: 100%;
            position: relative;
        }

        .swiper-slide {
            /*     text-align: center;*/
            /*     font-size: 18px;*/
            background: #ffffff;
        }

        /*首页css*/
        .home_page {
            height: 100%;
            width: 100%;
            background-color: #336666;
        }

        .home_introduce {
            margin-top: 12%;

        }

        .social_contact {
            margin: 0;
            padding: 0;

        }

        .social_contact li {
            display: -moz-inline-stack;
            margin: 0;
            padding: 0;
            list-style: none;
            display: inline-block;
            zoom: 1;
            *display: inline;
        }

        .social_contact li a {
            display: -moz-inline-stack;
            list-style: none;
            display: inline-block;
            zoom: 1;
            *display: inline;
            padding-left: 10px;
            padding-right: 10px;
            color: #ffffff;
            text-decoration: none;

        }

        .social_contact li a i {
            font-size: 36px;

        }

        /*个人介绍css*/
        #introduce_oneself {

            padding: 3em 0;
            clear: both;
        }

        @media screen and (max-width: 736px) {
            #remove-hobby,
            #resume-skills,
            #introduce_oneself {
                padding: 1em 0;
            }

        }

        .introduce_heading {
            margin-bottom: 5em;
        }

        .introduce_heading h2 {
            font-size: 40px;
            margin-bottom: 20px;
            /*1.5倍行间距*/
            line-height: 1.5;
            color: #000000;
        }

        .introduce_heading p {
            font-size: 18px;
            line-height: 1.5;
            color: #828282;
        }

        .introduce_heading span {
            font-size: 12px;
            /*将文字形成块的形式，每句结束出现换行符*/
            display: block;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 2px;
        }

        .info {
            text-align: left;
            margin: 0;
            padding: 0;
            width: 90%;
            float: left;
        }

        @media screen and (max-width: 768px) {
            .info {
                margin-bottom: 3em;
            }
        }

        .info li {

            width: 100%;
            float: left;
            list-style: none;
            padding: 10px 0;
        }

        .info li:first-child {
            padding-top: 0;
        }

        .info li .first-block {
            width: 40%;
            display: inline-block;
            float: left;
            color: #000;
            font-weight: bold;
        }

        .info li .second-block {
            width: 60%;
            display: inline-block;
            color: rgba(0, 0, 0, 0.5);
        }

        #introduce_oneself .social_contact {
            margin: 0;
            padding: 0;
        }

        #introduce_oneself .social_contact li {
            padding: 0;
            list-style: none;
            display: inline-block;
            *disply: inline;
            zoom: 1;
            display: -moz-inline-stack;
        }

        #introduce_oneself .social_contact li a {
            display: -moz-inline-stack;
            display: inline-block;
            *display: inline;
            zoom: 1;
            color: #ffffff;
            background: #336666;
            padding: 10px 10px 2px 10px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            list-style: none;
            -ms-border-radius: 2px;
            /* 圆角按钮*/
            border-radius: 2px;
        }

        #introduce_oneself .social_contact li a i {
            font-size: 20px;
        }

        #introduce_oneself .social_contact li a:hover {
            background: #999999;
        }

        /*教育经历CSS*/
        .timeline {
            list-style: none;
            padding: 20px 0 20px;
            position: relative;
        }

        .timeline:before {
            top: 0;
            bottom: 0;
            position: absolute;
            content: " ";
            width: 3px;
            background-color: #eeeeee;
            left: 50%;
            margin-left: -1.5px;
        }

        .timeline > li {
            margin-bottom: 20px;
            position: relative;
        }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li > .timeline-panel {
            width: 46%;
            float: left;
            border: 1px solid #d4d4d4;
            border-radius: 2px;
            padding: 20px;
            position: relative;
            -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
            box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
        }

        .timeline > li > .timeline-panel:before {
            position: absolute;
            top: 26px;
            right: -15px;
            display: inline-block;
            border-top: 15px solid transparent;
            border-left: 15px solid #ccc;
            border-right: 0 solid #ccc;
            border-bottom: 15px solid transparent;
            content: " ";
        }

        .timeline > li > .timeline-panel:after {
            position: absolute;
            top: 27px;
            right: -14px;
            display: inline-block;
            border-top: 14px solid transparent;
            border-left: 14px solid #fff;
            border-right: 0 solid #fff;
            border-bottom: 14px solid transparent;
            content: " ";
        }

        .timeline > li > .timeline-badge {
            color: #fff;
            width: 50px;
            height: 50px;
            line-height: 50px;
            font-size: 1.4em;
            text-align: center;
            position: absolute;
            top: 16px;
            left: 50%;
            margin-left: -25px;
            background-color: #999999;
            z-index: 100;
            border-top-right-radius: 50%;
            border-top-left-radius: 50%;
            border-bottom-right-radius: 50%;
            border-bottom-left-radius: 50%;
        }

        .timeline > li.timeline-inverted > .timeline-panel {
            float: right;
        }

        .timeline > li.timeline-inverted > .timeline-panel:before {
            border-left-width: 0;
            border-right-width: 15px;
            left: -15px;
            right: auto;
        }

        .timeline > li.timeline-inverted > .timeline-panel:after {
            border-left-width: 0;
            border-right-width: 14px;
            left: -14px;
            right: auto;
        }

        .timeline-badge.primary {
            background-color: #2e6da4 !important;
        }

        .timeline-badge.success {
            background-color: #3f903f !important;
        }

        .timeline-badge.warning {
            background-color: #f0ad4e !important;
        }

        .timeline-badge.danger {
            background-color: #d9534f !important;
        }

        .timeline-badge.info {
            background-color: #5bc0de !important;
        }

        .timeline-title {
            margin-top: 0;
            color: inherit;
        }

        .timeline-body > p,
        .timeline-body > ul {
            margin-bottom: 0;
        }

        .timeline-body > p + p {
            margin-top: 5px;
        }

        /* 技能CSS*/
        .skills-heading {
            padding: 3em 0;
            clear: both;
        }

        .skills-heading h2 {
            font-size: 40px;
        }

        .row-pb-md {
            padding-bottom: 4em !important;
        }

        .chart {
            width: 160px;
            height: 160px;
            margin: 0 auto 40px auto;
            position: relative;
            text-align: center;
        }

        .chart span {
            position: absolute;
            top: 50%;
            left: 0;
            margin-top: -30px;
            width: 100%;
        }

        .chart span strong {
            display: block;
        }

        .chart canvas {
            position: absolute;
            left: 0;
            top: 0;
        }

        .progress-wrap {
            width: 100%;
            float: left;
            margin-bottom: 10px;
        }

        .progress-wrap h3 {
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
            float: left;
            width: 100%;
        }

        .progress-wrap h3 .name-left {
            float: left;
        }

        .progress-wrap h3 .value-right {
            float: right;
        }

        .progress {
            width: 100%;
            float: left;
            height: 5px;
            box-shadow: none;
        }

        .progress-bar {
            background-color: #2F3C4F;
            height: 5px;
            display: block;
            box-shadow: none;
        }

        .progress-bar.progress-bar-1 {
            background-color: #2980b9 !important;
        }

        .progress-bar.progress-bar-3 {
            background-color: #d35400 !important;
        }

        .progress-bar.progress-bar-5 {
            background-color: #27ae60 !important;
        }

        /* 爱好*/
        #remove-hobby {
            padding: 3em 0;
            clear: both;
        }

        .remove-hobby-bg {
            height: 100%;
            width: 100%;
            background: #99ccff;
        }

        .hobby-heading {
            margin-bottom: 5em;
        }

        .hobby-heading.hobby-heading-sm {
            margin-bottom: 2em;
        }

        .hobby-heading h2 {
            font-size: 40px;
            line-height: 1.5;
            color: #ffffff;
        }

        .hobby-heading p {
            font-size: 18px;
            line-height: 1.5;
            color: #828282;
        }

        .hobby-heading span {
            display: block;
            margin-bottom: 10px;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 2px;
        }

        .col-padding {
            padding: 6px !important;
            margin: 0px !important;
        }

        .work {
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            position: relative;
            height: 270px;
            width: 100%;
            display: table;
            overflow: hidden;
            text-decoration: none;
        }

        @media screen and (max-width: 768px) {
            .work {
                height: 400px;
            }
        }

        @media screen and (max-width: 480px) {
            .work {
                height: 270px;
            }
        }

        .work .desc {
            display: table-cell;
            vertical-align: middle;
            height: 270px;
            background: #fff;
            opacity: 0;
            -webkit-transition: 0.3s;
            -o-transition: 0.3s;
            transition: 0.3s;

        }

        .work .desc h3 {
            font-size: 20px;
            -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
            transition: transform 0.3s, opacity 0.3s;
            -webkit-transform: translate3d(0, -15px, 0);
            transform: translate3d(0, -15px, 0);

        }

        .work .desc span {
            display: block;
            color: #999999;
            font-size: 14px;
            -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
            transition: transform 0.3s, opacity 0.3s;
            -webkit-transform: translate3d(0, 15px, 0);
            transform: translate3d(0, 15px, 0);
        }

        @media screen and (max-width: 768px) {
            .work .desc {
                text-transform: none;
                opacity: 1;
                background: rgba(255, 255, 255, 0.6);
            }

            .work .desc h3 {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            .work .desc span {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }
        }

        .work:hover {
            text-decoration: none;
        }

        .work:hover .desc {
            opacity: 1;
        }

        .work:hover .desc h3 {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .work:hover .desc span {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .js .animate-box {
            opacity: 0;
        }

        /* 评价*/
        .evaluate, .show-msg {
            display: inline-block;
        }

        @media screen and (max-width: 768px) {
            .evaluate, .show-msg {
                width: 100% !important;
            }
        }

        .show-msg {
            width: 50%;
            padding: 4em;
        }

        @media screen and (max-width: 768px) {
            .show-msg {
                width: 100%;
                padding: 4em 1em;
            }
        }

        .remove-evaluate {
            overflow: hidden;
        }

        @media screen and (max-width: 992px) {
            .remove-evaluate {
                height: 400px;
            }
        }

        .remove-evaluate .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.1);
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
        }

        #consult .evaluate {
            display: table;
            width: 50%;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            position: relative;
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            flex-wrap: wrap;
            -webkit-flex-wrap: wrap;
            -moz-flex-wrap: wrap;
        }

        @media screen and (max-width: 768px) {
            .evaluate {
                display: none;
            }
        }

        #consult {
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            flex-wrap: wrap;
            -webkit-flex-wrap: wrap;
            -moz-flex-wrap: wrap;
            width: 100%;
            float: left;
        }

        #consult .evaluate, #consult .show-msg {
            display: inline-block;
        }


    </style>
    <title>Title</title>
</head>
<body>
<div class="swiper-container">

    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="home_page">
                <!--用于适配不同大小屏幕（栅格化布局） -->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-lg-offset-2 text-center ">
                            <div class="home_introduce">
                                <img src="images/user-3.jpg" style="height: 220px;width: 220px"
                                     class="img-circle ">
                                <% UserInfo user = (UserInfo) request.getAttribute("user");%>
                                <h1 style="color: #ffffff;margin-top: 30px"><span><%=user.name%></span></h1>
                                <h3 style="color: #ffffff;margin-bottom: 25px"><span>性别:<%=user.sex%></span>&nbsp;&nbsp;&nbsp;<span>年龄:<%=user.age%></span>
                                </h3>
                                <p>
                                <ul class="social_contact">
                                    <li><a href="#"><i class="icon-qq"></i></a></li>
                                    <li><a href="https://weibo.com/u/5390908643"><i class="icon-sina-weibo2"></i></a>
                                    </li>
                                    <li><a href="#"><i class="icon-bubbles"></i></a></li>
                                    <li><a href="https://github.com/zhangjie45"><i class="icon-github2"></i></a></li>
                                </ul>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div id="introduce_oneself" class="animate-box">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-lg-offset-2 text-center introduce_heading">
                            <h2>个人信息</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <ul class="info">
                                <li><span class="first-block">姓名:</span><span class="second-block"><%=user.name%></span>
                                </li>
                                <li><span class="first-block">手机号:</span><span
                                        class="second-block"><%=user.phoneNum%></span>
                                </li>
                                <li><span class="first-block">邮箱:</span><span class="second-block"><%=user.mail%></span>
                                </li>
                                <li><span class="first-block">个人网址:</span><span
                                        class="second-block"><%=user.site%></span>
                                </li>
                                <li><span class="first-block">住址:</span><span
                                        class="second-block"><%=user.address%></span>
                                </li>
                            </ul>
                        </div>
                        <div class="col-sm-8">
                            <h2>各位好！</h2>
                            <p>
                                <%=user.introduceHead%>
                            </p>
                            <p>
                                <%=user.introduceContent%>
                            </p>
                            <ul class="social_contact">
                                <li><a href="#"><i class="icon-qq"></i></a></li>
                                <li><a href="https://weibo.com/u/5390908643"><i class="icon-sina-weibo2"></i></a>
                                </li>
                                <li><a href="#"><i class="icon-bubbles"></i></a></li>
                                <li><a href="https://github.com/zhangjie45"><i class="icon-github2"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="swiper-slide">
            <div class="container">
                <div class="page-header">
                    <h1 id="timeline">我的教育经历</h1>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-badge"><i class="icon-graduation-cap"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">高中</h4>
                            </div>
                            <div class="timeline-body">
                                <p>2011-2014：河南省项城市第一高级中学</p>
                            </div>
                        </div>
                    </li>

                    <li class="timeline-inverted">
                        <div class="timeline-badge "><i class="icon-graduation-cap"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">专科</h4>
                            </div>
                            <div class="timeline-body">
                                <p>2014-2017：南京工业职业技术学院</p>
                                <p>专业：移动互联网应用技术</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-badge "><i class="icon-graduation-cap"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">本科</h4>
                            </div>
                            <div class="timeline-body">
                                <p>2017-2019：南京信息工程大学滨江学院</p>
                                <p>专业：软件工程</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="swiper-slide">
            <div id="resume-skills" class="animate-box">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center skills-heading">
                            <h2>技能</h2>
                        </div>
                    </div>
                    <div class="row row-pb-md">
                        <div class="col-md-3 col-sm-6 col-xs-12 text-center">
                            <div class="chart" data-percent="80"><span><strong>80%</strong>HTML5</span></div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12 text-center">
                            <div class="chart" data-percent="93"><span><strong>93%</strong>Java</span></div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12 text-center">
                            <div class="chart" data-percent="91"><span><strong>91%</strong>css3</span></div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12 text-center">
                            <div class="chart" data-percent="89"><span><strong>89%</strong>jQuery</span></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="progress-wrap">
                                <h3><span class="name-left">Html5/css3</span><span class="value-right">100%</span></h3>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-1 progress-bar-striped active"
                                         role="progressbar"
                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                    </div>
                                </div>
                            </div>
                            <div class="progress-wrap">
                                <h3><span class="name-left">PHP</span><span class="value-right">100%</span></h3>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped active"
                                         role="progressbar"
                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="progress-wrap">
                                <h3><span class="name-left">Java</span><span class="value-right">100%</span></h3>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-5 progress-bar-striped active"
                                         role="progressbar"
                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                    </div>
                                </div>
                            </div>
                            <div class="progress-wrap">
                                <h3><span class="name-left">页面设计</span><span class="value-right">80%</span></h3>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-3 progress-bar-striped active"
                                         role="progressbar"
                                         aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div id="remove-hobby" class="remove-hobby-bg">
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-8 col-md-offset-2 text-center hobby-heading">
                            <h2>爱好---相册</h2>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 text-center col-padding animate-box">
                            <a href="#" class="work"
                               style="background-image: url(/web_index/images/portfolio-2.jpg);">
                                <div class="desc">
                                    <h3>游泳</h3>
                                    <span>代码界的孙杨</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 text-center col-padding animate-box">
                            <a href="#" class="work"
                               style="background-image: url(/web_index/images/portfolio-2.jpg);">
                                <div class="desc">
                                    <h3>摄影</h3>
                                    <span>走灵魂摄影风格</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 text-center col-padding animate-box">
                            <a href="#" class="work"
                               style="background-image: url(/web_index/images/portfolio-3.jpg);">
                                <div class="desc">
                                    <h3>宠狗狂魔</h3>
                                    <span>汪汪汪</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 text-center col-padding animate-box">
                            <a href="#" class="work"
                               style="background-image: url(/web_index/images/portfolio-3.jpg);">
                                <div class="desc">
                                    <h3>唱歌</h3>
                                    <span>KTV是我家，我爱我家</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="swiper-slide">
            <div id="consult">
                <div class="show-msg animate-box">
                    <h2>欢迎对我进行评价！</h2>
                    <form action="#" method="post">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <input type="text" id="form_name" name="evaluate_name" class="form-control"
                                       placeholder="姓名">
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-12">
                                <input type="text" id="form_email" name="evaluate_email" class="form-control"
                                       placeholder="您的邮箱">
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-12">
                                <input type="text" id="form_subject" name="evaluate_subject" class="form-control"
                                       placeholder="信息主题">
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-12">
                        <textarea name="message" id="form_message" cols="30" rows="12" class="form-control"
                                  placeholder="你想告诉我啥"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="button" onclick="judgeNull()" value="提交信息" class="btn btn-primary">

                            <input type="button" onclick="clear_msg()" value="清空信息" class="btn btn-default zj">
                        </div>
                    </form>
                </div>
                <div class="evaluate remove-evaluate" style="background-image: url(/web_index/images/cover_bg_1.jpg);">
                    <div class="overlay"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="swiper-pagination"></div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
<script type="text/javascript" src="js/jquery.easypiechart.min.js"></script>
<script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="js/jquery.stellar.min.js"></script>
<script type="text/javascript" src="js/remove_js.js"></script>
<script type="text/javascript" src="js/jquery.custom.popup-v1.2.js"></script>
<script>
    $(function () {
        var mySwiper = new Swiper('.swiper-container', {
            mousewheel: true,
            keyboardControl: false,//不能使用键盘进行控制
            direction: 'vertical',
            loop: false,
            longSwipesRatio: 0.5,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    })
</script>
<script type="text/javascript">
    function judgeNull() {
        var form_name = $('#form_name').val();
        var form_email = $('#form_email').val();
        var form_subject = $('#form_subject').val();
        var form_message = $('#form_message').val();
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if ("" == form_name || "" == form_email || "" == form_subject || "" == form_message) {
            showPopup25({context: "输入内容不能为空"});

        } else if (!reg.test(form_email)) {
            showPopup25({context: "邮箱格式不正确，请重新输入"});

        } else {
            submitMessage();
        }

    }
</script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
    function submitMessage() {
        var form_ip = returnCitySN["cip"];
        var form_name = $('#form_name').val();
        var form_email = $('#form_email').val();
        var form_subject = $('#form_subject').val();
        var form_message = $('#form_message').val();
        $.ajax({
            type: "POST",
            url: "/evaluate",
            data: {
                "form_ip": form_ip,
                "form_name": form_name,
                "form_email": form_email,
                "form_subject": form_subject,
                "form_message": form_message,
            },
            statusCode: {
                404: function () {
                    showPopup25({context: "又报404错误啦"});
                }
            },
            dataType: "text",
            success: function (data) {
                alert("已经成功将数据传送至servlet中，等待发送");
                clear_msg();
            }
        });
    }
</script>
<script type="text/javascript">
    function clear_msg() {
        $(document).ready(function () {
            $(function () {
                $('#form_name').val("");
                $('#form_email').val("");
                $('#form_subject').val("");
                $('#form_message').val("");
            });
        });
    }
</script>
<script type="text/javascript">
    function showPopup25(txt) {
        $.initPopup({isShowBg: true})
            .addButton("关闭").showPopup(txt.context);
    }
</script>
</body>

</html>
