<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="container" style="height: 1637px;">
  <div id="content" class="section_home">
    <div class="column">
      <div class="sh_group">
          스크랩  <a href='../scrap/list' class='btn btn-success btn-sm'>스크랩</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
       <div class="sh_group">
           포인트 <a href='../point/userlist?userNo=${loginUser.no}' class='btn btn-success btn-sm'>포인트</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
    </div>
    <div class="column">
      <div class="sh_group">
        <img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' width='360'> ${loginUser.name}  <a href='../user/updateform' class='btn btn-success btn-sm'>정보수정</a><br>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
      </div>
      <div class="sh_group">
         출금 <a href='../point/form?userNo=${loginUser.no}' class='btn btn-success btn-sm'>출금</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
    </div>
  </div>
</div>  
     