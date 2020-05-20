<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>스크랩 리스트</h1>
<h5>데이 스크랩</h5>
  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행일</th>
    <th>메인후기</th>
    <th>삭제</th>
  </tr>

  <c:forEach items="${day}" var="scrap">
      <tr>
        <td><a href='../review/detail?no=${scrap.review.no}'>${scrap.reviewDay.title}</td> 
        <td>${scrap.reviewDay.dayDate}</td> 
        <td>${scrap.reviewDay.mainReview}</td> 
        <td><button type="button" onclick="location.href='delete?no=${scrap.reviewDay.no}'">삭제</button></td>
        <!-- 
        <td>
        <form action='addScrap' method='post'>
				  <div class="userNo">
				   <!-- 스크랩 파일에 저장된 유저번호 -->
				   <!-- 로그인 세션의 넘버 -->
				   <!-- 스크랩을 한 사람 -->
				   <input class="usernos" name="userNo" type="hidden" value='#'>
				  </div>
				  <div class="traderNo"> 
				    <!-- 
				    스크랩.리뷰 데이 no
				    스크랩.리뷰 장소 no 
				    에서 장소 or 데이 대한 카운팅이 올라갈 때 유저 번호를 확인 가져온다.
				      -->
				    <!-- 리뷰의 넘버 -->
				    <!-- 스크랩을 당한 사람-->
				    <input class="tradernos" name="traderNo" type="hidden">
				  </div>
				  <!-- 
				    - 스크랩시 카운팅된 번호일때는 상대방 번호를 사용하고, 
				    - price 값이 증가되지 않을 때는 0을 만든다.
				  -->
				   <div class="pointType">
				     <input class="types" name="pointType" type="hidden" > 
				   </div>
				  <!-- 
				    - 입금 : 0일 때 - 스크랩 적립, 결제 충전
				    - 출금 : 1일 때 - 출금 요청 
				   -->
				 <div class="content">
				   <input class="contents" name="content" type="hidden"> 
				  <!-- 
				  // 1. 스크랩 포인트 - 스크랩에서 카운팅이 올라갔을 때 
				        - 스크랩을 했을 때 userNo와 traderNo
				        - 스크랩을 당했을 때 tarderNo와 userNo 
				  // 2. 충전 결제 - 충전이 완료되었을때 
				  // 3. 출금 - 출금이 정상적으로 처리 되었을 때 (마이너스값)
				   --> 
				 </div>
				  <div class="price">
				   <input class="prices" name="price" type="hidden">
				   <!-- 
				    // pointType, content, price, trader로 확인하여 변경
				  // pointType의 값이 0 일 때  - 입금된값 (plus function) (content 1,2 일 때)
				  // pointType의 값이 1 일 때  - 출금된값 (minus funcion) (content 1,2 일 때)
				   
				    -->
				 </div>
        <button type="button" onclick="location.href='addScrop'">스크랩</button></td>
				</form>
      </tr>
       -->
  </c:forEach>
</table>

 <table border='1'>
  <tr>
    <th>장소</th>
    <th>메인사진</th>
    <th>리뷰</th>
    <th>기본주소</th>
    <th>상세주소</th>
    <th>삭제</th>
  </tr>
<hr>
<h5>장소 스크랩</h5>
  <c:forEach items="${place}" var="scrap">
      <tr>
        <td>${scrap.reviewPlace.name}</td> 
        <td>${scrap.reviewPlace.mainPhoto}</td> 
        <td>${scrap.reviewPlace.placeReview.substring(0,10)}</td> 
        <td>${scrap.reviewPlace.basicAddr}</td> 
        <td>${scrap.reviewPlace.detailAddr}</td> 
        <td><button type="button" onclick="location.href='delete?no=${scrap.reviewPlace.no}'">삭제</button></td>
      </tr>
  </c:forEach>
</table>

