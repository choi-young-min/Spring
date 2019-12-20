<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body{
        font-family: 'Josefin Sans', sans-serif;
    }
    #wrap{
        width: 80%;
        margin: 0 auto;
    }
    table{
        width: 100%;
        text-align: center;
        margin: 0 auto;
    }
    table tr{
        width: 100%;
        height: 20px;
    }
    table tr td{
        width: 100%;
        padding-top: 20px;
    }
    input{
        width: 90%;
        height: 20px;
        float: right;
    }
    table textarea{
        width: 90%;
        height: 200px;
        float: right;
    }
    #button{
        width: 100%;
        text-align: center;
    }
    button{
        background-color: transparent;
        border: 0;
        font-size: 30px;
    }
    button:hover{
        cursor: pointer;
        opacity: 0.7;
    }
</style>
</head>
<body>
    <div id="wrap">
        <form action="/board/insert">
		<table>
		    <tr><td>TITLE : <input name="title"></td>
		    </tr>
		    <tr><td>CONTENT : <textarea name="content"></textarea></td></tr>
		    <tr><td>WRITER : <input name="w_id" readonly="readonly" value="${w_id}"></td></tr>
		</table><br/>
		<div id="button">
		    <button>Write</button>
		</div>
	</form>
    </div>
</body>
</html>