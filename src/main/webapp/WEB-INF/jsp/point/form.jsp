<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출금 시스템 addForm</title>
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

<form action='update' method='post' enctype='multipart/form-data'>
보유포인트 : <input id="p1" name="price" type="text"> <br>

예금주 : <input name="name" type="text" value= "${user.name}" readonly> <br>
전화번호 : <input name="tel" type="text" > <br>
은행명 : <input name="bank" type="text" > <br>
계좌번호 : <input name="account" type="text" > <br>
출금금액 : <input id="p2" name="price" type="text"><br>
<button>제출</button>
</form>

<script type="text/javascript">
</script>

<jsp:include page="../footer.jsp"/>