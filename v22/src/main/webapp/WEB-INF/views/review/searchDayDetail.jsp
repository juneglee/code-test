<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>데이 검색 상세 </h1>

<c:if test="${not empty review}">
  <td><button id=total_scrap_butoon>전체 스크랩</button></td>
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
        <td><button>스크랩</button></td>
        </c:if>
        장소사진 : <img src='${pageContext.servletContext.contextPath}/upload/review/${reviewPlacePhoto.photo}' width='360'><br>
      </tr>
     </c:forEach>
   </c:forEach>
  </c:forEach>
</table>

  <a href='delete?no=${review.no}&userNo=${review.user.no}'>삭제</a>
</c:if>

<c:if test="${empty review}">
<p>해당 후기가 없습니다.</p>
</c:if>
              <input id="data-reviewDay-no" type="hidden" value="${reviewDay.no}">
              <input id="data-user-no" type="hidden" value="${loginUser.no}">
              <input id="data-trader-no" type="hidden" value="${review.user.no}">
              <input id="data-pointType" type="hidden" value="1">
              <input id="data-content" type="hidden" value="2">
              <input id="data-price" type="hidden" value="150">

<script>
"use strict"
// scrap value
var pa = document.querySelector("#data-reviewDay-no");
console.log(pa);

// point value
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');
var e = document.querySelector('#data-price');

// 동일 게시물 비교
var co1 = document.querySelector("#data-reviewDay-no");
var co2 = document.querySelector("#data-user-no");
var co3 = document.querySelector('#data-trader-no');
console.log(a);
console.log(b);
console.log(c);
console.log(d);
console.log(e);

document.querySelector("#total_scrap_butoon").onclick = () => {
  sendScrapData();
  sendPointData();
}

function sendScrapData() {
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
         if (xhr.readyState == 4) {
             if (xhr.status == 200) {
               console.log("point send() 리턴함.");
             }
         }
     };         
      xhr.open("GET", 
          "http://localhost:8080/Root_Project/app/scrap/addReviewDay?userNo=" 
          + a.value + "&reviewDayNo="+ pa.value , true);
      xhr.send();
  }


  function sendPointData() {
       var xhr = new XMLHttpRequest();
       xhr.onreadystatechange = () => {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                  console.log("point send() 리턴함.");
                }
            }
        };       
        xhr.open("GET", 
            "http://localhost:8080/Root_Project/app/point/add?userNo=" + a.value 
            + "&reviewUserNo=" + b.value
            + "&pointType=" + c.value
            + "&content=" + d.value
            + "&price=" + e.value, true);
        xhr.send();
    }

</script>
