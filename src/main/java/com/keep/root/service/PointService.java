package com.keep.root.service;

import java.sql.Date;
import java.util.List;

import com.keep.root.domain.Paging;
import com.keep.root.domain.Point;

public interface PointService {

  int scrapAdd(//
      int userNo, //
      int reviewUserNo, //
      int pointType, //
      int content, //
      int price) throws Exception;

  void withdraw(Point point) throws Exception;

  List<Point> list() throws Exception;

  List<Point> list(int userNo) throws Exception;

  List<Point> findOutputByUserNo() throws Exception;

  List<Point> calendarList(int userNo, Date startDate, Date endDate) throws Exception;

  Point get(int no) throws Exception;

  Point getUser(int userNo) throws Exception;

  Point getTrader(int traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;
  
  // paging
  
  int countPoint()  throws Exception;
	// 페이징 처리 게시글 조회
  List<Point> selectPoint(Paging vo) throws Exception;

}


