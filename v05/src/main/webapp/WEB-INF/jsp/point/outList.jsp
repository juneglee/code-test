<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h>출금 리스트</h1>
  <input name='userNo' type='text' value='${user.no}' readonly><br>
  <form action='output' method='get' enctype='multipart/form-data'>
  <table border='1'>
  <tr>
    <th>유저 번호</th>
    <th>상대 번호</th>
    <th>유저 이름</th>
    <th>전화 번호</th>
    <th>출금 계좌</th>
    <th>출금 은행</th>
  </tr>
  
  <tr>
    <td>${point.user_no}</td> 
    <td>${point.trader_no}</td> 
    <td>${user.user_name}</td> 
    <td>${user.tel}</td>
    <td>${user.account}</td>
    <td>${user.bank}</td>
  </tr>

</table>

<jsp:include page="../footer.jsp"/>