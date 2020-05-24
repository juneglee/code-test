<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>장소 검색 상세</h1>
<div class="search_Place_Detail">
   <div class="search_place_Detail_text">
     <div class="text_mainPhoto">
		    메인 사진 : ${placeDetail.mainPhoto} <br> 
		    장소 이름 : ${placeDetail.name} <br>
		    상세 주소 : ${placeDetail.basicAddr} <br>
		    기본 주소 : ${placeDetail.detailAddr} <br>
    </div>
    <div class="search_place_Detail_Photo">
    <c:forEach items="${placePhotoDetail}" var="placePhoto">
          사진 : ${placePhoto.photo}<br> 
    </c:forEach>
    </div>
    </div class="search_place_Detail_textarea">
          장소 후기 : ${placeDetail.placeReview} <br>
    </div>
    <div class="search_place_Detail_P.Scrap">
    <input id="data-user-no" type="hidden" value="${loginUser.no}">
    <input id="data-trader-no" type="hidden" value="${review.user.no}">
    <input id="data-pointType" type="hidden" value="1">
    <input id="data-content" type="hidden" value="2">
    <input id="data-price" type="hidden" value="30">
       <div class="P.Scrap_button">
          <button id='place_scrop_button'>스크랩</button>
       </div>
    </div>
</div>

<script type="text/javascript">
"use strict"
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');
var e = document.querySelector('#data-price');
console.log(a);
console.log(b);
console.log(c);
console.log(d);
console.log(e);

document.querySelector("#place_scrop_button").onclick = () => {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 
    		"http://localhost:8080/Root_Project/app/point/add?userNo=" + a.value 
    		+ "&reviewUserNo=" + b.value
    		+ "&pointType=" + c.value
    		+ "&content=" + d.value
    		+ "&price=" + e.value, false);
    xhr.send();
    console.log("send() 리턴함.");
};

</script>


<!-- 각각 해당하는 로컬로 변경요먕  ex) localhost:9999
// http://localhost:8080/Root_Project/app/point/add?reviewUserNo='${revriew.user.no}'  
--> 



