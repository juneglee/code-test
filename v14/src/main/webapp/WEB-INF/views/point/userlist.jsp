<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>
<div class="cotainer">
  <div class="t_sction">
     <div class="snb">
       <div class="member_sc">
         별명
       </div>

       <div class="my_setting">
       </div>
     </div>
     <div id="content"  class="subpg _root">
       <div class="sub_tmenu">
         <li class="on"><span>전체</span></li>
         <li class="t2_2"><span>충전</span></li>
       </div>
       <div class="point_spot">
            <table border='1'>
            <tr>
              <th scope="col">포인트 번호</th>
              <th scope="col">등록날짜</th>
              <th scope="col">유저 번호</th>
              <th scope="col">상대 번호</th>
              <th scope="col">포인트 분류</th>
              <th scope="col">입출금 내용</th>
              <th scope="col">포인트 금액</th>
            </tr>
          <c:set var = "sum" value = "0" />
          <c:forEach items="${userlist}" var="item">
            <tr>
              <td>${item.no}</td> 
              <td>${item.createdDate}</td> 
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
          </table>
       </div>
            
       <div class="_listRoot">
         <div class = "ask_sc">
         </div>
         <div class = "dsk_sc">
            <c:forEach items="${userlist}" var="item">
              <div class="list_point">
                  <div class="point_userlist">
                     <div class="userlist">
                     <span> #이미지 삽입# </span>
                      <a href="#" class="item_content">
                          <div class="point_no">
                              <span class="state _statusName">${item.no}</span>
                              <strong class="title click _titleName">스크랩</strong>
                              <span class="point">${item.price}가 적립 되었습니다.</span>
                          </div>   
                      </a>
                      </div>
                      <div class="amount_space">
                          <div class="amount_inner">
                              <a href=='delete?no=${item.no}' class="point delete"><button>내역삭제</button></a> 
                          </div>
                      </div>
                  </div>
               </div>
              </c:forEach>
         </div>
       </div>
    </div>
  </div>
</div>
       
  
<jsp:include page="../footer.jsp"/>
