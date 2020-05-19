<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<style>

#container {
    position: relative;
    z-index: 20;
    max-width: 954px;
    height: 100%;
    margin: 0 auto;
}

#content {
    position: relative;
    padding: 32px 51px 95px;
}
.section_home{
    line-height: 14px;
    zoom: 1;
    padding: 16px 12px 94px;
}

.section_home .column {
    float: left;
    width: 50%;
}

.sh_group, .sh_group2, .sh_group3, .sh_group4 {
    margin: 16px 8px 0;
    padding: 32px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
}

.sh_group {
    min-height: 185px;
}
</style>

<div id="container" style="height: 1637px;">
  <div id="content" class="section_home">
    <div class="column">
      <div class="sh_group">
          스크랩 <a href='../scrap/list' class='btn btn-success btn-sm'>스크랩</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
       <div class="sh_group">
           포인트 <a href='../point/userlist?userNo=${user.no}' class='btn btn-success btn-sm'>포인트</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
    </div>
    <div class="column">
      <div class="sh_group">
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
      </div>
      <div class="sh_group">
         출금 <a href='../point/form?userNo=${user.no}' class='btn btn-success btn-sm'>출금</a>
        <div class="header"></div>
        <div class="content"></div>
        <div class="footer"></div>
       </div>
    </div>
  </div>
</div>  
     

<jsp:include page="../footer.jsp"/>