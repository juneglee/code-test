<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<h1>로그인</h1>
<form action='login' method='post'>
이메일: <input name='email' type='email' value='${cookie.email.value}'>
<input type='checkbox' name='saveEmail'> 이메일 저장해두기<br>
암호: <input name='password' type='password'><br>
<button>로그인</button>
</form>
  <a href='../user/form'>새 회원</a><br>

