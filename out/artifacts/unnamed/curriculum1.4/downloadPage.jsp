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

    <style>
        *{
            margin: 0 0;
            overflow: hidden;
        }
        li{
            list-style: none;
        }
        .agree ul {
            margin-top: 10px;
        }

        .agree ul li {
            margin-bottom: 15px;
        }

        .agree ul li:after {
            display: block;
            clear: both;
            content: "";
        }

        .agree ul li input[type="checkbox"] {
            display: none;
        }

        .agree ul li input[type="checkbox"] + label {
            width: 17px;
            height: 17px;
            background: #fa3062;
            cursor: pointer;
            border-radius: 3px;
            float: right;
        }

        .agree ul li input[type="checkbox"]:checked + label {
            background: #fa3062 no-repeat center/10px 10px;
            float: right
        }

        .agree ul li input[type="checkbox"] + label span {
            position: absolute;
            left: 0px;
            display: block;
        }
        .wrap{
            width : 800px;
            height: 600px;
        }
        .top{
            width: 800px;
            height: 400px;
            border: 1px solid blue;
        }
        .down{
            width: 800px;
            height: 200px;
            border: 1px solid blue;
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="top">
        <button>다운로드</button>
        <ul>
            <li><input type="checkbox" id="a2" name="전체동의"/>
                <label for="a2"><span>이용약관동의 (필수)</span></label>
            </li>

            <li><input type="checkbox" id="a3" name="전체동의"/>
                <label for="a3"><span>개인정보수집이용 동의 (필수)</span></label>
            </li>

            <li><input type="checkbox" id="a4" name="전체동의"/>
                <label for="a4"><span>만 14세 이상 확인 (필수)</span></label>
            </li>
        </ul>
    </div>
    <div class="down">
        <span>${id}님 환영합니다</span>
    </div>
</div>

</body>
</html>
