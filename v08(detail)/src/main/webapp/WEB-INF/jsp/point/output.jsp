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
  <c:if test="${not empty point.no}">
  <tr>
    <td>유저 번호: ${userNo}</td> 
    <td>상대 번호: ${tarderNo}</td> 
    <td>유저 이름: ${user.name}</td> 
    <td>전화 번호: ${user.tel}</td>
    <td>출금 계좌: ${user.account}</td>
    <td>촐금 은행: ${user.bank}</td>
  </tr>
</c:if>
</table>

<jsp:include page="../footer.jsp"/>