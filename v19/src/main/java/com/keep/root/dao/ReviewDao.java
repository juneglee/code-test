package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.Review;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface ReviewDao {

  int insert(Review review) throws Exception;

  List<Review> findAllByUserNo(int userNo) throws Exception;

  Review findByNo(int no) throws Exception;

  int update(Review review) throws Exception;

  int delete(int no) throws Exception;

  //
  Review findAll() throws Exception;

  List<Review> findByKeyword(String keyword) throws Exception;
}
