<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>스크랩 리스트</h1>
<h5>조건 검색</h5>

  <div class="day_search">
	  <table border='1'>
		  <tr>
		    <th>메인 사진</th>
		    <th>메인 주제</th>
		    <th>메인 날짜</th>
		    <th>메인 리뷰</th>
		  </tr>
		  <c:forEach items="${list}" var="scrap">
		      <tr>
		        <td><{scrap.reviewDay.mainPhoto}'></td> 
		        <td>${scrap.reviewDay.title}</td> 
		        <td>${scrap.reviewDay.dayDate}</td> 
		        <td>${scrap.reviewDay.mainReview}</td>
		      </tr>
		  </c:forEach>
		</table>
	</div>
  <div class="place_search">
   <table border='1'>
		  <tr>
		    <th>장소</th>
		    <th>메인사진</th>
		    <th>리뷰</th>
		    <th>기본주소</th>
		    <th>상세주소</th>
		    <th>삭제</th>
		  </tr>
		  <c:forEach items="${list}" var="scrap">
		      <tr>
		        <td>${scrap.reviewPlace.name}</td> 
		        <td>${scrap.reviewPlace.mainPhoto}</td> 
		        <td>${scrap.reviewPlace.placeReview.substring(0,10)}</td> 
		        <td>${scrap.reviewPlace.basicAddr}</td> 
		        <td>${scrap.reviewPlace.detailAddr}</td> 
		      </tr>
		  </c:forEach>
		</table>
  </div>
