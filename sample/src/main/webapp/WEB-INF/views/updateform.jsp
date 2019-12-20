<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<style>
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
	<form name="frm">
		<table>
		    <tr><td>BNO : <input name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly"></td></tr>
		    <tr><td>TITLE : <input name="title" value='<c:out value="${board.title }"/>'></td>
		    </tr>
		    <tr><td>CONTENT : <textarea name="content"><c:out value="${board.content }"/></textarea></td></tr>
		    <tr><td>WRITER : <input name="w_id"  value='<c:out value="${board.w_id }"/>' readonly="readonly"></td></tr>
		</table><br/>
		<div id="button">
            <button id="update">UPDATE</button>
            <button id="list">Back to list</button>
	    </div>
	</form>
</div>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
            $("#update").click(function(){
				document.frm.action="/board/update";
				document.frm.submit();
			});
            $("#list").click(function(){
				document.frm.action="/board";
				document.frm.submit();
			});
         });
    </script>
</body>
</html>