<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>포인트 리스트 입출금 상태</h1>
<c:if test="${point.userNo == point.traderNo}">
  <p> error : 유저와 상대 번호가 동일하여 잘못된 정보 입니다. </p><br>
  
</c:if>
포인트 번호 : ${point.no} <br>
유저 번호 : ${point.userNo} <br>
상대 번호 : ${point.traderNo} <br>
포인트 타입 :
  <c:if test="${point.pointType==0}">입금</c:if>
  <c:if test="${point.pointType==1}">출금</c:if>
  <br>
분류 : 
<c:choose>
  <c:when test="${point.content == 1}"> 포인트 적립</c:when>
  <c:when test="${point.content == 2}"> 충전 결제 </c:when>
  <c:otherwise> 출금 </c:otherwise>
</c:choose>

<jsp:include page="../footer.jsp"/>
    