<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>리스트</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>포인트 번호</th>
    <th>유저 번호</th>
    <th>상대 번호</th>
    <th>포인트 분류</th>
    <th>입출금 내용</th>
    <th>금액</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td>${item.userNo}</td> 
    <td>${item.traderNo}</td> 
    <td>${item.pointType}</td>
    <td>${item.content}</td>
    <td>${item.price}</td>
  </tr>
</c:forEach>

</table>

<jsp:include page="../footer.jsp"/>
    