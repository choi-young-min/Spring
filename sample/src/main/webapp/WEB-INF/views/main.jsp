<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    body{
        margin: 0 auto;
        text-align: center;
        background-color: #D8D7D7;
    }
    #logo{
        margin-top: 60px;
    }
    #logo img{
        width: 400px;
    }
    button{
        border: 0px;
        font-size: 2rem;
        background-color: transparent;
    }
    span{
        font-size: 2rem;
    }
    .logout_btn{
    	margin-left: 20px;
    }
    .logout_btn:hover{
    	opacity : 0.7;
    	text-decoration: underline;
    }
    .go_board:hover{
    	opacity : 0.7;
    	text-decoration: underline;
    }
    .login_btn:hover{
    	opacity:0.7;
    	text-decoration: underline;
    }
    .join_btn:hover{
    	opacity:0.7;
    	text-decoration: underline;
    }
    h2{
    	margin-top: 20px;
    }
</style>
</head>
<body>

    <div id="logo">
    	<img src="/resources/salt-logo.jpg">
    </div>
    <form name="frm">
		<c:choose>
				<c:when test="${sessionScope.id == null}">
					아 이 디 : <input type="text" name="id"><br>
					비밀번호 : <input type="password" name="pwd"><br>
					<button class="login_btn">LOGIN</button><span>|</span>
					<button class="join_btn">JOIN</button>
				</c:when>
				<c:otherwise>
					<h2>${sessionScope.name}님 환영합니다.</h2><br>
					<button class="go_board">BOARD</button>
					<button class="logout_btn">LOGOUT</button>
				</c:otherwise>
		</c:choose>
	</form>
	<c:if test="${join_result eq 0}">
		<script>
			alert("회원 가입 실패");
		</script>
	</c:if>
	
	<c:if test="${join_result eq 1}">
		<script>
			alert("회원 가입 성공");
		</script>
	</c:if>
	
	<c:if test="${msg == 'fail'}">
		<script>
			alert("아이디와 패스워드를 확인해 주세요!");
		</script>
	</c:if>
	
	<c:if test="${msg == 'success'}">
		<script>
			alert("로그인 성공!");
		</script>
	</c:if>
	
	<c:if test="${logout_success == 'success'}">
		<script>
			alert("로그아웃 성공!");
		</script>
	</c:if>
	
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(function(){
            $(".join_btn").click(function(){
               document.frm.action = "/joinform";
                document.frm.submit();
            });
            $(".login_btn").click(function(){
               document.frm.action = "/login";
               document.frm.submit();
            });
            $(".logout_btn").click(function(){
            	document.frm.action = "/board/logout";
                document.frm.submit();
            });
            $(".go_board").click(function(){
            	document.frm.action = "/board";
                document.frm.submit();
            });
        });
    </script>
</body>
</html>