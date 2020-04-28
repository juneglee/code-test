<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>content</h1>
<c:if test="${not empty point}">
<form action='update' method='post'>
번호: <input name='no' readonly type='text' value='${no}'><br>
유저 번호: <input name='userNO' type='text' value='${userNo}'><br>
상대 번호: <input name='traderNo' type='text' value='${traderNo}'><br>
분류: <input name='content' type='text' value='${content}'><br>
<p>
</p>
</form>
</c:if>

<c:if test="${empty point}">
<p>해당 포인트가 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    