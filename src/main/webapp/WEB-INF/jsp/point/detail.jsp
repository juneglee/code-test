<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>게시물 상세정보(JSP + EL + JSTL)</h1>

<c:if test="${not empty point}">
<form action='update' method='post'>
유저번호: ${point.userNo}<br>
상대번호: ${point.traderNo}<br>
</from>
</c:if>

<c:if test="${empty requestScope.point}">
<p>입출금내역이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    