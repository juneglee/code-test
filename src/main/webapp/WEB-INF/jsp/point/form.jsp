<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!-- 
- 자바스크립트로 addForm으로 입력을 받고 session에 저장한다. (price만 업데이트)
- 각 해당 입력 받은 값을 통해서 결과 페이지까지 출력 (list 저장 가능>?)
  // 포인트에서 출력
  // 보유포인트 : 포인트 price 
  // 출금 금액 : [add] 입력값 , 초과시 에러 발생, 

  // 유저에서 출력
  // 예금주, 
  // 전화번호, : 인증 절차
  //  (전화번호를 통해서 은행명, 계좌번호에 대한 조회 가능)
  // 은행명, : 인증 가능
  // 계좌번호, : 인증 가능 
  // 유저번호 : 유저 정보 확인
  // 
  // 본인 인증 API
  // - 부트페이, 아임포트, 이니시스
  // unique ( 사용자 고유 식별자 )  와  di ( 가맹점 SITE별 고유 식별자 )  값을 전달
  // - 핸드폰 번호를 통해 인증? 이름, 성별, 생년월일, 고유키 (아임포트)
  //
  // 결제 시스템 연동 API
  // - 아임포트, 부트페이, 이니시스 
 -->
<jsp:include page="../header.jsp"/>
 
<p> ${user.name} 의 보유 포인트는 ${point.price} 포인트 입니다. </p>

예금주 : <input name="name" type="text" value="${user.name}" > <br> 
전화번호 : <input name="tel" type="text" value='${user.tel}' > <br> <!-- 인증 -->
은행명 : <input name="bank" type="text" value="${user.bank}" > <br>
계좌번호 : <input name="account" type="text" value="${user.account}" > <br>
출금 포인트 : <input name="price" type="text"><br>

스크랩. 데이 리뷰 번호: ${reviewDay.no}<br>
스크랩. 장소 리뷰 번호: ${reviewPlace.no}<br>
 
<form action='add' method='post'>
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
 <button> 제출 </button>
</form>
<button type="button" onclick="location.href='payment.jsp' ">충전하기</button>
<!-- 충전을 취소했을 때 되돌아가기 -->

<script type="text/javascript">
"use strict"
 var f1 = document.getElemnetByClassName("usernos");
 var f2 = document.getElemnetByClassName("tradernos");
 var f3 = document.getElemnetByClassName("types");
 var f4 = document.getElemnetByClassName("contents");
 var f5 = document.getElemnetByClassName("prices");
 
function unos() {
	if (f1 != f2 || f1=="") {
		console.log("아래의 게시물로는 적립을 할 수 없습니다.");
	} else {
		return "${user.no}";
	}
	  
	function con(f1,f2,f3,f4) {
		if (f4 == 1) {
			if (f3 == 0) {
				// userno 는 session no값으로 한다
				// tarderNo는 스크랩.리뷰 데이.userno or 스크랩.리뷰 장소 userno
				
			} else (f3==1){
				// 위와 반대 
			}
		} else if (f4 == 1)
			
	}
	
}
 

</script>


<jsp:include page="../footer.jsp"/>