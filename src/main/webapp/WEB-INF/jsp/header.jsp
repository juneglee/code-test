<%@page import="com.keep.root.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<c:if test="${not empty refreshUrl}">
<meta http-equiv="Refresh" content="${refreshUrl}">
</c:if>
<title>Root</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' integrity='sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh' crossorigin='anonymous'>

<style>
body, p,
h1, h2, h3, h4, h5, h6,
ul, ol, li,
dl, dt, dd,
table, th, td,
form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
}

body,input,textarea,select,button,table {font-size: 12px;}

img,fieldset {
    border: 0;
}

ul, ol {
    list-style: none;
}

em, address {
    font-style: normal;
}

a {
    text-decoration: none;
}


body {
  background-color: white;
}

#snb {width:300px;margin:0 auto}
.profile{
  background-color: LightGray;
  position:relative;
  float:left;
  margin-left:300px;
  width:250px;
  padding:100px;
}


#container{width:1100px;margin:0 auto}
.subpg{background-color:LightGray;float:left;position:relative;width:840px;margin-left:90px;}


.content .date .d_bx .ico
{position:absolute;top:0;left:0;z-index:20;width:100%;height:100%;background:white}

/* 서브 탭메뉴 */
.sub_tmenu{overflow:hidden;position:relative;z-index:10;padding-right:1px;background:#4f5c74}
.sub_tmenu ul{display:table;*overflow:hidden;width:100%;font-size:12px;table-layout:fixed}
.sub_tmenu li{display:table-cell;*display:inline-block;*float:left;width:auto;*width:33.1%;height:45px;padding:1px 0 1px 1px;text-align:center}


div.list_point{
  border: 1px solid gray;
  background-color: white;
  padding: 5px;
  width: 840px;
  height: 50px;
}
div.userlist{
  float: left;
  width: 600px;
}

div.amount_space{
  float: left;
}


div.sub_tmenu{
overflow:hidden;
position:relative;
z-index:10; 
padding-right:1px;
background:#4f5c74;
}

</style>
</head>
<body>
<nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
	<div id="categorybar">
		<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>
		  <span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='navbarNav'>
		  <ul class='navbar-nav mr-auto'>
		      <li class="nav-item">
		        <a class="nav-link" href="../course/list">코스짜기</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../review/list">후기쓰기</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../info/list">공지</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../auth/form">로그인</a>
		    </li>
		  </ul>
		</div>
	</div>
</nav>
<c:if test="${not empty loginUser}">
  <span class='navbar-text'>${loginUser.name}</span>
  <a href='../auth/logout' class='btn btn-success btn-sm'>로그아웃</a>
</c:if>
<c:if test="${empty loginUser}">
  <a href='../auth/form' class='btn btn-success btn-sm'>로그인</a>
</c:if> 
</div>
</nav>
