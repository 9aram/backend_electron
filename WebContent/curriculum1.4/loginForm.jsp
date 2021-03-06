<%--
  Created by IntelliJ IDEA.
  User: CP
  Date: 2019-01-11
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
                                               pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/myscript.js"></script>
<style type="text/css">
    body {
        font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
        color: #333333;
        background: #596778;
    }

    .signUp {
        position: relative;
        margin: 50px auto;
        width: 280px;
        padding: 33px 25px 29px;
        background: #FFFFFF;
        border-bottom: 1px solid #C4C4C4;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
        box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    }

    .signUp:before,
    .signUp:after {
        content: '';
        position: absolute;
        bottom: 1px;
        left: 0;
        right: 0;
        height: 10px;
        background: inherit;
        border-bottom: 1px solid #D2D2D2;
        border-radius: 4px;
    }

    .signUp:after {
        bottom: 3px;
        border-color: #DCDCDC;
    }

    .signUpTitle {
        margin: -25px -25px 25px;
        padding: 15px 25px;
        line-height: 35px;
        font-size: 26px;
        font-weight: 300;
        color: #777;
        text-align: center;
        text-shadow: 0 1px rgba(255, 255, 255, 0.75);
        background: #F7F7F7;
    }

    .signUpTitle:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 8px;
        background: #C4E17F;
        border-radius: 5px 5px 0 0;
        background-image: -webkit-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #db9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
        background-image: -moz-linear-gradient(left, #c4e17f, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
        background-image: -o-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCC 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9DBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
        background-image: linear-gradient(to right, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #c49cde 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62c2e4 87.5%, #62C2E4);
    }

    input {
        font-family: inherit;
        color: inherit;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .signUpInput {
        width: 100%;
        height: 50px;
        margin-bottom: 25px;
        padding: 0 15px 2px;
        font-size: 17px;
        background: white;
        border: 2px solid #EBEBEB;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 -2px #EBEBEB;
        box-shadow: inset 0 -2px #EBEBEB;
    }

    .signUpInput:focus {
        border-color: #62C2E4;
        outline: none;
        -webkit-box-shadow: inset 0 -2px #62C2E4;
        box-shadow: inset 0 -2px #62C2E4;
    }

    .lt-ie9 .signUpInput {
        line-height: 48px;
    }

    .signUpButton {
        position: relative;
        vertical-align: top;
        width: 100%;
        height: 54px;
        padding: 0;
        font-size: 22px;
        color: white;
        text-align: center;
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
        background: #F0776C;
        border: 0;
        border-bottom: 2px solid #D76B60;
        border-radius: 5px;
        cursor: pointer;
        -webkit-box-shadow: inset 0 -2px #D76B60;
        box-shadow: inset 0 -2px #D76B60;
    }

    .signUpButton:active {
        top: 1px;
        outline: none;
        -webkit-box-shadow: none;
        box-shadow: none;
    }
    .joinButton{
        position: relative;
        vertical-align: top;
        display: block;
        text-decoration: none;
        height: 54px;
        padding: 0;
        font-size: 22px;
        color: white;
        text-align: center;
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
        background: #F0776C;
        border: 0;
        border-bottom: 2px solid #D76B60;
        border-radius: 5px;
        cursor: pointer;
        -webkit-box-shadow: inset 0 -2px #D76B60;
        box-shadow: inset 0 -2px #D76B60;
    }
</style>
<body>


<form class="signUp" id="signupForm" action="login_controller.jspx?cmd=loginConfirm" method="post">
    <h1 class="signUpTitle">로그인페이지</h1>
    <input type="text"  name="id" class="signUpInput" placeholder="Enter your ID" autofocus required>
    <input type="password"  name="pw" class="signUpInput" placeholder="Enter your password" required>
    <input type="submit" value="Sign in!" class="signUpButton">
    <input type="button" value="회원가입" class="signUpButton">

    <a href="signUpForm.jsp" class="joinButton">회원가입</a>
</form>
</body>
</html>
