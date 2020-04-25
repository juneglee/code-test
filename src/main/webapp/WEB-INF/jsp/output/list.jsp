

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>리스트</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>유저번호</th>
    <th>예금주</th>
    <th>전화번호</th>
    <th>은행</th>
    <th>계좌번호</th>
    <th>금액</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td>${item.name}</td> 
    <td>${item.tel}</td> 
    <td>${item.bank}</td>
    <td>${item.account}</td>
    
  </tr>
</c:forEach>

</table>

<jsp:include page="../footer.jsp"/>
    