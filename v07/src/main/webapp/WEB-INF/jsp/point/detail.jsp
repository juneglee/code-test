<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>content</h1>
<form action='detail' method='post' enctype='multipart/form-data'>
번호 : <input name='no' readonly type='text' value='${point.no}'><br>
분류 : <input name='content' type='text' value='${point.content}'><br>

<c:if test="${not empty point}">
<c:choose>
<c:when test="${point.content}='1'">
번호 : ${point.no}<br>
유저번호: ${point.userNo}<br>
상대번호: ${point.traderNo}<br>
</c:when>
<c:when test="${point.content}=2">
번호 : ${point.no}<br>
유저번호: ${point.userNo}<br>
상대번호: ${point.traderNo}<br>
</c:when>
<c:when test="${point.content}=3">
번호 : ${point.no}<br>
유저번호: ${point.userNo}<br>
상대번호: ${point.traderNo}<br>
</c:when>
</c:choose>
</c:if>
</from>

<jsp:include page="../footer.jsp"/>
    