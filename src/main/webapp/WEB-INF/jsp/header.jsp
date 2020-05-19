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
body {
display: block;
margin: 0;
padding: 0;
}

#container {
    width: 1100px;
    margin: 0 auto;
}

.t_sction {
    background: #fff
}

.snb {
  float: left;
    width: 220px;
    margin-left:200px;
    margin-right: 40px;
    padding-bottom: 50px;
    background-color: #f3f4f5;
}

.snb .member_sc{
position: relative;
    padding: 24px 0;
    border: 1px solid #4e5a72;
    background-color: #525f78;
    text-align: center;
}

.my_setting {
  overflow: hidden;
    background-color: #aaa;
}

#content .date .d_bx .ico
{position:absolute;top:0;left:0;z-index:20;width:100%;height:100%;background:white;}

.subpg{float:left;position:relative;width:840px}

.sub_tmenu{
    overflow: hidden;
    position: relative;
    z-index: 10;
    padding-right: 1px;
    background: #4f5c74;
}

.sub_tmenu ul{display:table;*overflow:hidden;width:100%;font-size:12px;table-layout:fixed}
.sub_tmenu li{display:table-cell;*display:inline-block;*float:left;width:auto;*width:33.1%;height:45px;padding:1px 0 1px 1px;text-align:center}
.sub_tmenu li a{display:block;width:100%;padding:15px 0;background-color:#606e89;color:#fff;text-decoration:none}
.sub_tmenu li.on a{background-color:#525f78}

.point_spot{
    position: relative;
    z-index: 30;
    margin-top: -1px;
    padding: 31px 0 30px;
    border: 1px solid #dadddf;
    background-color: #edeff2;
}

}
._listRoot{
  border: 1px solid black;
}

._listRoot .ask_sc {
    position: relative;
    z-index: 20;
    margin: -1px 0 46px;
    padding: 18px 27px;
    border: 1px solid #dadddf;
    background-color: #edeff2;
}

._listRoot .dsk_sc {
    position: relative;
    z-index: 10;
    padding: 0 0 30px;
    background-color: #fff;
}

._listRoot .dsk_sc .list_point {
    border: 1px solid black;
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
