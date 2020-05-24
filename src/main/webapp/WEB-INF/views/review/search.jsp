<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>검색 리스트</h1>
<h5>조건 검색</h5>
  
		  <div class="day_search">
		    <table border='1'>
		      <tr>
		        <th>메인 사진</th>
		        <th>주제</th>
		        <th>리뷰</th>
		        <th>스크랩</th>
		      </tr>
		      <c:forEach items="${searchDayList}" var="searchDay">
		          <tr>
		            <td><a href='searchDayDetail?no=${searchDay.no}'>${searchDay.mainPhoto}</td> 
		            <td>${searchDay.title}</td> 
		            <td>${searchDay.mainReview}</td>
		            <td><button id='day_scrop_button' data-no="${searchDay.no}">스크랩</button></td>
		          </tr>
		      </c:forEach>
		    </table>
		  </div>
      <div class="place_search">
       <table border='1'>
          <tr>
            <th>메인 사진</th>
            <th>장소</th>
            <th>리뷰</th>
          </tr>
          <c:forEach items="${searchPlaceList}" var="searchPlace">
              <tr>
                <td><a href='searchPlaceDetail?no=${searchPlace.no}'>${searchPlace.mainPhoto}</td> 
                <td>${searchPlace.name}</td> 
                <td>${searchPlace.placeReview.substring(0,10)}</td> 
                <td><button id='day_scrop_button' data-no="${searchPlace.no}">스크랩</button></td>
              </tr>
          </c:forEach>
        </table>
  </div>
  

