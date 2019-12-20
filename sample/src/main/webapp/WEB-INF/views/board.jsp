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
<style>
    *{
        margin: 0;
        padding: 0;
    }
    #wrap{
        margin: 0 auto;
        margin-top: 20px;
        width: 70%;
        text-align: center;
        position: relative;
    }
    #wrap table{
        position: relative;
        border: 3px solid gray;
        width: 100%;
        border-collapse: collapse;
        font-size: 20px;
        background-color: white;
    }
    #wrap table td{
        border: 1px solid black;
    }
    a{
    	text-decoration: none;
    	color: black;
    }
    a:hover{
    	opacity: 0.7;
    }
    #top{
    	width:100%;
    	height:25px;
    	position: relative;
    	margin-bottom: 10px;
    }
    #write{
    	position: absolute;
    	right:0;
    	border: 0;
    	background: transparent;
    	cursor: pointer;
    	font-size: 25px;
    	font-weight: bolder;
    }
    button:hover{
    	opacity: 0.6;
    	cursor: pointer;
    }
</style>
</head>
<body>
<div id="wrap">
	<h1>RECIPES</h1>
		<div id="top">
			<button id="write" onclick="location.href='/board/writeform'">Write</button>
		</div>
	     <table>
	       <thead>
	         <tr>
	           <th style="width:5%;">#번호</th>
	           <th style="width:35%;">제목</th>
	           <th style="width:20%;">작성자</th>
	           <th style="width:20%;">작성일</th>
	           <th style="width:20%;">수정일</th>
	         </tr>
	       </thead>
	       
	       <tbody>
	       <c:forEach items="${list }" var="board">
			<tr>
			  	<td><c:out value="${board.bno }"/></td>
				<td><a class="move" href='/board/get?bno=<c:out value="${board.bno }"/>'>
				<c:out value="${board.title }"/></a></td>
				<td><c:out value="${board.w_id }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }" /></td>
			</tr>
			</c:forEach>
           </tbody>
           
         </table><br>
         
  		<c:forEach var="item" items="${rep}">
			<a href="/board?BoardNum=${item}" style="font-weight: bolder; font-size:20px;">[${item}]</a>
		</c:forEach>
		<br>
		
    </div>
</body>
</html>