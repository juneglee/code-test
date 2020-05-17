<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>
<div>
  스크랩 <a href='../scrap/list' class='btn btn-success btn-sm'>스크랩</a>
</div>
<div>
  포인트 <a href='../point/userlist?userNo=${user.no}' class='btn btn-success btn-sm'>포인트</a>
</div>
<div>
  출금 <a href='../point/form?userNo=${user.no}' class='btn btn-success btn-sm'>출금</a>
</div>


<jsp:include page="../footer.jsp"/>