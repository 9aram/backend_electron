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

<script>
    // for form validation
    var unsupportedBrowsers = false;
    if ((navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) || (navigator.userAgent.match(/MSIE\s(?!10)/))) {
        unsupportedBrowsers = true;
    }

    // Tests with Modernizr if supports HTML5 placeholder="" attribute. If old browser, load necessary JS files and run them
    if (!Modernizr.input.placeholder) {
        Modernizr.load({
            load: [
                'http://lab.alexcican.com/minimal_signup_form/placeholder.min.js',
            ],
            complete: function(){
                $('input').placeholder();
            }
        })
    }

    // ugly browser sniffer for form validation
    if (unsupportedBrowsers) {
        Modernizr.load({
            load: [
                'http://lab.alexcican.com/minimal_signup_form/jquery.validate.min.js'
            ],
            complete: function(){
                // parse through each required input
                $('form').find('input[required]').each(function () {
                    // add a class to each required field with "required" & the input type
                    // using the normal "getAttribute" method because jQuery's attr always returns "text"
                    $(this).attr('class', 'required ' + this.getAttribute('type')).removeAttr('required');
                });

                // call jQuery validate plugin on each form
                $('form').each(function () {
                    $(this).validate();
                });
            }
        })
    }



    // check password strength on key up
    $('#password').keyup(function() {
        var pass = $(this).val();
        var cacheResult = checkPassStrength(pass);
    })

    // on blur makes passwordMeter border same colour as not focused
    $('#password').blur(function() {
        $('#passwordMeter').addClass('blur');
    })

    // on focus removes class that makes passwordMeter border same colour as not focused
    $('#password').focus(function() {
        if ($('#passwordMeter').hasClass('blur'))
            $('#passwordMeter').removeClass('blur');
    })



    // rates user's password
    function scorePassword(pass) {
        var i = pass.length,
            score = 0;
        if (i >= 7) {
            score += /[a-z]/.test(pass) ? 3 : 0;
            score += /[A-Z]/.test(pass) ? 4 : 0;
            score += /\d/.test(pass) ? 1 : 0;
            score += /[^\w\d\s]/.test(pass) ? 1 : 0;
        }
        if (i >= 22 && score >= 9)
            score += 1;

        return score;
    }

    // adds classes depending on score
    function checkPassStrength(pass) {
        var score = scorePassword(pass);
        console.log(score);
        if (score < 1)
            $('#password, #passwordMeter').removeClass().addClass('weak');
        if (score >= 7)
            $('#password, #passwordMeter').removeClass().addClass('good');
        if (score >= 8)
            $('#password, #passwordMeter').removeClass().addClass('better');
        if (score >= 9)
            $('#password, #passwordMeter').removeClass().addClass('strong');
        if (score >= 10)
            $('#password, #passwordMeter').removeClass().addClass('military');
    }

</script>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    @font-face {
        font-family: 'form';
        src: url("fonts/form.eot");
    }
    @font-face {
        font-family: 'form';
        src: url(data:application/x-font-ttf;charset=utf-8;base64,AAEAAAALAIAAAwAwT1MvMg6vDWgAAAC8AAAAYGNtYXAAbgBfAAABHAAAADxnYXNwAAAAEAAAAVgAAAAIZ2x5ZuVMt8gAAAFgAAAApGhlYWQAJ3CxAAACBAAAADZoaGVhB5kD7QAAAjwAAAAkaG10eAYAACkAAAJgAAAADGxvY2EACgBSAAACbAAAAAhtYXhwAAcANAAAAnQAAAAgbmFtZXPEmewAAAKUAAABHnBvc3QAAwAAAAADtAAAACAAAwQAAZAABQAAApkCzAAAAI8CmQLMAAAB6wAzAQkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAACAAPgPA/8D/wAPAAEAAAAAAAAAAAAAAAAAAAAAgAAAAAAACAAAAAwAAABQAAwABAAAAFAAEACgAAAAGAAQAAQACACAAPv//AAAAIAA+////4f/EAAEAAAAAAAAAAQAB//8ADwABAAAAAAAAAAAAAgAANzkBAAAAAAMAKf/2A9cDpAAUACkAMQAAExQeAjMyPgI1NC4CIyIOAhUhFA4CIyIuAjU0PgIzMh4CFSUVMxU3JxUjKUqArGJirIBKSoCsYmKsgEoDSDpkhkxMhmQ6OmSGTEyGZDr9ytHDw9EBzWKsgEpKgKxiYqyASkqArGJMhmQ6OmSGTEyGZDo6ZIZMXLhzz89zAAAAAAEAAAABAABSMHaPXw889QALBAAAAAAAzpiWDQAAAADOmJYNAAD/9gPXA6QAAAAIAAIAAAAAAAAAAQAAA8D/wAAABAAAAAApA9cAAQAAAAAAAAAAAAAAAAAAAAMAAAAAAgAAAAQAACkAAAAAAAoAUgABAAAAAwAyAAMAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAADgCuAAEAAAAAAAEACAAAAAEAAAAAAAIADgAyAAEAAAAAAAMACAAeAAEAAAAAAAQACABAAAEAAAAAAAUAFgAIAAEAAAAAAAYABAAmAAEAAAAAAAoAKABIAAMAAQQJAAEACAAAAAMAAQQJAAIADgAyAAMAAQQJAAMACAAeAAMAAQQJAAQACABAAAMAAQQJAAUAFgAIAAMAAQQJAAYACAAqAAMAAQQJAAoAKABIAGYAbwByAG0AVgBlAHIAcwBpAG8AbgAgADAALgAwAGYAbwByAG1mb3JtAGYAbwByAG0AUgBlAGcAdQBsAGEAcgBmAG8AcgBtAEcAZQBuAGUAcgBhAHQAZQBkACAAYgB5ACAASQBjAG8ATQBvAG8AbgAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=) format("truetype"), url(data:application/font-woff;charset=utf-8;base64,d09GRgABAAAAAAQgAAsAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABPUy8yAAABCAAAAGAAAABgDq8NaGNtYXAAAAFoAAAAPAAAADwAbgBfZ2FzcAAAAaQAAAAIAAAACAAAABBnbHlmAAABrAAAAKQAAACk5Uy3yGhlYWQAAAJQAAAANgAAADYAJ3CxaGhlYQAAAogAAAAkAAAAJAeZA+1obXR4AAACrAAAAAwAAAAMBgAAKWxvY2EAAAK4AAAACAAAAAgACgBSbWF4cAAAAsAAAAAgAAAAIAAHADRuYW1lAAAC4AAAAR4AAAEec8SZ7HBvc3QAAAQAAAAAIAAAACAAAwAAAAMEAAGQAAUAAAKZAswAAACPApkCzAAAAesAMwEJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAgAD4DwP/A/8ADwABAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAgAAAAMAAAAUAAMAAQAAABQABAAoAAAABgAEAAEAAgAgAD7//wAAACAAPv///+H/xAABAAAAAAAAAAEAAf//AA8AAQAAAAAAAAAAAAIAADc5AQAAAAADACn/9gPXA6QAFAApADEAABMUHgIzMj4CNTQuAiMiDgIVIRQOAiMiLgI1ND4CMzIeAhUlFTMVNycVIylKgKxiYqyASkqArGJirIBKA0g6ZIZMTIZkOjpkhkxMhmQ6/crRw8PRAc1irIBKSoCsYmKsgEpKgKxiTIZkOjpkhkxMhmQ6OmSGTFy4c8/PcwAAAAABAAAAAQAAUjB2j18PPPUACwQAAAAAAM6Ylg0AAAAAzpiWDQAA//YD1wOkAAAACAACAAAAAAAAAAEAAAPA/8AAAAQAAAAAKQPXAAEAAAAAAAAAAAAAAAAAAAADAAAAAAIAAAAEAAApAAAAAAAKAFIAAQAAAAMAMgADAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAA4ArgABAAAAAAABAAgAAAABAAAAAAACAA4AMgABAAAAAAADAAgAHgABAAAAAAAEAAgAQAABAAAAAAAFABYACAABAAAAAAAGAAQAJgABAAAAAAAKACgASAADAAEECQABAAgAAAADAAEECQACAA4AMgADAAEECQADAAgAHgADAAEECQAEAAgAQAADAAEECQAFABYACAADAAEECQAGAAgAKgADAAEECQAKACgASABmAG8AcgBtAFYAZQByAHMAaQBvAG4AIAAwAC4AMABmAG8AcgBtZm9ybQBmAG8AcgBtAFIAZQBnAHUAbABhAHIAZgBvAHIAbQBHAGUAbgBlAHIAYQB0AGUAZAAgAGIAeQAgAEkAYwBvAE0AbwBvAG4AAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA) format("woff");
        font-weight: normal;
        font-style: normal;
    }
    [class*="icon-"] {
        font-family: 'form';
        speak: none;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        text-transform: none;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .icon-arrow-right:before {
        content: "\3e";
    }

    body, input {
        font-family: "Avenir Next", Avenir, "Segoe UI", Roboto, "Helvetica Neue", sans-serif;
    }

    body {
        line-height: 1.6;
        -webkit-font-smoothing: antialiased;
        background: #fff;
        color: #111;
    }

    a {
        color: #e74c3c;
        text-decoration: none;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    a:hover {
        text-decoration: underline;
        color: #111;
    }

    form {
        margin: 12% auto;
        width: 19em;
        text-align: center;
        position: relative;
        -webkit-animation: moveDown .3s;
        -moz-animation: moveDown .3s;
        animation: moveDown .3s;
        -webkit-animation-fill-mode: forwards;
        -moz-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
    }

    @-webkit-keyframes moveDown {
        0% {
            -webkit-transform: translate(0, -10%);
            opacity: 0;
        }
        100% {
            -webkit-transform: translate(0, 0);
            opacity: 1;
        }
    }
    @-moz-keyframes moveDown {
        0% {
            -moz-transform: translate(0, -10%);
            opacity: 0;
        }
        100% {
            -moz-transform: translate(0, 0);
            opacity: 1;
        }
    }
    @keyframes moveDown {
        0% {
            transform: translate(0, -10%);
            opacity: 0;
        }
        100% {
            transform: translate(0, 0);
            opacity: 1;
        }
    }
    input:-webkit-autofill {
        -webkit-box-shadow: 0 0 0px 1000px white inset;
    }

    input {
        color: #444;
        font-size: 1.5em;
        outline: none;
        box-shadow: none;
        -webkit-appearance: none;
        border-radius: 0;
        border-top: none;
        border-left: solid 1px;
        border-right: solid 1px;
        border-bottom: solid 1px;
        border-color: #bbb;
        background: transparent;
        display: block;
        height: 2em;
        width: 12em;
        margin-bottom: 5%;
        padding: 0 3%;
        position: relative;
        z-index: 0;
        -webkit-transition: border .25s;
        -moz-transition: border .25s;
        -o-transition: border .25s;
        transition: border .25s;
    }

    input:focus {
        color: #111;
        border-color: #444;
    }

    #password {
        width: 10.5em;
        padding-right: 1.85em;
    }

    .input, #passwordMeter {
        speak: none;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        display: block;
        position: relative;
        width: .25em;
        height: 3em;
        background: #fff;
        margin: 0% 0 -2em;
        z-index: 1;
    }

    .input:after, #passwordMeter:after {
        content: '';
        width: 1em;
        height: 100%;
        position: absolute;
        right: -19.5em;
        background: #fff;
    }

    .placeholder {
        color: #999;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    ::-webkit-input-placeholder {
        color: #999;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    :-moz-placeholder {
        color: #999;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    :-ms-input-placeholder {
        color: #999;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    .placeholder:focus {
        color: #ddd;
    }

    input:focus::-webkit-input-placeholder {
        color: #ddd;
    }

    input:focus::-moz-input-placeholder {
        color: #ddd;
    }

    input:focus::-ms-input-placeholder {
        color: #ddd;
    }

    .error {
        border-color: #E35F5F;
        color: #E35F5F;
    }

    .error + button {
        margin-bottom: 2em;
    }

    #passwordMeter:before {
        content: '';
        height: 1px;
        position: absolute;
        bottom: -17px;
        left: 0;
        -webkit-transition: width .3s;
        -moz-transition: width .3s;
        -o-transition: width .3s;
        transition: width .3s;
    }

    #passwordMeter.blur:before {
        width: 0 !important;
    }

    .weak:focus {
        border-left-color: #E35F5F;
    }

    #passwordMeter.weak:before {
        background: #E35F5F;
        width: 3.8em;
    }

    .good:focus {
        border-left-color: #87E696;
    }

    #passwordMeter.good:before {
        background: #87E696;
        width: 7.6em;
    }

    .better:focus {
        border-left-color: #55D969;
    }

    #passwordMeter.better:before {
        background: #55D969;
        width: 11.4em;
    }

    .strong:focus {
        border-left-color: #3EC753;
    }

    #passwordMeter.strong:before {
        background: #3EC753;
        width: 15.2em;
    }

    .military:focus {
        border-color: #10AD27;
    }

    #passwordMeter.military:before {
        background: #10AD27;
        width: 19em;
    }

    button {
        outline: none;
        -webkit-appearance: none;
        border: none;
        background: transparent;
        color: #bbb;
        font-size: 2.05em;
        padding: 3% 7%;
        cursor: pointer;
        position: absolute;
        right: -6%;
        bottom: 0%;
        -webkit-transition: color .2s;
        -moz-transition: color .2s;
        -o-transition: color .2s;
        transition: color .2s;
    }

    button:hover, button:focus {
        color: #111;
    }

    button span {
        display: none;
    }

    div {
        margin: 15% auto 0;
        max-width: 32em;
        -webkit-animation: moveDown .3s;
        -moz-animation: moveDown .3s;
        animation: moveDown .3s;
        -webkit-animation-fill-mode: forwards;
        -moz-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
    }

    p {
        margin-bottom: .8em;
    }

    footer {
        text-align: center;
        padding: 3% 0;
        opacity: .3;
        -webkit-transition: all .3s;
        -moz-transition: all .3s;
        -o-transition: all .3s;
        transition: all .3s;
    }

    footer:hover {
        opacity: 1;
    }

    .twitter-share-button {
        vertical-align: -15%;
        margin-right: -25px !important;
    }

</style>
<body>

<form  action="login_controller.jspx?cmd=insertMember" method="post" >
    <h1 >회원가입페이지</h1>
    <input type="text"  name="id"   placeholder="Enter your ID" autofocus required>
    <input type="password" name="pw"   placeholder="Enter your password" required>
    <input type="submit"   value="Sign up!" >

    <a href="loginForm.jsp">되돌아가기</a>
    <a href="download_page.html">다운로드</a>

</form>
</body>
</html>
