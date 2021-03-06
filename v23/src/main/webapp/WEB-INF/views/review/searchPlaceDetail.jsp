<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
div.search_Place_Detail {
  width :1000px;
}

div.main_control, .search_place_Detail_text, 
.search_place_Detail_Photo, 
.search_place_Detail_textarea{
  height: 100;
  border: 1px solid;
  float: left;
}

div.Detail_mainPhoto {
  width: 200px;
  height: 100px;
  float: left;
}

div.Detail_text {
  width:500px;
  height: 10px;
  float: left;
  border: 1px solid white;
}

div.search_place_Detail_Photo {
  width: 100%;
  height : 200px;
  margin-top: 50px;
}
div.search_place_Detail_textarea {
  width: 100%;
  height : 200px;
  margin-top: 50px;
  
}



</style>

<h1>#장소 검색 상세</h1>
<div class="search_Place_Detail">
   <div class="search_place_Detail_text">
      <div class="main_control">
		     <div class="Detail_mainPhoto">
				    메인 사진 : <img alt="${placeDetail.mainPhoto}" src=""> <br> 
		     </div>
		     <div class="Detail_text">
				    <p>장소 이름 : ${placeDetail.name}<p> <br>
				    <p>상세 주소 : ${placeDetail.basicAddr}<p> <br>
				    <p>기본 주소 : ${placeDetail.detailAddr} <br>
	      </div>
	     </div>
	      <div class="search_place_Detail_Photo">
	          <c:forEach items="${placePhotoDetail}" var="placePhoto">
	            사진 : <img alt="${placePhoto.photo}" src=""> <br> 
	          </c:forEach>
	      </div>
			      <div class="search_place_Detail_textarea">
			        장소 후기 : ${placeDetail.placeReview} <br>
			      </div>
					    <div class="search_place_Detail_P.ScrapAndPoint">
					    <input id="data-reviewPlace-no" type="hidden" value="${placeDetail.no}">
					    <input id="data-user-no" type="hidden" value="${loginUser.no}">
					    <input id="data-trader-no" type="hidden" value="${review.user.no}">
					    <input id="data-pointType" type="hidden" value="1">
					    <input id="data-content" type="hidden" value="2">
					    <input id="data-price" type="hidden" value="30">
	       <div class="plaScrap_button">
	          <button id='place_scrop_button'>스크랩</button>
	       </div>
	    </div>
	</div>
</div>

<script>
"use strict"
// scrap value
var pa = document.querySelector("#data-reviewPlace-no");
console.log(pa);

// point value
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');
var e = document.querySelector('#data-price');

// 동일 게시물 비교
var co1 = document.querySelector("#data-reviewPlace-no");
var co2 = document.querySelector("#data-user-no");
var co3 = document.querySelector('#data-trader-no');
console.log(a);
console.log(b);
console.log(c);
console.log(d);
console.log(e);

document.querySelector("#place_scrop_button").onclick = () => {
    if (confirm(" 해당 게시물을 스크랩을 하시겠습니까? ") == true){    
    	  sendScrapData();
    	  sendPointData();
     }else{ 
        console.log("error");
     }
}

function sendScrapData() {
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
    	 if (xhr.readyState != 4 || xhr.status != 200){	
    		 console.log("scarp 리턴 준비 완료()");
    		   }
      };       
      xhr.open("GET", 
          "http://localhost:9999/Root_Project/app/scrap/addReviewPlace?userNo=" 
        	+ a.value + "&reviewPlaceNo="+ pa.value , true);
      xhr.send();
  }


	function sendPointData() {
		   var xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = () => {
			   if (xhr.readyState != 4 || xhr.status != 200){  
		            	console.log("point 리턴 준비 완료()");
		        }
		    };		   
		    xhr.open("GET", 
		        "http://localhost:9999/Root_Project/app/point/add?userNo=" + a.value 
		        + "&reviewUserNo=" + b.value
		        + "&pointType=" + c.value
		        + "&content=" + d.value
		        + "&price=" + e.value, true);
		    xhr.send();
		}

</script>


<!-- 각각 해당하는 로컬로 변경요먕  ex) localhost:9999
// http://localhost:8080/Root_Project/app/point/add?reviewUserNo='${revriew.user.no}'  
                /* } else {
                    if (a.value == b.value){
                    alert("자신이 작성한 후기는 스크랩할 수 없습니다");
                    } else (pa.value == co1.value & b.value == co2.value & a.value == co3.value) 
                    alert("동일한 게시물이 있습니다.");
          } */

--> 



