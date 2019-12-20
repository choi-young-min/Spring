<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great&display=swap" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        body{ 
        	background-image: url("/resources/1p.jpg");
        }
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        header{
            width: 100%;
            height: 150px;
            display: flex;
            position: relative;
            border-bottom: 1px solid black; 
        }
        header img{
            width: 250px;
            height: 150px;
        }
        h1{
            font-family: 'Fredericka the Great', cursive;
        }
        #main{
            width: 70%;
            text-align: center;
            font-size: 50px;
        }
        #logo{
            width: 20%;
        }
        #logo a{
        	width: 100%;
        	height: 150px;
        }
        header #logout{
            position: absolute;
            right: 10px;
            top:10px;
            height: 100%;
            width: 10%
        }
        header button{
            position: absolute;
            right: 0;
            border: 0;
            background-color: transparent;
            font-size: 1.5rem;
        }
        @media(max-width:960px){
            #main{
                display: none;
            }
            header #logo{
                width: 80%;
            }
            #logo img{
                margin-left: 30%;
            }
            header #logout{
                width: 20%;
                font-weight: bolder;
            }
            header #logout:hover{
            	opacity:0.7;
            }
        }
    </style>
</head>
<body>
    <header>
       <div id="logo">
        <a href="/board"><img src="/resources/salt-logo-mini.jpg"></a>
       </div>
       <div id="main">    
        <h1>Lim's Kitchen</h1>
        </div>
        <div id="logout"><button onclick="location.href='/board/logout'">LOGOUT</button></div>
    </header>
</body>
</html>