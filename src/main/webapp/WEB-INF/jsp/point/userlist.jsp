<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>사용자별 포인트 리스트</h1>
  <td>${user.name} 의 출금 리스트 <br></td>
   
  <table border='1'>
  <tr>
    <th scope="col" style="width:auto;">포인트 번호</th>
    <th scope="col" style="width:auto;">유저 번호</th>
    <th scope="col" style="width:auto;">상대 번호</th>
    <th scope="col" style="width:auto;">포인트 분류</th>
    <th scope="col" style="width:auto;">입출금 내용</th>
    <th scope="col" style="width:auto;">포인트 금액</th>
  </tr>
<c:set var = "sum" value = "0" />
<c:forEach items="${userlist}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td>${item.userNo}</td> 
    <td>${item.traderNo}</td> 
    <td>
	    <c:if test="${item.pointType==0}">입금</c:if>
	    <c:if test="${item.pointType==1}">출금</c:if>
    </td>
    <td><a href='detail?no=${item.no}'>
      <c:choose>
			  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
			  <c:when test="${item.content == 2}"> 충전 결제 </c:when>
			  <c:otherwise> 출금 </c:otherwise>
			</c:choose>
    </td>
    <td>${item.price}</td>
    <c:set var= "sum" value="${sum + item.price}"/>
  </tr>
</c:forEach>
<tr>
 - ${user.name}의 총 포인트는 <c:out value="${sum}"/> 입니다
</tr>

<!-- 
<c:forEach items="${userlist}" var="item">
<class="list_point">
    <div class="point userlist">
        <a href="#" class="item_content">
            <div class="state_space point">
                <span class="state _statusName">${item.pointType}</span>
            </div>
            <div class="info_space" > 
                <strong class="title click _titleName">구매 적립예정</strong>
                <p class="subtext">${item.traderNo}</p>
            </div>
        </a>

        <div class="amount_space">
            <div class="amount_inner">
                <span class="point">${item.price}</span>
                <div class="func_area">
                    <a href=='delete?no=${item.no}' class="point delete">내역삭제</a> 
                </div>
            </div>
        </div>
    </div>
</c:forEach>
 -->
<%--
 - pointType :  0 입금, 1 출금
 - content : 0 
 --%>
</table>
<jsp:include page="../footer.jsp"/>
