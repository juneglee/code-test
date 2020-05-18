<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>
<div class="wrap">
	
	<div class='container'>
	  <div class="table">
		  <h1>사용자별 포인트 리스트</h1>
		  <td>${user.name} 의 출금 리스트 <br></td>
		   
		  <table border='1'>
		  <tr>
		    <th scope="col">포인트 번호</th>
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
	
	
	<div class="sub">
	${user.name}
	</div>
	
	<div class="sub_tmenu">
	</div>
	
	<c:forEach items="${userlist}" var="item">
	<div class="list_point">
	    <div class="point_userlist">
	       <div class="userlist">
	        <a href="#" class="item_content">
	            <div class="point_no">
	                <span class="state _statusName">${item.no}</span>
	                <strong class="title click _titleName">스크랩</strong>
	            </div>
	        </a>
	        </div>
	
	        <div class="amount_space">
	            <div class="amount_inner">
	                <span class="point">${item.price}</span>
	                <a href=='delete?no=${item.no}' class="point delete">내역삭제</a> 
	            </div>
	        </div>
	    </div>
	 </div>
	</c:forEach>
	</div>
</div>

<script type="text/javascript" >
if(typeof layout == 'undefined'){
	  layout = {};
	}

	layout.snb = {
	    initialize : function() {
	    }
	};

	layout.snb.initialize();

	var oRolling1 = new jindo.Rolling(jindo.$("rolling1"), {
	  nDuration : 400
	});

	var beforeIndex = 0;
	var afterIndex = 1;

	oRolling1.attach('afterMove', function(oCustomEvt) {
	  beforeIndex = afterIndex;
	});

	jindo.$Fn(function(e) {
	  e.stop($Event.CANCEL_DEFAULT);
	  if(!oRolling1.isMoving() && oRolling1.moveBy(-1)){
	    afterIndex = beforeIndex - 1;
	  }
	}).attach(jindo.$$('._prev_btn'), 'click');

	jindo.$Fn(function(e) {
	  e.stop($Event.CANCEL_DEFAULT);
	  if(!oRolling1.isMoving() && oRolling1.moveBy(1)){
	    afterIndex = beforeIndex + 1;
	  }
	}).attach(jindo.$$('._next_btn'), 'click');

	jindo.$Fn(function(e) {
	  e.stop($Event.CANCEL_DEFAULT);
	  jindo.$$.getSingle('._snb_bank_charge_tooltop').style.display='none';
	}).attach(jindo.$$('._snb_bank_charge_tooltop_btn'), 'click');

	function releaseDormancy(releaseUrl){
	  location.href = releaseUrl + "?rurl=" + encodeURIComponent(location.href);
	}

</script>

<jsp:include page="../footer.jsp"/>
