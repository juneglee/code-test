<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>출금 리스트</h1>
  <table border='1'>
  <tr>
    <th>유저 번호</th>
    <th>상대 번호</th>
    <th>유저 이름</th>
    <th>전화 번호</th>
    <th>출금 계좌</th>
    <th>출금 은행</th>
  </tr>
  <c:forEach items="${output}" var="item">
  <tr>
    <td>${item.point.user_no}</td> 
    <td>${item.point.trader_no}</td> 
    <td>${item.user.user_name}</td> 
    <td>${item.user.tel}</td>
    <td>${item.user.account}</td>
    <td>${item.user.bank}</td>
  </tr>
</c:forEach>
</table>

<jsp:include page="../footer.jsp"/>