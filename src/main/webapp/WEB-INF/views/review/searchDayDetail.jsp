<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>데이 검색 상세 </h1>

  <td><button id="total_scrap_butoon" >전체 스크랩</button></td> <br>
  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행일</th>
    <th>후기</th>
    <th>장소명</th>
    <th>기본주소</th>
    <th>상세주소</th>
    <th>장소후기</th>
    <th>스크랩</th>
  </tr>
  
  <c:forEach items="${review.reviewDay}" var="reviewDay">
      메인사진 : <img src='${pageContext.servletContext.contextPath}/upload/review/${reviewDay.mainPhoto}' width='360'><br>
       <input id="data-reviewDay-no" type="hidden" value="${reviewDay.no}">
       <input id="data-trader-no" type="hidden" value="${review.user.no}">
    <c:forEach items="${reviewDay.reviewPlace}" var="reviewPlace">
      장소대표사진 : <img src='${pageContext.servletContext.contextPath}/upload/review/${reviewPlace.mainPhoto}' width='360'><br>
      <c:forEach items="${reviewPlace.reviewPlacePhotos}" var="reviewPlacePhoto" varStatus="status">
      <c:if test="${status.first}">
      <tr>
        <td>${reviewDay.title}</td> 
        <td>${reviewDay.dayDate}</td>
        <td>${reviewDay.mainReview}</td>  
        <td>${reviewPlace.name}</td> 
        <td>${reviewPlace.basicAddr}</td> 
        <td>${reviewPlace.detailAddr}</td> 
        <td>${reviewPlace.placeReview}</td>
	      <input id="data-reviewPlace-no" type="hidden" value="${reviewPlace.no}">
	      
        
        <td><button id="place_scrap_butoon">스크랩</button></td>
        </c:if>
        장소사진 : <img src='${pageContext.servletContext.contextPath}/upload/review/${reviewPlacePhoto.photo}' width='360'><br>
      </tr>
     </c:forEach>
   </c:forEach>
  </c:forEach>
</table>
          <input id="data-user-no" type="hidden" value="${loginUser.no}">
          <input id="data-pointType" type="hidden" value="1">
          <input id="data-content" type="hidden" value="2">
          <input id="data-DayPrice" type="hidden" value="150">
          <input id="data-PlacePrice" type="hidden" value="30">

<script src="../node_modules/jquery/dist/jquery.min.js"></script>
<script>
"use strict"
// scrap Day value
var da = document.querySelector("#data-reviewDay-no");
console.log(da);

//scrap place value
var pa = document.querySelector("#data-reviewPlace-no");
console.log(pa);

// point total Data value
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');

// point price value
var e1 = document.querySelector('#data-DayPrice');
var e2 = document.querySelector('#data-PlacePrice');

// tag data
var button_tag1 = ${'total_scrap_butoon'};
// var button_tag1 = ${'total_scrap_butoon'};
console.log(a);
console.log(b);
console.log(c);
console.log(d);

console.log(e1);
console.log(e2);

// 동일 게시물 비교
var co1 = document.querySelector("#data-reviewDay-no");
var co2 = document.querySelector("#data-user-no");
var co3 = document.querySelector('#data-trader-no');
console.log(co1);
console.log(co2);
console.log(co3);

document.querySelector("#total_scrap_butoon").onclick = () => {
		 if (confirm(" 해당 게시물을 스크랩을 하시겠습니까? ") == true){    
				sendScrapDayData();
			  sendPointDayData();
		 }else{ 
			  console.log("error");
		 }
}

document.querySelector("#place_scrap_butoon").onclick = () => {
    if (confirm(" 해당 게시물을 스크랩을 하시겠습니까? ") == true){    
    	  sendScrapPlaceData();
    	  sendPointPlaceData();
     }else{ 
        console.log("error");
     }
}

function sendScrapDayData() {
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
    	 if (xhr.readyState != 4 || xhr.status != 200){  
               console.log("scrapDay send() 리턴함.");
         } else {
             console.log("Scrap 요청 완료");
           }
     };         
      xhr.open("GET", 
          "http://localhost:9999/Root_Project/app/scrap/addReviewDay?userNo=" 
          + a.value + "&reviewDayNo="+ da.value , true);
      xhr.send();
  }
  
  function sendScrapPlaceData() {
	     var xhr = new XMLHttpRequest();
	     xhr.onreadystatechange = () => {
	    	 if (xhr.readyState != 4 || xhr.status != 200){  
	               console.log("scrapPlace send() 리턴함.");
	         } else {
	             console.log("Scrap 요청 완료");
	           }
	     };         
	      xhr.open("GET", 
	          "http://localhost:8080/Root_Project/app/scrap/addReviewPlace?userNo=" 
	          + a.value + "&reviewPlaceNo="+ pa.value , true);
	      xhr.send();
	  }
  

  function sendPointDayData() {
       var xhr = new XMLHttpRequest();
       xhr.onreadystatechange = () => {
         if (xhr.readyState != 4 || xhr.status != 200){  
                  console.log("DayPoint send() 리턴함.");
         } else {
             console.log("withdraw 요청 완료");
           }
        };       
        xhr.open("GET", 
            "http://localhost:8080/Root_Project/app/point/add?userNo=" + a.value 
            + "&reviewUserNo=" + b.value
            + "&pointType=" + c.value
            + "&content=" + d.value
            + "&price=" + e1.value, true);
        xhr.send();
    }


  function sendPointPlaceData() {
       var xhr = new XMLHttpRequest();
       xhr.onreadystatechange = () => {
    	   if (xhr.readyState != 4 || xhr.status != 200){  
                  console.log("PlacePoint send() 리턴함.");
           } else {
               console.log("withdraw 요청 완료");
             }
        };       
        xhr.open("GET", 
            "http://localhost:9999/Root_Project/app/point/add?userNo=" + a.value 
            + "&reviewUserNo=" + b.value
            + "&pointType=" + c.value
            + "&content=" + d.value
            + "&price=" + e2.value, true);
        xhr.send();
    }
  

</script>
