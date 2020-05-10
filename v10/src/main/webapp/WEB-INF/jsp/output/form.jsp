<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>입력(JSP)</h1>
<form action='add' method='post'>

입출: <input name='name' type='text'><br>
내용: <input name='bank' type='text'><br>
금액: <input name='account' type='text'><br>
<button>등록</button>
</form>

<jsp:include page="../footer.jsp"/>
    