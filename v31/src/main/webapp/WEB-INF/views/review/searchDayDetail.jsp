<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Page Content -->
  <div class="container">
    <div class="row">
      <!-- Post Content Column -->
      <div class="col-lg-8">
        <c:forEach items="${review.reviewDay}" var="reviewDay">
        <!-- Title -->
        <h1 class="mt-4"># 데이 스크랩 상세 </h1>
        <!-- Author -->
        <p class="lead"></p>
        <hr>
        <!-- Date/Time -->
        <p>여행 일짜 : ${reviewDay.dayDate}</p>
        <strong>${reviewDay.title}</strong> <br>
        <td><button id="total_scrap_butoon" style="float: right;">전체 스크랩</button></td> <br>
        <hr>
        <!-- Preview Image -->
        <img src='${pageContext.servletContext.contextPath}/img/search/testimg.jpg' style="width:750; "><br>
        <hr>
        <!-- Post Content -->
        <p class="lead" style="font-size: 18px;">${reviewDay.mainReview}</p>
         <input id="data-reviewDay-no" type="hidden" value="${reviewDay.no}">
         <input id="data-trader-no" type="hidden" value="${review.user.no}">
         <input id="data-reverse-user-no" type="hidden" value="${review.user.no}">
         
        <c:forEach items="${reviewDay.reviewPlace}" var="reviewPlace" varStatus="place_status">
          <c:forEach items="${reviewPlace.reviewPlacePhotos}" var="reviewPlacePhoto" varStatus="status">
          <c:if test="${status.first}">
          <input id="data-reviewPlace-no" type="hidden" value="${reviewPlace.no}">  
		s         <blockquote class="blockquote">
				        <div class="main_img" style="border-top: 3px solid gray; padding-top: 30px;">
				          <img src='${pageContext.servletContext.contextPath}/img/search/testimg.jpg' style='width:360px; margin-left: 160px; margin-top: 50px;'><br>
				        </div>
		          <footer class="blockquote-footer" style="margin-left: 160px;"> 
		                    대표 장소 : <cite title="Source Title">${reviewPlace.name}</cite> <br>
		           &nbsp;&nbsp;&nbsp;&nbsp; 주소   : <cite title="Source Title"> ${reviewPlace.basicAddr} ${reviewPlace.detailAddr}</cite>
		            <button class="place_scrap_button" 
		                    style="float: right;"
		                    data-no="${reviewPlace.no}">스크랩</button><br>
		          </footer>
		        </blockquote>
		
		        <p>${reviewPlace.placeReview}<br></p>
          </c:if>
        <hr>
        <img src='${pageContext.servletContext.contextPath}/img/search/testimg.jpg' style="width: 20ox;"><br>
      </c:forEach>
    </c:forEach>
  </c:forEach>
  </div>
   <input id="data-user-no" type="hidden" value="${loginUser.no}">
   <input id="data-reverse-trader-no" type="hidden" value="${loginUser.no}">
   <input id="data-pointType" type="hidden" value="1">
   <input id="data-content" type="hidden" value="2">
        
   <input id="data-reverse-pointType" type="hidden" value="0">
   <input id="data-reverse-content" type="hidden" value="1">
        
   <input id="data-DayPrice" type="hidden" value="150">
   <input id="data-PlacePrice" type="hidden" value="30">
              
 
      <!-- Sidebar Widgets Column -->
      <div class="float_sidebar col-md-4" style="width:200px; float: left">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <form action='http://localhost:9999/Root_Project/app/review/search' method='get'>
              <input type="text" name="keyword" placeholder="Search for...">
              <button class="btn btn-secondary">Go!</button>
            </div>
          </div>
        </div>
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                <c:forEach items="${review.reviewDay}" var="reviewDay">
                  <c:forEach items="${reviewDay.reviewPlace}" var="reviewPlace" varStatus="place_status">
                  <li>
                    <a href="#">${reviewPlace.name}</a>
                  </li>
                  </c:forEach>
               </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
 </div>

 <!--  -->


<script>
"use strict"
// scrap Day value
var da = document.querySelector("#data-reviewDay-no");

// scrap place value
// 각각의 장소에 해당하는 no를 받아야 한다. 
// JSON을 이용하여 파싱
var pa = document.querySelector("#data-reviewPlace-no");
console.log(pa);

// point total Data value
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');

// trader date value(reverse)
var a1 = document.querySelector("#data-reverse-user-no");
var b1 = document.querySelector("#data-reverse-trader-no");
var c1 = document.querySelector('#data-reverse-pointType');
var d1 = document.querySelector('#data-reverse-content');

// point price value
var e1 = document.querySelector('#data-DayPrice');
var e2 = document.querySelector('#data-PlacePrice');

// tag data
var button_tag1 = ${'total_scrap_butoon'};

console.log(a1);
console.log(b1);

// 동일 게시물 비교
var co1 = document.querySelector("#data-reviewDay-no");
var co2 = document.querySelector("#data-reviewPlace-no");
var cu1 = document.querySelector("#data-user-no");
var cu2 = document.querySelector('#data-trader-no');

var userNo = ${loginUser.no};

document.querySelector("#total_scrap_butoon").onclick = () => {
     if (confirm(" 해당 게시물을 스크랩을 하시겠습니까? ") == true){    
    	 checkDayError();
     }else{ 
        console.log("error");
     }
}

// place scrap 
// foreach 에서 각각의 해당하는 input 값을 받을 수 있는 방법
// id에서 해당 번호만 받지말고 class로 받아서 각가의 값이 전달 될 수 있도록 만든다.
// id로 받았던 값을 '.'으로 각각의 해당되는 값으로 받아서 각각의 해당 값이 전달될 수 있도록 한다.
// 유효성 검사 및 해당 값이 적절히 이용될 수 있도록, juery를 이용하여 사용하도록 한다.
$(".place_scrap_button").click((e) => {
	var placeNo = $(e.target).attr('data-no');
  if (confirm(" 해당 게시물을 스크랩을 하시겠습니까? ") == true){    
	  if (isMyReview()) {
		  alert("자신이 게시한 글은 스크랩 할 수 없습니다.");
	  } else {
		  sendScrapPlaceData(placeNo);
	  }
  }else{ 
    console.log("게시물 스크랩 취소!");
  }
});

// 유효성검사
// - userNo, traderNo가 같으면 안된다
function isMyReview() {
	if (cu1.value == cu2.value) {
		return true;
	}
	return false;
}

function sendScrapDayData() {
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
       if (xhr.readyState != 4 || xhr.status != 200){  
          console.log("해당 게시글을 스크랩 할 수 없습니다.")
         } else {
          console.log("Scrap 요청 완료, point로 리턴");
          sendPointDayData();
          reverseSendPointDayData();
        }
     };         
      xhr.open("GET", 
          "http://localhost:9999/Root_Project/app/scrap/addReviewDay?userNo=" 
          + a.value + "&reviewDayNo="+ da.value , true);
      xhr.send();
}
  
function sendScrapPlaceData(placeNo) {
    console.log('===>', placeNo)

  $.get("http://localhost:9999/Root_Project/app/scrap/addReviewPlace?reviewPlaceNo="+ placeNo, function() {
    console.log("Scrap 요청 완료");
	  //sendPointPlaceData();
	  //reverseSendPointPlaceData();
	})
	.fail(function() {
	  alert("place Data 스크랩 처리 실패!");
	});
}


function sendPointDayData() {
	 $.get("http://localhost:9999/Root_Project/app/point/add?reviewUserNo=" + b.value
        + "&pointType=" + c.value
        + "&content=" + d.value
        + "&price=" + e1.value 
			  
	,function(){
		console.log("send point DayData()")
	})
	.done(function(){
	 console.log("포인트 전송 완료");
	})
	.fail(function(){
	 console.log("포인트 전송  실패");
	})
}

  function reverseSendPointDayData() {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = () => {
        if (xhr.readyState != 4 || xhr.status != 200){  
          console.log("reverseDayPoint send() 리턴함.");
        } else {
          console.log("reverse withdraw 요청");
          alert("스크랩을 완료했습니다.");
        }
       };       
       xhr.open("GET", 
           "http://localhost:9999/Root_Project/app/point/add?userNo=" + a1.value 
           + "&reviewUserNo=" + b1.value
           + "&pointType=" + c1.value
           + "&content=" + d1.value
           + "&price=" + e1.value, true);
       console.log(b.value);
       console.log(a.value);
       xhr.send();
   }

  function sendPointPlaceData() {
	  $.get("http://localhost:9999/Root_Project/app/point/add?userNo=" + a1.value 
	           + "&reviewUserNo=" + b1.value
	           + "&pointType=" + c1.value
	           + "&content=" + d1.value
	           + "&price=" + e1.value		
	  ,function(){
		  console.log("send Point Place 요청 완료()");
	  })
	  .done(function(){
      console.log("send point Place 요청 완료");
      changePlaceData();
	  })
	  .fail(function(){
		  console.log("send point place 전달 실패");  
	  })
  }
  
  function reverseSendPointPlaceData() {
	   $.get("http://localhost:9999/Root_Project/app/point/add?userNo=" + a1.value 
	           + "&reviewUserNo=" + b1.value
	           + "&pointType=" + c1.value
	           + "&content=" + d1.value
	           + "&price=" + e2.value   
	    ,function(){
	      console.log("send Point revPlace 요청 완료()");
	    })
	    .done(function(){
	      console.log("send point revPlace 요청 완료");
	      changePlaceData();
	    })
	    .fail(function(){
	      console.log("send point revplace 전달 실패");  
	    })
	  }
     
  
  function changeDayData() {
	  document.getElementById("total_scrap_butoon").innerHTML = ('<button id="total_scrap_butoon" style="float: right; background-color: Lime;" disabled >스크랩 완료</button>');
	}

	function changePlaceData() {
	    document.getElementById("place_scrap_butoon").innerHTML = ('<button id="place_scrop_button" style="float: right; background-color: Lime;" disabled >스크랩 완료</button>');
	}
  
  $(function(){
	    var $win = $(window);
	    var top = $(window).scrollTop(); 
	    var speed          = "normal";    
	    var easing         = 'linear';
	    var $layer         = $('.float_sidebar'); 
	    var layerTopOffset = 0;   
	    $layer.css('position', 'relative').css('z-index', '1');
	    if (top > 0 )
	        $win.scrollTop(layerTopOffset+top);
	    else
	        $win.scrollTop(0);
	    $(window).scroll(function(){
	        yPosition = $win.scrollTop(); 
	        if (yPosition < 0)  {
	            yPosition = 0;  }
	        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
	    });
	});

	$(document).ready(function() {
	    $(window).scroll(function() {
	        $(this).scrollTop() > 1000 ? $(".float_sidebar").fadeIn() : $(".float_sidebar").fadeOut()
	    })
	});
  

</script>
  
