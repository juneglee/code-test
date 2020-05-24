<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>후기 상세</h1>

<div>

    메인 사진 : ${placeDetail.mainPhoto} <br> 
    장소 이름 : ${placeDetail.name} <br>
    상세 주소 : ${placeDetail.basicAddr} <br>
    기본 주소 : ${placeDetail.detailAddr} <br>
    
    <c:forEach items="${placePhotoDetail}" var="placePhoto">
    사진 : ${placePhoto.photo}<br> 
    </c:forEach>
    장소 후기 : ${placeDetail.placeReview} <br>
  <button>스크랩</button>
</div>



