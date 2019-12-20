<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }
        body{
            text-align: center;
        	background-color: #D8D7D7;
        }
        #logo img{
            width: 400px;
        }
        form input{
            margin-bottom: 5px;
        }
        #join{
            margin-top: 10px;
            border: 0;
            width: 150px;
            height: 50px;
            background-color: transparent;
            font-size: 2rem;
        }
    </style>
</head>
<body>
	<div id="logo"><img src="/resources/salt-logo.jpg"></div>
	<h2>JOIN US</h2>
	<form action="/join" method="post">
		ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input name="id" type="text"> <br>
		PW &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input name="pwd" type="password"><br>
		NAME : <input name="name"><br>
		EMAIL : <input name="email" type="text"><br>
		<input id="join" type="submit" value="회원가입">
	</form>
</body>
</html>