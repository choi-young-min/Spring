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
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body{
        font-family: 'Josefin Sans', sans-serif;
        font-weight: bolder;
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
        font-family: 'Josefin Sans', sans-serif;
        font-weight: bolder;
        font-size:20px;
    }
    #rno:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    #buttons{
        width: 100%;
        text-align: center;
    }
    #reply-list{
        width: 100%;
        text-align: center;
    }
    #reply-start{
    	margin-left: 380px;
    	width: 50%;
        background-color: white;
        border: 1px solid gray;
    }
    #reply-content{
        width: 100%;
        text-align: center;
    }
    #reply-content textarea{
        width: 60%;
        border-radius: 15px;
    }
</style>
</head>
<body>
<div id="wrap">
	<form name="frm">
		<table>
		    <tr><td>BNO : <input name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly"></td></tr>
		    <tr><td>TITLE : <input name="title" value='<c:out value="${board.title }"/>' readonly="readonly"></td>
		    </tr>
		    <tr><td>CONTENT : <textarea name="content" readonly="readonly"><c:out value="${board.content }"/></textarea></td></tr>
		    <tr><td>WRITER : <input name="w_id"  value='<c:out value="${board.w_id }"/>' readonly="readonly"></td></tr>
		</table><br/>
		
		<c:if test="${id eq board.w_id}">
		<div id="button">
            <button id="remove">REMOVE</button> | 
            <button id="update">UPDATE</button>
		</div><br>
		</c:if>
		
		<div id="reply-start">
			<c:forEach var="list" items="${list }">
				<div id="reply-list">
					${list.w_id } : ${list.content }
					
					<c:if test="${id eq list.w_id}">
						<button class="delete" id="rno" name="rno" value="${list.rno }">x</button><br>
					</c:if>
				</div><br/>
			</c:forEach>
		</div><br>
		<div id="reply-content">
		    <c:forEach var="item" items="${reply}">
				<a href="board/get?replyNum=${item}&bno=${bno.bno}">[${item}]</a>
		    </c:forEach>
		    <br><br><span>${id } : </span>
		    <textarea rows="5" cols="20" name="reply-content"></textarea>
        </div>
		<div id="buttons">
            <button id="reply">REPLY</button> | 
            <button id="list">Back to list</button>
	    </div>
	</form>
	
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
            $("#list").click(function(){
				document.frm.action="/board";
				document.frm.submit();
			});
			$("#update").click(function(){
				document.frm.action="/board/updateform";
				document.frm.submit();
			});
			$("#reply").click(function(){
				document.frm.action="/board/insertreply";
				document.frm.submit();
			});
			$(".delete").click(function(){
				var rno = $(this).value;
				document.frm.action="/board/deletereply?rno="+rno;
				document.frm.submit();
			});
			$("#remove").click(function(){
				document.frm.action="/board/remove";
				document.frm.submit();
			});
		});
	</script>
</body>
</html>